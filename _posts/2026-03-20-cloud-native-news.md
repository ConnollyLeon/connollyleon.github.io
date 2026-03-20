---
layout: post
title: "云原生技术动态：K8s镜像促进器重构完成与KubeCon EU 2026即将开幕"
date: 2026-03-20
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/03/17/image-promoter-rewrite/"
categories:
  - cloud-native
tags:
  - kubernetes
  - kpromo
  - kubecon
  - openTelemetry
  - supply-chain
---

# 云原生技术动态：K8s镜像促进器重构完成与KubeCon EU 2026即将开幕

本周云原生领域迎来重要里程碑，Kubernetes项目完成了镜像促进器的核心重写，删除了20%的代码同时增加了关键功能。同时，随着KubeCon + CloudNativeCon Europe 2026即将于3月23-26日在阿姆斯特丹举行，Kubernetes v1.36的发布也进入倒计时阶段。

## 主要新闻

### Kubernetes镜像促进器完成历史性重构

Kubernetes官方博客于3月17日发布文章，详细介绍了kpromo镜像促进器的重大重构成果。该项目由Red Hat的Sascha Grunert主导，重写删除了超过16,000行代码，净减少约5,000行（20%），同时增加了原产地证明、漏洞扫描和多区域镜像复制等关键功能。

重构采用分阶段方式进行：Phase 1实现速率限制重写，Phase 2建立清晰的接口抽象，Phase 3构建管道引擎。这一重构解决了七年来累积的技术债务，使新功能添加不再痛苦。

**Source:** [The Invisible Rewrite: Modernizing the Kubernetes Image Promoter](https://kubernetes.io/blog/2026/03/17/image-promoter-rewrite/)

### OpenTelemetry Kubernetes属性提升至发布候选状态

OpenTelemetry项目于3月16日宣布，Kubernetes语义约定中的属性已提升至发布候选（RC）状态。这一里程碑意味着k8sattributes处理器将很快能够采用新的稳定schema，允许用户通过feature gates切换到新schema并提供反馈。

该工作由K8s语义约定特别兴趣小组完成，为Kubernetes环境的可观测性建立了更标准化的基础。

**Source:** [Kubernetes attributes promoted to release candidate in OTel Semantic Conventions](https://opentelemetry.io/blog/2026/k8s-semconv-rc/)

### Kubernetes v1.36预览：HPA Scale-to-Zero即将默认启用

Kubernetes v1.36将于4月22日正式发布，带来了多项重要更新。HPA Scale-to-Zero功能将从v1.16的alpha状态升级为默认启用，这是一项业界期待已久的特性。同时，Ingress-Nginx控制器将正式进入废弃流程，Gateway API成为官方推荐的迁移路径。

**Source:** [Kubernetes v1.36 — Sneak Peek](https://medium.com/google-cloud/kubernetes-v1-36-sneak-peek-7c5422ffd841)

### KubeCon EU 2026即将开幕：AI on Kubernetes成焦点

随着KubeCon + CloudNativeCon Europe 2026（3月23-26日，阿姆斯特丹）临近，业界对"AI on Kubernetes"的生产级部署模式充满期待。分析师指出，平台工程正在从概念走向运营实践，GPU编排正在Kubernetes原生技术栈中找到自己的位置。

AWS宣布将在大会上展示Karpenter、kro和Cedar等创新如何帮助Kubernetes进入"隐形"的下个阶段，让基础设施真正成为支撑AI工作负载的无形基础。

**Source:** [Cloud-native AI on Kubernetes takes shape at KubeCon EU](https://siliconangle.com/2026/03/11/cloud-native-ai-kubernetes-take-shape-kubeconeu/)

## 分析

本周的云原生新闻反映了Kubernetes生态系统的几个关键趋势。首先是基础设施成熟度的提升。kpromo镜像促进器的重构是一个标志性事件——这表明即使是被认为"足够好"的基础设施组件，也需要不断演进以满足现代云原生的需求。删除20%代码同时增加功能的成果，展示了重构的力量。

其次是可观测性标准的统一。OpenTelemetry的K8s属性达到RC状态，标志着Kubernetes可观测性领域正在走向标准化。对于平台团队而言，这意味着可以期待更一致的遥测数据格式，更可靠的多集群监控方案。

第三是AI工作负载的深度整合。KubeCon EU即将展示的AI工厂模式，预示着Kubernetes作为AI基础设施的角色正在巩固。2026 CNCF年度调查显示，82%的容器用户已在生产环境中运行Kubernetes，66%使用Kubernetes管理生成式AI推理工作负载。这些数字表明，Kubernetes已经成为AI时代的"操作系统"。

## 结论

云原生生态系统正在经历从"容器编排"向"AI基础设施平台"的深刻转型。Kubernetes v1.36的发布将进一步简化开发者体验（HPA Scale-to-Zero默认启用），而KubeCon EU 2026将展示生产级AI部署的最佳实践。对于从业者而言，关注Gateway API的演进和K8s语义约定的稳定化将是接下来的重点。
