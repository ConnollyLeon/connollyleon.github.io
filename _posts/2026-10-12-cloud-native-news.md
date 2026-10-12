---
layout: post
title: "云原生动态：cgroup v2迁移、策略引擎演进与Cilium默认化推动Kubernetes平台现代化"
date: 2026-10-12
author: "云原生观察"
source: "https://dev-ex.com/article/runc-1-6-0-rc1-cgroup-v2-kubernetes-platforms/"
categories:
  - cloud-native
tags:
  - kubernetes
  - runc
  - cgroup-v2
  - cilium
  - ebpf
  - admission-control
  - kyverno
  - gatekeeper
  - containerd
  - cloud-native
---

# 云原生动态：cgroup v2迁移、策略引擎演进与Cilium默认化推动Kubernetes平台现代化

2026年10月11日，云原生领域围绕底层运行时与平台治理出现多项关键进展。runc发布1.6系列首个候选版本，推动容器运行时全面对齐cgroup v2；Kubernetes准入策略生态进入CEL原生时代；Cilium的eBPF网络正成为三大公有云托管Kubernetes的事实默认栈。这些变化共同指向一个主题：Kubernetes平台正在从"能跑"走向"标准化、可治理、高性能"。

## 主要新闻

### 1. runc 1.6.0-rc.1发布，推动cgroup v2全面对齐

容器运行时runc于10月6日发布1.6.0-rc.1，这是1.6系列的首个候选版本。该版本在技术与流程两个层面都体现出明确指向：一方面聚焦cgroup v2，另一方面采用"不可变发布（immutable RC）"模式。这与同期Kubernetes官方博客《The Shift to cgroup v2 in Kubernetes》和《Scaling Kubernetes Workloads with Node Swap》所释放的信号一致——容器运行时、kubelet与内核正收敛到与过去五年截然不同的假设之上。

分析指出，真正的风险不在单个参数或API，而在于"组合爆炸"：默认cgroup v2的发行版内核、以v2语义构建的runc、以及附带backport的CRI shim，每一层都必须彼此兼容。当前窗口内runc是变化最活跃的一环，而部分下游运行时尚未在同一时间窗口发布协调一致的版本，这种错配正是集群升级中容易出问题的地方。

**Source:** [runc 1.6.0-rc.1: cgroup v2 alignment and immutable RC](https://dev-ex.com/article/runc-1-6-0-rc1-cgroup-v2-kubernetes-platforms/)

### 2. Kubernetes准入策略进入CEL原生与多引擎并存阶段

截至2026年10月11日，Kubernetes准入策略生态发生结构性变化。内置的ValidatingAdmissionPolicy自1.30起稳定，MutatingAdmissionPolicy自1.36起稳定并默认启用，二者均在APIServer内部运行，不再依赖可能宕机的webhook Pod。Kyverno 1.19实现CEL策略类型与旧ClusterPolicy的功能对齐并正式弃用ClusterPolicy（计划于1.20移除）；Gatekeeper 3.23.1则可将CEL编写的ConstraintTemplate自动生成ValidatingAdmissionPolicy及绑定，让APIServer负责强制执行，同时Gatekeeper继续提供审计能力。

这些变化意味着团队需要在"内置策略、Kyverno、Gatekeeper"之间重新做出选择。文章强调，选择应基于超出校验之外所需的功能（如报告、生成、镜像验证等），而非基准测试表的数字，并建议先梳理所有webhook的failurePolicy与timeout，明确哪些规则会在集群重启时阻断流程。

**Source:** [Kubernetes admission policy in 2026: revisit Kyverno, Gatekeeper and ValidatingAdmissionPolicy](https://revisit.tech/blog/kubernetes-admission-policy-in-2026-revisit-kyverno-gatekeeper-and-validatingadmissionpolicy-before-you-add-another-policy-engine/)

### 3. Cilium的eBPF网络成为GKE、AKS、EKS的默认或推荐路径

一项10月发布的分析显示，基于eBPF的Cilium已从"小众CNI"转变为三大公有云托管Kubernetes的默认或推荐网络层：Google Cloud在GKE Autopilot中将其作为标准CNI，Microsoft Azure将其定位为AKS的首选高级网络方案，Amazon则在对性能要求高的EKS场景中推荐使用。在Calico、Flannel、Weave与Cilium长期并存、各有所好的网络层，三大超大规模云厂商如此一致并不寻常。

这一转变带来两个值得关注的后果：其一，Kubernetes网络正在围绕单一eBPF实现收敛，围绕iptables类CNI建立的工具链、技能与排障实践将逐渐失去相关性；其二，过去需要服务网格才能提供的L7策略与流级可观测性，如今已下沉到内核，使许多组织得以缩减甚至跳过服务网格部署。

**Source:** [Cilium's eBPF networking becomes the default path across GKE, AKS and EKS](https://deniz.in/cilium-s-ebpf-networking-becomes-the-default-path-across-gke-aks-and-eks)

### 4. OCI Kubernetes Engine上线Kubernetes v1.37

Oracle Cloud Infrastructure Kubernetes Engine（OKE）宣布支持Kubernetes v1.37，使客户能够使用最新的上游Kubernetes能力，包括更高效的扩缩容、更强的工作负载身份、更具韧性的集群运维，以及对特殊资源（如GPU等）的改进管理。客户可通过控制台、CLI、API、SDK和Terraform创建新集群或升级现有集群。这标志着Kubernetes v1.37自8月发布后，正加速向主流托管平台铺开。

**Source:** [Kubernetes v1.37 is now available on OCI Kubernetes Engine (OKE)](https://blogs.oracle.com/cloud-infrastructure/kubernetes-v1-37-is-now-available-on-oke)

## 分析

### 底层假设的协调迁移是云原生平台的最大风险点

本期最值得警惕的信号来自runc与cgroup v2。过去几年，容器运行时、kubelet与内核在资源管理上采取的是混合模式（部分组件用v1、部分用v2），这种"慢动作的隐患"迟早要清算。现在生态正主动把整个栈推入统一的现代模型：Kubernetes自v1.35起默认`failCgroupV1=true`，containerd与runc围绕v2重构，内存QoS、In-place Pod垂直扩缩等新特性都依赖cgroup v2的控制器语义。方向正确，但代价是把兼容性验证的负担转移给了平台团队。任何只把运行时当作"可插拔低风险组件"的团队，都可能在下一次节点操作系统升级或托管集群滚动升级时措手不及。可行的做法是：用受控实验室镜像端到端演练完整运行时栈，覆盖cgroup v2主机与swap场景，再安排生产升级。

### 准入策略从"webhook集合"走向"内核原生+能力分层"

准入策略的演进反映了一个更广泛的平台治理趋势：把安全与合规控制尽量前移到APIServer内部，减少对外部webhook可用性的依赖。ValidatingAdmissionPolicy与MutatingAdmissionPolicy内置化的价值在于消除"webhook宕机导致集群不可控"的尾风险；而Kyverno与Gatekeeper转向CEL并具备"生成原生策略"的能力，则让审计、报告与策略生成等高级功能与强制执行的边界更加清晰。对平台团队而言，关键不是再引入一个新引擎，而是先盘点存量webhook的失败策略，识别哪些规则会在集群重启时阻断工作负载，再按"纯校验→CEL"的路径逐步收敛。这是典型的"减法优先"治理：能用内置机制解决的，就不要叠加新组件。

### 网络层的收敛将重塑技能栈与服务网格定位

Cilium在三大公有云同时成为默认或首选，意味着Kubernetes网络层的"选择之痛"正在结束。这既是好事，也带来锁定与技能迁移的隐忧：围绕iptables CNI积累的排障经验、监控指标和自动化脚本需要重估；而eBPF的调试门槛（需要理解Hubble、Tetragon、netkit等）对运维团队提出了新要求。更重要的是，当L7策略、mTLS与流级可观测性下沉到内核，很多组织将重新评估是否仍需要完整的服务网格——"用不到mesh"可能成为更理性的默认。可以预期，接下来围绕eBPF网络的可观测性与安全能力将成为平台差异化的主战场。

## 结论

本期云原生动态体现出清晰的主线：底层运行时与内核假设正在协调迁移，平台治理加速向"原生、可审计、少依赖"演进，网络层则围绕eBPF实现收敛。对云原生从业者而言，三项优先级尤为突出：第一，立即在实验环境端到端验证runc 1.6与cgroup v2迁移路径，避免生产升级踩坑；第二，盘点并重整准入webhook，将纯校验规则迁移到CEL，降低对webhook可用性的依赖；第三，评估Cilium默认化对现有网络工具链、技能与服务网格架构的影响。紧随其后的Kubernetes v1.37在托管平台的铺开，将进一步放大这些变化的实际影响，平台团队宜提前规划升级与适配窗口。
