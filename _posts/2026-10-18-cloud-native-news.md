---
layout: post
title: "云原生技术动态：KAI调度器开源并进入CNCF、Kubernetes 1.37新特性与根容器演进"
date: 2026-10-18
author: "云原生观察"
source: "https://www.aireport.net/Gn_88dc2e61add1"
categories:
  - cloud-native
tags:
  - kubernetes
  - cncf
  - kai-scheduler
  - runai
  - hpa
  - rootless
  - gpu
  - cloud-native
---
# 云原生技术动态：KAI调度器开源并进入CNCF、Kubernetes 1.37新特性与根容器演进

本周云原生领域迎来多项重要更新：NVIDIA将Run:ai平台全量开源并将KAI调度器贡献至CNCF；Kubernetes 1.37在HPA扩缩容至零（scale to zero）方面进入Beta，同时Rootless Kubelet也晋升至Beta；业界进一步明确AI代理（agent）与Kubernetes控制回路之间的职责边界，强调推理层与执行层分离。这些变化反映云原生正加速适配AI负载的调度与成本需求，同时在安全与架构上趋于更清晰的责任划分。

## 主要新闻

### 1. NVIDIA全量开源Run:ai平台，KAI调度器加入CNCF

NVIDIA宣布将Run:ai GPU编排平台完整开源，源码托管于NVIDIA DSX AI Factory GitHub组织，并在NGC上提供社区版与Helm Chart。核心是Kubernetes原生调度器KAI（Kubernetes AI Scheduler），现以Apache 2.0许可证开源并贡献至CNCF作为Sandbox项目。KAI支持Gang Scheduling（全有全无）、基于时间权重的公平共享、拓扑感知调度，并覆盖多种GPU共享机制（MIG、MPS、Time-slicing、HaMi以及CUDA 13.4中的MPS硬隔离分片）。同时发布CUDA原生GPU分片Operator，基于CUDA 13.4驱动实现内存硬隔离与每Pod指标导出。

**Source:** [Run:ai Goes Open Source: KAI Scheduler Joins CNCF, CUDA-Native GPU Segmentation, Four Components Released](https://www.aireport.net/Gn_88dc2e61add1)

### 2. Kubernetes 1.37：HPA Scale to Zero进入Beta，Rootless Kubelet晋升Beta

Kubernetes v1.37将HorizontalPodAutoscaler的scale to zero特性推进至Beta。对于GPU、批处理等按需负载，该特性允许在无流量/无待处理任务时将副本缩至0，避免长期空闲Pod持续占用资源，从而降低AI与批处理场景的GPU空置成本。与此同时，Rootless Kubelet（`KubeletInUserNamespace`）也晋升至Beta。该特性允许kubelet、CRI/OCI运行时、CNI插件及kube-proxy在Linux user namespace内以非特权用户身份运行，从而降低节点提权面。社区在过去数年已积累大量测试和CVE案例佐证其安全价值。

**Source:** [Kubernetes HPA Scale to Zero Cuts GPU Idle Cost in Beta | Dipesh Rawat, CNCF](https://www.technology-news-channel.com/kubernetes-hpa-scale-to-zero-gpu-cost-cncf/)

**Source:** [Rootless Kubelet Hits Beta in Kubernetes 1.37: What Unprivileged Nodes Buy a Multi-Tenant Fleet](https://bex.co/blog/2026/10/14/rootless-kubelet-beta-kubernetes-137)

### 3. 云原生架构明确AI推理与Kubernetes执行边界

业界共识日益明确：应将AI代理（reasoning/diagnosis）与Kubernetes确定性控制回路（execution/reconciliation）分离。Kubernetes Operator追求可预测的状态收敛；AI代理在目标清晰但路径不明时更适合推理。最佳实践是“推理层”与“执行层”分离——代理提出方案，但由确定性Operator或策略引擎执行变更，确保每个操作可观测、可逆且受授权。CNCF已将代理框架纳入Sandbox，Kubernetes SIG Apps也启动Agent Sandbox子项目，旨在为AI代理运行时提供面向Kubernetes的标准化API。开源项目kagent（CNCF Sandbox）通过CRD将AI代理建模为Kubernetes资源，进一步将代理管理纳入Kubernetes资源模型。

**Source:** [Cloud-Native Architecture Separates AI Reasoning from Kubernetes Execution — TechNewsReel](https://technewsreel.com/software-and-development/cloud-native-architecture-separates-ai-reasoning-from-kubernetes-execution)

## 分析

这些动态共同指向几个关键趋势：

- **调度范式向AI原生演进。** KAI调度器的开源及其对多种GPU共享、Gang Scheduling、拓扑感知的支持，表明云原生调度正从通用工作负载向大规模AI训练/推理场景深度适配。CUDA原生硬隔离分片的引入也意味着GPU共享正从厂商专有实现走向驱动原生能力，利于跨厂商一致性和长期可维护性。
- **成本优化成为首要诉求。** HPA scale to zero直接回应GPU资源稀缺与高昂成本的现实。事件驱动或队列深度指标触发扩缩容，能在无负载时彻底释放资源，减少“总要跑一个watcher”这类隐性开销，尤其适合批处理队列与按需推理场景。
- **安全基线向最小权限收敛。** Rootless Kubelet将节点关键代理移入非特权user namespace，收窄容器逃逸后的横向影响面。尽管仍需注意cgroup v2委派、存储（块设备）等约束，但在多租户与合规敏感场景中是重要的防御纵深演进。
- **架构治理先行于盲目AI接管。** 明确推理与执行边界是行业对“用AI管理Kubernetes”最务实的回应。将代理限制在提案而非直接强制执行、通过CRD与标准API治理代理生命周期，有助于保留Kubernetes控制回路的确定性与可审计性，同时仍能利用AI处理复杂故障诊断与多变决策路径。

## 结论

本周云原生生态在AI适配、安全收敛与架构治理三个方面均取得实质进展。KAI调度器开源与CNCF孵化有望加速GPU调度最佳实践的社区共建；Kubernetes 1.37的scale to zero与rootless kubelet为降本增效和安全加固提供了可落地的beta能力。最关键的是，社区正主动为agentic AI划定清晰边界：让AI去推理、让确定性控制器去执行。这种“分离而协作”的模式，可能是云原生在AI时代保持稳定性的关键路径。