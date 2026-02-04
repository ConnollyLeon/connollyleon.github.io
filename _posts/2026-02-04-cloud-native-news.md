---
layout: post
title: "云原生技术动态：Kubernetes新特性与LLM推理创新"
date: 2026-02-04
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/01/02/kubernetes-v1-35-restart-all-containers/"
categories:
  - cloud-native
tags:
  - kubernetes
  - llm
  - kthena
  - cncf
---

# 云原生技术动态：Kubernetes新特性与LLM推理创新

本周云原生领域迎来多项重要更新，Kubernetes 1.35版本发布和CNCF推出Kthena项目标志着容器编排平台在大模型推理领域的重要进步。

## 主要新闻

### Kubernetes 1.35：引入原地Pod重启功能

Kubernetes 1.35版本引入了强大的新功能，提供了触发Pod原地重启的能力。这个名为"Restart All Containers"的alpha功能允许高效重置Pod状态，相比删除并重新创建整个Pod的资源密集型方法更为高效。该功能对AI/ML工作负载特别有用，允许应用开发者专注于核心训练逻辑，同时将复杂的故障处理和恢复机制交给sidecar和声明式Kubernetes配置。

**Source:** [Kubernetes v1.35: New level of efficiency with in-place Pod restart](https://kubernetes.io/blog/2026/01/02/kubernetes-v1-35-restart-all-containers/)

### CNCF推出Kthena：面向云原生时代的LLM推理

Volcano社区骄傲地宣布推出Kthena，这是一个专为全球开发者和MLOps工程师设计的新子项目。Kthena是一个云原生、高性能的大型语言模型(LLM)推理、编排和调度系统，专为Kubernetes量身定制。该工程旨在解决在生产规模上部署LLM的复杂系统工程挑战。

Kthena由两个核心组件组成：Kthena Router（高性能多模型路由器）和Kthena Scheduler（智能调度器），通过拓扑感知调度、KV缓存感知路由和Prefill-Decode(PD)解耦等功能显著提高GPU/NPU利用率和吞吐量，同时最小化延迟。

**Source:** [Introducing Kthena: LLM inference for the cloud native era](https://www.cncf.io/blog/2026/01/28/introducing-kthena-llm-inference-for-the-cloud-native-era/)

### Dragonfly从CNCF毕业

云原生计算基金会宣布Dragonfly项目毕业，该项目在展示生产就绪状态和广泛采用后，为容器和AI工作负载提供大规模分发服务。Dragonfly被Ant Group、Alibaba、Datadog、DiDi和Kuaishou等主要组织使用，为大规模容器和AI模型分发提供支持。

自加入CNCF以来，Dragonfly的代码贡献增长了3000%以上，贡献者社区跨越130多家公司。

**Source:** [Cloud Native Computing Foundation Announces Dragonfly's Graduation](https://www.cncf.io/announcements/2026/01/14/cloud-native-computing-foundation-announces-dragonflys-graduation/)

## 分析

这些更新反映了云原生生态系统的几个关键趋势：

首先，Kubernetes正在从通用容器编排平台演进为支持AI工作负载的一等公民。新的Pod重启功能特别体现了这种转变，它专门为需要状态重置而非完全重建的AI/ML工作负载设计。这表明Kubernetes社区已经认识到AI工作负载的特殊需求，并开始在核心平台级别提供专门支持。

其次，Kthena的推出标志着云原生生态系统在AI推理领域的成熟。传统上，LLM推理被视为独立的AI工程问题，但现在它正在被整合到标准的云原生工具链中。Kthena不试图替代现有的推理引擎，而是在其上添加智能编排层，这种"编排而非替换"的方法可能成为行业标准，因为它允许组织利用现有投资的同时获得云原生的好处。

第三，Dragonfly的毕业突显了云原生数据分发在AI时代的重要性。随着AI模型变得越来越庞大，传统的中心化分发方法已无法满足需求。Dragonfly的P2P技术在减少存储带宽消耗达90%的同时，将启动时间从几分钟缩短到几秒，这对于需要快速模型更新的AI应用至关重要。

这些发展也反映了云原生社区的战略重点：从单纯支持web应用转向全面支持AI工作负载。这种转变既带来了机遇也带来了挑战，需要更复杂的资源管理、安全性和性能优化。

## 结论

本周的云原生技术发展清晰地描绘了一个支持AI工作负载的容器编排生态系统未来。Kubernetes的Pod重启、Kthena的LLM推理编排和Dragonfly的毕业都指向同一个方向：云原生基础设施正在深度集成AI能力，为下一代AI驱动应用提供基础平台。

随着这些技术的成熟和应用，组织应该开始评估如何在现有环境中利用这些新功能。特别是在AI工作负载管理、模型分发和资源优化方面，这些创新将显著改善运营效率和成本效益。云原生社区正处于一个关键时刻，它正在重新定义自己在现代AI驱动技术栈中的角色。