---
layout: post
title: "云原生技术动态：Kubernetes 1.36声明式验证GA与Kyverno 1.18发布"
date: 2026-05-09
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/05/05/kubernetes-v1-36-declarative-validation-ga/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - cncf
  - kyverno
  - gke
  - declarative-validation
---

# 云原生技术动态：Kubernetes 1.36声明式验证GA与Kyverno 1.18发布

过去一周，云原生生态系统迎来多项重大更新。Kubernetes v1.36的声明式验证正式GA，结束了数千行手工验证代码的时代；Kyverno 1.18作为CNCF毕业后的首个版本发布；Google在Cloud Next '26上推出GKE Agent Sandbox和Hypercluster，将Kubernetes定位为AI代理运行时。这些发展共同指向云原生平台的成熟化和智能化方向。

## 主要新闻

### Kubernetes v1.36：声明式验证正式GA

Kubernetes v1.36将声明式验证（Declarative Validation）推进到GA状态。该功能引入了一个名为`validation-gen`的新代码生成器，通过解析`+k8s:`标记标签自动生成对应的Go验证函数，取代了数千行手写验证代码。其核心创新之一是"环境速率调整"（ambient ratcheting）机制——当用户更新已有对象时，验证框架会比较传入对象与`oldObject`，如果某字段值与之前状态语义等价（用户未更改），则绕过新验证规则。这意味着Kubernete API团队可以在最不破坏性的情况下立即收紧或放宽验证规则。

**Source:** [Kubernetes v1.36: Declarative Validation Graduates to GA](https://kubernetes.io/blog/2026/05/05/kubernetes-v1-36-declarative-validation-ga/)

### Kyverno 1.18发布——CNCF毕业后首个版本

CNCF宣布Kyverno 1.18正式发布，这是该项目从CNCF毕业后的第一个版本。主要更新包括：更强的HTTP安全控制（默认阻止回环地址和元数据服务端点）、CLI重大增强（支持清理策略、HTTP和Envoy授权策略、`mutateExisting`规则）、策略引擎性能改进（基于内存的HPA自动缩放、TLS指标端点、改进的并发处理）、全新CEL策略类型支持、以及gzip CEL库。Kyverno从1.18开始采用"main+1"补丁支持模型，当前版本和上一个版本将获得约3个月的社区补丁支持。ClusterPolicy资源按计划在今年晚些时候弃用，用户应开始迁移到ValidatingPolicy、MutatingPolicy等新策略类型。

**Source:** [Announcing Kyverno release 1.18!](https://www.cncf.io/blog/2026/05/05/announcing-kyverno-release-1-18/)

### Google Cloud Next '26：GKE Agent Sandbox与Hypercluster

Google在Cloud Next '26上发布了一系列重大GKE更新。GKE Agent Sandbox基于gVisor提供内核级隔离的不受信代理代码执行环境，声称每秒300个沙箱、亚秒延迟，在Axion上运行时性能价格比提升30%。Agent Sandbox已作为Kubernete SIG Apps子项目在KubeCon NA 2025启动，引入了三个新的Kubernete原语：Sandbox、SandboxTemplate和SandboxClaim。GKE Hypercluster（私有GA）允许单个GKE控制平面管理分布在256,000个节点上的100万个加速器芯片，跨多个区域运行，利用Titanium Intelligence Enclave提供硬件认证的安全保障。在推理方面，GKE Inference Gateway的预测延迟优化使用ML驱动路由将首Token延迟降低70%。

**Source:** [Google Announces GKE Agent Sandbox and Hypercluster at Next '26](https://www.infoq.com/news/2026/05/gke-agent-sandbox-hypercluster/)

## 分析

Kubernetes v1.36的声明式验证GA与v1.35的用户命名空间GA、基于清单的准入控制Alpha形成了完整的Kubernete安全与可靠性增强拼图。声明式验证的意义不仅在于代码量的减少——它打开了将验证规则通过OpenAPI暴露给生态工具的可能性。Kubebuilder等工具、`kubectl`客户端和IDE将能够执行客户端验证，无需发送请求到API服务器。这是API Machinery SIG多年努力的结晶，也是Kubernete走向"开发者体验优先"的重要一步。

Kyverno 1.18的发布标志着策略即代码在云原生生态中的成熟。作为CNCF毕业项目，Kyverno在过去的版本中已经从简单的Kubernete策略引擎演化为一个完整的策略平台。转向CEL策略类型（ValidatingPolicy、MutatingPolicy等）反映了CNCF对"标准化更好"的认知——CEL作为Kubernete社区广泛采用的表达式语言，降低了策略编写的学习曲线。但ClusterPolicy的弃用也意味着用户需要规划迁移路径，这可能对已深度使用ClusterPolicy的组织带来短期负担。

GKE Agent Sandbox的发布将Kubernete推向了AI代理执行层的核心位置。Gkiouros指出的关键差异化在于Agent Sandbox是开源Kubernete原生原语，而非专有平台特性——任何Kubernete集群都可以运行它，不限于GKE。这与Cloudflare的Sandbox（基于容器隔离）和E2B的Firecracker微VM方案形成了三足鼎立的竞争格局。多代理AI工作流激增327%和66%组织依赖Kubernete驱动生成式AI应用（CNCF数据）表明，Kubernete正在从"容器编排平台"演变为"AI工作负载编排平台"。

## 结论

2026年5月的云原生更新沿三条主线展开：（1）Kubernete核心的成熟化——声明式验证GA消除了API扩展的瓶颈；（2）策略即代码的标准化——Kyverno和CEL策略类型定义了云原生策略的未来形态；（3）Kubernete作为AI平台——GKE Agent Sandbox和Hypercluster将Kubernete的规模边界提高了几个数量级。对于平台团队而言，CI/CD管道中的声明式验证集成、Kyverno策略迁移路径规划、以及AI代理工作负载的Kubernete基础设施准备已成为当务之急。
