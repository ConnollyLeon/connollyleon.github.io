---
layout: post
title: "云原生技术动态：Kubernetes 1.36发布、GKE Standby Buffers与AI原生时代"
date: 2026-06-04
author: "云原生观察"
source: "https://aws.amazon.com/about-aws/whats-new/2026/06/amazon-eks-distro-kubernetes-version-1-36/"
categories:
  - cloud-native
tags:
  - kubernetes
  - GKE
  - cloud-native
  - Kueue
  - security
  - AI
---

# 云原生技术动态：Kubernetes 1.36发布、GKE Standby Buffers与AI原生时代

本周云原生领域迎来多项重要更新。Kubernetes 1.36正式登陆Amazon EKS，Google推出GKE Standby Buffers大幅优化成本与性能，CNCF宣布"Cloud Native is Now AI-Native"，标志着云原生与AI的深度融合进入新阶段。

## 主要新闻 (Main News)

### Kubernetes 1.36登陆Amazon EKS

AWS宣布Amazon EKS及EKS Distro正式支持Kubernetes 1.36。该版本带来了多项关键特性：User Namespaces正式GA，可将容器root映射为非特权主机用户，防止节点级别的权限提升；Mutating Admission Policies支持基于CEL的资源变更而无需Webhook基础设施；In-Place Pod-Level Resources Vertical Scaling允许Pod在不重启的情况下调整CPU和内存资源；Resource Health Status在Pod状态中报告设备健康信息，帮助识别硬件导致的崩溃循环。

**Source:** [Amazon EKS and Amazon EKS Distro now supports Kubernetes version 1.36](https://aws.amazon.com/about-aws/whats-new/2026/06/amazon-eks-distro-kubernetes-version-1-36/)

### Google发布GKE Standby Buffers：革新集群自动扩缩容成本模型

Google Cloud发布GKE Standby Buffers，在年初Active Buffers的基础上进一步优化。Standby Buffers将节点状态持久化到磁盘，释放计算和内存资源，仅保留持久化磁盘和IP地址的成本，使备用容量成本降至极低水平。在测试中，Standby Buffers以相比完全过度 provisioning 降低90%的成本，实现了亚秒级的Agent Sandbox调度延迟。Active与Standby两种Buffer协同工作：Active Buffer处理初始流量峰值，Standby Buffer在节点恢复期间接管扩展负载。

**Source:** [GKE standby buffers speed up autoscaling for less spend](https://cloud.google.com/blog/products/containers-kubernetes/gke-standby-buffers-speed-up-autoscaling-for-less-spend)

### CNCF：Cloud Native is Now AI-Native

CNCF发布重磅报告《Cloud Native is Now AI-Native》，总结KubeCon EU圆桌讨论成果。报告指出，将AI工作负载投入生产需要三个核心要素：以平台成熟度为核心的供应商中立基础设施、面向自主代理的集成安全、以及活跃的社区贡献。为应对AI工作负载的特殊需求，社区正在推进Pod Groups、Dynamic Resource Allocation (DRA)和Inference Gateways等关键举措，推动Kubernetes向高性能计算演进。

**Source:** [Cloud native is now AI-native: Engineering production-ready AI](https://www.cncf.io/blog/2026/06/02/cloud-native-is-now-ai-native-engineering-production-ready-ai/)

### Kueue 0.18引入Concurrent Admission：终结批处理调度瓶颈

Kueue 0.18发布，引入Concurrent Admission特性，通过为每个可接受的资源风味创建工作负载变体，并行评估多个provisioning选项。这解决了此前串行评估导致的调度瓶颈问题。新特性支持TryPreferredFlavors和RetainFirstAdmission两种迁移模式，结合Provisioning Request API实现原子化资源分配。

**Source:** [Stop Waiting in Line: Scaling Faster with Kueue's Concurrent Admission](https://medium.com/google-cloud/stop-waiting-in-line-scaling-faster-with-kueues-concurrent-admission-1dc8bfa5a33e)

### Kubernetes Dashboard退役，Headlamp接替

Kubernetes Dashboard项目正式归档，官方推荐用户迁移至Headlamp。Headlamp在保持可视化界面清晰性的基础上，增加了多集群可见性、以应用为中心的视图、插件可扩展性以及灵活部署选项（集群内/桌面端）。这标志着Kubernetes UI工具进入新纪元。

**Source:** [From Kubernetes Dashboard to Headlamp: Understanding the Transition](https://kubernetes.io/blog/2026/06/01/dashboard-to-headlamp/)

### 红帽揭示Kubernetes Operator OOMKill漏洞及修复方案

红帽开发者团队在调查Spark Operator时发现了一个系统性的安全漏洞：未过滤的Informer Cache可被ConfigMap Flooding攻击利用，导致Operator因OOM被终止。团队提出了包含标签过滤、资源升级路径处理和标签传播的四步修复方案。修复后的Operator内存使用从630MB降至14MB。

**Source:** [Protect your Kubernetes Operator from OOMKill](https://developers.redhat.com/articles/2026/06/01/protect-your-kubernetes-operator-oomkill)

### 谷歌开源Agent eXecutor (AX)：面向AI代理的Kubernetes原生运行时

谷歌正式开源Agent eXecutor (AX)，这是一个基于Go语言编写的Kubernetes原生分布式运行时标准，专为调度、隔离、持久化和扩展长期运行的代理工作负载而设计。AX通过事件日志提供持久化、通过Model Context Protocol (MCP)提供原生工具集成、并配合Agent Substrate实现超大规模代理基础设施密度管理。

**Source:** [The Kubernetes Native Layer for AI: Google Open-Sources Agent eXecutor (AX)](https://dev.to/om_shree_0709/the-kubernetes-native-layer-for-ai-google-open-sources-agent-executor-ax-148e)

### ExtraHop：Kubernetes安全面临三大威胁

ExtraHop发布报告指出，随着AI工作负载大规模迁移至Kubernetes，攻击者已开始利用三大安全盲区：AI工作负载的快速扩缩容掩盖恶意活动、容器供应链漏洞（引用3月Trivy投毒事件）、以及分布式Kubernetes数据导致的碎片化可观测性。攻击者组织TeamPCP近期针对LiteLLM的攻击窃取了大量API密钥。

**Source:** [Kubernetes Security Risks: 3 Opportunities for Threat Actors to Exploit Your Kubernetes Clusters](https://www.extrahop.com/blog/kubernetes-security-risks-3-opportunities-for-threat-actors-to-exploit-clusters)

## 分析 (Analysis)

本周的新闻清晰地勾勒出云原生生态系统的三大趋势。首先是Kubernetes版本的快速演进——1.36不仅带来了用户命名空间等安全增强，更重要的是In-Place Pod垂直伸缩等特性让Kubernetes真正开始适应有状态和性能敏感型工作负载。GKE Standby Buffers的发布则回应了业界长期以来的核心痛点：如何在保证弹性的同时控制成本。这种"声明式容量保险"的模式可能会被其他云厂商快速跟进。

第二个趋势是云原生与AI的深度融合。CNCF的宣言标题本身就说明了问题——"Cloud Native is Now AI-Native"。这不是简单的口号，而是反映在基础设施层级的实际变化中。从Pod Groups到DRA，从Inference Gateways到Agent eXecutor，整个生态系统正在围绕AI工作负载的特殊需求进行重新架构。对于平台工程师来说，这意味着需要同时掌握传统Kubernetes运维和AI基础设施管理的能力。

第三，安全问题正在从"可选"变为"必须"。红帽发现的OOMKill漏洞、ExtraHop报告的攻击向量，都表明随着Kubernetes部署规模的扩大和复杂度的提升，安全威胁正在变得更加隐蔽和具有破坏性。3月的Trivy投毒事件更是敲响了警钟——即便是受信任的开源工具也可能成为攻击入口。社区需要更加重视供应链安全和运行时安全的纵深防御。

## 结论 (Conclusion)

2026年6月的云原生格局表明，平台工程正在进入一个新时代。Kubernetes不再仅仅是容器编排工具，而是正在演变为AI基础设施的核心操作系统。对于从业者来说，跟踪Kubernetes版本演进、掌握AI原生架构模式、以及建立纵深防御体系将成为必备能力。接下来的几个月，我们将看到更多围绕AI工作负载优化的Kubernetes特性和工具问世，这个领域的变化仍将保持高速。
