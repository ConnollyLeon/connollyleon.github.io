---
layout: post
title: "云原生技术动态：KubeCon EU 2026大会揭示AI与Kubernetes深度融合"
date: 2026-04-10
author: "云原生观察"
source: "https://www.cncf.io/news/2026/04/07/itops-times-will-kubernetes-become-the-standard-for-ai-workloads/"
categories:
  - cloud-native
tags:
  - kubernetes
  - ai
  - kubecon
  - cncf
  - service-mesh
---

# 云原生技术动态：KubeCon EU 2026大会揭示AI与Kubernetes深度融合

本周云原生领域最重要的新闻来自KubeCon Europe 2026大会。本届大会在阿姆斯特丹举行，AI成为贯穿所有主题演讲和公告的核心主题。Kubernetes正在从"如何大规模运行容器"转向"如何大规模运行AI"，这一转变标志着云原生生态系统进入新的发展阶段。

## 主要新闻 (Main News)

### Kubernetes AI Conformance Program正式发布

Google与CNCF在KubeCon EU 2026上宣布了Kubernetes AI Conformance Program，这是企业AI采用领域最重要的计划之一。该项目定义了Kubernetes平台可靠运行AI和机器学习工作负载所需的能力，包括模型感知负载均衡、模型就绪状态健康检查等关键特性。程序采用自评估模式，计划在2026年下半年实现自动化测试。

**Source:** [Kubernetes AI Conformance: CNCF's New Certification for AI-Ready Platforms](https://lucaberton.com/blog/kubernetes-ai-conformance-program-cncf-kubecon-2026/)

### Broadcom将Velero捐赠给CNCF Sandbox

Broadcom将其广泛采用的Kubernetes原生备份、恢复和迁移工具Velero捐赠给云原生计算基金会作为Sandbox项目。Kubernetes Technical Oversight Committee于3月17日批准了该提案。Velero在Kubernetes API层操作，支持可移植的、应用感知的备份和恢复，这与仅捕获控制平面数据存储的etcd快照不同。

**Source:** [Broadcom Donates Velero to the CNCF Sandbox](https://machineherald.io/article/2026-04-07-broadcom-donates-velero-to-the-cncf-sandbox-shifting-kubernetes-backup-governance-to-the-community)

### llm-d正式加入CNCF Sandbox

llm-d项目正式被接受为CNCF Sandbox项目，这是CNCF将Kubernetes和更广泛的CNCF生态系统演变为先进AI基础设施的重要一步。llm-d提供了预集成、Kubernetes原生的分布式推理框架，桥接了高级控制平面（如KServe）与低级推理引擎（如vLLM）之间的差距。

**Source:** [Welcome llm-d to the CNCF](https://www.cncf.io/blog/2026/03/24/welcome-llm-d-to-the-cncf-evolving-kubernetes-into-sota-ai-infrastructure/)

### KubeVirt v1.8发布：支持AI和HPC工作负载

KubeVirt v1.8正式发布，与Kubernetes v1.35对齐。本版本引入了多项重要更新：Confidential Computing Working Group改进了对Intel TDX Attestation的支持；Hypervisor Abstraction Layer使KubeVirt能够集成KVM之外的多个虚拟机管理程序后端；AI和HPC工作负载现在可以在虚拟机中实现接近原生的性能。

**Source:** [Announcing KubeVirt v1.8](https://www.cncf.io/blog/2026/03/25/announcing-the-release-of-kubevirt-v1-8/)

### Tekton成为CNCF孵化项目

经过七年的Kubernetes原生CI/CD开发，Tekton正式成为CNCF孵化项目。该项目拥有超过600名贡献者、11,000个GitHub stars和超过5,000个合并的pull requests。Tekton的可组合Kubernetes原生原语（Steps、Tasks和Pipelines）已在整个行业广泛采用。

**Source:** [Tekton Becomes a CNCF Incubating Project](https://www.cncf.io/blog/2026/03/24/tekton-becomes-a-cncf-incubating-project/)

## 分析 (Analysis)

KubeCon EU 2026清晰地展示了云原生生态系统的范式转变。AI不再是Kubernetes生态系统中的一项附加功能，而是正在成为一等公民。Kubernetes AI Conformance Program的推出尤其值得关注——它不仅仅是一个认证计划，更是一个架构清单，为构建AI平台定义了明确的要求。

llm-d的加入代表了推理基础设施领域的重要进展。传统服务路由和自动扩展机制不了解推理状态，导致放置效率低下、缓存碎片化和负载下不可预测的延迟。llm-d通过提供推理感知流量管理来解决这个问题，作为Kubernetes Gateway API Inference Extension (GAIE)的主要实现。

Velero捐赠给CNCF Sandbox反映了企业Kubernetes采用日益成熟的趋势。随着组织扩大其云原生工作负载，重点正从简单的编排转向长期数据保护和可移植性。Broadcom的决定表明，即使是拥有成熟产品的公司，也认识到社区治理对于长期可持续发展的价值。

从更广泛的角度看，本周CNCF还接受了Kyverno毕业，NVIDIA向Kubernetes项目捐赠了GPU Dynamic Resource Allocation驱动，Google开源了GKE Cluster Autoscaler。这些公告共同表明，云原生生态系统正在加速整合，形成更连贯的技术栈。

## 结论 (Conclusion)

云原生领域正在经历AI驱动的重大转变。2026年的云原生不再是关于容器编排的优化，而是关于如何在Kubernetes上大规模运行AI工作负载。Kubernetes AI Conformance Program、llm-d的加入以及Velero的社区治理转变都是这一趋势的体现。

对于从业者而言，现在是为AI工作负载准备Kubernetes平台的时候了。AI Conformance要求可以作为架构检查清单，帮助团队了解需要实现哪些能力。同时，关注Velero和Tekton等工具的发展，它们正在成为云原生工作流和安全供应链的关键组件。
