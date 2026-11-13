---
layout: post
title: "云原生技术动态：KubeCon收官聚焦AI训练调度、智能体沙箱与社区治理"
date: 2026-11-13
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/11/12/gang-scheduling-and-topology-aware-placement-for-ai-training-in-kubernetes/"
categories:
  - cloud-native
tags:
  - kubecon
  - cncf
  - kubernetes
  - kueue
  - gang-scheduling
  - topology-aware
  - ai-training
  - openshell
  - agent-substrate
  - kubeflow
---

# 云原生技术动态：KubeCon收官聚焦AI训练调度、智能体沙箱与社区治理

KubeCon + CloudNativeCon North America 2026在盐湖城收官，最后一天的议题把焦点从“把AI负载放进Kubernetes”进一步推向“如何让GPU集群真正跑满、让智能体安全运行、让社区持续供给人才”。Datadog与CNCF发布的调度实践揭示了Kueue与Coscheduling在生产中的分工，CNCF社区奖把聚光灯投向长期维护者，而OpenShell与Agent Substrate进入沙箱则标志着智能体基础设施正在被纳入云原生治理框架。

## 主要新闻

### Kubernetes原生调度补课：gang scheduling与拓扑感知放置成为AI训练刚需

CNCF在11月12日发布由Datadog工程师David Lentz撰写的技术文章，系统梳理了分布式AI训练对Kubernetes调度器提出的两个硬约束：同一训练作业的所有Pod必须同时启动，且必须落在具备合适GPU互联带宽的拓扑域内。文章指出，Kubernetes默认逐Pod独立调度，无法满足这两个条件，结果是GPU被分配却空转，或者跨机架通信拖慢每一步训练。

生产路径目前仍由Kueue与Coscheduling插件承担。Kueue位于kube-scheduler之上，在准入阶段根据配额、优先级、抢占和拓扑标签决定作业是否进入调度，并把拓扑约束写入Pod模板；它依赖管理员或云厂商预先为节点打上block、rack、host等拓扑标签。Coscheduling则通过PodGroup跟踪整个gang，`spec.minMember`定义最小成员数，`status.phase`在Pending、Scheduling、Running、Unknown、Finished、Failed之间迁移。文章强调，验证调度效果不能只看基础设施指标，还要把Kueue队列深度、PodGroup状态、GPU互联遥测与训练吞吐（steps/s、tokens/s）关联起来，否则“GPU利用率看起来正常、训练吞吐却持续下降”的问题很难定位。

原生能力正在追赶。Kubernetes v1.35引入gang scheduling alpha，v1.36加入拓扑感知调度alpha、工作负载感知抢占以及原生PodGroup API，v1.37把gang scheduling与工作负载感知抢占推进到beta（`GenericWorkload`特性门控默认关闭），拓扑感知调度仍为alpha。CNCF同时提到，Kubernetes 1.36的Workload与PodGroup API（KEP-4671）为gang调度、拓扑放置和高带宽互联协同提供了调度器原生原语。

**Source:** [Gang scheduling and topology-aware placement for AI training in Kubernetes](https://www.cncf.io/blog/2026/11/12/gang-scheduling-and-topology-aware-placement-for-ai-training-in-kubernetes/)

### CNCF社区奖揭晓：Prometheus与Kubernetes安全维护者获终身成就奖

11月12日，CNCF在KubeCon颁奖典礼上公布2026年社区奖，共表彰11位贡献者。终身成就奖授予Prometheus联合创造者Julius Volz与Kubernetes SIG Auth主席Rita Zhang，二人在可观测性与安全治理两个AI时代最关键的领域投入超过十年。Top Committer奖授予Antonio Ojea，表彰其在Kubernetes网络与测试上的持续贡献，包括IPv6双栈、KIND测试基础设施，以及把Dynamic Resource Allocation扩展到网络资源的DRANET。

Chop Wood Carry Water奖颁给Maciej Szulik、Saiyam Pathak、Steven Jin、Francisco Herrera与Joe Stringer，覆盖Istio发布工程、核心Kubernetes控制器维护、社区导师计划等“看不见但缺不得”的工作。Lorem Ipsum（原Top Documentarian）奖授予Natali Vlatko、Jimmy Song与Dylan Reimerink，表彰其在Kubernetes、HAMi、Cilium与eBPF文档上的长期投入。CNCF CTO Chris Aniszczyk表示，这些获奖者做的是让项目“年复一年保持可靠”的粗活。

**Source:** [CNCF Recognizes Cloud Native Champions in 2026 Community Awards](https://www.cncf.io/announcements/2026/11/12/cncf-recognizes-cloud-native-champions-in-2026-community-awards/)

### OpenShell与Agent Substrate进入CNCF沙箱，智能体运行时开始“云原生化”

KubeCon期间，NVIDIA把OpenShell贡献给CNCF沙箱，Google则把Agent Substrate、gVisor与OpenRL带入基金会。OpenShell定位为自治AI智能体的安全与治理运行时，采用CNCF项目Cedar作为策略语言，核心贡献者来自NVIDIA、Red Hat、Docker与Canonical。它把每个沙箱建模为Kubernetes对象，使RBAC、Kyverno、审计日志与kubectl都能作用于智能体；策略在单沙箱supervisor与共享egress网关两层执行，可以细到“允许curl读取GitHub issue、但禁止创建issue”。

Agent Substrate面向长期运行的有状态智能体，要求每个actor使用gVisor或Cloud Hypervisor沙箱，支持快照与恢复，并通过统一API兼容Kubernetes。Google在博客中将其与gVisor、OpenRL组合为“智能体基础设施栈”：gVisor负责不可信代码隔离，Substrate负责状态与调度，OpenRL负责Kubernetes原生的强化学习循环。对平台团队而言，这意味着智能体不再是“跑在Pod里的一个应用”，而是需要独立身份、策略、审计与生命周期管理的基础设施对象。

**Source:** [Welcoming OpenShell to the CNCF: Open Governance to Secure Agentic AI](https://www.cncf.io/blog/2026/11/10/welcoming-openshell-to-the-cncf-open-governance-to-secure-agentic-ai/)

### CNCF年度里程碑：231个项目、40个AI一致性平台与Kubeflow毕业

CNCF在11月10日公布的年度进展显示，基金会项目总数达到231个，全球云原生开发者规模达到2120万，过去12个月新增550万；全年CNCF与云原生活动吸引8.2万名参会者，KubeCon Europe创下近1.35万人纪录。AI相关进展包括：Kubeflow完成毕业，HAMi进入孵化，Kubernetes推进工作负载感知调度与Dynamic Resource Allocation，Kubernetes AI Conformance计划达到40个认证平台。

这组数字与调度、沙箱两条技术线形成呼应：项目数量扩张的同时，CNCF正试图用一致性认证、用户组和参考架构把“能跑”变成“可运营”。11月11日公布的CNCF User Groups计划进一步把终端用户按行业与问题域组织起来，直接向技术咨询委员会汇报，试图缩短生产经验回流到项目治理的路径。

**Source:** [CNCF Hits Major Milestones with Global Community Growth, Record Industry Investment and a New Generation of Projects to Build AI Systems in Production](https://www.cncf.io/announcements/2026/11/10/cncf-hits-major-milestones-with-global-community-growth-record-industry-investment-and-a-new-generation-of-projects-to-build-ai-systems-in-production/)

## 分析

KubeCon最后一天传递出的最清晰信号，是AI基础设施的竞争重心已经从“有没有GPU”转向“GPU是否被有效利用”。Datadog的文章之所以重要，不是因为它介绍了两个已知项目，而是因为它把调度问题拆成了可观测、可验证的工程链路：准入队列、gang组装、拓扑放置、互联带宽、训练吞吐。过去平台团队常把训练慢归因于模型或框架，实际上很多损耗发生在Pod被放到错误的机架、或者gang只启动了一半。把Kueue的`kueue_pending_workloads`、`kueue_admission_wait_time_seconds`、`kueue_evicted_workloads_total`与PodGroup状态、GPU/NVLink/PCIe遥测对齐，才可能把“看起来繁忙”与“真正产出”区分开。

更值得注意的是原生API的节奏。Kubernetes 1.35到1.37在两年内把gang scheduling从alpha推到beta，把拓扑感知、工作负载感知抢占和PodGroup纳入核心API，这说明社区已经承认“批处理调度”不再是可选插件，而是AI时代的默认能力。但beta默认关闭、拓扑感知仍是alpha，意味着短期内Kueue+Coscheduling仍是生产路径。企业不应等到原生GA才补课，而应先把拓扑标签、配额模型、PodGroup监控和训练吞吐基线建立起来；这些数据资产在迁移到原生API时可以直接复用。

OpenShell与Agent Substrate的加入，则把另一个风险面摆上台面：智能体拥有比普通微服务更高的权限，会执行shell、安装包、读文件、开网络连接，甚至根据刚从互联网抓取的文本行动。传统NetworkPolicy与RBAC只能约束“谁可以调用什么API”，却很难约束“智能体在沙箱里做了什么”。OpenShell用Cedar策略、egress网关和Kubernetes对象化沙箱补上行为层治理，Agent Substrate用gVisor/Cloud Hypervisor补上隔离层。两者结合，实际上是在把“智能体安全”从应用代码问题转化为平台基础设施问题。

社区治理层面，CNCF社区奖与User Groups计划说明基金会正在同时处理“人的供给”和“经验回流”。AI负载把网络、调度、安全、可观测性的复杂度推高，单靠少数明星维护者无法覆盖；把终端用户按行业组织起来、把文档与发布工程纳入奖励体系，是在为下一阶段的规模化采用做准备。接下来值得观察的是：Kubernetes 1.37的`GenericWorkload`何时默认开启、Kueue与原生API的边界如何划分、OpenShell的Cedar策略能否成为智能体治理的事实标准，以及CNCF User Groups能否产出可复用的行业参考架构。

## 结论

KubeCon 2026收官日的主线可以概括为“把AI负载从能跑变成跑得好、管得住”。短期来看，平台团队应优先做三件事：为GPU节点补齐拓扑标签并用Kueue/Coscheduling验证gang与放置效果；把训练吞吐纳入与GPU利用率同等重要的监控指标体系；在引入智能体运行时之前，先明确沙箱隔离等级、策略语言、egress控制与审计落点。中期应跟踪Kubernetes原生调度API的成熟度，以及OpenShell、Agent Substrate在CNCF沙箱中的治理进展。云原生的下一轮竞争，不会只比谁先支持新硬件，而会比谁能让昂贵的算力少空转、让高权限的智能体少越界。
