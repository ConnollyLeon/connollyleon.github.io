---
layout: post
title: "云原生动态：Cloudflare披露Containers跨租户数据暴露源于dm-thin的skip_block_zeroing开关、EKS网络策略代理因Pod标识符用连字符拼接而可跨命名空间绕过、AWS Elastic Beanstalk推出Cluster Mode把老平台迁到共享EKS、GKE公布Pod快照基准把70B模型冷启动压到37秒、Kubernetes 1.37把未使用PVC追踪提升为Beta并已进入GKE Rapid通道"
date: 2026-09-28
author: "云原生观察"
source: "https://blog.cloudflare.com/containers-cross-tenant-vulnerability/"
categories: [cloud-native]
tags: [cloud-native, cloudflare, containers, multi-tenancy, dm-thin, thin-provisioning, block-zeroing, firecracker, microvm, isolation, kubernetes, eks, network-policy, cve-2026-86831, aws, elastic-beanstalk, eks, gke, pod-snapshots, gvisor, checkpoint-restore, scale-to-zero, dra, gpu, cost-optimisation, pvc, storage, kubernetes-1-37, agentic-ai, platform-engineering, finops, observability]
---

9月27日的云原生消息可以归为两条线，而且这两条线指向同一个此前容易被忽略的事实：**隔离边界不由抽象层级决定，而由抽象链条上最长的那一环决定**。Cloudflare自己披露的Containers跨租户数据暴露是最好的例证——容器在、sandbox在、独立microVM在、Firecracker在，租户隔离宣传里的每一个名词都成立，但失效的那一环是Linux device-mapper thin provisioning的一个可选开关`skip_block_zeroing`。安全研究员用4 KiB写触发64 KiB块回收分配，让另外60 KiB保持可读，从同一台宿主机上其他客户的容器里读出目录结构、数据库页和结构完整的SQLite文件；24次放置中有18次、22台底层节点中有20台、横跨四个大洲都能复现。另一条线上，AWS披露的EKS网络策略代理高危漏洞CVE-2026-86831在根因上出奇地同构——代理用连字符把Pod名与命名空间名拼成唯一标识，而连字符在两个字段里都是合法字符，于是`prod/app-v1`与`v1-prod/app`可能产生同一个标识。两条新闻合起来指向的判断是：**当隔离被拆成一串"层"来销售时，风险就藏在层与层之间的接缝上，而接缝恰恰是最少被审计的部分。**

## 主要新闻 (Main News)

### Cloudflare披露Containers跨租户数据暴露：一个为性能而设的dm-thin开关让60 KiB残存数据可读

Cloudflare官方博客与研究者Oren Yomtov（Accomplish）联合披露了这起漏洞。9月4日Yomtov通过HackerOne（报告编号#3997565）报告了该问题，Cloudflare在数小时内确认、合并修复，并称**没有证据表明客户数据被入侵**。技术根因是一条完整的链条：Cloudflare Containers用Linux device-mapper thin provisioning（dm-thin）为每个容器提供可写根盘，每个容器跑在Firecracker监控的独立虚拟机里，Firecracker把这块盘以`/dev/vdc`暴露给客户机。thin provisioning只在虚拟盘写入未映射区域时才分配物理存储，受影响的存储池使用64 KiB的thin块大小，而池配置里带着`skip_block_zeroing`——该选项让dm-thin在新建块变得可访问之前跳过清零。容器删除时，其thin卷的物理块被归还到一个"服务于多个客户账户工作负载"的共享池；下次再分配时，如果写入是全块写就完整覆盖，如果是小块写则只覆盖写入部分，其余部分保留着前一个主人的内容。

研究者的证明过程被完整记录下来，读起来像一份教科书：读取未映射区域不会暴露任何东西（dm-thin直接返回零且不分配物理块），暴露需要一次分配。他们在客户机ext4文件系统的空闲空间里找出64 KiB对齐的区域，向每个区域写入单个4 KiB对齐块，迫使dm-thin分配一个回收来的64 KiB物理块，首4 KiB被替换、**剩余60 KiB（占93.8%）保持前一容器的内容可读**，随后对`/dev/vdc`的裸设备读取就能看到新容器从未写过的字节。验证方法本身也经过校验：在自己创建并删除的162个块上全部正确归属后，才把它用到生产放置上。最终结果是在24次放置中的18次、22台底层节点中的20台上观察到残存材料，覆盖四个大洲，恢复出的块类型包括目录结构、数据库页和结构完整的SQLite数据库。线程安全情报平台Threadlinqs的条目记录了更细的数字：跨六次生产放置检查了5614个可测试的ext4目录块，其中**属于研究者自己文件系统的为0个**，通过校验和分析识别出2700个属于他人的目录inode。

修复分为两步，而第二步才是真正值得学的部分。第一步是全fleet移除`skip_block_zeroing`，恢复dm-thin默认的清零行为，研究者独立确认了证明方法失效。**但清零新分配并不能消毒已经映射进现有thin设备的块**——这些映射存在于运行中的容器盘，以及每台宿主机为OCI镜像层准备的dm-thin快照缓存里；新容器可能从一个缓存层继承映射而无需重新分配，那些未使用区域（包括ext4空闲空间）里的残存字节仍可通过裸设备读取可读。因此Cloudflare进一步**报废了所有运行中的容器盘并清除了缓解措施之前创建的镜像快照**，在低峰期排空宿主机、重启每台机器上的VM、清空镜像缓存，使磁盘与缓存层都以清零分配重建，清理于9月19日完成。Cloudflare用"4 KiB写入未映射区域触发回收块分配，随后读取返回远超写入量的数据"这一写读比特征生成检测签名，扫过保留的历史磁盘I/O遥测，只匹配到研究者与Cloudflare工程师的授权验证活动。该漏洞未分配CVE与CVSS。Threadlinqs还指出这是Accomplish自2026年7月以来发布的**第六起sandbox/隔离逃逸**（前五起包括Claude Cowork的SharedRoot、Claude Code的Beltdown、Cursor CLI的Beltdown2、Docker的hypervisor、OpenAI Codex沙箱），并引用Linux内核文档指出dm-thin设置了`discard_zeroes_data_unsupported`，因为部分discard不保证在复用前被清零，**所以安全擦除必须显式实现**。

**Source:** [How Cloudflare addressed a cross-tenant data exposure vulnerability in Containers](https://blog.cloudflare.com/containers-cross-tenant-vulnerability/)

**Source:** [Escaping the Cloudflare sandbox — Accomplish Blog](https://accomplish.ai/blog/escaping-the-cloudflare-sandbox/)

**Source:** [Cross-tenant data exposure in Cloudflare Containers/Sandboxes/Browser Run via Linux dm-thin skip_block_zeroing residual block reuse | Threadlinqs](https://intel.threadlinqs.com/threat/TL-2026-2648)

**Source:** [Cloudflare containers returned other tenants' disk blocks | P.K. Sharma](https://www.pk-sharma.com/briefing/cloudflare-containers-block-zeroing-residue)

### AWS披露EKS网络策略代理高危漏洞：连字符拼接导致的Pod标识符碰撞可绕过跨命名空间隔离

AWS披露了Amazon EKS Network Policy Agent的高危漏洞CVE-2026-86831，CVSS分类为CWE-1289（不恰当的输入等价性验证不严）。该缺陷允许**已认证用户绕过跨命名空间的NetworkPolicy执行**。根因在数据面构造唯一标识的方式上：代理用连字符（`-`）把Pod名与命名空间名拼接成标识符，而连字符在Kubernetes的Pod名和命名空间名中都是合法字符，因此拼接过程存在歧义。报告给出的例子极为具体：命名空间`prod`中的Pod `app-v1`，可以产生与命名空间`v1-prod`中的Pod `app`相同的拼接标识。当发生这类碰撞时，策略执行引擎可能把一个Pod的策略状态错误地套用到另一个Pod上，导致本应被拒绝的流量得到错误的"允许"判定。SentinelOne的漏洞分析指出这构成集群内部的未授权横向移动途径。

修复方案是升级到Amazon EKS Network Policy Agent v1.4.0或更高版本，以及Amazon VPC CNI托管插件v1.22.4或更高版本。在无法立即升级的环境中存在一个临时变通：**定义不含连字符的命名空间名**，从而消除标识符构造的歧义。需要强调的是，这起漏洞直接打击的是Kubernetes多租户的一项基本支柱——命名空间隔离。命名空间设计的全部意义就是把一个群体的资源与另一个群体的资源分开，而这条保证的失效环节，恰好是"把两个本就不该用连字符分隔的字段用连字符拼起来"这样一个看起来无害的实现细节。

**Source:** [AWS Discloses High-Severity Network Policy Bypass Vulnerability in Amazon EKS](https://thenextgentechinsider.com/pulse/aws-discloses-high-severity-network-policy-bypass-vulnerability-in-amazon-eks)

### AWS Elastic Beanstalk推出Cluster Mode：老平台通过共享EKS集群做资源装箱

AWS宣布Elastic Beanstalk的Cluster Mode正式可用，这是一个新的部署模式，把计算模型从"每个应用独占一组EC2实例"改为"多个应用跑在由Elastic Beanstalk管理的共享Amazon EKS集群上"。技术上，应用作为容器运行在Beanstalk管理的EKS集群上，节点容量交由Amazon EKS Auto Mode处理；支持all-at-once、rolling、immutable与traffic-splitting四种部署策略，失败时自动回滚；与OpenTelemetry原生集成，数据可流向CloudWatch与第三方可观测性后端；提供自动化容器化，用户只需提供源码、Dockerfile或ECR中的容器镜像，Beanstalk用Cloud Native Buildpacks完成构建，支持Java、.NET、Python、Node.js、PHP、Ruby与Go。配置命名空间也随之从`aws:autoscaling:*`切换到`aws:elasticbeanstalk:eks:*`，副本数通过`min-replica`与`max-replica`调整。

这一模式对拥有大量应用组合的组织意义明确：通过跨环境共享EKS集群做资源装箱，可以**在服务数量增长时不必成比例增加运维复杂度与基础设施开销**。Beanstalk负责EKS集群的完整生命周期（置备、打补丁、扩缩容），用户不必自己搭建控制面。Cluster Mode与Standard Mode可共存，团队可以按自己的节奏把单个环境从EC2迁移到EKS。AWS的文档同时给出边界：虽然Cluster Mode在高密度应用组合上优化成本，**Standard Mode仍是单应用场景或无法容器化的Windows/.NET Framework工作负载的推荐选项**。该模式在提供Elastic Beanstalk的所有商业区域均已GA。

**Source:** [AWS Elastic Beanstalk Launches Cluster Mode for Optimized Managed EKS Infrastructure](https://thenextgentechinsider.com/pulse/aws-elastic-beanstalk-launches-cluster-mode-for-optimized-managed-eks-infrastructure)

### GKE公布Pod快照基准：70B模型冷启动压到37秒，但工作转移到了快照生命周期管理

InfoQ报道，Google公布了GKE Pod快照的基准测试结果，报告启动延迟最多下降**89%**，其中700亿参数模型加载耗时37秒，80亿参数模型15秒。该功能保存工作负载的运行状态（包括CPU与GPU内存）并按需恢复，于今年5月在1.35.3-gke.1234000或更高版本的集群上达到GA。**gVisor是这一切的前提，且附带明确条件**：Pod必须跑在GKE Sandbox中，因为gVisor运行时就在那里——Autopilot集群自带，标准集群需要一个开启了gVisor的节点池。每个节点上的一个agent处理快照生命周期，控制面上的一个controller清除过期快照，数据存放在Cloud Storage。两个自定义资源负责配置：`PodSnapshotStorageConfig`指向存储桶，`PodSnapshotPolicy`按标签选择Pod、设定触发方式（workload或manual）、并通过`lastAccessTimeout`与每组快照上限设定保留策略。

InfoQ作者Steef-Jan Wiggers引述读者反馈指出了真正的代价：升级一个节点池，gVisor内核或GPU驱动版本可能改变，已有快照随之失配；此时Pod按文档记载的回退路径**正常启动、不报任何错误，只是收益消失了**。这一"静默降级"特性意味着快照的收益无法通过"有没有报错"来判断。Agent沙箱场景建立在这一功能之上：GKE Agent Sandbox同样于5月GA，Google称其warm pool每集群每秒可分配多达300个沙箱、其中90%在200毫秒内就绪，并使用Pod快照来挂起空闲Agent而不是为其保持热算力；同期推出的开源项目Agent Substrate探索在更高密度下的同类挂起/恢复多路复用，其仓库明确声明尚未达到生产可用。Google云平台与AI工程AVP Meet Shah在InfoQ的访谈中划出了两者之间的界线："Agent Sandbox GA……是你们可以对 secure execution 有所依靠的基础。Agent Substrate 是密度这一章，仍然在开放中书写。"Google把该功能描述为workload-agnostic，点名Java应用、游戏服务器与遗留单体，理由包括AI推理；而留给团队的决定是：哪些节点池跑gVisor、哪个桶存快照以及谁可以读、快照保留多久、以及**工作负载在从一个它没预料到会被冻结的状态恢复时该刷新什么**。

**Source:** [GKE Pod Snapshots Cut Model Load Times, and Move the Work to Snapshot Lifecycle Management | InfoQ](https://www.infoq.com/news/2026/09/gke-pod-snapshots-benchmarks/)

### Kubernetes 1.37落地进展：未使用PVC追踪进入Beta，scale-to-zero与DRA改变GPU成本模型，1.37已进入GKE Rapid通道

三条围绕Kubernetes 1.37（代号"Garhwal"，8月26日发布，共67项增强）的进展在本周集中落地。其一，**`PersistentVolumeClaimUnusedSinceTime`特性门在1.37中提升为Beta并默认启用**，PVC保护控制器开始管理PVC状态中的`Unused`条件：`Unused=True`（原因`NoPodsUsingPVC`）在无非终态Pod引用该PVC时出现，`Unused=False`（原因`PodUsingPVC`）在至少一个运行中或待调度的Pod引用时出现。两个实现细节值得注意：处于`Succeeded`或`Failed`阶段的Pod**不会**阻止PVC转为`Unused=True`，从而避免已完成的批处理任务永久占住卷；不可调度的Pod仍被计为使用中，因为系统把这种引用解释为使用意图；`lastTransitionTime`精确记录PVC转为空闲的时刻，管理员可据此自动化存储生命周期管理（例如找出空闲超过30天的PVC）。在此之前，判断某个PVC是否活跃需要人工盘点Pod、PersistentVolume与claim之间的关系。

其二，1.37中HPA的scale-to-zero进入Beta并默认启用，**允许HPA把目标的`minReplicas`降到零**——在1.37之前HPA永远无法低于一个运行副本。这一改动对GPU密集型账单的意义远大于普通Web服务：一个缩容到零的Pod会立即释放其DRA管理的GPU声明，无论同一节点上还运行什么，而调度器可以在这期间把该设备交给别的工作负载，这与等待整个节点排空是完全不同的成本模型。配合的另一半是**DRA对扩展资源（含GPU）的支持达到GA**：此前DRA要求工作负载采用专为其构建的独立API表面，与大多数GPU调度方案已在使用的`example.com/gpu`式传统扩展资源请求分离；GA后DRA驱动可以直接满足旧式扩展资源请求，无需并行运行独立的device plugin，运维方可在现有YAML之下替换DRA驱动而获得per-device taints与更丰富的调度元数据，不必改动应用清单。同一版本中，用于把多个Pod归入共享分配的ResourceClaim支持进入Beta。

其三，托管Kubernetes的节奏并不一致：微软AKS文档列出上游1.37于2026年8月发布、AKS预览版2026年9月可用、**GA目标为2026年10月**、支持至2027年10月；Google GKE发布说明**于2026年9月26日确认1.37已进入Rapid通道**，这是一条通常先于Regular与Stable通道数周至数月出现的早期访问轨道；**Amazon EKS截至文章写作时尚未公布确认的1.37 GA日期**。另有报道指出1.37的两项破坏性变更：IPVS作为kube-proxy模式被弃用（推动运维方转向nftables或iptables后端），以及**静态Pod内的Secret支持被彻底移除**——任何依赖把Secret挂载进静态Pod清单的控制面引导或节点级自动化将在1.37上直接失败而非优雅降级；SELinuxMount也转为默认启用，会改变运行SELinux或加固Linux镜像的集群中CSI卷的重标记行为。

**Source:** [Kubernetes v1.37 Enables Native Tracking of Unused PersistentVolumeClaims to Reduce Costs](https://thenextgentechinsider.com/pulse/kubernetes-v137-enables-native-tracking-of-unused-persistentvolumeclaims-to-reduce-costs)

**Source:** [Kubernetes 1.37 Scale-to-Zero Cuts GPU Cloud Cost](https://shattered.io/kubernetes-1-37-scale-to-zero-gpu-cost-2026/)

### 两则行业观察：Kubernetes上的Agentic AI需要"可观测的上下文"与"划清的边界"；银行平台团队把文化变成结构

The New Stack刊出Rhys Oxenham的署名文章，主张Agentic AI正在成为基础设施的新一层。文章的核心论点是**Agent的价值完全取决于它能看到什么上下文，以及团队为它划定了什么边界**：代理读取集群状态与运维数据、提出诊断或下一步、在经批准的范围（通常在人工签字后）内执行动作；进一步还可以把每个请求路由给一个只接收它所需元数据的专用代理。文章反复强调三样东西构成Agentic系统的实际价值，并与"通用助手"区分开：代理从集群收到的信号、它所掌握的策略与访问上下文、以及它被允许改变的项的明确定义。文中引述Forrester的报告指出现代AI计算栈正从模型本身延伸到并贯穿其下的基础设施。文章承认并非所有场景都适用——在单一小规模集群上，Agent的开销可能超过收益；人工Kubernetes管理在少量集群上尚能支撑，但在快速增长的资产组合中会失效，因为每个新集群都带来升级、打补丁、配置与续期方面的工作量。文章给出四条原则：从可观测的上下文起步；把建议与动作分离（让代理自由建议，任何变更都必须等待人工批准与明确范围）；**把代理接入既有的控制体系**，让其工作流经团队已经信任的访问规则、身份与审计路径；保持生态开放，优先选择与现有工具和标准集成而非把工作锁定在单一栈中的平台。文中以SUSE Rancher Prime与SUSE AI Factory为例说明这一思路的落地形态。

InfoQ则报道了一家银行如何把平台文化做成结构。Marcy Paramonova与Stéphane Cusin在KubeCon & CloudNativeCon Europe的演讲中提出"**平台是一个协作系统，而不是基础设施**"，并把"文化随结构而变"作为方法论。具体的结构包括每周两次、每次两小时的"Genius Bar"开放式支持时段——无需工单、无需等待日程空档；用户洞察会议分享优先级、已完成工作与可见性收益，并与用户一起排优先级而非替他们排；以及demo展示已交付、路线图上以及今天具体怎么用。Stéphane Cusin给出的第一条原则尤其关键：**平台能力绝不应依赖人工干预**——团队通过声明式配置与自动化工作流与平台交互，例如在Git里改一处配置、由GitOps流程自动应用，从而在提供自助体验的同时保留完整的可追溯性与可见性；这种做法让平台团队能看清哪些能力在被采用、哪些不再需要、哪些用户受某次变更影响，并已借此安全下线了闲置功能。第二条原则是**每个平台特性都应有生命周期**，需要知道谁在用某个能力、怎么用、它是否还在提供价值。

**Source:** [The rise of agentic AI on Kubernetes: unleashing the new infrastructure layer | The New Stack](https://thenewstack.io/agentic-ai-kubernetes-management/)

**Source:** [Building a Collaborative Platform Culture in a Bank | InfoQ](https://www.infoq.com/news/2026/09/collaborative-platform-culture/)

## 分析 (Analysis)

把Cloudflare与EKS这两条并读，会得到一个比"又多两个CVE"更有价值的结论：**两者的根因都不是实现错误，而是命名与配置的默认假设在真实命名空间里不成立。** dm-thin的`skip_block_zeroing`是一个可选功能参数，内核文档只用一句话描述它（"跳过新置位块的清零"），既未标注安全含义也未标注默认值；EKS网络策略代理用连字符拼接两个字段，而连字符在Kubernetes的DNS-1123命名规则里完全合法。这两类缺陷共享一个结构：**正确性依赖于一个"在此处恰好不成立"的隐含前提，而隐含前提永远不会出现在API文档、错误信息或默认配置里。** 平台团队真正能抓的抓手因此不是逐个CVE，而是可审计的默认值——`dm-thin`的池参数、标识符的分隔符与转义规则、namespace名的字符集约束。后者尤其讽刺：Kubernetes社区早已形成"namespace名应避免与其他资源名冲突"的模糊共识，却从未把"namespace名不得包含连字符"上升为硬约束；而在CVE-2026-86831中，这条本可省下所有受影响者的规则，正是变通方案本身。

Cloudflare处置的第二步比第一步更值得平台团队逐字抄下来。移除`skip_block_zeroing`是正确的、立即的、**但不充分的**，因为缓存已经把问题向前复制了一遍：宿主机上为OCI镜像层准备的dm-thin快照缓存可以把修复前就存在的映射交给新容器，而无需重新分配。P.K. Sharma对此的概括可以当作本周最实用的一句工程箴言——"**任何你预热并复用的文件系统，分配行为的变化都向后够不到**"，golden image、warm pool、预制快照与层缓存都有这个属性。这条推论直接连接到同一天的另一条新闻：GKE Agent Sandbox用Pod快照挂起空闲Agent、warm pool每秒分配300个沙箱、Agent Substrate探索更高密度的挂起/恢复多路复用——**冷启动优化与残存数据风险的来源是同一个东西**。InfoQ那篇GKE快照基准里读者反馈的"升级节点池后快照失配、Pod正常启动、不报错，只是收益消失"，是同一枚硬币的另一面：快照的版本与生命周期管理本身就是新的运维负担，而它与租户隔离的隐患在底层的`dm-thin`/块分配路径上完全重叠。实践者的结论应当是：**把"快照/层缓存的失效与清零"纳入多租户存储的安全清单，与"密钥轮换"同级对待**，而不是当作性能调优项。

从成本角度看，1.37的两项变更合起来构成了近两年平台工程中少见的一次"原生杠杆替代监控告警"。FinOps从业者过去两年搭建仪表盘与chargeback模型专门用于捕捉闲置GPU开销，**因为Kubernetes本身没有给出可拉的杠杆**；scale-to-zero把等式改了——它给平台工程师一个第一方旋钮，而不是一张告诉财务该给谁发邮件的告警。这是从"检测并报告闲置GPU成本"转向"防止闲置GPU成本发生"，对FinOps项目本身而言就是明显更便宜的做法。配套的DRA扩展资源GA则移除了既有GPU工作负载采用DRA的最大障碍：不必在第一天就重写Pod清单为新的ResourceClaim格式，可以在现有YAML之下换驱动。PVC的`Unused`条件是同一条逻辑在存储侧的镜像——把"人工盘点Pod/PV/claim关系"变成一个带`lastTransitionTime`的可查询条件。三个变更的共同点是**把此前只能靠外部工具拼凑的信息下沉为API服务器的一等状态**，代价则是每一条都要求团队重新审视自己的告警与清理逻辑是否还合理。1.37的破坏性变更（IPVS弃用、静态Pod的Secret被移除、SELinuxMount默认启用）再次印证Kubernetes的常规：**升级检查清单的长度从未缩短，只是内容在换**。

最后是两则行业观察与前四条新闻构成的呼应。The New Stack那篇讲Kubernetes上的Agentic AI，其中最扎实的论断是"模型普遍了解Kubernetes的基础知识，但它们不可能知道你的独特集群状态、你的策略或你近期的变更"——这与Docker把Agent权限清单做成OCI镜像的路线是同一个问题的两种解法：**Agent的有效性不来自模型能力，而来自它能拿到的上下文质量与权限边界的显式化程度。** 银行平台团队那篇则提供了这一诉求的组织侧答案：Genius Bar、用户洞察会议、demo这些"围绕协作建立仪式而非只是谈论文化"的结构，加上"平台能力绝不依赖人工干预"的声明式原则，其目的是**把反馈回路缩短到让平台团队能诚实地发现自己哪里让人困惑**。这两者合起来给出的判断是：在Agent与自动化越来越多地承担运维动作的当下，**平台团队的核心职能正从"提供能力"移向"提供可信的上下文与可审计的边界"**——而这两件事都无法自动化，只能靠结构化的协作节奏与严谨的默认值治理来维持。Elastic Beanstalk的Cluster Mode在这个背景下是一个有意思的注脚：一个诞生于容器前时代的服务，正通过共享EKS集群把成本模型重新对齐到资源装箱的方向，**它的迁移路径是"用新抽象重新实现旧承诺"**——这恰恰是平台工程最典型的形态。

## 结论 (Conclusion)

9月27日的云原生新闻可以归纳为一句判断：**隔离与成本这两个看似不同的问题，本周都由同一条原则支配——把隐含假设变成显式的、可审计的对象。** Cloudflare把一个dm-thin开关的性能影响与租户边界焊在了一起，于是60 KiB残存数据跨过了租户线；AWS把一个分隔符的选择与命名空间隔离焊在了一起，于是NetworkPolicy可以被绕过。而Kubernetes 1.37正在做的是同一件事的反面：把"这个PVC还在用吗""这个GPU在空转吗"从外部脚本的推断变成API服务器维护的、带时间戳的显式状态。

对实践者，本周可执行的动作清单是：(1) **审计自建多租户存储的块分配配置**——凡是用dm-thin或任何thin provisioning跑多租户工作负载的，检查池参数里是否存在跳过清零的开关，并确认该开关在产品从预览走向付费承载他人数据库的过程中是否被重新评估过；这比逐条读CVE清单的收益高得多；(2) **把namespace名的字符集纳入配置管理**——在CVE-2026-86831的临时变通方案仍可用的同时，为新建namespace加上不含连字符的校验规则，因为永久修复依赖代理侧的标识符构造变更；(3) **盘点"预热并复用"的存储工件**——golden image、warm pool、预制快照、镜像层缓存，凡是在1.37/新版本/新驱动之后继续复用的，都需要一条明确的失效与重建路径，因为分配行为的变化不会向后穿透已有映射；(4) **在1.37升级检查清单中补上成本侧的评估**——对GPU推理端点与定时批处理任务评估scale-to-zero，把空闲成本从监控指标变成集群配置项，同时把冷启动延迟纳入SLA测算（首次请求要等新Pod调度并完成模型加载），并参照DRA扩展资源GA的迁移路径——先在现有YAML之下换驱动，而不是重写清单。

值得持续跟踪的观察点有四个：其一，dm-thin的`discard_zeroes_data_unsupported`语义意味着**容器删除时显式发出discard/TRIM**是更彻底的下一步，Cloudflare已把它列为长期改进，若成为上游默认，多租户存储的安全基线会整体上移；其二，Accomplish自7月以来已发布第六起sandbox/隔离逃逸，**这个频率本身比任何单起事件都更值得注意**——值得建立一份跨厂商的隔离失效模式清单，按失效层（hypervisor / runtime / 存储分配器 / 网络策略 / 标识符构造）归类；其三，EKS至今未公布1.37的GA日期，而AKS目标10月、GKE已进Rapid通道，**托管服务对同一版本的能力交付时差正在成为平台团队规划GPU成本优化时必须外生的变量**；其四，GKE Pod快照的"静默降级"特性是否会被其他厂商的checkpoint/restore实现复制——**一个不报错的优化失效，比一个报错的优化失效消耗更多信任**。

---
*本文基于2026年9月27日公开资讯整理，来源URL均经核验可访问。*
