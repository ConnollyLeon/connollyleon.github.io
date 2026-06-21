---
layout: post
title: "云原生技术动态：Kubernetes 1.35.6发布、Oracle OKE支持零信任、Headlamp正式接替Dashboard"
date: 2026-06-15
author: "云原生观察"
source: "https://github.com/kubernetes/kubernetes/releases/tag/v1.35.6"
categories:
  - cloud-native
tags:
  - kubernetes
  - oracle
  - oke
  - zpr
  - headlamp
  - security
  - zero-trust
  - cloud-native
---

# 云原生技术动态：Kubernetes 1.35.6发布、Oracle OKE支持零信任、Headlamp正式接替Dashboard

本周云原生领域迎来多项重要更新：Kubernetes 1.35.6补丁发布修复多项稳定性问题，Oracle OKE集成零信任数据包路由（ZPR）增强安全，Kubernetes Dashboard正式退役由Headlamp接替，生态系统加速向AI原生方向演进。

## 主要新闻 (Main News)

### Kubernetes 1.35.6补丁发布

Kubernetes 1.35.6于6月12日发布，作为最新稳定版本的补丁更新，修复了多项社区报告的问题和安全漏洞。该版本延续了Kubernetes在2026年的快速迭代节奏，体现了项目维护者对生产环境稳定性的持续关注。

**Source:** [Kubernetes v1.35.6 Release](https://github.com/kubernetes/kubernetes/releases/tag/v1.35.6)

### Oracle OKE集成零信任数据包路由（ZPR）

Oracle Cloud Infrastructure的Kubernetes引擎（OKE）宣布支持零信任数据包路由（ZPR）。团队可以为OKE集群相关的OCI资源分配ZPR安全属性，并编写ZPR策略来定义批准的通信路径。ZPR不替代现有的VCN设计、路由、NSG、安全列表、IAM和Kubernetes RBAC/NP等控制措施，而是增加了一层独立的检查——即使网络可达性发生意外变更，也不会自动转化为访问权限。

**Source:** [Announcing OKE support for Zero Trust Packet Routing](https://blogs.oracle.com/cloud-infrastructure/zpr-support-for-oke)

### Headlamp正式取代Kubernetes Dashboard

Kubernetes项目于6月1日正式归档了Kubernetes Dashboard，推荐用户迁移至Headlamp——最初由Kinvolk开发、现作为CNCF沙箱项目维护的Kubernetes Web UI。Headlamp在Dashboard的基础上增加了多集群可见性、应用中心视图、插件扩展机制，以及支持集群内运行和桌面应用两种部署模式。这一转变标志着Kubernetes UI生态进入新阶段。

**Source:** [From Kubernetes Dashboard to Headlamp: Understanding the Transition](https://kubernetes.io/blog/2026/06/01/dashboard-to-headlamp/)

### NVIDIA发布开源AI Agent开发平台

NVIDIA在GTC大会上发布Agent Toolkit，包含OpenShell开源运行时，用于构建具有安全性和隐私保护的自演进AI代理。基于LangChain构建的AI-Q Blueprint在DeepResearch Bench准确性排行榜上位居首位，同时可将查询成本降低50%以上。Adobe、Atlassian、Red Hat、SAP、Salesforce等领先软件平台正在使用NVIDIA Agent Toolkit推进企业AI代理开发。

**Source:** [NVIDIA Ignites the Next Industrial Revolution with Open Agent Development Platform](https://nvidianews.nvidia.com/news/ai-agents)

## 分析 (Analysis)

本周的多项更新揭示了Kubernetes生态系统的三个关键趋势：安全纵深防御、AI原生集成和UI/UX现代化。

Oracle OKE的ZPR集成代表了Kubernetes安全策略从"边界防御"向"零信任架构"演进的重要一步。ZPR在现有网络策略之上增加了第七层感知的安全策略层，这尤其适合多租户集群和金融、政务等合规敏感场景。随着企业将更多关键工作负载迁移到Kubernetes，类似的零信任集成预计将成为所有主流云服务商的标配。

Kubernetes Dashboard正式归档并由Headlamp接替，反映了Kubernetes管理复杂度的提升。单一集群的UI管理在当今的多集群、多环境部署模式中已不合时宜。Headlamp的插件架构和桌面端支持为平台工程师提供了更大的灵活性——他们可以选择在集群内运行以集中管理，或在桌面端运行以获得更好的开发体验。

NVIDIA的Agent Toolkit发布和Kubernetes社区推动Dashboard至Headlamp的迁移都指向一个核心趋势：Kubernetes正在从容器编排平台演变为AI工作负载的操作系统。这不仅意味着对GPU/NPU调度、动态资源分配等底层能力的增强，也意味着管理界面和开发者体验需要跟上AI原生应用的复杂性。

## 结论 (Conclusion)

本周几个看似独立的更新共同指向Kubernetes生态系统的成熟化方向：Oracle的ZPR集成增强了企业级安全能力，Headlamp取代Dashboard提升了用户体验，Kubernetes 1.35.6持续加固稳定性。建议平台团队评估OKE ZPR对安全架构的增强价值，并规划从Dashboard到Headlamp的迁移路径。同时关注NVIDIA Agent Toolkit等AI原生工具对Kubernetes工作负载管理方式的潜在影响。
