---
layout: post
title: "云原生技术动态：CNCF扩大Kubernetes AI认证平台与Tekton进入孵化阶段"
date: 2026-05-03
author: "云原生观察"
source: "https://www.cncf.io/announcements/2026/03/24/cncf-nearly-doubles-certified-kubernetes-ai-platforms/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cncf
  - ai
  - tekton
  - kubescape
---

# 云原生技术动态：CNCF扩大Kubernetes AI认证平台与Tekton进入孵化阶段

近期云原生领域迎来多项重要进展。CNCF将其Kubernetes AI一致性认证平台数量几乎翻倍，同时Tekton正式成为CNCF孵化项目，标志着云原生CI/CD生态的进一步成熟。此外，Kubescape 4.0的发布为Kubernetes安全带来了企业级稳定性和AI时代的新能力。

## 主要新闻

### CNCF几乎翻倍Kubernetes AI一致性认证平台

CNCF宣布其Kubernetes AI一致性认证计划自2025年11月启动以来已几乎翻倍，新增认证平台包括OVHcloud、SpectroCloud、京东云和中国联通云。最新版本引入了更严格的v1.35要求，正式编为Kubernetes AI Requirements (KARs)，确保复杂AI任务在不同系统间的一致运行。新认证还支持"Agentic" AI工作负载，利用Kubernetes和容器已有的可信沙箱模型，为AI代理提供安全执行环境。

**Source:** [CNCF Nearly Doubles Certified Kubernetes AI Platforms](https://www.cncf.io/announcements/2026/03/24/cncf-nearly-doubles-certified-kubernetes-ai-platforms/)

### Tekton成为CNCF孵化项目

CNCF技术监督委员会(TOC)投票通过接受Tekton为CNCF孵化项目。Tekton作为通用的、注重安全的Kubernetes原生工作流引擎，其组合式原语（Steps、Tasks和Pipelines）使开发者能够在Kubernetes上编排任何类型的顺序或并行工作负载。项目已达到核心Pipelines组件的稳定v1.0版本，拥有超过11,000个GitHub Stars和来自全球贡献者的活跃社区。

**Source:** [Tekton Becomes a CNCF Incubating Project](https://www.cncf.io/blog/2026/03/24/tekton-becomes-a-cncf-incubating-project/)

### Kubescape 4.0发布：企业稳定性与AI时代相遇

Kubescape 4.0版本为企业级Kubernetes安全带来重大更新。Kubescape Storage正式达到GA状态，利用Kubernetes聚合API作为所有安全元数据的集中存储库。该版本引入了KAgent原生插件，允许AI助手直接从集群分析Kubernetes安全态势，同时为AI代理本身提供安全态势扫描，识别42个安全关键配置点。

**Source:** [Announcing Kubescape 4.0](https://www.cncf.io/blog/2026/03/26/announcing-kubescape-4-0-enterprise-stability-meets-the-ai-era/)

### Kubernetes v1.35：AI的操作系统

Kubernetes v1.35（代号"Timbernetes"）版本发布，带来了工作负载感知调度和gang调度的初始实现，帮助分布式训练避免部分放置模式造成的资源浪费。原位Pod资源调整已升级为Stable，允许在不重启容器的情况下调整CPU和内存，这对推理服务的快速调优至关重要。

**Source:** [Kubernetes as AI's Operating System: 1.35 Release](https://www.cncf.io/blog/2026/02/23/kubernetes-as-ais-operating-system-1-35-release-signals/)

## 分析

这些进展共同描绘了云原生生态系统的几个关键趋势。首先，Kubernetes正在从通用的容器编排平台转型为AI基础设施的核心操作系统。CNCF的Kubernetes AI一致性认证计划不仅扩大了认证平台数量，更重要的是引入了更严格的KARs标准，这标志着AI工作负载正在从实验性部署走向工业级规模化。

其次，Tekton晋升为孵化项目反映了云原生CI/CD生态的成熟。与Argo CD、SPIFFE/SPIRE和Sigstore等CNCF项目的深度集成，正在构建一个完整的软件供应链安全故事。这对于希望实现安全、可重复的持续交付的企业来说意义重大。

第三，安全领域正在适应AI时代的新挑战。Kubescape 4.0的"AI安全硬币两面"方法——既利用AI代理增强安全扫描能力，又为AI代理本身提供安全保障——代表了云原生安全的新范式。随着AI代理获得更多自主权，其基础设施的安全防护变得尤为关键。

最后，Kubernetes v1.35的原位Pod调整和gang调度等特性直接解决了AI/ML工作负载的核心痛点。这些改进减少了操作摩擦，使Kubernetes能够更好地支持混合生产工作负载，包括服务、批处理作业、数据管道和ML训练。

## 结论

2026年第一季度的云原生领域呈现出明显的AI融合趋势。从认证标准到安全工具，从CI/CD流水线到核心调度能力，Kubernetes生态系统正在全面适应AI时代的需求。对于从业者而言，关注这些变化并适时调整技术栈将是保持竞争力的关键。预计2026年下半年，随着自动化一致性测试和主权AI标准的推出，云原生AI基础设施将进一步规范化。
