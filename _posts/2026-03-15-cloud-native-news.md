---
layout: post
title: "云原生技术动态：KubeCon EU将至、Kubernetes 1.36即将发布与AI平台 converging on K8s"
date: 2026-03-15
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/03/05/the-great-migration-why-every-ai-platform-is-converging-on-kubernetes/"
categories:
  - cloud-native
tags:
  - kubernetes
  - kubecon
  - cloud-native
  - ai
  - service-mesh
---

# 云原生技术动态：KubeCon EU将至、Kubernetes 1.36即将发布与AI平台 converging on K8s

本周云原生领域迎来多项重要更新，Kubernetes生态系统持续演进，AI平台与容器技术的深度融合成为最显著趋势。KubeCon + CloudNativeCon Europe 2026即将于3月24-26日举行，业界对云原生AI的发展充满期待。

## 主要新闻

### Kelos：Kubernetes原生框架助力自主AI编码代理

Kelos是一个新兴的Kubernetes原生框架，旨在实现自主AI编码代理的编排。该项目源于一个核心理念：AI编码代理不应仅存在于交互式终端中，而应能够持续运行、响应真实事件、在隔离环境中操作，并参与到软件交付工作流中。Kelos使AI代理能够像其他生产系统一样参与工作流程，标志着AI开发环境的重要进步。

**Source:** [Kelos: Orchestrating Autonomous AI Coding Agents on Kubernetes](https://dev.to/gjkim/kelos-orchestrating-autonomous-ai-coding-agents-on-kubernetes-apl)

### Kubernetes 1.36版本前瞻

Kubernetes 1.36计划于2026年4月22日正式发布。该版本带来了多项重要改进，包括增强的节点就绪控制器以提高Pod调度可靠性、改进的集群安全性和容器隔离能力。根据发布预览，新版本将继续强化动态资源分配（DRA）、Gateway API和入口控制器等核心功能。值得关注的是，ingress-nginx即将迎来重大更新，平台工程实践也日趋成熟。

**Source:** [What to Expect From Kubernetes 1.36](https://cloudnativenow.com/features/what-to-expect-from-kubernetes-1-36/)

### 为什么每个AI平台都在向Kubernetes convergence

CNCF发布的2026年度调查显示，82%的容器用户在生产环境中运行Kubernetes，66%的组织使用Kubernetes托管生成式AI模型。Kubernetes已从单纯的容器编排器演变为现代应用的操作系统，为内部开发者平台、尖端AI训练和推理管道、大规模数据处理等提供支撑。这一转变标志着平台融合的实际需求正在驱动行业变革。

**Source:** [Why every AI platform is converging on Kubernetes](https://www.cncf.io/blog/2026/03/05/the-great-migration-why-every-ai-platform-is-converging-on-kubernetes/)

### AWS在KubeCon EU 2026展示开源领导力

AWS在KubeCon Europe 2026上宣布了多项开源创新计划，重点展示其在云原生生态系统中的领导地位。AWS承诺继续深化与Kubernetes生态系统的集成，推动生产创新，包括对Amazon EKS的持续优化以及与各类CNCF项目的深度合作。

**Source:** [AWS at KubeCon EU 2026](https://aws.amazon.com/blogs/containers/aws-at-kubecon-eu-2026-open-source-leadership-meets-production-innovation/)

### Kubernetes节点就绪控制器提升调度可靠性

Kubernetes项目近日宣布推出新的核心控制器——Node Ready Controller，旨在通过为API服务器提供更准确的节点就绪状态视图来增强调度可靠性和集群健康。该功能目前处于alpha阶段，解决了kubelet已将节点标记为不可用但仍调度Pod到这些节点的长期问题，有助于防止不必要的Pod驱逐并提高整体工作负载稳定性。

**Source:** [Kubernetes introduces a node readiness controller](https://longbridge.com/news/278033496)

## 分析

本周云原生领域的核心主题是AI与Kubernetes的深度融合。从Kelos这样的新兴框架到CNCF的权威调查数据，都指向同一个趋势：Kubernetes已经远远超越了传统的容器编排范畴，成为现代分布式系统的通用基础设施。

首先，AI工作负载正在重新定义云原生的边界。66%的组织使用Kubernetes托管GenAI模型这一数据表明，AI推理和训练正在成为Kubernetes的核心用例而非附加功能。这推动了平台工程实践的成熟，开发者平台、Karpenter自动扩缩容、Gateway API等服务正在形成标准化的云原生技术栈。

其次，Kubernetes 1.36的即将发布体现了项目持续演进的能力。Node Ready Controller等新功能的引入表明社区正在解决生产环境中的真实痛点。随着4月22日发布日期临近，Code & Test Freeze即将于3月19日到来，开发者社区正在为新版本做最后准备。

第三，KubeCon EU 2026的临近将提供一个重要的行业聚会平台。Kubernetes贡献者Meet & Greet等活动将促进社区活跃，预计将有更多关于云原生AI、边缘计算和安全增强的讨论。

## 结论

云原生生态系统在2026年3月展现出强劲发展势头。Kubernetes作为"云原生操作系统"的地位进一步巩固，AI工作负载成为驱动创新的核心动力。展望未来，随着KubeCon EU 2026的召开和Kubernetes 1.36的正式发布，我们可以期待看到更多关于云原生AI、平台工程和边缘计算的创新。企业和开发者应密切关注这些发展，以便在快速演进的技术 landscape 中保持竞争力。
