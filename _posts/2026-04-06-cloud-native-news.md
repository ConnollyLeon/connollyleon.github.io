---
layout: post
title: "云原生技术动态：llm-d加入CNCF与Kubernetes AI平台新进展"
date: 2026-04-06
author: "云原生观察"
source: "https://lucaberton.com/blog/llm-d-cncf-kubernetes-distributed-inference-2026/"
categories:
  - cloud-native
tags:
  - kubernetes
  - llm-d
  - cncf
  - ai
  - inference
---

# 云原生技术动态：llm-d加入CNCF与Kubernetes AI平台新进展

本周云原生领域迎来重要里程碑。llm-d项目正式加入CNCF沙箱，成为首个Kubernetes原生的分布式LLM推理平台。与此同时，Kubernetes AI Conformance认证项目启动，Google在KubeCon EU 2026上发布Kubernetes AI平台公告。这些进展标志着云原生生态系统正在加速拥抱AI workloads。

## 主要新闻

### llm-d正式加入CNCF沙箱项目

llm-d是由IBM Research、Google、Red Hat、CoreWeave和NVIDIA联合开发的分布式LLM推理框架，于2026年4月正式加入CNCF沙箱。该项目解决了LLM推理的特殊需求：KV缓存管理、预填充/解码解聚、推理感知路由等。传统Kubernetes负载均衡无法理解推理工作负载的独特特性，llm-d通过实现Gateway API推理扩展来改变这一现状。

**Source:** [llm-d Joins the CNCF: Kubernetes-Native Distributed LLM Inference](https://lucaberton.com/blog/llm-d-cncf-kubernetes-distributed-inference-2026/)

### Kubernetes AI Conformance认证项目启动

CNCF在KubeCon EU 2026上宣布启动Kubernetes AI Conformance认证项目，旨在确保AI-ready平台的互操作性。该认证涵盖GPU调度、模型服务、推理工作负载管理等关键能力。随着AI应用在企业中的普及，这一标准化认证将帮助企业选择符合标准的Kubernetes发行版。

**Source:** [Kubernetes AI Conformance: CNCF's New Certification for AI-Ready Platforms](https://lucaberton.com/blog/kubernetes-ai-conformance-program-cncf-kubecon-2026/)

### Google发布Kubernetes AI平台

Google在KubeCon EU 2026上发布多项Kubernetes AI平台公告，展示其在GKE上运行AI工作负载的最新能力。这些公告包括多租户GPU调度、AI模型权重分发优化、以及与NVIDIA深度集成的AI平台能力。

**Source:** [Google at KubeCon EU 2026: Kubernetes AI Platform Announcements](https://lucaberton.com/blog/google-kubecon-2026-kubernetes-ai-platform-announcements/)

### Kubernetes 1.36 Beta发布

Kubernetes 1.36 Beta版本发布，带来7项重要功能更新。这些更新涵盖部署效率改进、容器管理增强、以及新的API特性。Beta版本的发布为正式版本铺平了道路，预计将在未来几周内发布稳定版。

**Source:** [Kubernetes 1.36: 7 Features That Will Change How You Deploy](https://medium.com/@rameshavutu/kubernetes-1-36-beta-7-features-that-will-change-how-you-deploy-d9ece5b727e8)

## 分析

本周的云原生动态揭示了几个关键趋势。首先，AI推理正在成为Kubernetes的新战场。llm-d的加入标志着CNFC生态系统对AI工作负载的重视程度达到新高。传统上，Kubernetes主要服务于无状态Web服务，但现在它正在演变为AI推理的首选平台。

其次，预填充/解码解聚架构正在成为LLM推理的标准。这一架构将提示处理和token生成分离到独立的pod，使每个阶段能够根据其计算特性进行独立扩展。llm-d实现了这一架构，并贡献了DisaggregatedSet算子给LeaderWorkerSet项目。

第三，多 accelerator 支持成为现实。llm-d支持NVIDIA、AMD、Intel GPU以及Google TPU，这种硬件无关的设计使企业能够灵活选择最适合其工作负载的加速器。对于降低AI基础设施成本和避免供应商锁定具有重要意义。

## 结论

云原生生态系统正在经历AI转型。Kubernetes不再仅仅是容器编排平台，而是正在成为AI基础设施的核心。llm-d加入CNCF、Kubernetes AI Conformance认证的启动、以及Google的AI平台公告，都预示着2026年将是云原生AI的突破之年。对于平台团队而言，理解这些发展并提前规划AI基础设施战略将变得至关重要。
