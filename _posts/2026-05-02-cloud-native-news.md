---
layout: post
title: "云原生技术动态：Kubernetes 1.36 新特性与企业级应用演进"
date: 2026-05-02
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/05/01/kubernetes-v1-36-feature-pod-level-resource-managers-alpha/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - container
  - orchestration
---

# 云原生技术动态：Kubernetes 1.36 新特性与企业级应用演进

本周 Kubernetes 1.36 版本持续发布多项重要更新，涵盖 Pod 级资源管理、原地垂直扩缩容以及控制器可观测性等核心特性，标志着容器编排平台在企业级生产环境中的能力进一步增强。

## 主要新闻

### Kubernetes v1.36 引入 Pod 级资源管理器（Alpha）

Kubernetes v1.36 正式引入 Pod 级资源管理器（Pod-Level Resource Managers）作为 Alpha 特性，为性能敏感型工作负载提供了更灵活、更强大的资源管理模型。该增强功能将 kubelet 的拓扑管理器、CPU 管理器和内存管理器扩展到支持 Pod 级资源规范（`.spec.resources`），从严格的每容器分配模型演进为以 Pod 为中心的资源分配模式。

通过启用 Pod 级资源管理支持（通过 `PodLevelResourceManagers` 和 `PodLevelResources` 特性门控），kubelet 可以创建混合资源分配模型。这为高性能工作负载带来了灵活性和效率，同时不牺牲 NUMA 对齐。例如，可以为 ML 容器分配独占的、NUMA 对齐的 CPU 和内存以获得最大性能，而服务网格 sidecar 则不需要 NUMA 对齐，可以在通用节点级共享池中运行。

**Source:** [Kubernetes v1.36: Pod-Level Resource Managers (Alpha)](https://kubernetes.io/blog/2026/05/01/kubernetes-v1-36-feature-pod-level-resource-managers-alpha/)

### Pod 级资源原地垂直扩缩容升级至 Beta

继 v1.34 中 Pod 级资源功能升级至 Beta 以及 v1.35 中原地 Pod 垂直扩缩容正式发布（GA）之后，Kubernetes 社区欣喜地宣布，Pod 级资源原地垂直扩缩容在 v1.36 中已升级至 Beta 阶段！

该功能现通过 `InPlacePodLevelResourcesVerticalScaling` 特性门控默认启用。它允许用户更新正在运行的 Pod 的聚合 Pod 资源预算（`.spec.resources`），通常无需重启容器。Pod 级资源模型通过允许容器共享集体资源池，简化了复杂 Pod（如带有 sidecar 的 Pod）的管理。在 v1.36 中，您可以即时调整这个聚合边界。

**Source:** [Kubernetes v1.36: In-Place Vertical Scaling for Pod-Level Resources Graduates to Beta](https://kubernetes.io/blog/2026/04/30/kubernetes-v1-36-inplace-pod-level-resources-beta/)

### 控制器过期缓解与可观测性增强

Kubernetes v1.36 包含了客户端库 client-go 以及 kube-controller-manager 中高度竞争控制器的多项改进，用于缓解控制器过期问题并提供更好的可观测性。过期问题会影响许多控制器，并以微妙的方式影响控制器行为。

新版本为 ReplicaSet、DaemonSet、StatefulSet 和 Deployment 这四个不同的控制器添加了使用新能力的功能。这些控制器都作用于 Pod，而 Pod 在大多数情况下是集群中竞争最激烈的资源。这些更改默认对这些控制器启用，可以通过设置相应的特性门控来禁用。

**Source:** [Kubernetes v1.36: Staleness Mitigation and Observability for Controllers](https://kubernetes.io/blog/2026/04/28/kubernetes-v1-36-staleness-mitigation-for-controllers/)

### VMware 解析 Kubernetes 1.36 企业级影响

VMware 发布深度分析文章，指出 Kubernetes 1.36 包含数十项增强、更新和弃用，但对大多数企业团队而言，更重要的是这些变化所指明的方向，以及这对 Kubernetes 作为平台演进的意义。关键进展包括结构化参数用于动态资源分配（DRA），使调度器更容易"理解"GPU 或 AI 加速器的特定需求，大幅降低多节点 AI 部署的复杂性。

**Source:** [Kubernetes 1.36: What Actually Changed for Enterprise Platforms](https://blogs.vmware.com/cloud-foundation/2026/04/29/kubernetes-1-36-what-actually-changed-for-enterprise-platforms/)

## 分析

Kubernetes 1.36 的发布反映了云原生生态系统中几个关键趋势。首先，资源管理正从容器级向 Pod 级演进，这更好地反映了现代工作负载的实际部署模式，特别是那些包含多个容器（如主应用容器加 sidecar）的 Pod。这种 Pod 中心化的资源管理模型为复杂的 AI/ML 工作负载和微服务架构提供了更精细的控制能力。

其次，原地垂直扩缩容功能的成熟标志着 Kubernetes 在资源弹性方面迈出了重要一步。对于运行关键业务的应用来说，能够在不重启容器的情况下调整资源配额，意味着更高的可用性和更低的运维中断。这对于金融交易系统、实时数据分析平台等对停机敏感的场景尤为重要。

第三，控制器过期缓解机制的引入揭示了 Kubernetes 在生产环境中长期存在但鲜为人知的问题。当控制器基于过期的缓存数据采取操作时，可能导致不可预测的行为。通过引入可观测性指标和一致性检查，Kubernetes 正在向更健壮、更可预测的方向发展，这对大规模生产环境至关重要。

最后，从企业视角来看，Kubernetes 正在从纯粹的容器编排工具演变为企业级平台的核心基础设施。VMware 的分析指出，企业需要的不仅是 Kubernetes 本身，而是一个集成了治理、安全和生命周期管理的完整平台。这种演进推动了平台工程（Platform Engineering）的兴起，将 Kubernetes 视为一种可以跨团队和环境一致交付、治理和消费的服务。

## 结论

Kubernetes 1.36 的发布进一步巩固了其作为云原生生态系统核心的地位。Pod 级资源管理、原地垂直扩缩容和控制器可观测性等特性，不仅提升了技术能力，更反映了社区对生产环境实际需求的深刻理解。对于企业而言，这些更新意味着更低的运维成本、更高的资源利用率和更强的系统可靠性。展望未来，随着 Vertical Pod Autoscaler（VPA）与 Pod 级资源的进一步集成，以及多集群、边缘计算场景的持续发展，Kubernetes 将继续引领云原生技术的创新方向。
