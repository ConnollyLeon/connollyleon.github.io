---
layout: post
title: "云原生动态：Google发布OpenRL以Kubernetes方式管理AI微调，Amazon EKS支持客户路由控制面出站流量"
date: 2026-06-19
author: "云原生观察"
source: "https://cloudnativenow.com/features/google-openrl-tames-ai-model-tuning-kubernetes-style/"
categories:
  - cloud-native
tags:
  - kubernetes
  - google-openrl
  - eks
  - cncf
  - india
  - rl
  - kubecon
---

# 云原生动态：Google发布OpenRL以Kubernetes方式管理AI微调，Amazon EKS支持客户路由控制面出站流量

KubeCon + CloudNativeCon India 2026在孟买召开期间，云原生社区迎来多项重要发布。Google发布OpenRL开源项目，以Kubernetes的方式管理大语言模型的强化学习微调；Amazon EKS新增客户路由控制面出站流量能力；CNCF发布印度云原生开发者报告，显示印度拥有225万云原生开发者。这些更新表明Kubernetes正在从容器编排平台演变为AI基础设施的核心抽象层。

## 主要新闻

### Google发布OpenRL：以Kubernetes方式管理AI模型微调

Google Kubernetes Engine团队发布OpenRL开源项目，旨在以Kubernetes管理容器的方式管理大语言模型的强化学习（RL）微调。OpenRL将离散的模型微调操作——包括奖励模型推理、策略更新和环境交互——整合到一个统一的Kubernetes原生框架中。项目基于Thinking Machines的Tinker设计模式，提供四组API分别覆盖微调过程的不同方面。ML开发者可以在本地机器上管理RL循环，同时从运行在Kubernetes集群上的训练API中获取计算资源。OpenRL能够并发运行多个RL任务，最大化GPU利用率，为生产级模型创建和维护提供了硬件层面的抽象。

**Source:** [Google OpenRL Tames AI Model Tuning, Kubernetes-Style](https://cloudnativenow.com/features/google-openrl-tames-ai-model-tuning-kubernetes-style/)

### Amazon EKS支持客户路由控制面出站流量

Amazon Elastic Kubernetes Service宣布支持客户路由控制面出站流量（customer-routed control plane egress），允许用户将Kubernetes API服务器的出站流量路由到自己的Amazon VPC中。这包括准入Webhook回调、OpenID Connect（OIDC）提供商查询和聚合API服务器请求。该功能使流量流经用户VPC，用户可控制路由、安全组和出站路径。对于有数据边界要求、合规性要求或私有网络基础设施的组织，该功能可以访问仅在其VPC内可访问的私有OIDC提供商和Webhook服务器。通过设置controlPlaneEgressMode参数为CUSTOMER_ROUTED即可启用，并可配合AWS Organizations SCP进行组织级强制配置。

**Source:** [Amazon EKS now supports customer-routed control plane egress](https://aws.amazon.com/about-aws/whats-new/2026/06/amazon-eks-customer-routed-control-plane-egress/)

### CNCF报告：印度拥有225万云原生开发者，占全球11%

CNCF与SlashData在KubeCon India发布最新《印度云原生开发现状报告》。报告显示，截至2026年Q1，印度拥有约225万云原生开发者，占全球2000万总数的约11%，是全球最大的云原生社区之一。印度在后端开发者中Kubernetes使用率达到42%，超越容器采用率（39%），这与全球模式相反——反映出托管Kubernetes服务的广泛使用。44%的受访者报告使用混合云，远超全球平均水平的34%。CNCF还同期宣布新增14名白银会员，涵盖平台工程、AI基础设施、托管Kubernetes服务等领域。

**Source:** [CNCF and SlashData Report Confirms India as One of the Largest Cloud Native Communities](https://www.cncf.io/announcements/2026/06/17/cncf-and-slashdata-report-confirms-india-as-one-of-the-largest-cloud-native-communities-with-2-25-million-developers/)

### Kubernetes 1.37.0-alpha.1发布：cgroup v1完全移除与DRA测试回归

Kubernetes v1.37.0-alpha.1发布，标志着开发周期的前沿版本。从v1.33.13升级需严格按顺序遍历次版本。关键变化包括：v1.35中cgroup v1的完全移除、v1.36中gitRepo卷插件的删除（以缓解安全漏洞风险）。新的动态资源分配（DRA）测试套件在离线环境中存在镜像拉取验证回归问题——CSI hostpath驱动的ReplicaSet清单未编译标签后缀，导致在私有仓库中拉取失败。社区严格遵循N-3支持策略，仅维护v1.36、v1.35和v1.34三个最新次版本的发布分支。

**Source:** [Kubernetes 1.37.0-alpha.1: Breaking Changes and Community Responses](https://www.breakingchanges.dev/blog/kubernetes-1-37-0-alpha-1-breaking-changes/)

### Google Cloud Network Insights GA：跨云网络端到端可观测性

Google Cloud宣布Cloud Network Insights正式可用，这是一个开箱即用的云原生解决方案，提供跨多云和混合环境的网络与数字体验性能全面可见性。该服务与Broadcom AppNeta合作提供，通过主动合成探测在网络无用户流量时也能监控路由。功能包括逐跳网络路径可视化、数字体验监控、智能告警、以及Gemini Cloud Assist集成——用户可用自然语言查询网络指标与基础设施数据的关联。Cloud Network Insights填补了多云网络可观测性的关键空白。

**Source:** [Cloud Network Insights: End-to-end cross-cloud observability](https://cloud.google.com/blog/products/networking/cloud-network-insights-end-to-end-cross-cloud-observability)

## 分析

本周KubeCon India 2026期间的多项发布揭示了一个明确趋势：Kubernetes正在从"容器编排平台"演进为"AI基础设施控制平面"。Google OpenRL是最具标志性的例子——它并非将Kubernetes改造为AI平台，而是将RL微调工作流以Kubernetes原生的方式表达。OpenRL利用Kubernetes的资源管理和调度能力来协调GPU密集型RL任务，其设计哲学与Kubeflow一脉相承，但聚焦于微调这一特定阶段。

Amazon EKS的客户路由控制面出站流量功能虽然看似是一个网络功能更新，但反映了企业级Kubernetes部署中日益增长的安全合规需求。随着越来越多的组织将Kubernetes用于处理敏感工作负载（包括AI训练数据的访问），控制面组件之间的网络路径必须受到严格管控。该功能使EKS能够满足金融、医疗和政府行业的数据边界合规要求。

CNCF印度报告的数据尤其值得关注。印度Kubernetes使用率超过容器采用率这一反常现象，揭示了托管Kubernetes服务在开发者体验中的核心地位——平台工程团队管理底层容器基础设施，开发者直接面向Kubernetes API工作。这种模式正在成为全球趋势，平台工程实践的核心正是将基础设施复杂性抽象化。

Kubernetes 1.37.0-alpha.1的cgroup v1完全移除则是技术债务清理的重要里程碑。cgroup v1自Kubernetes 1.11起被标记为弃用，经过6个主要版本的过渡期后终于移除。这提醒社区：即使是最成熟的开源项目，也在持续进行底层机制的现代化改造。

## 结论

2026年6月的云原生动态表明，Kubernetes正在经历从"容器调度器"到"AI基础设施控制平面"的深刻转型。Google OpenRL和EKS控制面路由更新分别从"AI工作负载管理"和"安全合规"两个维度扩展了Kubernetes的能力边界。印度225万云原生开发者的数据则印证了这一生态系统的全球扩张势头。对于平台工程团队而言，重点关注Kubernetes上的AI工作负载编排能力演进，将是未来6-12个月的核心方向。
