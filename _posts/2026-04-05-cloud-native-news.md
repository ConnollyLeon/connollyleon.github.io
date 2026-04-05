---
layout: post
title: "云原生技术动态：Kubernetes v1.36即将发布与Istio服务网格AI增强"
date: 2026-04-05
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/03/30/kubernetes-v1-36-sneak-peek/"
categories:
  - cloud-native
tags:
  - kubernetes
  - istio
  - service-mesh
  - cloud-native
  - CNCF
---

# 云原生技术动态：Kubernetes v1.36即将发布与Istio服务网格AI增强

本周云原生领域迎来多项重要更新。Kubernetes v1.36版本预览版发布，带来多项增强功能。Istio宣布推出面向AI时代的服务网格新特性，CNCF认证的Kubernetes AI平台数量 nearly翻倍，Higress项目正式加入CNCF。这些进展表明云原生技术正在加速向AI基础设施方向演进。

## 主要新闻

### Kubernetes v1.36即将发布

Kubernetes v1.36版本预计于2026年4月底正式发布。该版本将包含多项移除和弃用更新，同时带来大量新功能强化。根据发布预览博客，这次更新将继续加强Kubernetes在AI/ML工作负载支持方面的能力，包括更高效的GPU调度和改进的推理部署支持。

**Source:** [Kubernetes v1.36 Sneak Peek](https://kubernetes.io/blog/2026/03/30/kubernetes-v1-36-sneak-peek/)

### Istio推出面向AI时代的服务网格

Istio正式发布新一代服务网格功能，为AI基础设施提供更强大的支持。新版本包括Ambient模式的多集群支持、Gateway API集成、推理扩展等特性。这些更新旨在简化服务网格的采用，同时扩展Istio在下一代AI基础设施中的角色。

**Source:** [Istio Brings Future Ready Service Mesh to the AI Era](https://www.cncf.io/announcements/2026/03/25/istio-brings-future-ready-service-mesh-to-the-ai-era-with-new-ambient-multicluster-gateway-api-inference-extension-and-more/)

### CNCF认证Kubernetes AI平台数量 nearly翻倍

CNCF宣布其认证的Kubernetes AI平台数量 nearly增加一倍，达到超过70%的增长。该计划现已包含agentic workflows，并引入更严格的v1.35要求以消除基础设施碎片化。这一举措反映了AI应用在Kubernetes上部署的快速增长趋势。

**Source:** [CNCF Nearly Doubles Certified Kubernetes AI Platforms](https://www.cncf.io/announcements/2026/03/24/cncf-nearly-doubles-certified-kubernetes-ai-platforms/)

### Higress加入CNCF

Higress正式通过CNCF技术监督委员会投票，以Sandbox项目身份加入CNCF。Higress是一个企业级AI网关，提供从Nginx Ingress的平滑迁移路径。该项目将为云原生生态带来更丰富的AI流量管理能力。

**Source:** [Higress Joins CNCF](https://www.cncf.io/blog/2026/03/25/higress-joins-cncf-delivering-an-enterprise-grade-ai-gateway-and-a-seamless-path-from-nginx-ingress/)

## 分析

本周的云原生动态揭示了几个关键趋势。首先，Kubernetes正在成为AI基础设施的标准底座。CNCF认证AI平台的爆发式增长和Kubernetes v1.36对AI工作负载的持续优化，都印证了这一趋势。随着AI应用从实验走向生产，Kubernetes在推理部署、GPU调度等方面的能力将变得越来越关键。

其次，服务网格正在经历技术复兴。Istio的Ambient模式和Gateway API集成，代表了服务网格从复杂走向简化、从网络代理走向AI基础设施的转型。这种变化将降低服务网格的采用门槛，同时扩展其应用场景。

第三，AI网关正在成为云原生生态的新热点。Higress加入CNCF标志着AI流量管理正成为云原生技术的重要方向。随着大语言模型和AI agent的普及，如何高效管理AI流量、保障AI服务的安全性和可靠性，将成为下一个关键挑战。

## 结论

云原生技术正在加速与AI技术的融合。从Kubernetes对AI工作负载的原生支持，到服务网格的AI增强，再到AI网关的兴起，整个生态系统都在为AI时代进行架构重塑。对于企业而言，这意味着在构建AI基础设施时有了更成熟的选择；对于开发者而言，这意味着需要掌握更多云原生+AI的交叉技能；对于整个行业而言，这意味着云原生将从容器管理工具演进为AI时代的操作系统。