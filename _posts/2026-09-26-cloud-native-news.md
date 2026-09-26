---
layout: post
title: "云原生动态：Docker将Sandbox Kit规范以Apache 2.0捐给CNCF、Cloudflare Containers共享磁盘残留数据泄露已修复、Kubernetes 1.37发布负责人详解scale-to-zero与Checkpoint Restore、groundcover并购Wand押注自主基础设施"
date: 2026-09-26
author: "云原生观察"
source: "https://www.docker.com/blog/docker-sandbox-kit-spec-cncf/"
categories: [cloud-native]
tags: [cloud-native, docker, cncf, sandbox-kit, agent-permissions, oci, cloudflare, containers, isolation, multi-tenancy, kubernetes, 1-37, hpa, scale-to-zero, checkpoint, groundcover, wand, resource-optimization, finops, platform-engineering]
---

9月24日至25日，云原生生态在三条主线上同时推进：标准化侧，Docker在WeAreDevelopers大会宣布以Apache 2.0开源"Sandbox Kit规范"并承诺提交CNCF中立治理，把AI代理的权限清单变成可与代理同镜像分发的OCI工件；安全侧，Cloudflare披露并修复了Cloudflare Containers共享磁盘的稀疏置备缺陷，付费客户可读取其他客户容器遗留的磁盘数据（含面向不可信代理代码的Sandboxes）；版本侧，Kubernetes 1.37发布负责人Dipesh Rawat在TFiR访谈中系统解释了HPA scale-to-zero、Resilient Watch Cache与Pod级Checkpoint/Restore三条主线；平台工程侧，groundcover完成其首次收购——以色列Kubernetes资源优化公司Wand，意图从"可观测"跨到"可运营"。四者合起来指向同一判断：云原生的下一阶段竞争，不在集群里，而在权限的可移植性、共享资源的隔离性与自动化的可信边界上。

## 主要新闻 (Main News)

### Docker将Sandbox Kit规范以Apache 2.0开源并提交CNCF：把"代理能做什么"变成可移植的OCI工件

Docker与CNCF在WeAreDevelopers大会宣布，Docker Sandbox Kit规范以Apache 2.0开源，并将提交给CNCF进行中立治理。Kit本身并非新概念——它是Docker Sandboxes（运行在隔离microVM中执行AI代理代码的产品）中用于打包"代理 + 其工具 + 其可触达范围"的机制；真正的新变化是产物形态：一个Kit现在就是一个普通OCI镜像，且描述它的格式是开放的。镜像里同时携带三样东西——代理、工具，以及一份带类型的权限清单（涵盖要访问的主机、凭据与卷）。因为清单在镜像内，"钉住镜像"就同时钉住了代理与它的请求。Docker称本次动作与其此前把镜像格式交给OCI的路径一致，并明确表态"Sandbox Kit不应只有Docker Sandboxes一个运行时实现"。CNCF CTO Chris Aniszczyk的评论点明了产业动机："标准让生态快速推进而不碎片化"，而"建立在OCI之上的代理标准可以一次触达整个生态"。背景是此前Anthropic的Claude Cowork/Claude Code、Cursor命令行工具、Docker与OpenAI Codex已先后暴露代码沙箱逃逸问题——把"权限"作为一等可审计工件，正是对这些事件的直接回应。

**Source:** [Docker Brings Sandbox Kit Spec to the CNCF | Docker](https://www.docker.com/blog/docker-sandbox-kit-spec-cncf/)

### Cloudflare修复共享磁盘残留数据泄露：一个付费客户可读取其他客户容器遗留的磁盘内容

Cloudflare与发现该问题的研究者周四共同披露：Cloudflare Containers存在一处缺陷，允许付费客户读取同一服务器上其他客户容器遗留的数据。数据来源是更早容器使用后交回的磁盘空间，而非任何在运行的工作负载，且攻击者无法指定拿到的是谁的数据（这正是薄置备块回收池的典型后果）。Cloudflare Containers运行客户程序于多账户共享的服务器，且由Cloudflare而非客户决定调度到哪台机器；基于Containers销售、专门用于运行不可信代码（包括AI代理生成的代码）的Cloudflare Sandboxes同样受影响。缺陷由安全公司Accomplish的Oren Yomtov于9月4日通过漏洞赏金报告。Cloudflare采取两步修复：先对新分配的块重新开启清零（研究者9月14日确认PoC失效），但这无法清理已映射进运行中容器磁盘、以及各服务器预置镜像层缓存中的旧块，因此又下线了所有运行中的容器磁盘并清空缓存，在低峰期排空并重启服务器，9月19日完成清理，9月25日（即披露日）公布。研究者另称同一套磁盘设置影响了Cloudflare的Browser Run产品，并将此次发现列为自7月以来针对代码沙箱的第六次逃逸。Cloudflare称客户无需采取任何行动。

**Source:** [Cloudflare Fixes Flaw That Let One Container Read Another Customer's Leftover Disk Data | The Hacker News](https://thehackernews.com/2026/09/cloudflare-fixes-flaw-that-let-one.html)

### Kubernetes 1.37发布负责人详解：scale-to-zero、检查点恢复与API Server韧性

CNCF在TFiR发布对Kubernetes 1.37发布负责人Dipesh Rawat的访谈，系统梳理了这一版本的主要增强项：HPA scale-to-zero（把自动伸缩从"至少1个副本"的地板扩展到0，显著压低事件驱动与间歇性服务在空闲期的开销，前提是触发扩容的请求、队列深度信号或定时任务在负载为0时仍可获得）、Resilient Watch Cache（提升API Server在大量Watch场景下的韧性）、以及Pod级Checkpoint/Restore。访谈同时覆盖关键弃用项，并指向Kubernetes整体正在走向的架构方向——面向AI与长时批处理任务的"工作负载感知调度"。这与1.37已GA的多项能力形成呼应：Metrics API（metrics.k8s.io）在历经约九年Beta后转正、Pod级资源requests/limits转正、PodCertificateRequest与ClusterTrustBundle在certificates.k8s.io/v1转正，为工作负载身份与mTLS工具提供稳定基础；KubeletInUserNamespace进入Beta并默认启用，使kubelet、运行时、CNI插件与kube-proxy可作为非root用户运行。

**Source:** [TFiR: "Kubernetes 1.37: Scale to Zero, Checkpoint Restore, and API Server Resilience | Dipesh Rawat" | CNCF](https://www.cncf.io/news/2026/09/24/tfir-kubernetes-1-37-scale-to-zero-checkpoint-restore-and-api-server-resilience-dipesh-rawat/)

### groundcover并购Wand：从"观察基础设施"跨到"运营基础设施"

可观测性平台groundcover宣布收购以色列Kubernetes资源优化公司Wand，这是其首次收购。据以色列财经媒体CTech报道，交易金额为"数千万美元级"；Wand成立于2023年，由Shon Lev-Ran与Shir Monether创立，融资约400万美元（Angular Ventures领投种子轮），创始团队与约10名员工将加入groundcover。技术层面，Wand协调垂直、水平与集群级资源决策，依据观测到的工作负载行为在实时调整CPU与内存分配，优先保证应用性能与可用性，同时消除多余算力；其做法不是输出"需工程师手工执行的建议"，而是直接作用于集群内环境，并可通过Helm chart部署。groundcover的动机在自家博客中说得很直白："我们不是因为想变成Kubernetes成本优化公司才收购Wand……我们认为观察基础设施与运营基础设施之间的界线会越来越模糊"，并进一步把code、部署、事故与既往运维决策等工程上下文与遥测数据一起喂给AI agent，使其在执行基础设施变更前拥有更完整的生产环境认知。groundcover成立于2021年，服务250余家客户，两个月前刚完成1亿美元融资，累计融资1.6亿美元。

**Source:** [Why groundcover Acquired Wand: Autonomous Infrastructure | groundcover](https://www.groundcover.com/blog/why-we-acquired-wand-autonomous-infrastructure)

## 分析 (Analysis)

Docker的Kit标准化是本轮最有结构性意义的一步。此前"AI代理的权限"散落在各家运行时的私有配置里：一个系统用YAML描述代理能访问什么，另一个用JSON，用途与字段都不可比，结果是权限无法被审计、无法被评审、无法在运行时之间迁移，更无法在CI中被验证。Kit把权限清单与代理放进同一个OCI镜像，直接复用了云原生生态已经花了十余年建成的分发、签名（cosign）、SBOM与准入控制（Kyverno/Gatekeeper）基础设施——换句话说，"代理能做什么"从此可以用与"镜像里有什么"完全相同的供应链安全工具链来处理。这条路径的聪明之处在于它不要求任何厂商放弃现有运行时：Sandbox Kit建立在OCI之上，OCI已经是整个生态的地基。反过来说，它的成败完全取决于是否真的做到"任何符合规范的运行时都一致解释同一份清单"——这正是历史上 OCI、CRI、CNI 都经历过的收敛过程。规范刚进入CNCF中立治理、尚需时间验证，可追踪的信号是除Docker Sandboxes外是否出现第二、第三个符合规范的运行时实现，以及权限清单的schema是否会像CRI API那样经历一轮"看起来够用、实际上逼迫所有实现打补丁"的收敛痛。

Cloudflare的事件则提醒人们：多租户共享基础设施的隔离边界，往往不落在大家盯着的那个"层"上。这里出问题的不是容器运行时、不是网络、不是cgroup，而是薄置备（thin provisioning）的块回收策略——一个存储层的实现细节。攻击者甚至无法控制自己读到谁的数据，这意味着它不构成一个可定向利用的投毒工具，但足以构成信息泄露的合规风险。这一模式正在成为代码沙箱赛道的系统性特征：自7月以来，Anthropic的Claude Cowork/Claude Code、Cursor的CLI、Docker、OpenAI的Codex，再到这次的Cloudflare Containers，六次逃逸横跨多家主流厂商，说明"microVM或容器作为执行隔离"这一层已经相对稳固，而**隔离环境之外的共享状态——磁盘、缓存、镜像层池**——正在成为新的攻击面。Cloudflare的修复方式（清零新块 + 全量重建运行中磁盘与镜像层缓存）也提示了这类问题的固有代价：共享资源池的污染一旦发生，就无法在原地修复，只能整体退役重建。

groundcover并购Wand标志着可观测性与资源优化这两条长期割裂的产品线开始合流。此前二者的分工是清晰的：可观测性回答"发生了什么"，资源优化回答"应该改成什么"，中间的"改"由人完成。Wand的自动化把这条人工环节拿掉了，而groundcover的雄心更大——它想让AI agent基于生产上下文"安全地行动"（"Understanding is only part of the problem. For infrastructure to become autonomous, systems also need to act safely on what they know"）。这条路线的成败几乎完全取决于一个安全问题：**谁为agent的自动变更负责**。Karmada式的集群自动化、Kyverno式的准入策略，都提供了"可审计、可回滚、可声明"的技术基础，但当决策主体从人变成模型，审计日志的语义就必须从"人做了什么"扩展到"模型为什么认为该这么做"。可以预见的是，接下来这一细分领域的产品竞争会大量围绕"变更前的模拟/预演（dry-run at fleet scale）"与"越权变更的自动回滚"展开。

Kubernetes 1.37的三条主线（HPA scale-to-zero、Checkpoint/Restore、工作负载感知调度）恰好对应了本期另外两条新闻的伏笔：scale-to-zero是FinOps诉求在编排层的正式承认，Checkpoint/Restore是"高频、有状态、可迁移工作负载"在编排层的正式承认，而工作负载感知调度（面向AI与长时批处理）则是Karmada在9月刚刚毕业时押注的方向。三者合起来意味着Kubernetes正试图把"AI基础设施"这半个新负载形态纳入其自身的抽象体系，而不是像前几轮那样由外部项目另起炉灶。对平台团队的实际含义是：1.37值得优先做升级可行性评估，但务必先排查三处已知的破坏性变更——IPVS kube-proxy模式弃用、static Pod内Secret支持被移除、SELinuxMount默认开启（影响CSI卷重标记行为）；2. scale-to-zero带来的成本节省是真实的，但只有在"触发器本身在零负载时依然可用"时才成立，事件驱动服务应把这一点作为验收标准；3. 检查点恢复值得重新评估其安全含义——同一时间线上，CRI-O的检查点恢复漏洞（CVE-2026-92574）表明恢复路径会把凭据、capabilities与seccomp状态一并还原，从而绕过准入策略声明。若集群启用了checkpoint restore，应把检查点镜像按与特权镜像同级的工件来管理。

## 结论 (Conclusion)

过去24小时的云原生新闻共同勾勒出一个不太舒服但重要的现实：**隔离正在从"一层"变成"很多层"，而每一层都需要单独治理。** Docker把代理权限做成OCI工件，是在给最上面那层（授权）补一个可移植、可审计的表达；Cloudflare的磁盘缺陷提醒我们，中间那层（共享存储池）是当下最薄的一环；groundcover与Wand的合并则指向最后一层（决策自动化）——一旦基础设施由agent自动调整，"权限"与"信任"的边界就必须重新定义。Kubernetes 1.37把scale-to-zero与checkpoint restore纳入一等公民，则是运行时的正面回应：编排层开始承认成本与状态迁移是它该管的事。

对实践者，本周可执行的动作清单是：(1) 跟踪Sandbox Kit规范在CNCF下的演进，关注是否出现第二个符合规范的运行时——这是判断该规范能否避免碎片化的关键早期信号；(2) 若使用任何"共享服务器 + 薄置备"的托管容器服务（包括Serverless Containers类产品），主动询问供应商的块回收与清零策略，并把"新建实例是否继承预置缓存"纳入供应商评估问卷；(3) 完成Kubernetes 1.36→1.37升级前的三项破坏性变更排查，尤其是static Pod内Secret依赖（控制面引导流程极易在此断裂）；(4) 重新审计"哪些资源规格（CPU/内存requests）是给人调整的、哪些已经由自动化系统调整"，并为后者建立独立的变更审计与回滚通道。

值得持续跟踪的下一个观察点：Kit类规范能否真正避免重演"每家运行时一套格式"的历史，以及社区是否会随之出现面向代理权限的通用准入策略（例如"清单中声明的凭据必须与Pod服务账号身份一致"这类可表达的策略原语）。这两件事的答案，将决定AI代理能否像容器一样成为云原生生态里一层真正可被平台工程治理的抽象。

---
*本文基于2026年9月24-25日公开资讯整理，来源URL均经核验可访问。*
