---
layout: post
title: "云原生技术动态：NVIDIA开源OSMO编排机器人工作流，Kubernetes扩展至7500节点"
date: 2026-10-04
author: "云原生观察"
source: "https://www.hypernova.news/article/nvidia-open-sources-osmo-a-kubernetes-orchestrator-for-robots"
categories:
  - cloud-native
tags:
  - kubernetes
  - nvidia
  - osmo
  - robotics
  - cloud-native
  - orchestration
  - ai
  - gpu
---

# 云原生技术动态：NVIDIA开源OSMO编排机器人工作流，Kubernetes扩展至7500节点

2026年10月4日，云原生领域迎来多项重要进展。NVIDIA开源OSMO工作流编排器，标志着Kubernetes正从云端应用编排向机器人与物理AI基础设施延伸。同时，大规模AI训练集群将Kubernetes推向7500节点规模，反映出云原生平台正承载日益复杂的AI计算负载。

## 主要新闻

### NVIDIA开源OSMO：基于Kubernetes的机器人工作流编排器

NVIDIA近日开源了OSMO（Open Source Management Orchestrator），这是一款基于Kubernetes原生构建的工作流编排器，专门用于管理机器人AI项目的计算需求。OSMO最初用于NVIDIA内部的Project GR00T（人形机器人基础模型）、Isaac Lab（强化学习框架）和Isaac Sim（基于Omniverse的仿真平台）等旗舰项目。

OSMO的核心价值在于统一了机器人研发全生命周期的计算资源调度。开发者只需编写单一YAML文件，即可定义训练、仿真和硬件在环（Hardware-in-the-Loop）等任务，OSMO将自动将这些任务路由到合适的计算层级：从GB200数据中心集群到Jetson AGX Thor边缘设备。这一设计大幅降低了机器人团队在异构硬件环境间迁移工作负载所需的定制化基础设施代码。

**Source:** [NVIDIA Open-Sources OSMO, a Kubernetes Orchestrator for Robots](https://www.hypernova.news/article/nvidia-open-sources-osmo-a-kubernetes-orchestrator-for-robots)

### Kubernetes集群规模突破7500节点，支撑大规模AI训练

据报道，业界已成功将Kubernetes集群扩展至7500节点规模，用于支撑GPT-3、CLIP、DALL·E等大规模模型的训练与研究工作。这一里程碑表明Kubernetes不仅适用于微服务生产环境，更已成为先进AI基础设施的核心编排平台。

在此规模下，集群需要同时满足两种截然不同的需求：大规模模型训练所需的高吞吐计算资源调度，以及研究团队频繁开展小规模实验所需的快速迭代能力。为了应对这一挑战，社区正积极探索更高效的调度器方案，如CNCF沙盒项目Koordinator已在实际案例中将GPU分配率提升至95%以上，整体GPU利用率超过55%。

**Source:** [Kubernetes stretched to 7,500 nodes for AI race](https://enmnews.com/2026/10/03/kubernetes-stretched-7500-nodes-ai-race)

### 云原生Agent Harness向分布式架构演进

随着AI Agent在生产环境中的普及，传统运行在开发者笔记本上的"Agent Harness"（Agent运行框架）正面临扩展性瓶颈。Stacklok创始人兼CEO Craig McLuckie指出，现有方案难以支撑数百个并发会话、无法在客户端间无缝迁移、且存在状态丢失等问题。

他呼吁将Agent Harness重新设计为云原生分布式应用，明确区分Agent执行循环与周边基础设施服务。"Kubernetes向业界证明：容器中的单体仍是单体。这个教训同样适用于AI Agent。"这一思路推动业界探索更适合大规模Agent部署的沙箱化、可观测性和权限治理方案。

**Source:** [What Kubernetes’ "monolith" lesson means for AI agent harnesses](https://thenewstack.io/kubecon-agent-harness-koordinator/)

## 分析

当前云原生技术正经历从"面向应用"向"面向AI基础设施"的范式转变。NVIDIA开源OSMO是这一趋势的典型体现：Kubernetes的抽象能力正被扩展到物理世界的计算异构性中。OSMO将数据中心GPU、边缘嵌入式设备纳入统一编排范畴，这种统一的工作流抽象有望成为物理AI（Physical AI）领域的基础设施标准。

大规模集群实践则暴露了云原生调度器在AI负载下的固有局限。默认Kubernetes调度器针对微服务设计，在GPU密集型、分布式训练等场景中难以实现最优资源利用。Koordinator等调度增强方案的成功实践表明，未来云原生平台需要针对AI工作负载特性进行深度优化，包括拓扑感知调度、GPU切分、Gang Scheduling等能力，这些特性正逐步在Kubernetes生态中落地。

Agent基础设施的演进则反映了云原生思路向AI应用层的回归。将Agent运行环境抽象为可编排、可治理的云原生资源（如Kubernetes Agent Sandbox），有助于解决Agent部署的安全边界、权限最小化、审计追溯等关键问题。随着Agent数量呈指数级增长，这种基础设施化思路将成为保障大规模Agent生产可用性的必要前提。

## 结论

云原生技术正在成为支撑下一代AI基础设施的底座。NVIDIA通过开源OSMO进一步巩固了Kubernetes在异构计算领域的影响力，而7500节点集群的实践验证了其在超大规模AI场景中的可行性。与此同时，Agent基础设施的云原生化预示着运维模式正从"管理应用"转向"管理智能体"。

未来，云原生社区需要在调度、网络、存储、安全等维度持续演进，以更好地适配训练、推理、Agent等多元AI工作负载的需求。技术融合的深度将决定云原生平台能否真正成为AI时代的通用计算底座。
