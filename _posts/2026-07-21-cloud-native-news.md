---
layout: post
title: "云原生技术动态：Agentic计算模式重塑Kubernetes基础设施"
date: 2026-07-21
author: "云原生观察"
source: "https://www.infoworld.com/article/4197466/new-agentic-compute-patterns.html"
categories:
  - cloud-native
tags:
  - kubernetes
  - agentic-ai
  - cloud-native
  - infrastructure
---

# 云原生技术动态：Agentic计算模式重塑Kubernetes基础设施

本周云原生领域迎来关于AI Agent工作负载与Kubernetes架构适配性的深度讨论。InfoWorld发表深度分析文章指出，Kubernetes传统上针对无状态HTTP请求优化的架构，正面临AI Agent带来的全新挑战——长时间运行、有状态、需要跨时间推理的工作负载要求全新的计算模式。与此同时，Red Hat OpenShift 4.22正式发布，聚焦降低云成本和优化AI工作负载。

## 主要新闻

### Kubernetes需要全新的Agentic计算模式

InfoWorld分析指出，Kubernetes十年来一直是正确的答案——它组织容器、水平扩展服务、为平台团队提供运行生产软件的共享词汇。但那个定义了Kubernetes黄金时代的负载——快速、无状态、可丢弃的HTTP请求——已不再是当前最重要的工作负载。AI Agent是长时间运行的有状态进程，它们跨时间推理、调用外部工具、生成子进程、编写和执行代码，并且依赖于任务中前五步的决策结果。单个Agent工作流可能运行数分钟或数小时，涉及十多个外部系统。Kubernetes SIG Apps已在2026年3月发布了Agent Sandbox的介绍，承认了这种不匹配。

**Source:** [New Agentic Compute Patterns - InfoWorld](https://www.infoworld.com/article/4197466/new-agentic-compute-patterns.html)

### Red Hat OpenShift 4.22发布：削减云成本，优化AI工作负载

Red Hat OpenShift 4.22于7月14日正式发布，聚焦三大方向：降低云基础设施成本、简化虚拟化工作负载运营、保护敏感数据。新版本引入了Confidential AI技术预览，允许组织在加密隔离的内存和CPU切片中运行敏感的AI工作负载和专有算法，即使在运行时执行期间也能保持数据隐私。此外，Red Hat构建的Karpenter自动缩放器现已正式可用，配合AWS EC2 Spot实例可显著降低计算成本。

**Source:** [Red Hat OpenShift 4.22 tackles cloud costs, AI workloads - InfoWorld](https://www.infoworld.com/article/4197008/red-hat-openshift-4-22-tackles-cloud-costs-ai-workloads.html)

### Kubernetes 1.36持续演进：安全与AI工作负载支持成熟

Kubernetes 1.36"Haru"版本自4月发布以来已更新至1.36.2，包含70项增强功能。该版本在安全加固、AI/ML工作负载支持和API可扩展性方面取得重大进展。User Namespaces达到GA状态，Mutating Admission Policies进入GA，Fine-Grained Kubelet API Authorization也已稳定。在存储方面，AWS EBS卷的原地大小调整（In-Place Resize）作为Alpha特性引入，这对有状态工作负载而言意义重大。

**Source:** [Kubernetes v1.36 Release](https://kubernetes.io/blog/2026/04/22/kubernetes-v1-36-release/)

## 分析

云原生生态系统正在经历一个关键的转型期。Kubernetes在十年间从一个容器编排工具成长为事实上的分布式操作系统，但AI Agent工作负载的出现暴露了其核心假设的根本性不匹配。Kubernetes的调度器、自动扩缩器和生命周期管理都是围绕短暂、无状态、可互换的工作单元设计的。Agent工作负载则需要持久化状态、跨步骤依赖、长运行进程管理和中间结果存储。这不是简单地添加新功能就能解决的问题——它需要从执行基础设施层面围绕Agent语义而非请求语义进行重新设计。

Red Hat OpenShift 4.22的发布恰好回应了这一转型需求。Confidential AI功能解决了企业在运行敏感AI模型时的数据隐私顾虑——在加密隔离的环境中运行专有算法，即使在运行时也能保护数据安全。JobSet算子的引入则针对大规模分布式训练和LLM微调作业的协调问题，这在GPU计算资源昂贵的背景下尤为重要。

Kubernetes 1.36的持续更新则表明核心平台社区正在积极适应新需求。User Namespaces的GA增强了容器逃逸场景的安全性，DRA的演进改善了GPU等异构资源的管理。AWS EBS卷的原地调整能力虽然看似是一个小功能，但对于需要动态调整存储容量的AI训练工作负载来说，它消除了一个重要的运维痛点。

## 结论

云原生基础设施正处于从"通用容器平台"向"AI原生操作系统"演进的关键阶段。Agentic计算模式的讨论、OpenShift的安全AI能力、以及Kubernetes核心功能的持续成熟，共同指向一个趋势：下一阶段的云原生将围绕AI工作负载的特殊需求进行深度重构。从业者应密切关注Kubernetes社区关于Agent Sandbox和有状态工作负载管理的进展，评估Confidential AI在数据合规场景中的应用，并为从无状态到有状态的架构范式转变做好准备。
