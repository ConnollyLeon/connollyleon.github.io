---
layout: post
title: "云原生动态：eBPF跃升为Kubernetes标准基础设施、Karmada实现CNCF毕业、v1.37特性周收官强化可观测性与AI调度"
date: 2026-09-15
author: "云原生观察"
source: "https://dev.to/saaro_net/ebpf-in-kubernetes-2026-from-kernel-feature-to-standard-infrastructure-5cj9"
categories: [cloud-native]
tags: [cloud-native, kubernetes, eBPF, cilium, karmada, cncf, observability, native-histograms, ai-scheduling]
---

9月中旬，云原生社区在"AI驱动基础设施"与"可观测性工程"两条主线上继续加码。CNCF年度调查与社区实践表明，eBPF正从内核奇技成为Kubernetes网络的默认底座，Cilium已是GKE、EKS与AKS的事实标准CNI；Karmada在KubeCon China上海站完成CNCF毕业，把多集群编排从"灾备与扩缩"推向"跨集群的分布式AI训练调度"；Kubernetes v1.37特性博客周收尾，Native Histograms晋级Beta，配合metrics API正式发布、Rootless Kubelet Beta与新引入的Gang Scheduling，为AI/ML负载和生产级可观测性打下一整套地基。

## 主要新闻 (Main News)

### eBPF在Kubernetes 2026：从内核特性到标准基础设施

据本周发布的技术综述，eBPF在Kubernetes生态的地位已从"前沿实验"彻底转为"标准基础设施"。CNCF 2026年度云原生调查显示，高达67%的Kubernetes团队在生产环境至少使用一种基于eBPF的工具，而在主要公有云上，Cilium已成为Google GKE、AWS EKS和Azure AKS的默认CNI。文章推荐的参考架构是一套"全eBPF"组合：以Cilium同时承担CNI与服务网格（替代sidecar），Hubble提供网络与安全可观测性，Pixie或Grafana Beyla负责应用层面的自动追踪（无需埋点），Tetragon在运行时层面执行安全策略与事件监控，再叠加OpenTelemetry与OBI项目把eBPF探针产生的自定义Trace接入标准遥测管线。相比传统iptables与sidecar方案，eBPF的优势集中体现在更低的延迟与CPU开销、零代码侵入的可观测性，以及直接在内核层拦截恶意行为的运行时安全能力。这也解释了为什么新成立不久的Meridian Labs等培训机构，已把Cilium与外网网关（Egress Gateway）等场景列入eBPF运维证书的主干课程。

**Source:** [eBPF in Kubernetes 2026: From Kernel Feature to Standard Infrastructure](https://dev.to/saaro_net/ebpf-in-kubernetes-2026-from-kernel-feature-to-standard-infrastructure-5cj9)

### Karmada从CNCF毕业：多集群编排走向"资源感知"的AI时代

在上海举办的KubeCon+OpenInfra+PyTorch Day大会上，CNCF正式宣布多集群编排项目Karmada毕业，成为CNCF继Cilium等之后的又一旗舰级项目。同期发布的Karmada v1.19将重点转向"多组件调度"（Multi-Component Scheduling），专门面向分布式AI训练等需要弹性调度GPU/CPU子任务组件的场景，并把基于优先级的队列调度（Priority-Based Scheduling）升级为默认启用。毕业时的社区规模达到1214名贡献者、292家组织参与，Star数超过5600，布告中的典型采用者包括Bloomberg、Wellhub、阿里巴巴、华为与Trip.com等。CNCF同时宣布SoftBank与Crusoe两家加入成为新会员，契合勘探AI基础设施多以跨集群弹性为前提的背景。多集群编排正在从"容灾与就近部署"演化为"在数十个集群上分片运行大模型训练任务"，Karmada的毕业意味着它已经是Kubernetes多云AI基础设施事实上的调度层之一。

**Source:** [Cloud Native Computing Foundation Announces Karmada Graduation](https://www.cncf.io/announcements/2026/09/07/cloud-native-computing-foundation-announces-karmada-graduation)

### Kubernetes v1.37特性周收官：Native Histograms晋级Beta

随着Native Histograms在9月11日正式晋升Beta，Kubernetes v1.37的特性博客周宣告收官。Native Histograms基于KEP-5808实现，在component-base指标子系统中原生实现并采用"双重暴露"策略：兼容模式继续输出经典的bucket（直方图桶）指标，Native模式则输出动态指数跨度的自然直方图，经内置换算让`histogram_quantile()`计算结果不再受桶插值误差影响，同时为监控系统节省大量上传带宽——设计目标被明确为"零破坏性升级"。与之配套，v1.37早期的特性周还先后确认了SLO指标必需的metrics API正式发布（GA）、Pod Certificates与Cluster Trust Bundles正式发布（GA）、etcd RangeStream服务端流式读进入Beta、HPA支持缩到零进入Beta，以及Rootless Kubelet进入Beta；本周还一并披露了KEP-3257的Gang Scheduling进入Beta、Workload-Aware Preemption进入Beta，以及面向AI批处理场景的CompositePodGroup进入Alpha。可观测性链路（malloc/metric API/Pod证书）与批处理调度（Gang/优先队列）在同一个版本同时成熟，v1.37显然在为高密度、大批次的AI/ML工作负载铺路。

**Source:** [Kubernetes v1.37: Native Histograms Graduates to Beta](https://kubernetes.io/blog/2026/09/11/kubernetes-v1-37-native-histograms-beta)

## 分析 (Analysis)

把本波信息放在一起看，云原生社区正处在一次"基础设施形态切换"的临界点：eBPF之所以能成为默认底座，与其说是某一项技术的胜利，不如说是"免融入侵可观测性＋内核级安全＋低开销数据面"三个诉求同时被满足的产物。67%的生产采用率意味着，未来新人的etcd网络栈训练，已经可以把iptables模式当作"历史背景"，而把Cilium/Hubble/tetragon当作必修主课。对平台团队而言，真正的信号是决策优先级的变化——先考虑eBPF数据面，再谈代理与sidecar，这在公有云默认网络方案上几乎已经是既定事实。

Karmada的毕业与Kubernetes v1.37的调度特性（Gang Scheduling、优先级队列、CompositePodGroup）在时间点上形成了"编排层＋内核层"的呼应：前者解决"在哪些集群上怎么分片"，后者解决"单个集群内如何为批处理任务让路、如何占坑不浪费"。AI训练负载特有的"要么一炮全开、要么别开火"特性，恰好需要Gang语义与多集群分片的组合。可以预期，接下来的社区重心会由"如何跑容器"彻底转向"如何跑模型"，而Native Histograms的Beta则为这类大规模负载的SLO与容量规划提供了精确的度量基础——没有可信的量化，就没有理性的GPU调度。

## 结论 (Conclusion)

9月这一周可以概括为"三件套渐渐合拢"：数据面默认化（eBPF/Cilium）、编排层成熟化（Karmada毕业）、内核面生产化（v1.37可观测性与批调度特性）。对于基础设施团队，建议把Cilium/Hubble/Tetragon的运维能力、Karmada的多集群AI调度、以及对v1.37 Native Histograms的适配评估，纳入下一季度的技术就绪清单。