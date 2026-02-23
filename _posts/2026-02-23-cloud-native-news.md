---
layout: post
title: "云原生技术动态：Kubernetes成为AI"操作系统"与Ingress NGINX退役警告"
date: 2026-02-23
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/02/19/state-of-cloud-native-2026-cncf-ctos-insights-and-predictions/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - AI
  - service-mesh
---

# 云原生技术动态：Kubernetes成为AI"操作系统"与Ingress NGINX退役警告

本周云原生领域迎来重要里程碑，Kubernetes已确立为AI工作负载的事实标准"操作系统"。同时，Kubernetes项目组就Ingress NGINX的退役发出正式警告，提醒组织尽快迁移。

## 主要新闻

### Kubernetes成为AI基础设施的核心

根据CNCF 2026年度云原生调查，82%的容器用户已在生产环境中运行Kubernetes，这一数据标志着Kubernetes已从容器编排工具演进为AI基础设施的核心平台。CNCF首席技术官Chris Aniszczyk在十周年之际分享了对云原生未来的展望，强调Kubernetes在AI时代的战略地位。

**Source:** [State of cloud native 2026: CNCF CTO's insights and predictions](https://www.cncf.io/blog/2026/02/19/state-of-cloud-native-2026-cncf-ctos-insights-and-predictions/)

### Ingress NGINX退役警告发布

Kubernetes项目组近日发布关于Ingress NGINX的正式退役声明。2025年3月披露的"IngressNightmare"漏洞（CVE-2025-1974，CVSS评分9.8）允许未经认证的远程代码执行，可完全控制Kubernetes集群。同年11月，Kubernetes SIG Network和安全响应委员会宣布Ingress NGINX将于四个月后停用，组织需尽快制定迁移计划。

**Source:** [Kubernetes project issues warning on Ingress NGINX retirement](https://securitylabs.datadoghq.com/articles/kubernetes-ingress-nginx-retirement-warning/)

### VMware发布vSphere Kubernetes Service 3.6

VMware近日发布vSphere Kubernetes Service 3.6版本，专注于提升企业Kubernetes的安全性、灵活性和可操作性。新版本解决了集群升级、数据库和工作负载支持等企业级挑战。

**Source:** [VMware vSphere Kubernetes Service 3.6](https://blogs.vmware.com/cloud-foundation/2026/02/11/vmware-vsphere-kubernetes-service3-6-making-enterprise-kubernetes-safer-more-flexible-and-easier-to-operate/)

## 分析

Kubernetes在AI领域的统治地位反映出云原生技术的范式转变。传统上被视为基础设施编排工具的Kubernetes，如今已成为AI模型训练和部署的底层平台。这一趋势的驱动力包括：容器化AI工作负载的普及、MLOps对标准化工作流的需求，以及云原生架构在扩展性方面的优势。

对于从业者而言，Ingress NGINX的退役警告意味着需要重新评估入口解决方案。组织应考虑迁移到社区推荐的替代方案，如 ingress-nginx的官方维护分支或云服务商提供的托管入口服务。这一变化也提醒我们，安全维护在开源项目中的持续性至关重要。

## 结论

云原生生态正在经历从通用容器编排向AI基础设施平台的重大转型。Kubernetes的统治地位已经稳固，但对于安全性和长期维护的考量仍然是选择技术方案时的关键因素。组织应密切关注项目动态，及时调整技术栈以适应快速变化的云原生领域。
