---
layout: post
title: "云原生技术动态：Cloud Custodian十周年与云原生CI/CD生态整合"
date: 2026-05-13
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/05/12/a-decade-of-governance-cloud-custodian-at-10-and-its-role-in-the-agentic-ai-era/"
categories:
  - cloud-native
tags:
  - cloud-native
  - cncf
  - kubernetes
  - cloud-custodian
  - tekton
  - observability
---

# 云原生技术动态：Cloud Custodian十周年与云原生CI/CD生态整合

本周云原生领域迎来多项重要更新。Cloud Custodian迎来十周年里程碑，其在Agentic AI时代的治理价值凸显。Tekton正式加入CNCF成为孵化项目，标志着云原生CI/CD工具链的生态整合。同时，一项针对407名从业者的调查揭示了云原生可观测性领域工具碎片化的现状与挑战。

## 主要新闻

### Cloud Custodian十周年：从云管理工具到AI治理基础

Cloud Custodian作为CNCF孵化项目迎来十周年里程碑。这款开源、无状态的策略引擎用于管理公有云环境、Kubernetes和基础设施即代码，通过统一的DSL定义和强制执行FinOps、安全与合规策略。在Agentic AI时代，AI代理自主生成和部署基础设施代码，实时自动化治理已成为必需品。Cloud Custodian提供可编程边界、实时强制执行和供应商中立的治理能力，覆盖AWS、Azure、GCP、Oracle Cloud、Kubernetes和Terraform。

**Source:** [A decade of governance: Cloud Custodian at 10 and its role in the agentic AI era](https://www.cncf.io/blog/2026/05/12/a-decade-of-governance-cloud-custodian-at-10-and-its-role-in-the-agentic-ai-era/)

### Tekton正式加入CNCF成为孵化项目

Tekton已从持续交付基金会（CDF）正式迁移至CNCF成为孵化项目。作为Kubernetes原生CI/CD工作流引擎，Tekton Pipelines已达到1.0稳定版本。迁移至CNCF后，Tekton与Kubernetes、Argo CD和Helm同属一个基金会，获得超过150,000名贡献者的社区资源支持。路线图重点包括增强供应链安全（默认达到SLSA Level 3）、Kueue集成实现高级调度，以及Results API的稳定性推进。

**Source:** [Tekton joins the CNCF as an incubating project](https://developers.redhat.com/articles/2026/05/11/tekton-joins-cncf-new-era-cloud-native-cicd)

### 云原生可观测性：工具碎片化仍是最大挑战

2026年2月一项针对407名从业者的行业调查显示，尽管已有成熟、可互操作的云原生可观测性项目，仍有46.7%的组织并行运行2到3个可观测性工具，仅7.4%实现了单一统一的可观测性体验。OpenTelemetry Operator for Kubernetes在自动化仪表注入和收集器管理方面取得了进展，但社区仍需通过更好的默认配置、告警管理工具改进以及更明智的入门模板来降低时间到价值。

**Source:** [The tools are ready. So why are most cloud native teams still running three observability stacks?](https://www.cncf.io/blog/2026/05/06/the-tools-are-ready-so-why-are-most-cloud-native-teams-still-running-three-observability-stacks/)

## 分析

Cloud Custodian的十周年里程碑具有特殊意义。当云原生基础设施管理从"人工定义策略"演进到"AI代理自动生成基础设施"时，治理层的重要性呈指数级增长。Cloud Custodian的声明式策略引擎恰好填补了这一空白——它为AI代理生成的基础设施提供了可编程的安全护栏。这对于正在经历AI转型的企业尤为关键：GPU集群、模型服务端点和训练管道的成本和安全攻击面远超传统工作负载，而Cloud Custodian的实时执行能力可以在资源部署的瞬间关闭成本和风险窗口。

Tekton从CDF迁移至CNCF反映了云原生CI/CD工具链的深层整合趋势。CI/CD工具分散在多个基金会造成了标准碎片化和社区分裂。Tekton加入CNCF后，与Kubernete、Argo CD（GitOps）和Helm（包管理）形成统一的交付体系。更重要的是，Tekton作为通用工作流引擎（不仅是CI/CD），其在AI工作流编排、数据管道等领域的扩展潜力将进一步释放。Kubernete已从"编排容器"演变为"编排一切工作流"的平台。

可观测性调查数据揭示了一个核心矛盾：工具能力已成熟，但集成复杂性仍在阻碍统一体验。46.7%的组织运行2-3个工具的现实意味着，OpenTelemetry作为标准化的数据采集层已获得广泛认可，但后端分析、告警管理和仪表板层面仍各自为政。对于平台团队而言，投资于OpenTelemetry-native工具链、减少集成债，是通往统一可观测性的最高杠杆路径。

## 结论

本周更新揭示了云原生生态的三个并行趋势：传统治理工具在AI时代焕发新生（Cloud Custodian）、CI/CD工具链向CNCF生态整合（Tekton）、以及可观测性领域从"工具能力"到"集成体验"的范式转换。对于平台工程团队，建议优先投资于基于OpenTelemetry的可观测性策略、关注Tekton迁移后的CI/CD生态变化，并将Cloud Custodian纳入AI工作负载的治理架构。

**Source:** [Cloud Custodian at 10](https://www.cncf.io/blog/2026/05/12/a-decade-of-governance-cloud-custodian-at-10-and-its-role-in-the-agentic-ai-era/)
**Source:** [Tekton joins CNCF](https://developers.redhat.com/articles/2026/05/11/tekton-joins-cncf-new-era-cloud-native-cicd)
**Source:** [Observability survey](https://www.cncf.io/blog/2026/05/06/the-tools-are-ready-so-why-are-most-cloud-native-teams-still-running-three-observability-stacks/)
