---
layout: post
title: "云原生技术动态：OpenTelemetry毕业与KubeCon Japan议程公布"
date: 2026-05-26
author: "云原生观察"
source: "https://www.cncf.io/announcements/2026/05/21/cloud-native-computing-foundation-announces-opentelemetrys-graduation-solidifying-status-as-the-de-facto-observability-standard/"
categories:
  - cloud-native
tags:
  - opentelemetry
  - kubernetes
  - kubecon
  - cncf
  - ingress-nginx
  - cloud-native
---

# 云原生技术动态：OpenTelemetry毕业与KubeCon Japan议程公布

过去一周云原生生态持续活跃：OpenTelemetry正式从CNCF毕业、KubeCon + CloudNativeCon Japan 2026完整议程公布、CNCF博客发布零停机迁移指南（从ingress-nginx到Envoy Gateway），以及社区发布端到端ingress请求追踪方案。

## 主要新闻

### OpenTelemetry正式从CNCF毕业——确立为事实可观测性标准

CNCF在5月21日正式宣布OpenTelemetry项目毕业。该项目自2019年成立以来，已成为CNCF生态系统中活跃度第二高的项目（仅次于Kubernetes），拥有超过12,000名贡献者，来自2,800多家企业。过去12个月，OpenTelemetry JavaScript API包下载量超过13.6亿次，Python API包超过13亿次。新发布的Profiles信号进入Alpha阶段，为持续生产性能分析提供了标准化的遥测数据采集方式。毕业确认了OpenTelemetry作为云原生可观测性事实标准的地位。

**Source:** [CNCF Announces OpenTelemetry's Graduation](https://www.cncf.io/announcements/2026/05/21/cloud-native-computing-foundation-announces-opentelemetrys-graduation-solidifying-status-as-the-de-facto-observability-standard/)

### KubeCon + CloudNativeCon Japan 2026完整议程公布

CNCF公布了KubeCon + CloudNativeCon Japan 2026的完整会议日程，会议定于7月29-30日在横滨PACIFICO会展中心举行。本次大会设置六大技术专题：人工智能、可观测性、平台工程等。这是继去年首届售罄后的第二届日本KubeCon，议程聚焦标准化云原生堆栈以支撑全球AI经济所需的高可靠性和规模。CNCF执行董事Jonathan Bryce表示："推理正在成为人类历史上最大的计算用例，66%的组织已经使用Kubernetes作为AI的操作系统。"

**Source:** [CNCF Debuts KubeCon + CloudNativeCon Japan 2026 Schedule](https://www.prnewswire.com/news-releases/cncf-debuts-kubecon--cloudnativecon-japan-2026-schedule-302771195.html)

### 零停机迁移：从ingress-nginx到Envoy Gateway实战指南

CNCF社区发布了题为"从ingress-nginx零停机迁移到Envoy Gateway"的技术文章，详细介绍了在生产环境中无缝替换入口控制器的完整方案。随着社区版ingress-nginx逐步退役，众多团队需要迁移到更现代、性能更优的替代方案。Envoy Gateway基于Envoy Proxy构建，提供更丰富的流量管理能力和更强的可观测性集成。该指南涵盖了DNS加权切换、流量镜像验证、渐进式流量迁移等关键步骤。

**Source:** [Zero-Downtime Migration from ingress NGINX to Envoy Gateway](https://www.cncf.io/blog/2026/05/25/zero-downtime-migration-from-ingress-nginx-to-envoy-gateway/)

### CNCF社区发布多租户SaaS平台端到端Ingress请求追踪方案

CNCF社区发布了面向多租户SaaS平台的端到端ingress请求追踪设计方案。该方案详细阐述了如何在多租户环境中实现请求的全链路追踪，从入口网关到后端服务，确保每个租户的请求轨迹可独立分析和监控。这对于运行大规模SaaS平台的云原生团队具有重要参考价值。

**Source:** [Designing end-to-end ingress request tracing for multi-tenant SaaS platforms](https://www.cncf.io/blog/2026/05/22/designing-end-to-end-ingress-request-tracing-for-multi-tenant-saas-platforms/)

## 分析

本周云原生观察的核心信号是可观测性标准化和AI驱动的基础设施演进正在加速。OpenTelemetry的毕业不是终点而是起点——它在CNCF生态中仅次于Kubernetes的活跃度说明可观测性已成为企业的刚性需求而非锦上添花。Profiles信号的引入将遥测数据从传统的三大支柱（日志、指标、链路）扩展到持续性能分析维度，这对云原生基础设施的精细化运维具有深远意义。

ingress-nginx的退役迁移浪潮则是云原生生态自然淘汰的典型体现。Envoy Gateway凭借更强的性能、更丰富的功能和更好的可观测性集成正在成为新的入口网关标准。对于平台团队而言，此时制定系统化的迁移计划、利用零停机策略完成平滑过渡是当务之急。

KubeCon Japan议程中日渐增长的AI专题占比表明，云原生与AI的融合正在从概念走向工程实践。Kubernetes作为"AI的操作系统"这一论断正在被66%的组织使用率所验证。

## 结论

云原生生态正稳步向标准化、AI原生的方向演进。OpenTelemetry毕业为可观测性提供了统一标准；ingress-nginx退役推动了网关层的技术迭代；KubeCon Japan议程则预示着下半年云原生+AI的更多创新。平台团队应优先将OpenTelemetry集成纳入技术路线，同时规划入口网关的升级迁移。
