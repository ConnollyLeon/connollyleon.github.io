---
layout: post
title: "云原生技术动态：Kubernetes v1.36 资源管理革新与企业平台化演进"
date: 2026-05-05
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/05/01/kubernetes-v1-36-feature-pod-level-resource-managers-alpha/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - resource-management
  - enterprise
  - platform-engineering
---

# 云原生技术动态：Kubernetes v1.36 资源管理革新与企业平台化演进

Kubernetes v1.36 的发布带来了云原生领域的多项重要更新，从 Pod 级资源管理器的 Alpha 特性到细粒度 kubelet API 授权的 GA，标志着容器编排平台正朝着更智能、更安全的方向演进。与此同时，VMware 等企业的分析指出 Kubernetes 正从灵活的基础设施向有意设计的平台转变。

## 主要新闻

### Kubernetes v1.36：Pod 级资源管理器（Alpha）

Kubernetes v1.36 引入了 Pod 级资源管理器作为 Alpha 特性，将 kubelet 的拓扑管理器、CPU 管理器和内存管理器扩展为支持 Pod 级资源规范（`.spec.resources`）。这使得 kubelet 能够创建混合资源分配模型——例如 ML 容器可以获得独占、NUMA 对齐的 CPU 和内存以获得最大性能，而服务网格 sidecar 则可以在通用节点共享池中运行。集体资源消耗仍然受到整体 Pod 限制的安全约束。

**Source:** [Kubernetes v1.36: Pod-Level Resource Managers (Alpha)](https://kubernetes.io/blog/2026/05/01/kubernetes-v1-36-feature-pod-level-resource-managers-alpha/)

### Kubernetes v1.36：细粒度 kubelet API 授权正式 GA

细粒度 kubelet API 授权特性在 v1.36 中正式升级为 GA。该特性将 `/pods`、`/runningPods/`、`/healthz`、`/configz` 等常用 kubelet API 路径映射到专用的子资源，取代了过去过度宽泛的 `nodes/proxy` 权限。这对于监控和可观测性工作负载意义重大——Prometheus、Datadog 等 DaemonSet 可以使用 `nodes/metrics`、`nodes/stats` 和 `nodes/pods` 替代 `nodes/proxy`，直接消除 WebSocket RCE 攻击面。

**Source:** [Kubernetes v1.36: Fine-Grained Kubelet API Authorization Graduates to GA](https://kubernetes.io/blog/2026/04/24/kubernetes-v1-36-fine-grained-kubelet-authorization-ga/)

### Kubernetes v1.36：控制器陈旧缓解与可观测性

Kubernetes v1.36 在 client-go 和 kube-controller-manager 中引入了新的陈旧缓解特性，DaemonSet、Job、ReplicaSet 和 StatefulSet 控制器现在可以利用 `LastStoreSyncResourceVersion()` 函数确保队列始终处于一致状态。新增的 `stale_sync_skips_total` 指标允许运维人员监控控制器缓存的健康状况，并与 API server 的资源版本进行对比。

**Source:** [Kubernetes v1.36: Staleness Mitigation and Observability for Controllers](https://kubernetes.io/blog/2026/04/28/kubernetes-v1-36-staleness-mitigation-for-controllers/)

### Kubernetes 1.36 对企业平台的深远影响

VMware 的分析指出，Kubernetes 1.36 中的结构化 DRA 参数、安全期望的收紧以及持续的发布速度，都指向一个未来：Kubernetes 变得更强大，但操作要求也更高。企业团队需要从"部署 Kubernetes"转向"以意图设计、治理和运营 Kubernetes 平台"。VKS 等解决方案通过异步发布和扩展支持选项，帮助团队在不被迫持续升级的情况下与上游保持一致。

**Source:** [Kubernetes 1.36: What Actually Changed for Enterprise Platforms](https://blogs.vmware.com/cloud-foundation/2026/04/29/kubernetes-1-36-what-actually-changed-for-enterprise-platforms/)

## 分析

Kubernetes v1.36 的发布体现了云原生生态系统的几个关键趋势。首先，资源管理正从粗放的容器级分配向精细的 Pod 级模型演进。在 AI/ML 工作负载日益普及的背景下，传统的一刀切资源分配已无法满足性能敏感型应用的需求。Pod 级资源管理器允许在同一 Pod 内为不同容器采用不同的资源策略——关键计算容器获得 NUMA 对齐的独占资源，而辅助组件则共享节点资源池。这种混合模型在性能和效率之间找到了平衡。

其次，安全正在成为 Kubernetes 的核心设计原则，而非事后补救。细粒度 kubelet API 授权的 GA 是这一趋势的标志性事件。过去，`nodes/proxy` 权限的广泛使用导致大量 Helm 图表存在 WebSocket RCE 风险。现在，Kubernetes 为常用 API 路径提供了独立的子资源，使得最小权限原则可以在集群层面强制执行。随着时间的推移，`nodes/proxy` 可能会被逐步弃用，进一步减少集群的攻击面。

第三，控制器陈旧缓解特性的引入反映了 Kubernetes 对大规模集群可靠性的关注。在拥有数千个 Pod 的高 contention 集群中，控制器基于陈旧缓存做出错误决策可能导致级联故障。v1.36 通过让控制器在同步前检查缓存版本，有效避免了这类问题。这对于大规模生产环境尤为重要。

最后，VMware 的分析揭示了一个更宏观的转变：Kubernetes 正在从"灵活的基础设施"演变为"需要有意设计的平台"。这意味着企业不能仅仅部署 Kubernetes 集群，而是需要构建围绕一致性、护栏和开发者自助服务的完整平台体系。这也解释了为什么平台工程（Platform Engineering）正在成为云原生领域最热门的方向之一。

## 结论

Kubernetes v1.36 不仅带来了技术层面的更新，更反映了云原生行业的发展方向。从 Pod 级资源管理到细粒度安全授权，从控制器可观测性到企业平台化思维，每一项改进都在推动 Kubernetes 成为更成熟、更可靠的企业级平台。对于从业者而言，现在正是评估这些新特性、规划平台升级的好时机。特别是那些正在运行 AI/ML 工作负载或管理大规模集群的团队，应重点关注 Pod 级资源管理和控制器陈旧缓解特性。同时，平台工程的理念也值得每个正在运营 Kubernetes 的团队深入思考。
