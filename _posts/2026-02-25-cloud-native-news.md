---
layout: post
title: "Kubernetes 1.35发布：云原生成为AI操作系统"
date: 2026-02-25
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/02/23/kubernetes-as-ais-operating-system-1-35-release-signals/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - ai
  - cncf
---

# Kubernetes 1.35发布：云原生成为AI操作系统

本周云原生领域迎来重要里程碑，Kubernetes v1.35（代号"Timbernetes"）正式发布，进一步巩固了Kubernetes作为AI基础设施核心操作系统的地位。CNCF年度调查数据显示，82%的容器用户已在生产环境中运行Kubernetes，标志着云原生技术已从容器编排工具演进为现代数字基础设施的基石。

## 主要新闻

### Kubernetes 1.35强化AI工作负载支持

Kubernetes v1.35版本专门针对AI场景进行了优化，包括改进的GPU调度能力、增强的节点管理功能以及更高效的资源分配机制。这一版本被视为"AI基础设施版本"，反映了容器编排平台在机器学习训练和推理工作负载方面的战略重心转移。

**Source:** [Kubernetes as AI's operating system: 1.35 release signals](https://www.cncf.io/blog/2026/02/23/kubernetes-as-ais-operating-system-1-35-release-signals/)

### CNCF年度调查：94%企业已采用Kubernetes

根据2026年CNCF年度云原生调查，94%的组织已采用Kubernetes，其中82%在生产环境中使用，另有12%正在测试或评估阶段。这一数据表明Kubernetes已成为企业级容器编排的事实标准。

**Source:** [Kubernetes Established as De Facto Operating System for AI](https://www.devopsdigest.com/kubernetes-established-as-de-facto-operating-system-for-ai)

### Ingress NGINX项目发布退役警告

Kubernetes项目组近日发布关于Ingress NGINX控制器退役的警告。该项目过去一年经历了多次安全漏洞，包括2025年3月披露的CVSS 9.8级"IngressNightmare"漏洞。社区正在推动迁移至社区驱动的NGINX Ingress Controller分支。

**Source:** [Kubernetes project issues warning on Ingress NGINX retirement](https://securitylabs.datadoghq.com/articles/kubernetes-ingress-nginx-retirement-warning/)

## 分析

Kubernetes从容器编排工具演变为AI操作系统的趋势，反映了云原生生态系统的深刻变革。首先，AI工作负载的爆发式增长正在重塑基础设施需求。传统的单体AI训练架构正在被分布式容器化方案取代，Kubernetes提供了跨集群的资源调度和弹性扩展能力，这是现代AI系统所需的核心能力。

其次，82%的生产使用率意味着Kubernetes已过了"概念验证"阶段，进入企业级成熟期。这带来新的挑战：安全性、运维复杂性和成本优化成为焦点。Ingress NGINX的退役警告正体现了这一点——随着项目成熟，社区必须更加重视长期维护和安全响应。

最后，从集群到平台的转变正在进行。2026年的趋势显示，企业不再满足于仅仅拥有Kubernetes集群，而是构建完整的平台工程能力，包括自助服务、GitOps工作流和可观测性堆栈。

## 结论

Kubernetes 1.35的发布标志着云原生技术进入新阶段。AI驱动的需求正在加速Kubernetes的功能演进，而生产环境的广泛采用则推动了对安全性、稳定性和运维效率的更高要求。展望未来，平台工程将成为云原生投资的重点领域，组织需要超越基础的容器编排，构建面向开发者自助服务的完整平台能力。
