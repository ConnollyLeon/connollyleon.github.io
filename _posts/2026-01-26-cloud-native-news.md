---
layout: post
title: "云原生技术动态：Kubernetes ingress-nginx控制器即将退役，GKE Autopilot增强DaemonSet支持"
date: 2026-01-26
author: "云原生观察"
source: "https://securityboulevard.com/2026/01/kubernetes-is-moving-on-from-ingress-nginx-how-are-you-planning-your-2026-migration/"
categories:
  - cloud-native
tags:
  - kubernetes
  - ingress
  - security
  - GKE
  - daemonset
---

# 云原生技术动态：Kubernetes ingress-nginx控制器即将退役，GKE Autopilot增强DaemonSet支持

本周云原生领域迎来重要安全更新和平台增强。Kubernetes社区正式宣布ingress-nginx控制器将于2026年3月退役，同时Google Kubernetes Engine Autopilot模式显著改善了DaemonSet部署支持，这些变化反映了云原生生态系统在安全性和易用性方面的持续演进。

## 主要新闻

### Kubernetes ingress-nginx控制器正式宣布退役

Kubernetes社区于2026年1月21日宣布，由于安全维护负担过重，社区ingress-nginx控制器将于2026年3月正式退役。该控制器已成为Kubernetes网络栈的关键组件，其广泛使用和安全敏感性使得维护团队难以安全地处理大量CVE报告。社区选择有序退役而非让组件逐渐衰减，体现了对安全性的重视。

**Source:** [Kubernetes Is Moving On From ingress-nginx: How Are You Planning Your 2026 Migration?](https://securityboulevard.com/2026/01/kubernetes-is-moving-on-from-ingress-nginx-how-are-you-planning-your-2026-migration/)

### GKE Autopilot增强DaemonSet自动节点迁移支持

Meshery于2026年1月26日发布的技术分析显示，Google Kubernetes Engine Autopilot模式从版本1.27.6-gke.1248000开始，能够自动检测无法容纳所有DaemonSet的节点，并逐步将工作负载迁移到更大的节点。这一改进解决了Autopilot模式下DaemonSet部署的长期痛点，为系统级工作负载提供了更好的支持。

**Source:** [Run DaemonSet on GKE Autopilot](https://meshery.io/catalog/deployment/run-daemonset-on-gke-autopilot-0aa86dd0-415c-4bf8-ae76-832560470b74.html)

### Kubernetes v1.35发布多项API增强功能

Kubernetes项目于2026年1月初发布v1.35版本，带来了多项重要API改进，包括通过exec插件allowList限制kubeconfig调用的可执行文件、可变PersistentVolume节点亲和性（Alpha阶段），以及为CSI驱动程序传递服务账户令牌的改进方式。这些更新增强了Kubernetes的安全性和灵活性。

**Source:** [Kubernetes Blog](https://kubernetes.io/blog/)

## 分析

本周的云原生新闻揭示了几个关键趋势，对行业从业者具有重要指导意义。

首先，Kubernetes生态系统的安全治理模式正在成熟。ingress-nginx控制器的退役决定反映了开源项目在面对广泛采用时的安全责任挑战。当一个组件从"可选工具"转变为"关键基础设施"时，维护团队需要重新评估安全承诺和资源投入。对于企业用户而言，这意味着需要更加关注关键组件的供应链安全，建立迁移计划，避免对单一社区组件的过度依赖。

其次，云平台提供商正在通过自动化解决复杂运维问题。GKE Autopilot对DaemonSet的改进体现了托管Kubernetes服务的价值主张——通过平台级的智能来简化用户的运维负担。这种"平台即服务"的趋势将继续发展，平台提供商将投入更多资源来解决常见的运维痛点，如资源调度、节点管理和工作负载放置。

第三，Kubernetes API的演进方向体现了"安全优先"的设计理念。v1.35版本中的多项安全增强功能表明，Kubernetes项目正在积极应对生产环境中的安全挑战。从限制kubeconfig执行权限到改进服务账户令牌传递，这些变化虽然可能增加一些配置复杂性，但显著提升了集群的整体安全性。

## 结论

ingress-nginx控制器的退役标志着Kubernetes生态系统的一个重要转折点——从快速增长阶段进入成熟治理阶段。对于平台工程师而言，现在是时候重新评估网络架构，考虑商业替代方案或建立内部维护能力。同时，GKE Autopilot的改进提醒我们，托管Kubernetes服务正在通过智能化来解决传统运维难题，这为资源有限的团队提供了新的选择。

随着Kubernetes v1.35的安全增强功能落地，我们看到了一个更加成熟、安全的容器编排平台。这些变化虽然可能需要短期适应，但长期来看将帮助构建更加可靠、安全的云原生基础设施。对于正在规划2026年技术路线的企业来说，平衡安全性、易用性和成本效益将成为关键考量因素。