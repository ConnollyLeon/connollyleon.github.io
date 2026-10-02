---
layout: post
title: "云原生动态：Azure把agent沙箱的「闲置零成本、回来不到一秒」做成平台原语并让Express与Sandboxes同日GA、K3s宣布v1.40起系统镜像整体迁出Docker Hub改用GHCR、Kubernetes 1.37因cAdvisor瘦身一口气砍掉18个kubelet标志而metrics.k8s.io在beta九年后终于毕业为v1、以及HPE Morpheus给出的「Day 2所有权矩阵」"
date: 2026-10-02
author: "云原生观察"
source: "https://www.infoq.com/news/2026/10/container-apps-express-sandboxes/"
categories: [cloud-native]
tags: [cloud-native, kubernetes, container-apps, express, sandboxes, microvm, snapshot, scale-to-zero, serverless, agent-sandbox, k3s, ghcr, docker-hub, registry, supply-chain, airgap, kubernetes-1-37, garhwal, cAdvisor, kubelet-flags, IPVS, nftables, containerd, metrics-server, hpa, gang-scheduling, podgroup, dra, numa, platform-engineering, day2-operations, ownership-matrix, hpe-morpheus, canary-upgrade, rbac, multitenancy, cncf, kubecon-na-2026]
---

10月1日的云原生新闻看起来是四条互不相干的消息，但把它们并排放会发现它们落在**同一条轴线的两端**：一端是托管平台在Kubernetes之上**新增**原语——隔离单位从容器升到microVM沙箱、伸缩信号从Pod升到队列、快照让"冻住再唤醒"成为可能；另一端是Kubernetes本身在做**减法与固化**——cAdvisor瘦身砍掉18个kubelet标志、kube-proxy终于把IPVS让位给nftables、`failCgroupV1`默认开启、`metrics.k8s.io`在beta待了九年之后终于升到v1。**新增的那一端在回答"怎么跑不可信的agent"，减法的那一端在回答"能不能被依赖"。** 两者不冲突，但它们共同说明一件事：所谓"云原生"现在已经分裂成两场完全不同的对话——托管平台谈的是能力边界，Kubernetes谈的是兼容性承诺。

## 主要新闻 (Main News)

### Azure Container Apps Express与Container Apps Sandboxes同日GA：把「闲置零成本、回来不到一秒」做成平台原语

InfoQ（Steef-Jan Wiggers）报道，Microsoft把**Azure Container Apps Express**推上正式可用，与之同日的还有Express所依赖的隔离计算层**Azure Container Apps Sandboxes**的GA。Express去掉"先建环境"这一步，用强默认值替换掉大部分配置：给一个镜像、一个区域和应用需要的配置，Express自己把计算、入口和伸缩都准备好。应用跑在consumption CPU上，**按秒计费，可缩容到零**。微软把Express描述为"开发者优先，并且agent优先"（developer-first and agent-first）。

真正的技术底座在Sandboxes里，按微软文档的表述有四层：**从预热池（prewarmed pools）供给以实现亚秒级启动**；**每个工作负载隔离在自己独立的、硬件级隔离的microVM边界内**；**可爆发到数千个并发沙箱**；以及**支持suspend与resume——快照完整状态（含内存与磁盘），恢复也是亚秒级**。InfoQ指出这个组合是可辨认的：Google Kubernetes Engine今年把**Pod快照**（通过gVisor对CPU与GPU内存做checkpoint）与**GKE Agent Sandbox**（跑不可信agent代码）配成一对，微软现在用microVM隔离配快照式suspend/resume，瞄准的是同一批负载。InfoQ给出的概括是：**两家厂商在回答同一个问题——怎么给agent一个闲置时不花钱、回来时不到一秒的隔离环境。**

Express自身的排除清单其实比功能清单信息量更大：**不支持自定义域名、可用区冗余、Key Vault密钥引用、Easy Auth、OpenTelemetry、Dapr、作业、工作负载配置、GPU工作负载、多版本与流量切分，以及系统分配的托管标识（managed identities）**；没有服务发现，应用之间靠各自的公网URL通信，入口仅HTTP。文档还带上出站子网**一旦设定不可更改**、以及每副本存储的两条约束。

迁移路径既有也有推力：存量环境通过**归档与还原**（archive and restore）自迁移到Express，微软称过程保留应用与环境配置、**约15分钟**、且不影响"消费免费额度"；FAQ同时提到迁移通知里有一个**选择退出表格（opt-out form）**，供需要额外审批或协调的组织使用。另外，长期不活跃的环境（无运行中应用或作业、无近期活动）可能被归档并进入休眠。GA时Express覆盖**超过40个Azure区域**，微软称公测期间创建了数千个Express应用。

**Source:** [Container Apps Express Reaches GA on a Newly Generally Available Sandbox Layer](https://www.infoq.com/news/2026/10/container-apps-express-sandboxes/)

### K3s宣布系统镜像迁往GHCR：起点是SUSE与Docker之间那份付费安排到期

K3s官方文档博客（Vitor Savian、Brad Davidson、Derek Nola）宣布：**从K3s v1.40（预计2027年7月发布）起，K3s自己部署的系统镜像将从Docker Hub改为从GitHub Container Registry（`ghcr.io/k3s-io`）拉取。** 默认设置且节点能访问GHCR的用户无需改动；使用registry mirror、私有registry、`--system-default-registry`标志或气隙tarball的用户必须修改配置。

理由写得很直白：**`rancher`组织在Docker Hub上的镜像此前不受速率限制，是因为SUSE与Docker之间有一份付费安排，而这份安排正在结束**，此后所有拉取都要受Docker Hub的镜像拉取用量限制约束。K3s已经有一些镜像发在GHCR，而公开镜像在那里没有这类限制，所以迁移是显然的选择——并且**连pause镜像一起迁**，因为"哪怕留下一个在Docker Hub上也仍然会暴露在限制之下"。

这份公告里最实用的是那张变更对照表，以及几个容易被忽略的语义反转：**K3s替换的是registry主机名，保留的是仓库路径**（`registry.example.com:5000/k3s-io/`），所以私有registry必须提前把镜像放在`k3s-io/`路径下；**把`--system-default-registry`设为空字符串现在意味着`ghcr.io`，而以前空字符串意味着`docker.io`**；显式设成`docker.io`仍被允许但很可能不工作，除非在`registries.yaml`里加重写规则，因为镜像前缀已从`rancher/`变成`k3s-io/`；**旧版本的airgap tarball与v1.40不通用**（旧tarball载入私有registry后落在`/rancher/`，而K3s会去找`/k3s-io/`），必须始终使用与K3s版本匹配的tarball。K3s仍会继续把镜像发布到Docker Hub的`rancher/`下，只是默认不再从那里拉取。

**Source:** [K3s System Images Are Moving to GHCR](https://docs.k3s.io/blog/2026/10/01/K3s-system-images-ghcr)

### Kubernetes 1.37「Garhwal」的迁移细节：metrics.k8s.io毕业v1，以及被cAdvisor瘦身砍掉的18个kubelet标志

DEV社区（saaro_net，原始发布于blog.saaro.net）在10月1日梳理了1.37「Garhwal」的运维侧要点。**该版本自2026年8月26日可用，包含67项增强、其中16项达到Stable**，命名取自印度喜马拉雅的Garhwal地区，主线是**整合**。

**HPA缩容到零**是运维侧最重要的一项：Beta、默认开启，**前提是使用Object或External指标——因为CPU与内存指标依赖运行中的Pod**。关键机制在于：**队列长度独立于处理它的worker而存在**，所以Pod数为零时HPA仍能读到队列长度并据此拉起副本。**Gang Scheduling（KEP-4671）**用`PodGroup`概念解决分布式训练作业的部分Pod已放置、其余卡在队列从而作业不推进却占着资源的问题；同期新增**workload-aware Preemption（KEP-5710）**防止竞争工作负载互相无限抢占。**`metrics.k8s.io`API自Kubernetes 1.8起处于beta，将近九年后在1.37升为稳定的`v1`**——API表面完全不变，是纯粹的版本毕业；`kubectl top`已经优先使用v1并回退到v1beta1。

**破坏性变更方面，18个kubelet标志被移除**：内嵌cAdvisor向精简的`cadvisor/lib`模块迁移（PR #139870），移除了包括`--containerd`、`--containerd-namespace`、`--boot-id-file`、`--enable-load-reader`在内的18个标志——**任何传递了这些标志的kubelet会直接以`unknown flag`启动失败**，通过`kubeadm-flags.env`或systemd drop-in配置的节点必须在升级前清理。同期还有：kube-proxy中旧的IPVS支持终于让位给nftables；`failCgroupV1`保持默认开启；**容器运行时必须使用containerd 2.x，containerd 1.x不再受支持**；DRA的`resource.k8s.io/numaNode`属性允许通过`securityContext`字段做每节点配置，这对数据库与高并发负载是期待已久的能力。

**Source:** [Kubernetes 1.37 Garhwal: HPA Scale-to-Zero, Gang Scheduling, and 18 Removed Kubelet Flags](https://dev.to/saaro_net/kubernetes-137-garhwal-hpa-scale-to-zero-gang-scheduling-and-18-removed-kubelet-flags-10d0)

### The New Stack访谈HPE Morpheus：集群可以很健康而应用不是，"Day 1像里程碑，Day 2才是硬现实"

The New Stack（Chris J. Preimesberger）10月1日刊登了对**HPE Morpheus Software首席产品经理Karthik Subramanian**的访谈，主题是Kubernetes上线之后的责任划分。文章开头的判断很直接：**集群上线第一天通常是IT部门的一个里程碑——集群已交付、网络已路由、首批应用容器在跑——但第二天暴露出更难的现实：集群可以是健康的，而应用不是。**

责任划分落在两组人身上。**平台团队**（云架构师、Kubernetes平台管理员、安全团队、监控专家）负责provision集群、分配命名空间、制定版本策略、管理存储与CNI插件、执行安全策略、管理基础设施漂移；**应用团队**（核心开发者、QA、生产部署工程师，作为租户消费者）在指定命名空间内部署工作负载、管理代码发布、使用集群能力但不管底层控制平面。

标准可以设在两个层级：**云级**（访问与RBAC策略、网络与准入要求、备份与恢复目标、Terraform等基础设施即代码标准、SLI）与**集群级**（Kubernetes版本支持节奏，例如维持两到三个活跃的次版本；命名约定、资源标签、多租户命名空间模型；集群专属的Pod间通信网络策略）。升级计划是分阶段的：**预验证检查**（先看节点健康与兼容性告警并整改）、**顺序更新控制平面与工作节点**（平台团队盯集群健康，应用团队验证工作负载可用性）、以及**金丝雀与蓝绿**（并跑一个较新版本的集群，用应用交付与负载均衡工具**先导1%到5%流量**，只在应用达到约定检查项后才继续放量）。Subramanian对"升级完成"给了明确定义：**不是节点回到Ready就算完成，而是应用关键路径可用、服务目标仍在容忍范围内、并且团队知道什么条件会触发暂停或回滚。**

他给出的逐任务责任矩阵覆盖架构与容量、集群与命名空间供给、工作负载供给、密钥与证书轮换与mTLS、升级与漂移、监控与恢复等领域；建议在演练中验证**升级失败、硬件与工作节点故障、RBAC边界（验证租户隔离未被越权访问隔离命名空间）、备份与恢复（RTO与数据完整性）**；并跟踪四个运营指标——**升级成功率、MTTI与MTTR、备份成功率与恢复就绪率、以及审计复核（记录是否识别出"谁或什么执行了有后果的动作、改了什么、是否发生了应有的审批"）**。

**Source:** [A live Kubernetes cluster can still have an ownership gap](https://thenewstack.io/kubernetes-operations-ownership-governance/)

### CNCF发布KubeCon北美2026"自选路径"指南：新增AI Inference + Agentic轨道，同期举办五个社区日

CNCF营销团队在10月1日发布两篇KubeCon + CloudNativeCon北美2026（**11月9–12日，盐湖城**）的参会指南。与会者被明确告知**行程不会停留在单一轨道内**，需要在Platform Engineering、Operations + Performance、Connectivity、Data Processing + Storage、Security、**AI Infrastructure**与Maintainer Track之间往返；应用开发者侧则被引导从Application Development + Delivery出发，再穿行Security、Observability、**AI Inference + Agentic**与Maintainer Track。

这套轨道结构与8月7日公布的完整日程一致：今年首次新增**AI Inference + Agentic**轨道，主题包括编排自主agent、用vLLM与KServe等工具优化模型服务、在推理管道上实现动态路由与可观测性。同期的CNCF托管合办活动包括**ArgoCon、BackstageCon、Cloud Native AI + Inference Day与CiliumCon**。这一安排与本日其余几条新闻形成呼应：隔离原语（Sandboxes）、编排原语（Gang Scheduling、PodGroup）、身份与治理原语（详见本日politics与military分类）正在同时出现在KubeCon的轨道设置与各家平台的GA清单里。

**Source:** [KubeCon + CloudNativeCon North America 2026: Build your infrastructure engineer journey](https://www.cncf.io/blog/2026/10/01/kubecon-cloudnativecon-north-america-2026-build-your-infrastructure-engineer-journey/)

## 分析 (Analysis)

把四条并排，本日最有信息量的判断是：**托管平台正在把"隔离"和"伸缩"的单位往上移，而Kubernetes本身正在把已有表面往死里固化。** 这两件事看起来方向相反，实际是同一个问题的两面——当被托管的对象从"你自己写的无状态服务"变成"你不完全信任的agent代码"，隔离必须变强（microVM而不是共享内核）、空闲成本必须归零（快照而不是缩容）、伸缩信号必须离开工作负载本身（队列长度而不是CPU利用率）。Azure这次GA的三层设计正好一一对应：**预热池解决冷启动、microVM边界解决信任、快照式suspend/resume解决闲置成本**。InfoQ把它和GKE的Pod快照+GKE Agent Sandbox并排看，这个对比是准确的：**两家云厂商独立地走到了同一个架构位置**，说明这不是某一家的产品选择，而是负载形态变化带来的必然结果。

**快照式suspend/resume是这批设计里最被低估的一环。** 容器时代的scale-to-zero之所以能便宜，是因为容器本身几乎无状态——停掉再启动，损失只是一个启动时间。microVM不是这样：VM有内存、有磁盘、有进程状态，"停掉"要么意味着丢弃（那就不是suspend是terminate），要么意味着把状态搬走（那就不亚秒了）。快照把这两难解掉了：**状态被完整保存（含内存与磁盘），恢复是一次本地操作而不是一次重建。** 这也解释了为什么"闲置零成本、回来不到一秒"这个提法现在才成立——在此之前，VM级隔离的代价就是闲置成本。值得注意的是Express的措辞里"Sandboxes"是平台原语（platform primitive）而非产品功能，这个定位意味着它是可被其他服务复用的底层能力，而不只是Container Apps的内部实现。

**Express的排除清单比它的功能清单更有价值，因为它精确地划出了这条产品线"刻意不做"的东西。** 最值得单独指出的是**系统分配的托管标识（managed identities）与Key Vault密钥引用双双被排除**，加上没有服务发现、入口仅HTTP、没有OpenTelemetry。这三项合起来定义了一个**不带云凭据的沙箱**：Express里的工作负载拿不到托管身份，也拿不到平台代管的密钥引用。考虑到微软自己把Express标为"agent优先"，这个取舍是自洽的——**不可信agent代码的执行环境恰恰应该是拿不到平台凭据的**。但它同时也把一个真实问题留在门外：**这类沙箱产出的结果要送回业务系统时，认证在哪一层解决？** 沙箱内不能持凭据，就必然要在沙箱外有一个持凭据的服务做代理——而那个服务才是真正的信任边界。这解释了为什么微软同时提醒：GA时覆盖40多个区域、公测数千应用，而官方口径仍然是给"想要快速起步"的开发者的。**Express解决的是"agent要跑在哪"，不解决"agent的输出送到哪才算可信"。** 迁移路径上那个"需要额外审批或协调的opt-out表单"也值得记一笔：厂商允许把运行中的生产环境自动归档还原到新形态，同时提供逃生口，说明**批量迁移正在被当作一次治理事件而不是一次技术变更**。

K3s那条在技术上极小，在结构上极大。**它的触发原因是SUSE与Docker之间那份付费安排到期，而不是Docker Hub在技术上做了什么。** 这意味着过去大约八年里"默认从Docker Hub拉"的整个行业惯例，其基础是一个**采购与法务关系，而不是一个技术判断**；当这份关系终止，所有以它为默认值的分发链路在同一时刻被迫迁移。更值得注意的是官方给出的迁移语义里藏着的两个陷阱：**K3s替换registry主机名而保留仓库路径**，所以私有registry的用户必须自己完成仓库重命名；以及**`--system-default-registry`设为空字符串的语义被反转**——以前是`docker.io`，现在是`ghcr.io`。这类"同一个配置项、相反的含义"的变更在迁移窗口里几乎不可能靠文档阅读发现，只能靠实际验证。**凡是有"自动迁移"的产品公告，都应该被当成一份需要写回归测试的变更来读。** 对气隙集群而言影响更直接：v1.40的airgap制品引用新路径，旧tarball与新K3s不通用，必须版本严格匹配。这条公告是本日最容易造成生产事故、也最不可能被注意到的一条。

Kubernetes 1.37的两半——新增与移除——放在一起看，暴露了版本演进的两种完全不同的节奏。**新增的那一半是被需求推着走的**（HPA缩容到零来自"闲置成本"、Gang Scheduling来自"分布式训练部分放置却不推进"、DRA的NUMA属性来自"数据库与高并发负载"），每项都有明确的用户痛点。**移除的那一半是被依赖结构推着走的**——18个kubelet标志不是走完弃用周期才删的，而是因为cAdvisor从内嵌组件变成精简`cadvisor/lib`模块后，那些标志所依赖的实现**根本不存在了**，于是只能在一次发布里直接删掉。**依赖替换驱动的移除比人为弃用快一个数量级**：人为弃用周期动辄跨越五到九个次版本，而依赖替换可以让破坏性变更在一次发布里落地。这也解释了为什么1.37需要"任何传递了这些标志的kubelet会以`unknown flag`直接启动失败"这种硬失败——**留出平滑迁移窗口的成本太高，而节点启动失败是唯一能保证所有人都立刻知道的信号。** `metrics.k8s.io`毕业v1则是另一件事：API表面完全不变，纯粹的版本承诺。它的价值恰恰在这种不变性上——**它把"资源指标这条链路"从"社区实现的最佳实践"变成了"兼容性承诺"**，而这正是HPA缩容到零（要求Object/External指标）和原生直方图这类特性能被放心依赖的前提。

**HPA缩容到零的技术前提值得单独讲透，因为它是本日最被低估的架构含义。** 前置条件是必须使用**Object或External指标**，原因很直白：**CPU与内存指标依赖运行中的Pod，而Pod数为零时不存在CPU与内存指标**——用基于Pod的指标做scale-to-zero会陷入死锁，永远读不到触发扩容的信号。这条限制把整个自动伸缩体系的设计重心**从"worker"搬到了"工作"**：队列长度、积压深度、请求到达率是世界的属性，与处理它的worker数量无关，因此零副本时依然可读。**这本质上是一条平台工程要求伪装成了Kubernetes特性**：HPA要能缩到零，你的应用就必须把"我还有多少活没干"表达成一个独立于执行者的可观测量——这通常意味着应用要暴露自己的队列深度，而不是把队列深度藏在worker里只暴露CPU。这是本日五条新闻里对架构影响最深的一条，也是最难在升级时被发现的，因为它不报错。

HPE那条的价值不在产品（把这段责任划分包装成Morpheus的功能目录，对不采购HPE的人价值有限），而在两处措辞。**第一处是"集群可以是健康的而应用不是"**，这句话把Day 2问题的性质说准了：Kubernetes的健康检查覆盖的是控制面与节点，而"应用关键路径是否可用"是另一个观测面——Subramanian把升级完成的定义直接改写成后者，并要求"团队知道什么条件会触发暂停或回滚"，等于把**回滚判据的可知性**列入了升级的完成标准。第二处是那个1%到5%的金丝雀流量比例：**它是把变更半径写成了一个可执行的数字**，与本日云原生分类里Atlassian那条"10分钟内重启超过3次就让流水线失败"（见10月1日分类）是同一种工程纪律——把经验固化成CI里可断言的门禁。责任矩阵与运营指标（升级成功率、MTTI/MTTR、备份恢复率、审计复核）同样值得整体抄走：**"审计复核"这一项问的是"记录是否识别出谁执行了有后果的动作"**，这是一个可以直接落到日志schema上的问题，而大多数团队的日志并不回答它。

综合起来，本日最实用的判断是一句话：**云原生的下一批能力正在长在Kubernetes之上，而不是长在Kubernetes之内。** 隔离（microVM沙箱）、快照（suspend/resume）、编排原语（PodGroup gang scheduling）都由托管平台提供；Kubernetes在同期做的是把`metrics.k8s.io`这类用了九年的API变成v1、把cAdvisor这类内嵌依赖换成可维护的库、把kube-proxy的IPVS换成nftables。**前者回答"能不能跑"，后者回答"敢不敢依赖"。** 这个分工短期是健康的——平台厂商承担前沿负载形态的实验，Kubernetes把赌注收敛到兼容性上；但它也意味着**"上Kubernetes"和"上云"之间的差距在扩大**：能力差异正越来越多地落在托管层而非编排层，因此**把平台能力当作可移植假设来设计，会在下一个版本周期里付出代价**。反过来，1.37的减法提醒了一件事：Kubernetes的破坏性变更仍然以一次发布的粒度到来，依赖"弃用周期"来保证平滑的假设已经不成立，**节点配置必须当作代码来管理，且升级前要有一次真实的节点级验证**。

## 结论 (Conclusion)

10月1日的云原生新闻可以归纳为一个判断：**"云原生"已经分裂成两场对话——托管平台谈隔离与原语的上移，Kubernetes谈兼容性与弃用节奏的下沉；而真正的工作量在两者的接缝处。** Azure把"闲置零成本、回来不到一秒"做成平台原语，代价是明确的能力缺口（无托管身份、无服务发现、无自定义域名）与一个需要治理审批的自动迁移路径；K3s因为一份商业安排到期而整体迁出Docker Hub，代价是镜像仓库路径变化与一个语义被反转的配置项；1.37给出了HPA缩容到零、Gang Scheduling、DRA NUMA属性，代价是18个kubelet标志直接移除、`metrics.k8s.io`之外没有平滑期；HPE则给出了Day 2的责任矩阵与四个可落地的运营指标。

对实践者，本日可执行的动作清单是：(1) **把集群配置当代码管理，并在1.37升级前逐节点清理kubelet标志**——用`kubeadm-flags.env`或systemd drop-in配置的节点会在升级后直接以`unknown flag`启动失败，检查项包括`--containerd`、`--containerd-namespace`、`--boot-id-file`、`--enable-load-reader`在内被移除的18个；同时确认容器运行时已到containerd 2.x，因为1.x已不受支持；(2) **为HPA缩容到零准备一个"零副本时可读"的指标**——检查你的扩缩容指标是否在Pod为零时仍有值；如果当前只有CPU与内存利用率，那么**必须先让应用暴露队列长度或积压深度这类与执行者无关的量**，否则scale-to-zero在架构上就是死锁；(3) **审计镜像分发路径，不要只看"能不能拉通"，要看"拉的是什么路径"**——把镜像仓库主机、仓库前缀、`--system-default-registry`的实际取值、是否使用`registries.yaml`重写与镜像mirror、气隙tarball版本这五项列成一张表逐项确认；特别检查是否有任何地方依赖"空字符串等于docker.io"这一已被反转的语义，以及是否有脚本或流水线仍在用旧的`rancher/`路径做mirror、scan或retag；(4) **重新检查哪些能力在你的架构里是"平台提供"而非"Kubernetes提供"**——像microVM沙箱、快照恢复、托管身份、Key Vault引用这类能力一旦进入设计，就会成为实际依赖；在引入前明确它们在自建路径上的替代方案与迁移成本；(5) **把"升级完成"的判据从节点Ready改成应用关键路径可用，并把回滚触发条件写成显式条目**——配合1%到5%的金丝雀流量，以及"未经人工介入或回滚即完成"的升级成功率指标；(6) **检查日志能否回答"谁或什么执行了有后果的动作、改了什么、是否发生了应有的审批"**——这是Subramanian列出的四个指标之一，也是最常被默认无法回答的一个。

值得持续跟踪的观察点有五个：其一，**Sandboxes类原语是否会以可复用的形式开放给其他Azure服务**，如果Container Apps Sandboxes真的成为平台原语而非产品功能，它会改变多个托管服务的能力边界，而不只是Container Apps；(2) **`ghcr.io/k3s-io`路径变更与语义反转在v1.40之前是否还有第二次调整**——公告给的窗口是预计2027年7月，中间近十个月里如果路径或语义再变一次，迁移成本会被叠加，因此值得把这份公告存档并设一个复核提醒；(3) **HPA缩容到零在真实队列指标下的实测行为**——特别是缩回零与拉起之间的抖动控制，以及`metrics.k8s.io`升v1之后外部指标推送链路的兼容性变化；(4) **`metrics.k8s.io`升v1之后，HPA、kubectl top、自定义指标适配器、以及Prometheus-adjacent的采集链是否全部对齐**——纯粹的版本毕业意味着API不变，但对仍在硬编码`v1beta1`路径的第三方控制器与自定义exporter，这个不变性需要被实际验证而不是被假定；(5) **CNCF是否把"agent沙箱"正式立为一个独立讨论域**——目前AI Inference + Agentic轨道里的编排与推理内容，与托管平台正在GA的沙箱原语之间还缺一节"隔离与身份"的内容；如果KubeCon北美2026（11月9–12日，盐湖城）补上这一节，说明社区也开始把agent运行时的信任边界当成独立问题处理，而不只是推理服务的调优问题。

---
*本文基于2026年10月1日公开资讯整理，来源URL均经核验可访问。*