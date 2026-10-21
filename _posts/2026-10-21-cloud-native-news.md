---
layout: post
title: "云原生技术动态：AI工作负载重塑Kubernetes自动扩缩容与分布式推理"
date: 2026-10-21
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/10/19/how-ai-workloads-are-reshaping-kubernetes-autoscaling/"
categories:
  - cloud-native
tags:
  - kubernetes
  - AI
  - autoscaling
  - llm-d
  - cloud-native
  - GPU
---

# 云原生技术动态：AI工作负载重塑Kubernetes自动扩缩容与分布式推理

随着AI推理和智能体工作负载的大规模普及，云原生基础设施正在经历一场深刻的变革。传统的Kubernetes架构正在适应GPU密集型、长上下文和突发性AI任务的新需求，呈现出从容器编排到智能推理平台的演进趋势。

## 主要新闻

### AI工作负载重塑Kubernetes自动扩缩容机制

CNCF近日发布文章，深入分析了AI工作负载如何对Kubernetes自动扩缩容带来挑战。传统的调度器和自动扩缩器之间的职责分离在GPU场景下面临失效：调度器负责将Pod放置到现有节点，自动扩缩器则根据Pod需求添加节点。但在GPU场景中，节点形态、拓扑结构、配额限制等因素使得"有容量但无法调度"的情况频繁发生。

文章指出，社区正通过工作负载感知调度（Workload-Aware Scheduling）、预置请求（Provisioning Request）等机制实现两者协同，并朝着更紧密的调度-扩缩容一体化方向发展。

**Source:** [How AI workloads are reshaping Kubernetes autoscaling](https://www.cncf.io/blog/2026/10/19/how-ai-workloads-are-reshaping-kubernetes-autoscaling/)

### llm-d 1.0发布：面向分布式推理的Kubernetes原生栈

Google、Red Hat、IBM等厂商联合发布了CNCF沙箱项目llm-d 1.0，这是一个面向大语言模型分布式推理的Kubernetes原生开源栈。该项目旨在解决从聊天到智能体工作负载转型带来的推理效率挑战。

llm-d 1.0提供了前缀感知路由、负载感知路由、KV缓存卸载、预填充/解码解耦、智能体感知服务等核心能力，并在Google Cloud TPU和GPU混合集群上得到验证。Google Gemini平台通过GKE Inference Gateway结合llm-d实现了前缀缓存命中率从35%提升至70%，编码智能体的TTFT降低35%以上。

**Source:** [llm-d 1.0, an open source stack for distributed inference](https://cloud.google.com/blog/topics/ai-infrastructure/llm-d-1-0-an-open-source-stack-for-distributed-inference)

### NVIDIA将Run:ai全面开源，KAI调度器加入CNCF

NVIDIA宣布将其收购的Run:ai平台全面开源，采用Apache 2.0许可证。平台包含四个核心组件：KAI Scheduler（已贡献给CNCF沙箱项目）、GPU分片算子、资源管理层和工作负载映射库。KAI Scheduler支持gang调度、公平共享、拓扑感知和动态资源分配（DRA），为GPU集群提供更精细的资源管理能力。

**Source:** [NVIDIA Open Sources Run:ai Under Apache 2.0 for Kubernetes GPU Orchestration](https://global1.news/nvidia-open-sources-runai-under-apache-20-for-kubernetes-gpu-orchestration)

## 分析

这三个发展共同反映了云原生领域的几个关键趋势：

首先，**Kubernetes正成为AI基础设施的操作系统**。CNCF CTO Chris Aniszczyk在最新播客中明确指出，Kubernetes已经从容器编排平台演变为AI基础设施的事实标准。这种转变不仅体现在项目数量上，更体现在核心架构的演进中。

其次，**推理效率成为云原生AI的核心挑战**。随着智能体应用的普及，单个用户请求可能触发数十次模型调用，对延迟和成本的要求极为严格。llm-d通过KV缓存复用、智能路由等技术大幅降低推理成本，这对于大规模部署至关重要。

第三，**调度与编排正走向深度融合**。传统的"调度器+自动扩缩器"二元模型在AI场景下已不再足够。社区正在探索统一的调度框架，既要考虑Pod的放置，又要预判扩容需求，在GPU这种昂贵且有限的资源上实现最优化利用。

此外，开源生态的加速也值得关注。NVIDIA将Run:ai开源、Google推动TorchTPU开源，表明云厂商正通过开源来争夺AI基础设施的标准制定权，而Kubernetes生态成为这场竞争的主战场。

## 结论

云原生技术正迎来其历史上最大的应用场景转型。从支撑Web应用到支撑AI工作负载，这一转型要求重新思考调度、扩缩容、存储和网络等各个方面。llm-d、KAI Scheduler等项目的成熟预示着，面向AI的云原生基础设施正从实验走向生产就绪。

对于企业来说，关键在于尽早布局基于Kubernetes的AI基础设施平台，既要利用开源项目的成熟能力，又要关注社区动态以便及时采用最佳实践。在AI成本日益成为企业负担的当下，高效的云原生编排和调度能力将成为差异化竞争的核心要素。
