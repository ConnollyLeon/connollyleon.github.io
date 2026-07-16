---
layout: post
title: "云原生技术动态：HAMi成为CNCF孵化项目与GPU虚拟化新时代"
date: 2026-07-16
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/07/15/hami-becomes-a-cncf-incubating-project/"
categories:
  - cloud-native
tags:
  - kubernetes
  - gpu-virtualization
  - cncf
  - hami
  - ai-infrastructure
---

# 云原生技术动态：HAMi成为CNCF孵化项目与GPU虚拟化新时代

云原生生态系统迎来重要里程碑，CNCF技术监督委员会投票决定接受HAMi作为CNCF孵化项目。这一决定标志着GPU虚拟化中间件在Kubernetes生态中的成熟度获得认可，为AI基础设施的云原生部署开辟了新路径。

## 主要新闻

### HAMi成为CNCF孵化项目

CNCF宣布HAMi正式成为孵化项目，该项目为Kubernetes提供开源GPU虚拟化中间件。HAMi允许平台团队将物理GPU（或NPU、DCU、MLU等加速器）按内存、核心或设备数量进行切分，在共享工作负载之间强制执行硬运行时隔离，并使用装箱、扩散和拓扑感知策略调度Pod——所有这些都无需修改应用程序代码或现有Kubernetes资源清单。

**Source:** [HAMi becomes a CNCF incubating project](https://www.cncf.io/blog/2026/07/15/hami-becomes-a-cncf-incubating-project/)

### GPU虚拟化解决AI基础设施痛点

现代AI基础设施团队面临一个反复出现的问题：昂贵的GPU经常因为整个设备被分配给只需要一小部分的工作负载而变得碎片化和利用率低下。团队争夺稀缺加速器，每个硬件供应商都暴露不同的操作模型。HAMi通过提供单一、一致的接口解决了这个问题，使其与围绕单一供应商生态系统构建的设备插件工具区分开来。

**Source:** [HAMi Project Overview](https://project-hami.io/)

## 分析

HAMi的孵化标志着云原生AI基础设施的重要转折点。随着AI工作负载在Kubernetes上的扩展，GPU资源的高效利用成为关键挑战。传统的设备插件模式将整个GPU分配给单个工作负载，导致资源浪费严重。HAMi的GPU虚拟化方案允许多个工作负载共享单个GPU，同时保持硬隔离保证，这不仅提高了硬件利用率，还降低了运营成本。

从生态系统角度看，HAMi的加入丰富了CNCF的AI基础设施工具链。项目已经与Volcano和Koordinator等调度项目集成，并计划与Kueue进一步协作，构建更完整的云原生AI基础设施栈。这种跨项目协作模式体现了云原生社区在解决复杂基础设施问题上的成熟度。

对于企业用户而言，HAMi的多供应商设计意味着他们可以在不同硬件厂商之间保持一致的操作体验，避免供应商锁定。随着项目向v3.0版本演进，计划中的 gang-scheduling、抢占和自动扩展功能将进一步增强其在生产环境中的实用性。

## 结论

HAMi成为CNCF孵化项目不仅是对该项目技术价值的认可，更是云原生社区在AI基础设施领域持续创新的体现。随着AI工作负载成为企业IT的核心组成部分，GPU虚拟化技术将成为云原生平台不可或缺的能力。我们期待看到HAMi在CNCF生态中继续发展，为全球企业提供更高效、更灵活的AI基础设施解决方案。