---
layout: post
title: "云原生技术动态：Kubescape 4.0发布与CNCF Kubernetes AI合规计划扩展"
date: 2026-03-29
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/03/26/announcing-kubescape-4-0-enterprise-stability-meets-the-ai-era/"
categories:
  - cloud-native
tags:
  - kubernetes
  - kubescape
  - security
  - cncf
  - k8s
---

# 云原生技术动态：Kubescape 4.0发布与CNCF Kubernetes AI合规计划扩展

本周云原生领域迎来多项重要更新，Kubescape 4.0的发布标志着Kubernetes安全工具进入AI原生时代，而CNCF的Kubernetes AI合规计划几乎翻倍，显示Kubernetes在AI基础设施领域的核心地位日益巩固。

## 主要新闻

### Kubescape 4.0正式发布

CNCF安全项目Kubescape于3月26日发布4.0版本，这是一个重要里程碑，为开源Kubernetes安全带来企业级稳定性和高级威胁检测能力。该版本聚焦于使安全更加主动和可扩展，同时引入使AI代理能够利用Kubescape扫描集群的功能，以及针对AI代理本身的安全态势扫描能力。

Runtime Threat Detection（运行时威胁检测）达到GA（正式可用）状态，引擎由CEL（Common Expression Language）规则驱动，能够直接访问Kubescape Application Profiles作为工作负载的安全基线。新版本监控全面的事件套件，包括系统交互（进程、Linux能力和系统调用）、连接（网络和HTTP事件）以及存储（文件系统活动）。

**Source:** [Announcing Kubescape 4.0 Enterprise Stability Meets the AI Era](https://www.cncf.io/blog/2026/03/26/announcing-kubescape-4-0-enterprise-stability-meets-the-ai-era/)

### CNCF Kubernetes AI合规计划几乎翻倍

CNCF于3月24日在阿姆斯特丹KubeCon Europe 2026大会上宣布，其Kubernetes AI合规计划自去年11月推出以来，认证平台数量几乎翻倍，从18个增加到31个。新加入的包括OVHcloud、SpectroCloud、JD Cloud和中国联通云。

该计划正在添加更严格的v1.35规则，以确保复杂的AI任务能够跨不同系统无缝且一致地运行。这些Kubernetes AI要求（KARs）专注于无缝硬件编排和智能工作负载验证，有效消除基础设施碎片化。NVIDIA副总裁Justin Boitano表示：“Kubernetes是AI数据中心的关键操作系统和现代AI工厂的编排层。”

**Source:** [CNCF Nearly Doubles Certified Kubernetes AI Platforms](https://www.cncf.io/announcements/2026/03/24/cncf-nearly-doubles-certified-kubernetes-ai-platforms/)

### Kubernetes引入Agent Sandbox支持AI代理运行

Kubernetes官方博客于3月20日发布文章，详细介绍了如何在Kubernetes上运行AI代理的Agent Sandbox技术。随着AI领域正在经历重大的架构转变，Kubernetes正在成为AI系统的平台。文章讨论了AI推理作为下一个主要云原生工作负载的趋势，以及Kubernetes如何演进为智能系统的平台。

Agent Sandbox提供了安全隔离机制，使AI代理能够在受限环境中执行操作，同时保持与外部系统的必要通信能力。

**Source:** [Running Agents on Kubernetes with Agent Sandbox](https://kubernetes.io/blog/2026/03/20/running-agents-on-kubernetes-with-agent-sandbox/)

### Broadcom扩展Kubernetes支持

Broadcom在KubeCon Europe 2026大会上宣布多管齐下的Kubernetes策略，简化企业Kubernetes运营同时扩展对AI和现代应用工作负载的支持。公司将Velero项目贡献给CNCF Sandbox，并发布VKS 3.6版本，增强升级、性能调优和生命周期管理能力。

Broadcom还通过F5 Networks、Kong和Tigera的新合作关系扩展其合作伙伴生态系统，为网络、API管理和安全提供经过验证的集成方案。

**Source:** [Broadcom expands Kubernetes support with VKS upgrades, open-source contributions and new partnerships](https://siliconangle.com/2026/03/23/broadcom-expands-kubernetes-support-vks-upgrades-open-source-contributions-new-partnerships/)

## 分析

本周的云原生新闻反映了该生态系统正在经历的两个关键趋势。首先是AI与Kubernetes的深度融合。Kubescape 4.0的发布和Kubernetes Agent Sandbox的引入表明，云原生社区正在积极应对AI原生时代的安全和运营挑战。运行时威胁检测的GA状态特别值得关注，因为这意味着企业现在可以依靠经过生产验证的安全工具来保护其AI推理工作负载。

其次是标准化和合规性的重要性日益凸显。CNCF的Kubernetes AI合规计划几乎翻倍的认证平台数量表明，行业正在认识到跨云和跨供应商一致性的重要性。v1.35中引入的更严格要求，包括对智能工作负载的支持，标志着Kubernetes正在成为企业AI部署的可信基础。NVIDIA和Google等行业领导者对该计划的支持进一步验证了这一趋势。

Broadcom将Velero贡献给CNCF Sandbox的决定也值得关注。这表明即使是大型商业实体也认识到开源治理模型对项目长期可持续发展的价值。对于企业用户来说，这意味着他们可以期待更多的社区参与和更广泛的生态系统支持。

## 结论

云原生生态系统正在快速演进，以满足AI原生时代的需求。Kubescape 4.0和企业级安全工具的进步为保护AI工作负载提供了必要的工具，而CNCF合规计划的扩展正在为工业规模AI部署建立标准。随着KubeCon Europe 2026大会的进行，我们可以预期未来几周会有更多关于Kubernetes在AI领域角色的公告和创新。
