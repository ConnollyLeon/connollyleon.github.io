---
layout: post
title: "云原生技术动态：Kubernetes AI合规认证全面扩展与1.36版本即将发布"
date: 2026-04-17
author: "云原生观察"
source: "https://machineherald.io/article/2026-04/14-kubernetes-ai-conformance-program-nearly-doubles-certified-platforms-to-31-as-cncf-adds-agentic-workflow-validation-and-stricter-hardware-requirements"
categories:
  - cloud-native
tags:
  - kubernetes
  - AI
  - CNCF
  - conformance
---

# 云原生技术动态：Kubernetes AI合规认证全面扩展与1.36版本即将发布

本周云原生领域迎来多项重要更新。CNCF的Kubernetes AI合规认证计划从18个平台扩展到31个，增长超过70%。同时Kubernetes 1.36版本将于4月22日发布，带来了多项稳定性改进。本周我们还关注到Kubescape 4.0的发布和AWS EKS自动模式的最新进展。

## 主要新闻

### Kubernetes AI合规认证计划实现翻倍增长

CNCF在KubeCon + CloudNativeCon Europe 2026期间宣布，Kubernetes AI合规认证计划从2025年11月启动时的18个平台扩展至31个认证平台，增长超过70%。新加入的平台包括OVHcloud、SpectroCloud、JD Cloud和中国联通云。此计划引入三项新的Kubernetes AI Requirements (KARs)，对齐Kubernetes v1.35，并为智能体AI工作负载提供验证支持。

**Source:** [Kubernetes AI Conformance Program Nearly Doubles](https://machineherald.io/article/2026-04/14-kubernetes-ai-conformance-program-nearly-doubles-certified-platforms-to-31-as-cncf-adds-agentic-workflow-validation-and-stricter-hardware-requirements)

### Kubernetes 1.36将于4月22日发布

Kubernetes 1.36版本计划于2026年4月22日发布，此版本是一个稳定性优先的版本。主要GA功能包括：MutatingAdmissionPolicy、OCI VolumeSource和Pod用户命名空间。值得注意的是，ingress-nginx项目已于2026年3月24日停止维护，不再提供安全更新。同时gitRepo卷插件被永久移除。

**Source:** [Kubernetes v1.36 GA Features, Removals, and What to Know](https://hubkub.com/dev-it-ops/kubernetes-1-36-features/)

### Kubescape 4.0发布

CNCF发布了Kubescape 4.0，带来企业级稳定性和高级威胁检测能力。此版本特别引入了针对KAgent的扫描功能，并实现了Runtime Threat Detection的正式可用。该版本还支持CIS Benchmark 1.12版本。

**Source:** [Announcing Kubescape 4.0 Enterprise](https://www.cncf.io/blog/2026/03/26/announcing-kubescape-4-0-enterprise-stability-meets-the-ai-era/)

## 分析

这些更新反映了云原生生态系统在AI时代的关键转型。AI合规认证的快速扩展表明了行业对标准化GPU基础设施的迫切需求，同时智能体工作负载验证的加入标志着Kubernetes正在成为AI原生平台的核心基座。

Kubernetes 1.36的发布策略体现了项目成熟度的提升——从功能驱动转向稳定性优先。ingress-nginx的退役和gitRepo的移除虽然会对部分用户造成迁移成本，但这些决策对于生态系统长期健康至关重要。

对于企业用户，建议关注三个方向：1）评估AI工作负载的现有平台是否符合新标准；2）规划ingress控制器的迁移路径；3）跟踪Kubescape 4.0的安全能力以增强集群防护。

## 结论

云原生技术正在加速与AI的融合。Kubernetes通过AI合规认证计划建立了行业标准，同时通过版本迭代确保了平台稳定性。企业应积极规划升级路线，以充分利用这些新能力。