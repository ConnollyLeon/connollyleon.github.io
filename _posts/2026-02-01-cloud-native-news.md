---
layout: post
title: "云原生技术动态：Kubernetes Ingress NGINX退役与cgroup v2转换增强"
date: 2026-02-01
author: "云原生观察"
source: "https://kubernetes.io/blog/"
categories:
  - cloud-native
tags:
  - kubernetes
  - ingress
  - cgroup
  - cloud-native
---

# 云原生技术动态：Kubernetes Ingress NGINX退役与cgroup v2转换增强

本周云原生领域迎来重要更新，Kubernetes社区宣布Ingress NGINX将于2026年3月退役，同时发布了新的cgroup v2 CPU转换增强功能，这些变化标志着云原生基础设施的重要演进。

## 主要新闻

### Kubernetes Ingress NGINX将于2026年3月退役

Kubernetes指导委员会和安全响应委员会联合发布声明，宣布Ingress NGINX作为关键基础设施组件将于2026年3月退役。这一决定影响了约一半云原生环境的使用者，社区建议用户迁移到Gateway API等替代方案。

**Source:** [Ingress NGINX Statement from Kubernetes Steering and Security Response Committees](https://kubernetes.io/blog/2026/01/29/ingress-nginx-statement/)

### 新的cgroup v1到v2 CPU转换公式实现

Red Hat的Itamar Holder宣布了改进的cgroup v1 CPU共享到cgroup v2 CPU权重的转换公式实现。这一增强解决了Kubernetes工作负载在运行cgroup v2系统上时的CPU优先级分配关键问题。

**Source:** [New Conversion from cgroup v1 CPU Shares to v2 CPU Weight](https://kubernetes.io/blog/2026/01/30/cgroup-conversion/)

## 分析

这些更新反映了云原生生态系统的几个关键趋势。首先，Ingress NGINX的退役标志着Kubernetes生态系统的成熟和标准化进程。作为最早的Ingress控制器之一，Ingress NGINX服务了广大用户多年，但随着Gateway API等更现代标准的出现，社区正在推动基础设施的统一化。

其次，cgroup转换增强显示了对性能优化和资源管理的持续关注。随着云原生环境变得更加复杂，精确的CPU资源管理对于确保工作负载性能和稳定性变得至关重要。这一改进特别对运行在混合环境中的组织具有重要意义，因为它们需要在不同cgroup版本之间保持一致的行为。

从技术架构角度看，这些变化表明Kubernetes正在从简单的容器编排平台演进为全面的云原生操作系统。通过标准化接口如Gateway API和优化底层资源管理，Kubernetes为更复杂的应用场景提供了更好的支持。

## 结论

云原生技术生态系统正在经历重要的转型期。Ingress NGINX的退役提醒我们，即使是广泛使用的技术也需要不断演进以适应新的需求和标准。同时，底层技术改进如cgroup转换增强确保了平台能够在各种生产环境中提供一致且可靠的性能。

对于从业者而言，现在开始规划Ingress NGINX的迁移策略是明智的，而新的cgroup功能则提供了在资源受限环境中优化性能的新工具。这些发展共同推动了云原生技术向更成熟、更可靠的方向发展。