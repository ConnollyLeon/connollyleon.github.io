---
layout: post
title: "云原生技术动态：Kubernetes 1.36即将发布与CNCF项目全面进展"
date: 2026-04-12
author: "云原生观察"
source: https://kubernetes.io/blog/2026/03/30/kubernetes-v1-36-sneak-peek/
categories:
  - cloud-native
tags:
  - kubernetes
  - cncf
  - cloud-native
---

# 云原生技术动态：Kubernetes 1.36即将发布与CNCF项目全面进展

本周云原生领域迎来多项重要更新，Kubernetes新版本的发布标志着容器编排平台的又一次重大进步。与此同时，CNCF生态系统持续扩张，多个项目达成重要里程碑，为2026年的云原生发展奠定坚实基础。

## 主要新闻

### Kubernetes v1.36即将发布

Kubernetes v1.36计划于2026年4月22日正式发布，带来多项重要特性更新。该版本将包含Kubernetes SELinux卷挂载改进的全面可用性，以及动态资源分配（DRA）分区设备的增强支持。值得关注的是，Ingress NGINX项目已于2026年3月24日正式退役，社区被鼓励评估符合当前安全和维护最佳实践的替代入口控制器。

**Source:** [Kubernetes v1.36 Sneak Peek](https://kubernetes.io/blog/2026/03/30/kubernetes-v1-36-sneak-peek/)

### OpenEverest成为CNCF Sandbox项目

OpenEverest于2026年3月15日正式接受为CNCF Sandbox项目，提供跨任何Kubernetes基础设施的自动化数据库配置和管理。该项目支持多种数据库技术，由Percona捐赠，旨在为云原生环境提供更完善的数据库解决方案。

**Source:** [OpenEverest | CNCF](https://www.cncf.io/projects/openeverest/)

### Higress加入CNCF

Higress正式通过CNCF技术监督委员会投票，以Sandbox项目身份加入CNFC生态系统。Higress是一个基于Envoy和Istio构建的AI原生高性能API网关，提供统一的流量网关、微服务网关和AI网关控制平面，为Nginx Ingress退役提供了安全的替代方案。

**Source:** [Higress Joins CNCF](https://www.cncf.io/blog/2026/03/25/higress-joins-cncf-delivering-an-enterprise-grade-ai-gateway-and-a-seamless-path-from-nginx-ingress/)

### Tekton成为CNCF孵化项目

CNCF技术监督委员会已投票接受Tekton为CNCF孵化项目。Tekton是一个强大的开源框架，用于创建持续集成和交付系统。作为Kubernetes原生项目，Tekton与Argo CD、SPIFFE/SPIRE等CNCF项目深度集成，为云原生交付创建了强大的供应链安全故事。

**Source:** [Tekton Becomes a CNCF Incubating Project](https://www.cncf.io/blog/2026/03/24/tekton-becomes-a-cncf-incubating-project/)

## 分析

这些更新反映了云原生生态系统的几个关键趋势。首先，Kubernetes正在加速向AI工作负载优化方向发展，从v1.35的"Restart All Containers"到v1.36的DRA增强，都体现了对AI/ML场景的深度优化。根据CNCF 2026年1月发布的年度调查，82%的容器用户在生产环境中运行Kubernetes，66%托管生成式AI模型的组织使用Kubernetes进行部分或全部推理工作负载。

其次，Ingress NGINX的退役标志着云原生社区对安全的重视程度达到新高。这一决定源于对生态系统安全的长期考量，为用户提供了评估替代方案的时间窗口。Higress等项目的加入填补了这一空白。

第三，Tekton和Fluid等项目的孵化/升级进展表明，CNCF项目治理的成熟度持续提升。从sandbox到incubating再到graduated的清晰路径，为云原生项目的可持续发展提供了制度保障。

## 结论

2026年第二季度的云原生领域呈现出几个鲜明特征：Kubernetes与AI的深度融合、安全优先的生态系统治理、以及多云策略的持续推进。对于 practitioners而言，关注v1.36的发布公告、评估Ingress NGINX替代方案、以及跟踪新兴CNFC项目，将是近期的关键任务。云原生技术的演进正在进入一个新的成熟阶段，为企业数字化转型提供更坚实的技术基础。