---
layout: post
title: "云原生技术动态：Ingress-nginx项目归档与Kthena AI推理系统发布"
date: 2026-02-02
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/01/27/navigating-the-ingress-nginx-archival-why-now-is-the-time-to-move-to-cilium/"
categories:
  - cloud-native
tags:
  - kubernetes
  - ingress
  - cilium
  - cloud-native
  - ai
---

# 云原生技术动态：Ingress-nginx项目归档与Kthena AI推理系统发布

本周云原生生态系统迎来重大变革，instruct-nginx项目宣布归档以及Volcano社区推出Kthena AI推理系统，标志着服务网格和AI工作负载管理进入新阶段。

## 主要新闻

### Ingress-nginx项目宣布归档，转向Cilium

Kubernetes社区广泛使用的ingress-nginx项目维护者宣布该项目将于2026年初正式归档，不再接收主动维护、安全补丁或错误修复。这一消息对成千上万依赖ingress-nginx构建入口策略的Kubernetes用户和组织产生重大影响。

**Source:** [Navigating the ingress-nginx archival: why now is the time to move to Cilium](https://www.cncf.io/blog/2026/01/27/navigating-the-ingress-nginx-archival-why-now-is-the-time-to-move-to-cilium/)

### Volcano社区推出Kthena AI推理系统

Volcano社区发布了Kthena，这是一个专为全球开发者和MLOps工程师设计的全新子项目。Kthena是一个云原生的高性能大语言模型(LLM)推理、编排和调度系统，专门为Kubernetes量身定制，具备拓扑感知调度、KV缓存感知路由和预填充-解码(PD)分离等特性。

**Source:** [Introducing Kthena: LLM inference for the cloud native era](https://www.cncf.io/blog/2026/01/28/introducing-kthena-llm-inference-for-the-cloud-native-era/)

### Dragonfly项目正式毕业

云原生计算基金会(CNCF)宣布Dragonfly项目正式毕业，证明了其在生产环境中大规模运行容器和AI工作负载的成熟度。Dragonfly作为文件分发和镜像加速解决方案，已在多个大型企业中广泛应用。

**Source:** [Cloud Native Computing Foundation Announces Dragonfly's Graduation](https://www.cncf.io/announcements/cloud-native-computing-foundation-announces-dragonflys-graduation/)

## 分析

这些更新反映了云原生生态系统的几个关键趋势。首先，项目生命周期管理变得更加成熟，ingress-nginx的归档表明社区正在向更现代、更安全的解决方案迁移，如基于eBPF的Cilium。这标志着技术债务的主动清理和生态系统的健康发展。

其次，AI工作负载的云原生化已成为现实。Kthena的推出显示，云原生社区正在积极构建专门的AI/ML基础设施，而不仅仅是通用容器编排。拓扑感知调度和KV缓存优化等技术创新直接解决了AI推理的独特挑战，为生产环境中的大模型部署提供了企业级解决方案。

最后，CNCF项目的成熟度标准保持严格。Dragonfly的毕业证明了项目需要经过长期的生产验证和社区支持才能达到毕业水平。这种严格性确保了用户可以依赖CNCF毕业项目的稳定性和可靠性。

## 结论

云原生技术正在快速演进，从传统的容器编排向AI原生化发展。对于从业者而言，这意味着需要持续学习新工具，评估现有架构的技术债务，并积极拥抱AI工作负载的云原生解决方案。未来几个月将看到更多类似创新，特别是在AI推理优化和服务网格现代化方面。组织和开发者应密切关注这些趋势，以确保保持技术竞争力。