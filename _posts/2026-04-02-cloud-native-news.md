---
layout: post
title: "云原生技术动态：Kubernetes 1.36预览与CNCF项目重要更新"
date: 2026-04-02
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/03/30/kubernetes-v1-36-sneak-peek/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cncf
  - cloud-native
  - service-mesh
  - containers
---

# 云原生技术动态：Kubernetes 1.36预览与CNCF项目重要更新

本周云原生领域迎来多项重要更新，KubeCon Europe 2026在阿姆斯特丹成功举办期间，CNCF宣布了多个里程碑式的项目进展。本周新闻涵盖了Kubernetes即将发布的1.36版本预览、Kyverno毕业为正式项目、Istio服务网格的AI时代更新，以及Higress加入CNCF沙箱项目等重大事件。

## 主要新闻

### Kubernetes 1.36版本预览发布

Kubernetes 1.36版本预计将于2026年4月底正式发布，该版本将包括多项重要的移除和弃用更新，同时带来了大量新特性。这个即将发布的版本延续了Kubernetes持续演进的传统，为容器编排平台引入更多现代化功能。

**Source:** [Kubernetes v1.36 Sneak Peek](https://kubernetes.io/blog/2026/03/30/kubernetes-v1-36-sneak-peek/)

### Kyverno正式从CNCF毕业

CNCF宣布Kyverno正式毕业成为CNCF毕业项目，这标志着Kyverno在企业级采用方面取得了显著成功。作为一个专为Kubernetes设计的策略即代码解决方案，Kyverno展示了广泛的企业采用率，平台团队越来越多地采用声明式治理方式来管理Kubernetes集群。

**Source:** [CNCF Announces Kyverno's Graduation](https://www.cncf.io/announcements/2026/03/24/cloud-native-computing-foundation-announces-kyvernos-graduation/)

### Istio服务网格拥抱AI时代

Istio在KubeCon Europe 2026上宣布了多项重磅更新，包括新的Ambient多集群支持、Gateway API推理扩展等功能。这些更新旨在简化服务网格的采用，同时扩展Istio在下一代AI基础设施中的作用。新功能包括beta级别的能力支持和实验性支持，旨在使服务网格更加易于使用。

**Source:** [Istio Brings Future Ready Service Mesh to the AI Era](https://www.cncf.io/announcements/2026/03/25/istio-brings-future-ready-service-mesh-to-the-ai-era-with-new-ambient-multicluster-gateway-api-inference-extension-and-more/)

### Higress成为CNCF沙箱项目

Higress正式通过CNCF技术监督委员会投票，成为CNCF沙箱项目。Higress是一个企业级AI网关解决方案，同时为从Nginx Ingress迁移提供了无缝路径。这一加入标志着云原生生态系统中API网关和AI基础设施领域的持续创新。

**Source:** [Higress Joins CNCF](https://www.cncf.io/blog/2026/03/25/higress-joins-cncf-delivering-an-enterprise-grade-ai-gateway-and-a-seamless-path-from-nginx-ingress/)

## 分析

本周的云原生新闻反映了行业发展的几个关键趋势。首先，AI与Kubernetes的深度融合已成为不可逆转的方向。CNCF将近翻倍的Kubernetes AI认证平台数量，以及llm-d项目加入CNCF沙箱，都表明整个生态系统正在围绕AI推理和训练工作负载进行优化。Kyverno的毕业尤其值得关注，因为它代表了策略即代码领域的成熟，这一领域对于在大型组织中实施一致的治理和安全策略至关重要。

其次，服务网格技术正在经历重大转型。Istio的新功能表明，服务网格不再仅仅是微服务通信的基础设施，而是正在成为AI时代分布式系统的核心组件。多集群支持和Gateway API集成反映了现代云原生应用对跨环境和统一网络层的需求。Traefik Proxy作为Kubernetes网络标准的崛起也值得关注，这表明开源生态系统的多样性正在增加，为用户提供了更多选择。

第三，企业级采用继续加速。Kubernetes 1.36预览版的发布和多项CNCF项目的重要更新表明，容器编排生态系统正在向更成熟、更稳定的方向发展。Kubescape 4.0的发布也印证了安全在云原生部署中的核心地位，特别是其AI代理扫描和运行时安全功能，这对于在生产环境中运行AI工作负载尤为重要。

## 结论

云原生生态系统在2026年4月呈现出强劲的发展势头。Kubernetes与AI的融合正在深化，Kyverno和Istio等项目的重要里程碑表明云原生技术正在走向成熟。企业团队应该密切关注这些发展，特别是在AI推理工作负载、策略即代码和多集群服务网格等领域。对于 practitioners 而言，现在正是评估和采用这些新技术以增强其云原生基础设施的最佳时机。
