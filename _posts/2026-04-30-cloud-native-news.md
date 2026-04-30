---
layout: post
title: "云原生技术动态：CNCF项目整合加速，Ingress迁移与CI/CD新进展"
date: 2026-04-30
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/04/23/from-ingress-nginx-to-higress-migrating-60-resources-in-30-minutes-with-ai/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cncf
  - higress
  - tekton
  - velero
  - cloud-native
---

# 云原生技术动态：CNCF项目整合加速，Ingress迁移与CI/CD新进展

本周云原生领域迎来多项重要进展，CNCF基金会持续推进项目治理整合，Tekton从CDF迁移至CNCF成为孵化项目，Broadcom将Velero捐赠给CNCF沙箱，标志着云原生生态系统进一步成熟。同时，随着Ingress NGINX正式退役，企业级迁移方案借助AI辅助工具实现了惊人的效率提升。

## 主要新闻

### Ingress NGINX退役：AI辅助30分钟完成60+资源迁移至Higress

2026年3月Ingress NGINX正式退役后，企业平台团队面临紧迫的安全合规要求。Alibaba工程师利用AI Agent结合Higress（近期加入CNCF沙箱的项目）实现了30分钟内完成60+复杂Ingress资源的全量迁移验证。该方案通过AI驱动的分析、模拟和执行流程，将传统需要数月的人工重构工作压缩至半小时以内。Higress基于Envoy和Istio构建，具备NGINX原生兼容性，为企业提供了面向AI时代的云原生API网关选择。

**Source:** [From Ingress NGINX to Higress: migrating 60+ resources in 30 minutes with AI](https://www.cncf.io/blog/2026/04/23/from-ingress-nginx-to-higress-migrating-60-resources-in-30-minutes-with-ai/)

### Tekton加入CNCF成为孵化项目，Kubernetes原生CI/CD迎来新里程碑

CNCF技术监督委员会于3月24日批准Tekton成为孵化项目，结束了该项目在持续交付基金会（CDF）长达七年的发展历程。Tekton拥有超过600名贡献者、11,000个GitHub星标和5,000多个合并拉取请求，其核心Pipelines组件已发布稳定的v1.0版本。该项目支撑着Red Hat OpenShift Pipelines、IBM Cloud Continuous Delivery等商业产品，并在Ford、Puppet、Nubank等企业的生产环境中运行。Tekton的加入反映了云原生治理整合的大趋势。

**Source:** [Tekton Joins the CNCF as an Incubating Project](https://machineherald.io/article/2026-04/02-tekton-joins-the-cncf-as-an-incubating-project-after-seven-years-of-kubernetes-native-cicd-development)

### Broadcom将Velero捐赠给CNCF沙箱，Kubernetes备份治理转向社区驱动

Broadcom将广泛采用的Kubernetes原生备份、恢复和迁移工具Velero捐赠给CNCF沙箱项目，CNCF技术监督委员会于3月17日批准该提案。这一举措将Velero从Broadcom的企业管理转向CNCF旗下的供应商中立、社区驱动的治理模式。与此同时，VMware发布vSphere 9.3.6，新增Kubernetes 1.35支持、RHEL 9兼容性等企业级特性。Velero捐赠是继Kyverno毕业、Tekton加入之后，CNCF生态系统整合的又一重要举措。

**Source:** [Broadcom Donates Velero to the CNCF Sandbox](https://machineherald.io/article/2026-04/07-broadcom-donates-velero-to-the-cncf-sandbox-shifting-kubernetes-backup-governance-to-the-community)

## 分析

近期CNCF的项目整合动作揭示了云原生生态系统正在经历深刻的治理变革。Tekton从CDF迁移至CNCF不仅仅是一个项目的简单转移，更反映了围绕Kubernetes生态的治理权力重新分配。随着Kubernetes成为容器编排的事实标准，与之紧密相关的CI/CD、安全、备份等工具链项目正加速向CNCF集中，以获得共享基础设施、跨项目协作和统一的供应商中立治理模型。这种整合降低了生态碎片化带来的摩擦，但也引发了关于CNCF是否会形成"垄断性治理"的讨论。

Ingress NGINX退役事件及其AI辅助迁移方案则揭示了云原生技术演进的两个重要趋势。首先，技术债务和安全合规压力正在迫使企业加速技术栈更新，而AI工具的介入使得这种大规模迁移从"不可能完成的任务"变为可行的工程实践。其次，Higress作为Alibaba贡献的云原生API网关，其快速崛起反映了亚洲科技企业在CNCF生态中影响力的提升，也预示着服务网格与API网关的边界将进一步模糊。

Velero的捐赠案例则展示了大型科技企业如何通过开源捐赠来实现战略转型。Broadcom在收购VMware后，正逐步将原本的企业专有工具转向社区治理，这种模式既能降低企业的维护成本，又能通过社区贡献提升工具的质量和采用率。对于使用Velero的企业而言，治理模式的转变意味着更透明的路线图决策和更丰富的生态系统集成，但也需要关注项目品牌和GitHub组织迁移带来的实际影响。

从更宏观的视角来看，这些动态共同指向云原生技术正在从"技术探索期"进入"企业主流采用期"。当CI/CD、备份、网关等基础设施组件都逐步标准化并纳入统一治理框架时，企业的关注点将从基础技术选型转向如何在这些标准化组件之上构建差异化的业务价值。对于从业者而言，理解这些治理变革背后的战略意图，比单纯掌握技术细节更为重要。

## 结论

云原生生态的整合加速为企业带来了更清晰的技术路线和更可靠的供应链保障。Ingress NGINX退役虽然带来了短期迁移成本，但AI辅助工具的成熟使得这种技术更新变得更加可控。建议企业平台团队密切关注CNCF项目治理变化，提前规划技术栈更新路线图，并积极探索AI辅助工具在基础设施迁移中的应用潜力。未来几个月，值得关注Tekton在CNCF框架下的毕业进展，以及Velero社区治理转型后的首次重大版本发布。
