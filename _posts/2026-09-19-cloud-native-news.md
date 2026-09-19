---
layout: post
title: "云原生动态：Karmada通过CNCF毕业认证成为多集群编排新标杆、Kubernetes 1.37引入bind mount选项与emptyDir权限模式加固存储安全、Azure九月CVE集群扩散至PostgreSQL与计费层"
date: 2026-09-19
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/09/16/kubernetes-v1-37-hardening-container-storage/"
categories: [cloud-native]
tags: [cloud-native, karmada, cncf, graduation, multicluster, kubernetes, v1-37, storage-security, bindmount, emptydir, noexec, azure, cve, postgresql, billing, kubernetes-security]
---

9月16日至18日，云原生生态在"编排层、平台层与安全层"三条线上各有关键进展。编排侧，多集群编排项目Karmada在KubeCon China 2026期间获得CNCF毕业认证，伴随v1.19发布把AI训练的多组件调度与优先调度推向Beta——这意味着"跨集群运行一个应用"从实验工具沉淀为生产级基础设施，继上周Cilium 1.20之后又一重量级里程碑落地。平台侧，Kubernetes v1.37的存储安全加固内容于9月16日得到官方集中解读：bind mount选项（noexec/nosuid/nodev）与emptyDir权限模式（mode字段）让文件系统级加固从init容器脚本走向Pod声明式配置。安全侧，Azure九月的CVE集群持续扩散——9月18日新披露的PostgreSQL（CVSS 9.9）与Billing（CVSS 10.0）两个高危漏洞，把攻击面从身份控制面进一步推向数据层与财务层。

## 主要新闻 (Main News)

### Karmada正式毕业：CNCF多集群编排"从实验到生产"

CNCF在KubeCon + CloudNativeCon + OpenInfra Summit + PyTorch Conference China 2026（上海）期间宣布，多集群、多云Kubernetes编排项目Karmada正式毕业——这是CNCF对"稳定、被广泛采用、可投产"项目的最高成熟度认证。与毕业同步发布的v1.19版本，为分布式AI训练任务增强了多组件（multi-component）调度能力，并将优先级调度（priority-based scheduling）提升至Beta且默认开启，确保关键工作负载优先被调度。Karmada自2021年进入CNCF Sandbox、2023年进入Incubating以来，已聚集超过1,214名贡献者与292家组织，生产采用者包括Bloomberg、Wellhub、阿里云、华为、Trip.com、B站、商汤、Vivo、WPS等。作为KubeFed退役后的继承者之一，Karmada并不取代标准Kubernetes API，而是以统一控制面（API Server / Controller Manager / Scheduler + 各自的etcd）叠加PropagationPolicy与OverridePolicy两类自定义API，提供跨集群放置、传播、故障转移与多集群弹性伸缩；平台团队无需改动既有manifest，即可获得覆盖"多云容量、跨地域容灾、GPU/CPU异构调度"的多集群能力。恰逢GPU资源在区域与云商之间碎片化、单一集群难以容纳大型训练任务的当口，Karmada把"分片训练、异构调度、分布式推理"变成可以被策略声明的编排资产。

**Source:** [Karmada Graduates From CNCF, cementing multi-cluster Kubernetes orchestration as production-ready | InfoQ](https://www.infoq.com/news/2026/09/karmada-kubernetes-cncf/)

### Kubernetes 1.37存储安全加固：bind mount选项与emptyDir权限模式让声明式安全成为默认

Kubernetes官方博客于9月16日发布v1.37存储安全解读，正式落地两个Alpha特性门控：`VolumeBindMountOptions`与`EmptyDirVolumeMode`。前者在`volumeMounts`上新增`bindMountOptions`字段，允许对任意卷类型（emptyDir、PersistentVolume、CSI、projected等）的容器内bind mount施加`noexec`/`nosuid`/`nodev`标志——此前默认挂载不带任何加固标志，一旦进程被攻破，可借可写卷下载、chmod +x并执行任意二进制，即使容器根文件系统已是只读（readOnlyRootFilesystem）；1.24安全审计（NCC-E003660-7HM）早已将"无法对emptyDir施加noexec"标记为安全失败。后者为`emptyDir`新增`mode`字段（octal 0000–01777），允许直接声明目录权限位，包括再现共享/tmp语义的关键粘滞位`01777`，替代了长期以来"init容器chmod、自定义卷类型"的合规绕行。实现上，bind选项经由CRI `Mount`消息的`mount_options`下发，由运行时（containerd/CRI-O）合并进OCI mount选项并在内核级执行；kubelet通过节点声明特性（Node Declared Features）避免把Pod调度到不支持的节点，无静默降级。两个特性均为Alpha且默认关闭，缺省行为保持不变——这意味着一份"更紧、更可审计"的默认安全基线已经进入Kubernetes API，只待平台团队打开。

**Source:** [Kubernetes v1.37: Hardening Container Storage with Bind Mount Options and EmptyDir Permissions](https://kubernetes.io/blog/2026/09/16/kubernetes-v1-37-hardening-container-storage/)

### Azure九月CVE集群扩散：PostgreSQL与Billing两个高危漏洞浮出水面

据Forkast 9月18日报道，Azure九月的身份基础设施漏洞集群持续扩大，最新披露的两个漏洞把攻击面推向纵深：其一为Azure Database for PostgreSQL的CVE-2026-85878（授权逻辑不当，CWE-285，CVSS 9.9）；其二为Azure Billing的CVE-2026-62874（数据真实性校验不足，CWE-345，CVSS 10.0），二者均由Tenable与MITRE确认，于9月18日公开发布。叠加此前披露的Azure AD B2C（CVSS 10.0）、Azure AI Language（10.0）、Entra ID（9.9）、Cosmos DB（8.5）、Dataverse（9.0）、Microsoft Fabric（10.0）等，经核验漏洞已超过10个、波及10余个不同服务，攻击面沿"谁能认证（身份层）→AI端点信任什么（AI层）→数据存在哪里（数据层）→计费如何验证（财务层）"四级展开。值得注意的结构性特征：大多数漏洞属于"无需凭据即可绕过信任边界"的认证/授权逻辑失败，微软均以服务端修复处理、无需客户操作——这与"一个个孤立实现缺陷"不同，更像是一种"共享认证架构依赖未能跟上服务扩张"的系统性隐患，云上身份控制面正在成为2026年最值得优先清点的高价值风险面。

**Source:** [The Fault Line Spreads: Azure's September CVE Cluster Now Covers PostgreSQL and Billing | Forkast](https://forkast.news/the-fault-line-spreads-azures-september-cve-cluster-now-covers-postgresql-and-billing/)

## 分析 (Analysis)

Karmada毕业的行业含义，是"多集群"正式从高级用户的DIY方案变成平台团队的默认资产。GPU存量在区域与云商之间碎片化之后，没有单个集群能装下大型训练任务，工作负载必须被拆分、调度与跨系统迁移——Karmada以"标准API + 不修改应用"的方式承接了这一需求，恰好填补KubeFed退役后留下的真空，并与Cluster API（管集群生命周期）、Argo CD ApplicationSet（管GitOps分发）形成互补而非重叠。对企业而言，CNCF毕业不只是荣誉：它意味着第三方安全审计、正式指导委员会与CII最佳实践徽章齐备，采购部门第一次可以像评估一个成熟商业产品一样评估多集群编排方案。对平台团队，接下来的动作是评估Karmada v1.19的优先调度Beta是否与自身工作负载优先级语义对齐，并把它纳入多集群容灾演练。

v1.37的存储加固，则是"声明式安全"对"运维hack"的又一轮替代。noexec/nosuid/nodev与emptyDir mode把安全审计反复点名的两个缺口（0777默认权限、可写卷的任意代码执行面）压缩进Pod规格本身，让静态YAML扫描即可评估每个卷的安全姿态，也让Gatekeeper类策略引擎能够把这些字段纳入统一规则集。但升级节奏需要克制：两个特性都是Alpha且默认关闭，bind选项还需运行时支持CRI `mount_options`并正确上报`runtimeFeatures`，kubelet会拒绝在无法支持的节点上调度这类Pod——这意味着平台团队需要先做运行时兼容性盘点，再批量启封。值得注意的是，这些能力与Linux安全基线的对齐，预示着未来对hostPath、ephemeral乃至镜像卷的同类暴露，安全侧的"内核原语API化"会是持续方向。

Azure CVE集群的价值在于警示一种结构性集中风险：10多个跨服务漏洞共享"无需凭据绕过认证/授权"的模式，说明平台越大、共享控制平面越关键，A/B面也越单一——这正是上周Azure East US单区域故障同时拖垮OpenAI、Anthropic与xAI的同一个病根。对云原生团队，账单层与数据层的漏洞通常不在常规SRE监控范围内，提醒我们应把"云供应商身份控制平面＋数据层＋计费层的供给链"完整纳入风险登记与故障演练，而不是默认"服务已由微软修复"即可高枕无忧。把这三条新闻并置，2026年云原生的主线已相当清晰：编排能力走向生产（Karmada）、安全默认走向声明式（v1.37）、平台依赖走向风险量化（Azure CVE）——"默认可编排"与"默认安全"第一次成为同一份工作。

## 结论 (Conclusion)

过去四天，云原生圈子同时收获"里程碑""加固包"与"风险提示"：Karmada以CNCF毕业认证为多集群编排立下生产级标杆，v1.37以bind mount选项与emptyDir权限模式把存储安全改写成可审计的声明式字段，而Azure九月CVE集群扩散至PostgreSQL与计费层，提醒所有平台团队对"认证控制面＋数据层＋财务层"的集中依赖保持清醒。对实践者，下一步值得依次推进：评估Karmada v1.19优先调度与多组件调度在自身AI训练场景的适配性；盘点运行时对CRI `mount_options`的支持并试点`VolumeBindMountOptions`/`EmptyDirVolumeMode`；同时把云供应商漏洞披露（而非仅依赖服务端修复）纳入工程风险登记，为2026下半年的"安全即声明、平台即信任"做好准备。