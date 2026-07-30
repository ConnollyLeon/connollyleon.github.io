---
layout: post
title: "KubeCon Japan 2026闭幕：CNCF报告日本AI开发者达10万、平台工程与AI原生成为核心主题"
date: 2026-07-30
author: "云原生观察"
source: "https://www.cncf.io/announcements/"
categories:
  - cloud-native
tags:
  - kubernetes
  - kubecon
  - cncf
  - japan
  - ai
  - platform-engineering
  - gitops
  - otel
---

# KubeCon Japan 2026闭幕：CNCF报告日本AI开发者达10万、平台工程与AI原生成为核心主题

KubeCon + CloudNativeCon Japan 2026今日在横滨PACIFICO会展中心闭幕。CNCF在大会期间发布报告称日本已有10万名AI开发者使用云原生技术，AI基础设施SIG正式启动，平台工程和GitOps演进成为第二天议程焦点。

## 主要新闻

### CNCF报告：日本10万AI开发者使用云原生技术

CNCF在KubeCon Japan 2026上发布新研究报告，显示日本已有约10万名AI开发者正在使用云原生技术构建和部署AI工作负载。研究指出，日本企业在Kubernetes上运行AI/ML工作负载的比例较去年增长超过60%，DRA（Dynamic Resource Allocation）和Kueue等AI调度工具在日本的采用率居全球前列。这一数据标志着日本正在从"云原生采用者"向"云原生AI创新者"转型，特别是在金融科技、制造业和机器人领域的AI部署方面表现突出。

**Source:** [CNCF Research: 100,000 Japan AI Developers Now Use Cloud Native](https://www.cncf.io/announcements/)

### KubeCon Day 2亮点：平台工程与GitOps源真相重构

KubeCon Japan第二天议程聚焦平台工程演进。Artem Lajko在"The Evolution of GitOps in Platform Engineering"议题中探讨了GitOps从基础设施自动化向平台工程核心方法论的角色转变。Michael Crenshaw和Robin Lieb的"OCI is not Git: Rethinking the GitOps Source of Truth"演讲引发广泛讨论，提出OCI制品作为Kubernetes原生环境中GitOps真相来源的新范式。Red Hat的Vincent Caldeira和Morgan Foster展示了金融行业Kubernetes上安全Agentic工作流架构的案例研究。

**Source:** [KubeCon + CloudNativeCon Japan 2026 Schedule](https://events.linuxfoundation.org/kubecon-cloudnativecon-japan/program/schedule/)

### CNCF日本分会AI基础设施SIG首次见面会

CNCF日本分会（Cloud Native Community Japan）在KubeCon期间成功举办了AI基础设施SIG的首次见面会。该SIG由LY Corporation和IBM Research Tokyo工程师领导，聚焦DRA GPU调度、Kueue批处理作业、KubeRay AI训练、KServe推理服务和Gateway API Inference Extension等技术领域。首次见面会吸引了超过120名参与者，SIG计划以月频次组织技术分享和贡献者研讨会。

**Source:** [Launch of the AI Infra SIG under the CNCF Japan chapter](https://www.cncf.io/blog/2026/07/23/launch-of-the-ai-infra-sig-under-the-cncf-japan-chapter-first-meetup-and-call-for-speakers/)

### 可持续性设计：DRA助力节能Kubernetes集群

IBM Research的Sunyanan Choochotkaew和Ericsson的Faseela Kundattil在KubeCon上展示了"Sustainability by Design: Leveraging DRA for Energy-Efficient Kubernetes Clusters"。该议题展示了如何利用DRA框架实现基于碳排放感知的Pod调度——通过将每千瓦时碳排放数据作为资源指标暴露给调度器，DRA能够将工作负载调度到碳强度最低的节点上，在典型混合能源集群中可实现15-25%的碳排放降低。

**Source:** [KubeCon Japan 2026 - Sustainability by Design](https://events.linuxfoundation.org/kubecon-cloudnativecon-japan/program/schedule/)

## 分析

KubeCon Japan 2026的闭幕标志着云原生社区在亚太地区的第二个年度里程碑。从大会内容来看，三个趋势值得关注：

1. **AI原生基础设施从实验走向生产**：DRA的成熟、AI Infra SIG的成立以及日本10万AI开发者的数据共同表明，Kubernetes作为AI基础设施的操作系统定位已经稳固。GPU调度不再是技术难题，而是标准化实践。

2. **平台工程进入精细化阶段**：GitOps源真相从Git仓库向OCI制品的演进，反映了平台工程从"基础设施即代码"向"平台即产品"的深化。OCI作为非Git源的支持意味着平台团队可以构建更灵活、更安全的交付管道。

3. **可持续性成为Kubernetes调度的新维度**：DRA在碳排放感知调度方面的应用，为云原生基础设施的绿色运维提供了技术路径。随着全球数据中心能耗持续增长，这一方向将获得更多关注。

## 结论

KubeCon Japan 2026展现了云原生与AI深度融合的清晰路线图。对于亚太地区的技术团队而言，关注DRA的成熟度、积极参与AI Infra SIG、评估GitOps现代化路径，以及将可持续性纳入调度策略，将是接下来几个月的关键任务。
