---
layout: post
title: "云原生动态：Kubernetes 1.37的Memory QoS升级为默认能力、Red Hat详解OpenShift默认OVN-Kubernetes与Cilium operator选型、微软开源TauGrid统一K8s上的AI工作负载编排"
date: 2026-09-20
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/09/14/kubernetes-v1-37-memory-qos-graduates-to-beta/"
categories: [cloud-native]
tags: [cloud-native, kubernetes, v1-37, memory-qos, cgroup-v2, qos, openshift, ovn-kubernetes, cilium, ebpf, cni, taugrid, microsoft, aks, kueue, kuberay, gpu, ai-workloads, open-source]
---

9月14日至18日，云原生在"调度、网络与AI基础设施"三条线各有关键进展。调度侧，Kubernetes官方博客于9月14日宣布v1.37中Memory QoS特性进入Beta并默认开启——基于cgroup v2的memory.min/memory.high自动配置，kubelet得以在Pod越过内存限制时以回收与节流替代OOM杀死，让"内存利用率"与"工作负载稳定性"这对老矛盾第一次可以同时优化；网络侧，Red Hat于9月18日发文详解默认OVN-Kubernetes与Cilium operator的选型逻辑，把选择题从"哪个CNI更好"变成"如何对齐运营能力、合规需求与硬件基线"；AI侧，微软正式开源TauGrid，用一个Helm安装统一K8s上AI工作负载的提交、排队、调度、监控与恢复，GPU工作负载的"平台化"步伐显著加快。

## 主要新闻 (Main News)

### Kubernetes 1.37：Memory QoS转正为Beta并默认开启

Kubernetes官方博客于9月14日宣布，Memory QoS（内存服务质量）特性在v1.37中升级为Beta并默认启用。该特性自v1.22起由Red Hat主导开发，核心思路是在cgroup v2上自动配置memory.min与memory.high：当容器声明了内存limit时，kubelet会根据Pod的QoS等级（Guaranteed/Burstable/Besteffort）自动将memory.high设置为对应的内存上限，内存使用一旦越过该边界，内核便先通过回收与限流（throttling）进行干预，而不是直接触发OOM杀死进程。相比此前"越过limit即OOM"的处置，新行为显著改善了运行时稳定性：对Guaranteed工作负载，memory.min保证其关键内存不被Besteffort邻居抢占；对集群整体，Besteffort Pod也可以在"越界被温和回收"的前提下安全复用冗余内存，从而提升节点的内存利用率。需要留意的是，节流可能伴随一定的CPU消耗与排队延迟（行为与CPU throttling类似），且该特性依赖cgroup v2——在使用cgroup v1的节点上不会生效。

**Source:** [Kubernetes v1.37: Memory QoS Graduates to Beta and Is Enabled by Default](https://kubernetes.io/blog/2026/09/14/kubernetes-v1-37-memory-qos-graduates-to-beta/)

### Red Hat：OpenShift默认OVN-Kubernetes与Cilium operator如何选型

Red Hat于9月18日发布文章，对OpenShift上的默认OVN-Kubernetes与通过operator部署的Cilium进行了系统对比。文章开宗明义：选型目标不是找出"绝对更好的CNI"，而是让网络架构与自身的运营能力、安全合规需求与基础设施硬件对齐。默认的OVN-Kubernetes以"100%单厂商支持（Red Hat）、SmartNIC/DPU硬件卸载、无值守的集群升级、零平台工程量"见长；而Cilium operator带来的则是"深度L7/API级安全、Hubble观测面板、原生多集群mesh与无sidecar服务网格"等能力。Cilium走的另一条路径是eBPF：在内核hook点直接注入经过沙箱隔离的eBPF字节码（用户态仅声明CiliumConfig自定义资源），显著降低数据面延迟。文章特别指出，对于用Cluster API（CAPI）或托管控制面（HyperShift）声明式管理集群的团队，Cilium与CAPI机组的自动扩缩、Ignition引导进程天然契合，且Isovalent的企业级Cilium已针对托管控制面完成认证，适合大规模多租户拓扑；而追求稳妥、运维人力有限的企业则更适合保留默认的OVN-Kubernetes。

**Source:** [Red Hat OpenShift networking: Default OVN-Kubernetes vs. Cilium operator | Red Hat Developer](https://developers.redhat.com/articles/2026/09/18/openshift-networking-default-ovn-kubernetes-vs-cilium-operator)

### 微软开源TauGrid：一个Helm安装搞定K8s上的AI工作负载管理

微软于8月末在AKS博客上宣布、近期获业内广泛报道：正式开源TauGrid——一个面向GPU Kubernetes集群、用于管理、调度与监控AI工作负载的云原生平台。其设计目标是把平台团队零散拼装的"提交脚本、队列包装、健康检查、结果回收"等胶水代码收敛为一个统一堆栈：平台侧获得workspaces、队列、计算画像、存储、身份与可观测性能力；研究者则只需通过tau CLI与一份YAML配置即可提交工作负载，无需学习Kubernetes。TauGrid覆盖AI工作负载的完整生命周期——从数据准备、分布式训练、微调到推理，底层以Kueue承担排队与配额管理、以KubeRay承担分布式任务编排，并内置GPU节点健康监控与可观测性；`tau run`把配置校验后转成Kubernetes Job或KubeRay RayJob交由Kueue按配额与优先级排队，任务失败时可从检查点恢复，同时留存日志、检查点与实验证据以保证可复现性。其路线图还包括多租户workspace、RBAC与配额、PyTorch DDP/FSDP、DeepSpeed、LoRA/QLoRA、数据生命周期管理以及多集群/多云执行。代码以Go为主（仓库位于github.com/Azure/taugrid），要求Kubernetes 1.30+与带GPU的节点，只需一次Helm安装。

**Source:** [Microsoft Open-Sources TauGrid to Simplify AI Workload Management on Kubernetes | InfoQ](https://www.infoq.com/news/2026/09/microsoft-taugrid-open-source)

## 分析 (Analysis)

Memory QoS在v1.37的"转正"，把此前v1.37存储加固（bind mount选项与emptyDir权限模式）的叙事延续到了内存侧：安全与效率的默认值正在被逐段改写为"内核原语＋声明式配置"。对平台团队最直接的收益，是Kubernetes第一次默认"在OOM之前先尝试体面地回收"——长期困扰SRE的"越限即被杀、又不敢随便调limit"的两难，被简化成一行默认行为。但默认开启不等于零成本：节流伴随CPU开销与延迟波动，以混布比例见长的团队需要重新校准limit与request的定义，托管环境（GKE/ACK等）也要确认运行时与节点内核的cgroup v2覆盖，避免"升级即行为漂移"。结合Karmada多集群编排9月毕业、v1.37浮出水面等近期事件，Kubernetes在"把大任务编排好、再把它放稳、最后让它跑得便宜"的路径上又走完一环。

CNI选型文章本身说明问题：当OpenShift把"默认OVN-Kubernetes vs Cilium operator"作为正式议题讨论时，"替换默认CNI"已经从个别团队的黑科技变成企业级工程决策。Red Hat给出的判断框架值得借鉴——先自问三件事：运维人力能支撑多大的网络复杂度？安全合规是否必须到L7策略层？硬件（SmartNIC/DPU）是否已经就位？三者都成立，Cilium的eBPF路径与托管控制面（CAPI/HyperShift）的组合优势明显；追求最低总拥有成本与单厂商兜底，则默认OVN-Kubernetes仍是稳妥答案。对eBPF生态而言，这等于又一次"平台厂商官方背书"，也意味着Cilium在OpenShift上的升级、支持与认证路径会进一步被压齐。

TauGrid开源的价值，在于把"AI工作负载调度"这个过去高度工程化的领域重新平台化。它没有重新发明轮子，而是把Kueue（排队/配额）、KubeRay（Ray编排）、GPU健康监控与实验可复现（日志、检查点、实验证据留存）粘合成一个Helm可交付的统一层，并用CLI把研究者从YAML深渊里捞出来——"研究者会写、平台团队好运维"的分工哲学，与Kubeflow、Nvidia Run:AI等替代方案异曲同工。值得注意的是它把"从失败点恢复"与"实验可复现"放进第一版设计，说明GPU作业的"廉价重启"与"可追溯性"正成为AI基础设施的默认要求，而不只是锦上添花。对正在搭建自有AI Infra的团队，TauGrid提供了一条比纯DIY更低的起步点；对Kueue/KubeRay生态的跟踪者，微软的官方背书也为其"标准化选型"再添一票。

## 结论 (Conclusion)

过去一周的云原生进展，构成一条清晰的"AI基础设施平台化"主线：Kubernetes v1.37把Memory QoS升级为默认行为，让GPU/内存密集工作负载在"更稳"与"更省"之间第一次可以兼得；Red Hat给出OVN-Kubernetes与Cilium operator的选型框架，把网络层从玄学变成可评估的工程决策；微软开源TauGrid，用一个Helm安装完成AI工作负载从提交到恢复的全流程编排。对实践者的下一步建议是：在测试集群量化启用Memory QoS后的节流开销并核对cgroup v2覆盖率；以Red Hat的框架为模板，把自身CNI选型从"跟风benchmark"升级为"对齐运营能力清单"；并评估TauGrid是否适合作为团队从零搭建AI训练平台的默认底座——三者叠加，正合著2026年"AI就绪型云原生平台"的标准答案。