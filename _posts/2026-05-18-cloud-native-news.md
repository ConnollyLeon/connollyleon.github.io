---
layout: post
title: "云原生技术动态：Kubernetes v1.36工作负载感知调度与服务网格演进"
date: 2026-05-18
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/05/13/kubernetes-v1-36-advancing-workload-aware-scheduling/"
categories:
  - cloud-native
tags:
  - kubernetes
  - workload-scheduling
  - cloud-native
  - AI-workloads
  - PodGroup
---

# 云原生技术动态：Kubernetes v1.36工作负载感知调度与服务网格演进

本周云原生领域继续围绕Kubernetes v1.36展开深度应用，工作负载感知调度（Workload-Aware Scheduling）体系的推进以及HPE GreenLake集成Kubernetes管理，标志着云原生技术正从平台建设走向AI原生工作负载优化阶段。

## 主要新闻

### Kubernetes v1.36：工作负载感知调度能力大幅增强

Kubernetes v1.36在调度领域引入了重大的架构演进。新的PodGroup API与Workload API实现了关注点分离——Workload API作为静态模板，PodGroup API负责运行时状态。kube-scheduler新增了PodGroup调度周期，支持原子化的工作负载处理。该版本还首次引入了拓扑感知调度（Topology-Aware Scheduling）和工作负载感知抢占（Workload-Aware Preemption）的Alpha实现。Job控制器现在可以自动创建和管理Workload与PodGroup对象，使得分布式AI训练等紧密耦合的并行应用无需额外工具即可获得组调度能力。

**Source:** [Kubernetes v1.36: Advancing Workload-Aware Scheduling](https://kubernetes.io/blog/2026/05/13/kubernetes-v1-36-advancing-workload-aware-scheduling/)

### Kubernetes v1.36.1补丁发布

Kubernetes项目发布了v1.36的第一个补丁版本v1.36.1，包含多项稳定性修复和安全改进。该补丁版本已于5月12日通过官方渠道发布，建议生产环境用户尽快升级。

**Source:** [Kubernetes v1.36.1 Release](https://github.com/kubernetes/kubernetes/releases/tag/v1.36.1)

### HPE Private Cloud集成Kubernetes管理

HPE在最新的GreenLake更新中为HPE Private Cloud增加了Kubernetes管理能力，使企业能够在统一平台上管理虚拟机和容器。第四代HPE Private Cloud支持通过单一平台管理云原生工作负载，现有客户可通过软件升级获得VM和容器统一管理功能。该方案基于HPE ProLiant Compute Gen12构建，支持通过HPE Morpheus Software扩展至混合云和多云管理。

**Source:** [HPE Private Cloud Adds Kubernetes Management](https://virtualizationreview.com/articles/2026/05/12/hpe-private-cloud-adds-kubernetes-management-in-greenlake-update.aspx)

### Kubernetes v1.36：spec.externalIPs正式弃用

随着Kubernetes v1.36的发布，spec.externalIPs字段正式被弃用。该字段自CVE-2020-8554发布以来一直是安全风险点，DevOps团队需要立即审计所有集群中的Service配置，迁移至LoadBalancer或Ingress等替代方案。

**Source:** [Kubernetes v1.36 Drops spec.externalIPs](https://dev.to/pratheesh_s/5-things-brisbane-devops-teams-must-do-after-kubernetes-v136-drops-specexternalips-3b9a)

## 分析

Kubernetes v1.36在调度领域的演进代表了Kubernetes调度哲学的根本性转变——从单个Pod优化转向工作负载级资源管理。Workload API和PodGroup API的分离设计体现了对AI/ML工作负载特殊需求的深刻理解。分布式训练任务不像传统Web服务那样可以独立调度每个Pod，它们需要原子化的组调度、拓扑感知的GPU分配和智能的抢占策略。这一变化直接回应了Kuberentes用户长期以来的痛点：在运行大规模GPU作业时，部分调度导致的资源碎片和训练失败。

PodGroup API的设计尤为值得关注。通过将运行时状态从Workload API中分离出来，Kubernetes为未来的弹性作业（如minCount可变性）和层次化工作负载（Job Set）奠定了基础。这意味着未来的Kubernetes集群将能够支持更复杂的AI训练拓扑，包括流水线并行和数据并行的混合部署模式。

HPE GreenLake对Kubernetes的集成则反映了企业市场的另一个重要趋势：VM和容器的统一管理正在从可选变为必选。当企业同时运行传统企业应用和云原生AI工作负载时，碎片化的管理工具成为运维瓶颈。HPE的策略——为现有私有云客户提供软件升级路径而非强制迁移——体现了对大型企业客户实际需求的深刻理解。

## 结论

Kubernetes v1.36的工作负载感知调度能力为AI原生计算奠定了调度层面的基础设施。与HPE等传统基础设施厂商在统一管理方面的努力相结合，云原生技术正在两个方向同步演进：向上支撑更复杂的AI工作负载，向下整合更广泛的异构基础设施。
