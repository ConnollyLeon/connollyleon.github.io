---
layout: post
title: "云原生动态：Google把gVisor连同商标整体捐给CNCF并让它先进入「Sandbox」状态、Docker把第3版Sandbox Kit规范交给CNCF把AI agent的权限清单打包成普通OCI镜像、Dell的Container Storage Modules曝出两个CVSS 10.0加四个9分以上漏洞而唯一解就是升到1.18.0、以及Amazon ECS给VPC Lattice补上blue/green与canary部署策略"
date: 2026-10-03
author: "云原生观察"
source: "https://gvisor.dev/blog/2026/10/02/gvisor-cncf/"
categories: [cloud-native]
tags: [cloud-native, kubernetes, gvisor, cncf, sandbox-status, runsc, container-runtime, application-kernel, donation, governance, docker, sandbox-kit-spec, sbx, oci-image, ai-agent, permissions, capability-declaration, network-policy, proxy-managed-credentials, mixin, provides-requires, deny-wins, aws, palo-alto-networks, snyk, jfrog, datadog, dynatrace, aniszczyk, dell, csm, container-storage-modules, CVE-2026-63688, CVE-2026-63692, CVE-2026-67269, CVE-2026-54472, CVE-2026-67273, CVSS-10, karavi, jwt, csi-driver, storage-backend, rbac, kubernetes-secrets, CVE-2026-80521, AF_UNIX, use-after-free, container-escape, seccomp, kernel-patch, amazon-ecs, vpc-lattice, blue-green-deployment, linear-deployment, canary-deployment, lifecycle-hooks, circuit-breaker, cloudwatt, traffic-shifting]
---

10月2日的云原生新闻看起来是四条互不相干的消息——一份捐赠公告、一份规范提案、一份漏洞通告、一条产品更新——但它们全部落在**同一条轴线上：容器隔离这条防线，正在从"某家厂商的实现"重新变成"一项公共基础设施"。** Google把gVisor连同商标一起捐给CNCF，并让它从一个名字里就带着讽刺的项目进入**"Sandbox"**状态；Docker则把Sandbox Kit规范的第3版交给CNCF，核心思路是把**AI agent能访问什么**这件事从散落在shell history、dashboard和人的记忆里，压缩成一个可版本化、可签名、可审计的**普通OCI镜像**。而这同一个上午，Dell的Container Storage Modules曝出**两个CVSS 10.0加四个9分以上**的漏洞，其中一个能让未认证的攻击者拿到**所有已注册存储阵列的管理员凭据**；Amazon ECS则给VPC Lattice补上了blue/green、linear与canary三种托管流量切换策略。**前两条在说"未来的隔离应该长什么样"，后两条在说"今天的隔离已经被打破了，你打算怎么办"——这两件事其实是同一件事。**

## 主要新闻 (Main News)

### Google把gVisor（含商标）整体捐给CNCF：先进入Sandbox状态，仓库将迁出google组织，Ant Group、Modal、Tines已承诺加入维护者

Google于10月2日宣布将gVisor项目（含名称与商标）捐赠给云原生计算基金会（CNCF），并同步调整治理模型。这条公告的时间线被完整公开：9月7日Google提交捐赠申请，9月22日CNCF审查，9月28日申请获批，10月2日发布公告。

治理变化被分成两个阶段。第一阶段是立即生效的"进入CNCF **Sandbox**状态"——公告对这个状态的措辞是"对于这样一个项目来说，这个名字再合适不过了"。该阶段下，gVisor的构建与测试基础设施迁往GitHub Actions与Buildkite；**Google内部原有的gVisor测试基础设施将不再阻塞PR**；治理转向基于维护者的模式，并新增非Google维护者授予merge权限。第二阶段是申请**Incubation**状态的步骤——届时仓库将从`google` GitHub组织迁出，治理转向包含组织级投票的长期模型，从而"阻止Google在治理决策上拥有单方面控制权"，再往后是成为完整CNCF项目的全套步骤。

技术层面，公告强调gVisor是一个**drop-in兼容的容器运行时**，与Kubernetes、`containerd`以及Agent Substrate等CNCF技术直接集成。在资源效率上，它凭借类容器的进程模型，比其他以安全为导向的容器运行时更"云原生"，可以实现VM运行时在**密度与装箱分辨率上无法达到**的安全装箱；同时**不依赖硬件虚拟化或嵌套虚拟化**，凡Linux可运行之处皆可运行。公告称gVisor已在所有主流云上可用，部分作为原生服务提供，其余供用户自安装。

社区交接已在推进：截至发稿，**Ant Group、Modal与Tines**已承诺长期加入gVisor维护者；OpenAI、腾讯与NVIDIA则继续既有贡献。公告给出的理由值得原样引用——在廉价且安全的沙箱需求空前明确的时期 abandoning沙箱技术"说得通才怪"，捐赠的目标是让gVisor与"应用内核"成为**容器生态与安全产业的专业术语**，并推动能解决gVisor性能问题的上游Linux补丁。

### Docker把Sandbox Kit规范（第3版）提交给CNCF：把AI agent的权限声明打包成普通OCI镜像，镜像清单里只留一个`vnd.docker.sandbox.kit.descriptor`声明

Docker在9月24日的WeAreDevelopers大会上宣布把Sandbox Kit Specification提交给CNCF，该规范于10月2日被InfoQ等媒体报道。规范采用Apache 2.0许可，目前为**v3**版本。核心命题只有一句：**让"一个AI agent可以访问什么"这件事，和agent本身一样可移植。**

问题定义被表述得很清楚。像Claude Code、Codex这类agent会代表用户安装包、调用API、使用凭据，而让它们有用的那些授权——bind mount、宽泛的token、放开的防火墙规则——通常**活在shell history、控制台dashboard和人的记忆里**，而不是一个可评审的产物里。Docker认为这正是OCI当初要解决的碎片化。

v3 的关键变化是：**Kit不再是独立的产物类型**。没有自定义media type，没有sidecar文件，镜像清单里只有一个声明`vnd.docker.sandbox.kit.descriptor`。因此Kit可以用`docker buildx build`构建、用`docker pull`拉取，可以被现有工具扫描、签名，甚至在`FROM`里当基础镜像使用——**固定digest即同时固定了内容与权限**。

声明是**带类型、带版本的能力**（capability），例如`com.docker.sandbox/network-policy@2`与`com.docker.sandbox/credential@1`。规范中GitHub CLI的例子是：Kit允许`api.github.com`，但对`/repos/**`的`DELETE`显式拒绝，**deny优先于allow**。凭据可以是**代理托管**的：符合规范的运行时把真实token注入到指向具名域的请求里，沙箱内部只存在一个哨兵值。一次启动由一个workload Kit（提供根文件系统）加上任意数量的mixin叠加层组成，**mixin按`provides`/`requires`依赖图排序而非命令行标志顺序**；若某个`requires`无法满足或两个Kit提供同名能力，则解析失败。

关键的边界条件同样被写明：**Kit只提出权限请求，最终由主机决定；没有符合规范的运行时，这些注解就是惰性的**；若必需请求无法满足，启动会被拒绝。目前唯一的符合规范实现是Docker Sandboxes（在带自有内核的microVM中运行agent）。InfoQ指出，这意味着标准的核心承诺——**跨运行时可移植性——尚未在实践中被证明**，因为还没有第二个竞争运行时可供对照测试。此外每个描述符都可归约为一个规范化的授权集合，运行时可以记录该集合并**阻断任何扩大它的版本，包括删除了deny规则的版本**。Docker称规范随附两套一致性测试套件，一套针对Kit产物，一套针对运行时。

协作方阵容与捐赠OCI时的阵容相当接近：AWS、Box、Datadog、Dynatrace、JFrog、NanoClaw、OpenClaw、Palo Alto Networks、Snyk等。Docker把这次动作与当年捐赠镜像格式与runc、催生OCI直接类比。CNCF CTO Chris Aniszczyk表示欢迎，但**公告未说明该规范是否已被正式纳入CNCF项目体系以及成熟度级别**；在治理决定作出前，Docker继续维护规范。

### Dell的Container Storage Modules曝出多个致命漏洞：两个CVSS 10.0可拿全部存储阵列管理员凭据，升级到1.18.0是唯一手段

Dell于10月2日发布安全更新，修复Dell Container Storage Modules（CSM）中的多个严重漏洞。CSM是把Dell企业存储阵列接入Kubernetes环境的关键组件，因此缺陷的影响不止于集群。已披露的关键条目包括：

- **CVE-2026-63688（CVSS 10.0）**：`csm-authorization-storage` gRPC服务器上关键功能缺失认证，未认证的远程攻击者可获取**所有已注册存储阵列的存储后端管理员凭据**。Dell称该漏洞"极为严重，因为它导致csm-authorization安全模型被完整绕过，攻击者可对横跨全部五个受支持Dell存储产品族的存储基础设施获得完全管理控制权"。
- **CVE-2026-63692（CVSS 10.0）**：授权代理与tenant service上的关键功能缺失认证，未认证的网络攻击者可绕过认证控制并获得管理员级权限，进而访问或篡改**所有租户**的存储资源。
- **CVE-2026-67269（CVSS 9.9）**：ContainerStorageModule Custom Resource reconciler的权限管理不当，低权限远程攻击者可提权并在集群节点上获得root。Dell特别指出，攻击者可通过**提交一个自定义资源就攻陷整个Kubernetes集群的所有节点**。
- **CVE-2026-54472（CVSS 9.8）**：硬编码凭据，远程未认证攻击者可**伪造密码学有效的管理员token**。
- **CVE-2026-67273（CVSS 9.6）**：模板引擎漏洞；Dell称成功利用可获得**集群范围内读取Kubernetes Secrets的权限**以及创建集群级RBAC资源的能力，等于绕过预期的Kubernetes访问控制。
- **CVE-2026-61421（CVSS 9.8）**：影响已归档的karavi-authorization项目，其旧安装指南里就有示例JWT签名密钥，抄用而从未轮换密钥的团队可能仍然暴露。

安全媒体统计该公告（DSA-2026-448）列出13个Dell特定CVE，加上第三方Go库中的24个，另有9个被归为Critical。Dell将CSM 1.17.0之前的**全部版本**列为受影响，1.18.0已修复，**除升级外没有变通方案**。Dell建议客户升级并**轮换所有JWT签名密钥**、更换CSM存储的后端管理员密码、退役任何karavi-authorization部署，并限制对CSM授权服务的网络访问、检查RBAC角色是否有异常变更。

值得注意的是，Security Online指出Dell的受影响版本表"可能不是全部受影响受支持版本的完整清单"——**部分CVE条目直接点名了CSM Authorization 2.4.0、CSM Operator 1.12.0，甚至1.18.0本身**。迄今未见在野利用报告，也没有公开的PoC。

### Amazon ECS为VPC Lattice补上托管的blue/green、linear与canary部署策略

Amazon于10月2日宣布，Amazon Elastic Container Service现已支持为使用Amazon VPC Lattice的ECS服务提供**内置的blue/green、linear与canary部署策略**。使用Lattice做跨VPC、跨AWS账号服务间通信的应用，现在可以直接从ECS原生获得托管流量切换能力，无需自行搭建。

可选的切换节奏对应不同的发布信心：blue/green一次性全量切换，linear等量递增，canary从一个小百分比开始。团队可用测试流量先行验证新版本，再切生产流量，并通过**部署生命周期钩子**（含Lambda与pause钩子）运行自定义验证步骤或人工审批。这些服务还可使用**Amazon CloudWatch告警与ECS部署断路器**在检测到问题时自动回滚，bake time则保持旧版本就绪以实现无停机快速回滚。

该功能对**新旧ECS服务**均可用，覆盖所有支持VPC Lattice的AWS区域。用户需在ECS服务配置中选定VPC Lattice目标组、监听器规则与首选部署策略，可通过控制台、CLI、SDK或IaC工具完成。

## 分析 (Analysis)

这四条新闻串起来看，指向的是同一个结构性变化：**容器隔离正在从"某个产品的配置选项"升格为"有治理、有标准、有漏洞史的公共基础设施"。** gVisor的捐赠与Sandbox Kit规范的提交分别处理了这层公共基础设施的两端——运行时（谁来实现隔离）与契约（agent被允许做什么）。值得注意的是Docker选择的落地形式：不是新造一种产物类型，而是**把权限声明塞进OCI镜像清单**。这在工程上极其聪明，因为它让整套现有供应链工具链（registry、scanner、签名、入场准入）零修改地继承过来。但它同时也把风险从"运行时实现"转移到了"规范语义"上——描述符的语法与每种capability的语义都是新的，需要重新学习；更关键的是**强制性完全依赖运行时**，而符合规范的运行时目前只有一个。标准的价值要等到第二个、第三个实现出现才真正兑现。

第二个观察是gVisor的时点。它与同一天曝出的CVE-2026-80521形成了教科书级的对照：后者是Linux内核AF_UNIX套接字垃圾回收器中的use-after-free，自9月22日起已有公开的容器逃逸利用代码，可让默认Docker或Kubernetes容器内的非特权进程在宿主机上成为root，修复的内核版本（6.12.111、6.18.53、7.1.10、7.2）虽已进主线，但截至9月30日Ubuntu 24.04/26.04与RHEL 10都还没跟进。实测结论尤其值得记住：**`runAsNonRoot`、`capabilities.drop: ["ALL"]`与`RuntimeDefault` seccomp档位都拦不住它**，因为该漏洞需要的正是创建AF_UNIX套接字与用SCM_RIGHTS传递描述符的能力。而gVisor能截断这条路径——容器的Unix套接字存在于Sentry这个用户态内核内部，宿主机那个有漏洞的回收器根本看不到它们。实测中在runsc下跑500对套接字，宿主机上一个都没产生。**一个安全运行时从"单点技术"变成"基金会项目"的价值，在这类具体事件里被定价得很清楚。**

第三个观察针对运维现实：这两天的漏洞组合构成了一个不太舒服的画面。**容器逃逸在内核层，CVM与kubeconfig窃取在CSI驱动层。** CVE-2026-67269尤其恶劣——提交一个自定义资源就能拿到集群所有节点的root；CVE-2026-67273则直接给出集群级Secrets读取与RBAC创建能力。当企业级存储CSI驱动以DaemonSet形式常驻集群、把持全部存储阵列的管理员凭据时，它实质上已经成为一个**单点高价值攻击目标**，而这类组件的补丁跟进速度通常远慢于业务集群的版本迭代节奏。值得注意的是Dell自己的受影响版本清单并不自洽（1.18.0同时出现在受影响与修复版本中），这本身就说明在企业存储集成层做漏洞响应的信息质量还有提升空间。**对practitioners而言，现在应该做的三件事：升级到CSM 1.18.0并轮换所有JWT签名密钥；清点集群里所有运行在节点级DaemonSet形态的CSI驱动；把"内核未修复"这件事当作需要向业务方书面说明的风险，而不是运维内部的待办事项。**

第四点关于最后这条产品更新：VPC Lattice加上托管渐进式交付，标志着"渐进式发布"正在从Kubernetes生态特有的能力，变成**云厂商托管服务的基础契约**。当ECS这种托管运行时把canary、生命周期钩子、断路器都作为一等公民提供时，"我们用金丝雀发布"这句话在技术评审中会越来越缺乏区分度。**竞争维度正在上移到"隔离与权限的可审计性"上**——谁能给出可证明的最小权限、可复现的审计证据和可回滚的授权扩展，这比谁能做蓝绿部署更难复制，也更有长期价值。

## 结论 (Conclusion)

综合来看，10月2日的云原生格局可以用"**基础设施正在被重新定义为公共品，同时暴露出它在资金紧张时有多脆弱**"来概括。gVisor进入CNCF Sandbox、Sandbox Kit规范提交基金会，代表着隔离能力从商业产品的差异化卖点回归为社区共同维护的地基；Dell CSM的CVSS 10.0与仍在扩散的AF_UNIX容器逃逸则提醒我们，地基的维护速度受制于供应链最脆弱那一环的响应速度。

值得跟踪的三条线索：**其一，CNCF对Sandbox Kit规范的治理决定与成熟度级别**——这决定了标准的可信度；**其二，Ubuntu与Red Hat的内核补丁时间表**——这决定了有多少集群要带着已知可利用的逃逸漏洞运行；**其三，第二个符合Sandbox Kit规范的运行时何时出现**——那才是这份规范真正成立的时刻。对企业和从业者而言，短期内最实际的动作是把隔离能力纳入与依赖版本同等严格的治理节奏：升级、轮换密钥、审计节点级组件，并把**权限面本身**当作可审计、可版本化、可签名的工程产物来对待——这恰好也是Docker那份规范试图教给整个行业的道理。