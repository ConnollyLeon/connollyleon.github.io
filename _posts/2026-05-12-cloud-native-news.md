---
layout: post
title: "云原生技术动态：Tekton加入CNCF孵化与Kubernetes 1.36服务端分片Watch"
date: 2026-05-12
author: "云原生观察"
source: "https://developers.redhat.com/articles/2026/05/11/tekton-joins-cncf-new-era-cloud-native-cicd"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - cncf
  - tekton
  - gke
  - kyverno
---

# 云原生技术动态：Tekton加入CNCF孵化与Kubernetes 1.36服务端分片Watch

本周云原生领域迎来多项重磅更新。Tekton从持续交付基金会（CDF）正式迁移至CNCF成为孵化项目，标志着云原生CI/CD进入新纪元。Kubernetes v1.36引入服务端分片List/Watch特性，为超大规模集群的控制器扩展提供了架构级解决方案。GKE节点启动速度提升4倍，Kyverno 1.18增强策略引擎，共同描绘了云原生基础设施成熟化的清晰图景。

## 主要新闻

### Tekton加入CNCF成为孵化项目

Tekton已正式加入CNCF成为孵化项目，从持续交付基金会（CDF）迁移至管理Kubernete、Argo CD和Helm的同一基金会。Tekton作为Kubernete原生CI/CD工作流引擎，其核心组件Tekton Pipelines已达到1.0稳定版本。此次迁移使Tekton更紧密地融入Kubernete生态系统，获得超过150,000名贡献者的社区资源支持。路线图重点包括：增强供应链安全（默认达到SLSA Level 3）、可信制品传递、Kueue集成实现高级调度，以及Results API的稳定性推进。

**Source:** [Tekton joins the CNCF as an incubating project](https://developers.redhat.com/articles/2026/05/11/tekton-joins-cncf-new-era-cloud-native-cicd)

### Kubernetes v1.36：服务端分片List和Watch进入Alpha

Kubernetes v1.36引入服务端分片List和Watch（KEP-5866）作为Alpha特性。当集群规模达数万个节点时，监视高基数资源（如Pod）的控制器面临严重的扩展瓶颈——每个水平扩展的控制器副本都会收到API服务器的完整事件流。通过`shardSelector`字段，客户端可指定其负责的哈希范围，API服务器仅发送匹配的事件。该特性使用确定性64位FNV-1a哈希，在多个API服务器实例间保持一致。控制器可通过`WithTweakListOptions`注入分片选择器，实现真正的每副本工作负载隔离。

**Source:** [Kubernetes v1.36: Server-Side Sharded List and Watch](https://kubernetes.io/blog/2026/05/06/kubernetes-v1-36-server-side-sharded-list-and-watch/)

### GKE节点启动速度提升4倍

Google Cloud宣布GKE节点启动速度提升高达4倍，这是一次架构级别的升级——重构了VM和GKE节点的配置逻辑，结合智能计算缓冲区、快速启动虚拟机和全新的控制平面架构，支持VM即时调整大小而无需重启。当前已在GKE Autopilot中支持NVIDIA L4、A100、H100及RTX PRO 6000等实例类型，后续将扩展至H200和B200。加速配置直接提升了AI推理的响应速度和集群自动扩展器的效率。

**Source:** [GKE node startup gets faster](https://cloud.google.com/blog/products/containers-kubernetes/gke-node-startup-gets-faster)

### Kyverno 1.18：CNCF毕业后的首个版本

Kyverno 1.18作为CNCF毕业后的首个版本发布，包含多项重大改进：默认阻止回环地址和元数据服务端点以增强HTTP安全控制；CLI支持清理策略、HTTP和Envoy授权策略；策略引擎改为基于内存的HPA自动缩放和TLS指标端点；新增CEL策略类型。Kyverno采用N-1支持模型，同时宣布ClusterPolicy资源将在今年晚些时候弃用，用户需规划迁移至ValidatingPolicy和MutatingPolicy等新策略类型。

**Source:** [Announcing Kyverno release 1.18!](https://www.cncf.io/blog/2026/05/05/announcing-kyverno-release-1-18/)

## 分析

Tekton从CDF迁移至CNCF标志着云原生CI/CD工具链的生态整合趋势。过去几年，CI/CD工具分散在多个基金会中，造成了社区分裂和标准碎片化。Tekton迁移至CNCF后，与Kubernete、Argo CD（GitOps）和Helm（包管理）等核心项目同属一个基金会，有利于形成从代码提交到生产部署的标准化交付体系。更重要的是，Tekton的通用工作流引擎定位（不仅仅是CI/CD）使其在AI工作流编排、数据管道等领域具备扩展潜力。与其同时，Kubernete已从"编排容器"演变为"编排一切工作流"的平台。

Kubernetes v1.36的服务端分片Watch是控制平面扩展性的架构级突破。在超大规模集群中，控制器（尤其是自定义控制器）同时Watch大量资源时，每个副本都需要反序列化完整的事件流——随着副本增加，总体负载线性增长，而不是降低。通过将过滤逻辑从客户端上移到API服务器端，服务端分片完美解决了这个"扩展悖论"。此特性对运行数千个节点集群的平台团队至关重要，预计将在未来版本中快速成熟并GA。

GKE的4倍节点启动加速不仅仅是性能提升。当前AI推理场景中，节点冷启动延迟直接影响模型服务的SLA。加速启动意味着自动扩展器可以更激进地缩减空闲节点（降低50%+成本），同时在流量突增时快速响应。结合GKE Agent Sandbox和Hypercluster，Google正在构建从芯片（百万级加速器）到运行时（gVisor沙箱）到应用（AI代理）的完整Kubernete AI栈。

## 结论

2026年5月的云原生更新揭示了三个核心趋势：CI/CD工具生态向CNCF统一（Tekton加入）、Kubernete自身向超大规模方向演进（服务端分片Watch）、以及云原生基础设施的AI原生优化（GKE加速节点启动）。对于平台团队，Tekton的迁移意味着CI/CD流水线可能迎来更深度的CNCF生态集成；Kyverno的ClusterPolicy弃用则提醒用户及时规划策略迁移路径。Kubernete作为AI平台的基础设施正在以惊人的速度成熟。

**Source:** [Tekton joins the CNCF as an incubating project](https://developers.redhat.com/articles/2026/05/11/tekton-joins-cncf-new-era-cloud-native-cicd)
**Source:** [Kubernetes v1.36: Server-Side Sharded List and Watch](https://kubernetes.io/blog/2026/05/06/kubernetes-v1-36-server-side-sharded-list-and-watch/)
**Source:** [GKE node startup gets faster](https://cloud.google.com/blog/products/containers-kubernetes/gke-node-startup-gets-faster)
**Source:** [Announcing Kyverno release 1.18!](https://www.cncf.io/blog/2026/05/05/announcing-kyverno-release-1-18/)
