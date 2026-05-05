---
layout: post
title: "云原生技术动态：Kubernetes v1.36 新特性深度解析"
date: 2026-05-05
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/05/01/kubernetes-v1-36-feature-pod-level-resource-managers-alpha/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - container
  - resource-management
---

# 云原生技术动态：Kubernetes v1.36 新特性深度解析

Kubernetes v1.36 于近期发布，带来了多项重要的云原生技术更新。本月最值得关注的包括 Pod 级资源管理器（Alpha）、Pod 级资源原地垂直扩缩容（Beta）以及分层内存保护（Memory QoS）等特性。这些更新标志着 Kubernetes 在资源管理和性能优化方面迈出了重要一步。

## 主要新闻

### Kubernetes v1.36：Pod 级资源管理器（Alpha）

Kubernetes v1.36 引入了 Pod 级资源管理器作为 Alpha 特性，为性能敏感型工作负载提供了更灵活、更强大的资源管理模型。这一增强功能将 kubelet 的拓扑管理器、CPU 管理器和内存管理器扩展为支持 Pod 级资源规范（`.spec.resources`），从严格的每容器分配模型演进为以 Pod 为中心的模式。

启用 Pod 级资源管理支持（通过 `PodLevelResourceManagers` 和 `PodLevelResources` 特性门控）允许 kubelet 创建混合资源分配模型。这为高性能工作负载带来了灵活性和有效性，同时不牺牲 NUMA 对齐。例如，可以将 ML 容器配置为独占、NUMA 对齐的 CPU 和内存以获得最大性能，而服务网格 sidecar 则不需要 NUMA 对齐，可以在通用节点共享池中运行。

**Source:** [Kubernetes v1.36: Pod-Level Resource Managers (Alpha)](https://kubernetes.io/blog/2026/05/01/kubernetes-v1-36-feature-pod-level-resource-managers-alpha/)

### Kubernetes v1.36：Pod 级资源原地垂直扩缩容升级至 Beta

继 v1.34 中 Pod 级资源升级至 Beta 以及 v1.35 中 Pod 原地垂直扩缩容正式发布（GA）之后，Kubernetes 社区很高兴地宣布 Pod 级资源原地垂直扩缩容在 v1.36 中升级至 Beta！

该功能现在通过 `InPlacePodLevelResourcesVerticalScaling` 特性门控默认启用。它允许用户在运行时更新正在运行的 Pod 的聚合 Pod 资源预算（`.spec.resources`），通常不需要重启容器。Pod 级资源模型通过允许容器共享集体资源池，简化了复杂 Pod（例如带有 sidecar 的 Pod）的管理。

**Source:** [Kubernetes v1.36: In-Place Vertical Scaling for Pod-Level Resources Graduates to Beta](https://kubernetes.io/blog/2026/04/30/kubernetes-v1-36-inplace-pod-level-resources-beta/)

### Kubernetes v1.36：分层内存保护与 Memory QoS

Kubernetes v1.36 更新了内存 QoS 特性（Alpha），引入了选择性内存预留、基于 QoS 类别的分层保护、可观测性指标以及针对 `memory.high` 的内核版本警告。v1.36 将节流与预留分离：启用特性门控会开启 `memory.high` 节流（kubelet 根据 `memoryThrottlingFactor` 设置 `memory.high`，默认为 0.9），而内存预留现在由单独的 kubelet 配置字段控制。

通过 `TieredReservation` 策略，kubelet 根据 Pod 的 QoS 类别写入分层内存保护：Guaranteed Pod 设置 `memory.min`（硬保护），Burstable Pod 设置 `memory.low`（软保护）。这为不同服务等级的工作负载提供了更精细的内存保护机制。

**Source:** [Kubernetes v1.36: Tiered Memory Protection with Memory QoS](https://kubernetes.io/blog/2026/04/29/kubernetes-v1-36-memory-qos-tiered-protection/)

## 分析

Kubernetes v1.36 的这些更新反映了云原生生态系统的几个关键趋势。首先，资源管理正从容器级向 Pod 级演进。传统的每容器资源分配模型在处理复杂 Pod（如包含多个容器和 sidecar 的场景）时显得不够灵活。Pod 级资源管理器的引入，使得资源分配可以更贴合实际工作负载的需求，特别是在 AI/ML 和高性能计算场景中，NUMA 对齐和独占资源对性能至关重要。

其次，原地垂直扩缩容的成熟（升级至 Beta）标志着 Kubernetes 在资源弹性方面的重要进步。过去，调整 Pod 资源通常需要重新创建 Pod，这会导致服务中断。现在，对于许多场景，可以在不重启容器的情况下动态调整资源边界，这对需要持续运行的服务来说是一个重大改进。这也与云原生理念中的"弹性"和"按需分配"高度契合。

第三，内存 QoS 的增强反映了 Kubernetes 对资源隔离和服务质量保障的重视。在混合部署环境中，不同 QoS 类别的 Pod 对内存的需求和保护级别不同。通过分层保护机制，Guaranteed Pod 获得硬保护，Burstable Pod 获得软保护，而 BestEffort Pod 则依赖节流机制。这种精细化的资源管理有助于提升集群的整体稳定性和资源利用率。

最后，这些特性的发布也表明 Kubernetes 正逐步向更智能、更自动化的资源管理方向发展。随着 AI 工作负载在 Kubernetes 上的广泛部署，对资源管理的灵活性和性能要求越来越高。Pod 级资源管理和原地扩缩容为 AI/ML 工作负载提供了更好的支持，这也是 Kubernetes 社区对业界需求的直接响应。

## 结论

Kubernetes v1.36 的资源管理更新为云原生平台带来了更强大的能力和更高的灵活性。Pod 级资源管理、原地垂直扩缩容和分层内存保护等特性，不仅提升了资源利用效率，也为 AI/ML、HPC 等性能敏感型工作负载提供了更好的支持。对于平台团队和运维人员来说，现在是评估和测试这些新特性的好时机，特别是那些正在运行复杂工作负载或计划迁移 AI/ML 工作负载到 Kubernetes 的团队。随着这些特性逐步稳定（从 Alpha 到 Beta），我们可以期待在未来版本中看到更多围绕 Pod 级资源管理的生态工具和优化。
