---
layout: post
title: "云原生技术动态：GitOps 交付、策略即代码与服务网格安全演进"
date: 2026-10-16
author: "云原生观察"
source: "https://blogs.vmware.com/cloud-foundation/2026/10/15/vcf-breakroom-chats-episode-95-securing-vmware-vsphere-kubernetes-service-with-nirmata-and-kyverno/"
categories:
  - cloud-native
tags:
  - kubernetes
  - kyverno
  - linkerd
  - argocd
  - gitops
  - service-mesh
---

# 云原生技术动态：GitOps 交付、策略即代码与服务网格安全演进

本周云原生生态围绕「安全左移、GitOps 交付与多集群治理」持续演进。策略即代码、服务网格与交付流水线的深度集成，正成为平台工程团队的核心议题。

## 主要新闻

### VMware 携手 Nirmata，将 Kyverno 策略引擎引入 VKS
在最新一期 VCF Breakroom Chats 中，Broadcom 与 Nirmata 讨论了如何把 CNCF 毕业项目 Kyverno 的策略引擎带入 VMware vSphere Kubernetes Service（VKS）。通过在准入控制阶段强制执行 Pod Security Standards 等基础策略，该联合方案可在工作负载运行前拦截不合规配置，并与 GitOps 流程无缝集成，从而降低运维成本。

**Source:** [VCF Breakroom Chats Episode 95: Securing VMware vSphere Kubernetes Service with Nirmata and Kyverno](https://blogs.vmware.com/cloud-foundation/2026/10/15/vcf-breakroom-chats-episode-95-securing-vmware-vsphere-kubernetes-service-with-nirmata-and-kyverno/)

### Buoyant 发布 GitOps 服务网格实践指南
Buoyant 发布技术文章，演示如何使用 ArgoCD、cert-manager 与 GitOps 最佳实践，跨 Kubernetes 集群部署和管理 Linkerd 服务网格。该指南聚焦多集群场景下的证书轮换与声明式配置管理，回应了服务网格在大规模环境中的可运维性痛点。

**Source:** [GitOps for Service Mesh: an ArgoCD plus Linkerd Walkthrough](https://www.buoyant.io/blog/gitops-for-service-mesh-argocd-linkerd-walkthrough)

### Last Week in Cloud Native 第 42 周：57 项发布、150 条新闻
LWCN 周报显示，本周云原生生态共记录 57 个版本发布和 150 条新闻。CNCF 技术监督委员会正式接纳 Meshery 为孵化项目，社区同时围绕 Kubernetes 向 cgroup v2 迁移以及 AI Agent 在云原生环境中的技术影响展开讨论。

**Source:** [Week 42, Oct 12-18, 2026: Kube-Ovn, Jaeger & Linkerd2 Updates](https://lwcn.dev/newsletter/2026-week-42/)

### Kubernetes 1.34 即将于 10 月 27 日生命周期终止
Kubernetes 1.34 进入维护模式并将在 2026 年 10 月 27 日完全终止支持。在此之前，项目已于 10 月 13 日发布 1.37.2、1.36.6、1.35.10 等补丁版本。对于仍运行 1.34 的团队而言，「已打补丁」并不等于「仍受支持」，升级窗口正快速收窄。

**Source:** [Kubernetes CVE-2026-19444 & CVE-2026-2270 Patched, 1.34 EOL](https://shattered.io/kubernetes-cve-19444-2270-1-34-eol-2026/)

## 分析

策略即代码（Policy as Code）正在从「可选项」变为平台工程的基础能力。Kyverno 与 VKS 的集成表明，准入控制不再只是安全团队的孤立工具，而是嵌入到平台交付路径中的默认护栏。这种「默认安全」的设计思路，能够在容器工作负载运行之前就阻断不合规配置，显著降低事后修复的成本与风险。

GitOps 与 service mesh 的结合反映了交付范式的统一趋势。ArgoCD 负责声明式同步应用与网格配置，cert-manager 管理证书生命周期，Linkerd 提供零信任 mTLS——三者共同构成可审计、可复现的多集群交付链路。对于采用多云或混合云架构的组织而言，这种「一切皆声明式」的模式有助于消除环境漂移。

与此同时，AI Agent 的兴起为云原生带来新的复杂度。Agent 可能以远超人工审查的速度生成基础设施变更，这就要求策略引擎具备实时校验与可解释的拒绝机制。Meshery 被接纳为孵化项目，正是社区对「统一管理平面」需求的回应。

生命周期管理仍是落地难点。1.34 的 EOL 提醒我们，Kubernetes 的快速迭代节奏要求企业建立常态化的版本治理机制。将「补丁」与「支持」区分开来，并在维护模式开始前规划升级路径，是避免安全缺口的关键。

## 结论

云原生正在从「编排容器」迈向「治理平台」。安全策略、交付流水线与服务网格的融合，将成为企业规模化落地的核心竞争力。平台团队应尽早将策略即代码纳入 CI/CD，建立版本生命周期看板，并持续关注 AI 工作负载对集群调度与安全带来的新挑战。
