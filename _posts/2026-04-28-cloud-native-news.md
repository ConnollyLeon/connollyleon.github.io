---
layout: post
title: "云原生技术动态：Kubernetes v1.36发布与控制器稳定性增强"
date: 2026-04-28
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/04/27/kubernetes-v1-36-mutable-pod-resources-for-suspended-jobs/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - container
  - devops
---

# 云原生技术动态：Kubernetes v1.36发布与控制器稳定性增强

2026年4月27日至28日，Kubernetes社区发布了v1.36版本"Haru"，带来了70项功能增强，其中包括控制器过时性缓解、可变Pod资源、细粒度kubelet授权正式发布等重要特性。这些更新标志着云原生容器编排平台在稳定性、安全性和灵活性方面的又一次重大进步。

## 主要新闻

### Kubernetes v1.36：控制器过时性缓解与可观测性

Kubernetes v1.36引入了针对控制器过时问题的新特性，帮助缓解可能影响控制器行为的细微问题。过时问题通常直到控制器在生产环境中采取错误行动时才会被发现。v1.36版本在kube-controller-manager中为4个不同的控制器添加了使用新能力的功能，并增加了相关检测指标，如`stale_sync_skips_total`，用于监控控制器因缓存过时而跳过的同步次数。

**Source:** [Kubernetes v1.36: Staleness Mitigation and Observability for Controllers](https://kubernetes.website.cncfstack.com/blog/2026/04/28/kubernetes-v1-36-staleness-mitigation-for-controllers/)

### Kubernetes v1.36：暂停任务的可变Pod资源（Beta）

Kubernetes v1.36将修改暂停Job中容器资源请求和限制的能力提升到Beta阶段。该功能最初在v1.35中作为Alpha引入，现在默认启用，允许队列控制器和集群管理员在Job暂停时调整CPU、内存、GPU等资源规格，无需等待Job运行结束。这对于AI、机器学习等需要动态调整资源的场景尤为重要。

**Source:** [Kubernetes v1.36: Mutable Pod Resources for Suspended Jobs (beta)](https://kubernetes.io/blog/2026/04/27/kubernetes-v1-36-mutable-pod-resources-for-suspended-jobs/)

### 细粒度Kubelet API授权正式发布（GA）

经过从Alpha到Beta的演进，细粒度kubelet API授权在v1.36中正式达到GA（通用可用性）状态。该功能允许对kubelet HTTPS API进行更精确的、最小权限的访问控制，取代以往需要授予过于宽泛的`nodes/proxy`权限的做法。监控和诊断工具现在可以仅获取它们实际需要的端点权限，提升了集群的整体安全性。

**Source:** [Kubernetes v1.36: Fine-Grained Kubelet API Authorization Graduates to GA](https://kubernetes.io/blog/2026/04/24/kubernetes-v1-36-fine-grained-kubelet-authorization-ga/)

### Kubernetes v1.36工作负载感知调度进入Beta

v1.36版本中，工作负载感知调度功能进入Beta阶段，引入了去耦合的PodGroup API和Job控制器集成。相关Pod被视为单一逻辑实体，以原子方式进行评估，而非各自独立地进行放置决策。这一特性对于AI、ML和HPC相关工作负载的调度优化具有重要意义。

**Source:** [Kubernetes v1.36 "Haru" Arrives After the Frost](https://www.kubermatic.com/blog/kubernetes-v1-36-haru-arrives-after-the-frost/)

## 分析

Kubernetes v1.36的发布反映了云原生生态系统的几个关键趋势。首先，控制器过时性缓解功能显示了社区对生产环境稳定性的持续关注。在大规模的云原生部署中，控制器行为异常可能导致严重的生产事故，而新的可观测性指标为运维团队提供了更早发现问题的工具。

其次，可变Pod资源功能的成熟标志着Kubernetes在支持AI/ML工作负载方面迈出了重要一步。这类工作负载往往需要根据实际运行情况动态调整资源分配，而以往需要重启Pod的操作会导致服务中断。现在，平台团队可以在不中断服务的情况下优化资源使用。

细粒度kubelet授权的GA也是安全性的重要提升。研究表明，默认的RBAC配置中，`nodes/proxy` GET权限可能被滥用于通过WebSocket协议实现无日志记录的远程代码执行。通过细粒度授权，企业可以更严格地遵循最小权限原则。

工作负载感知调度的进展则反映了云原生平台对复杂工作负载的支持能力不断增强。随着AI和机器学习工作负载在生产环境中的广泛部署，传统的独立Pod调度模式已无法满足需求。PodGroup的概念使得相关的工作负载组件可以被作为一个整体进行调度和管理，这对于分布式训练和推理任务尤为重要。

从更宏观的角度来看，v1.36中Pod级硬件健康报告的引入（Beta阶段）也显示了云原生平台对硬件状态的关注度提升。在混合云和多云环境中，了解Pod使用的硬件健康状况对于确保服务可靠性至关重要。这一功能与Dynamic Resource Allocation (DRA)管道配合使用，为复杂的硬件资源管理提供了统一的接口。

## 结论

Kubernetes v1.36 "Haru"版本在稳定性、安全性和灵活性三个维度上都带来了显著提升。对于运行生产级Kubernetes集群的企业而言，控制器过时性缓解和细粒度kubelet授权是两个值得优先关注的特性。对于AI/ML工作负载的用户，可变Pod资源和工作负载感知调度功能将大大提升资源利用效率。建议平台团队在测试环境中验证这些新特性，并制定相应的升级计划。随着云原生生态的持续发展，我们可以期待在未来的版本中看到更多针对特定工作负载优化的功能。
