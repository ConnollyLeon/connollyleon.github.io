---
layout: post
title: "云原生技术动态：AI负载重塑Kubernetes自动伸缩、NVIDIA Run:ai全面开源与机密容器上的机密AI"
date: 2026-10-20
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/10/19/how-ai-workloads-are-reshaping-kubernetes-autoscaling/"
categories:
  - cloud-native
tags:
  - kubernetes
  - autoscaling
  - gpu-scheduling
  - runai
  - confidential-containers
  - cncf
  - cloud-native
---
# 云原生技术动态：AI负载重塑Kubernetes自动伸缩、NVIDIA Run:ai全面开源与机密容器上的机密AI

过去24小时内，云原生生态传来三条重量级消息：CNCF博客刊文剖析AI加速器负载如何迫使Kubernetes调度器与自动伸缩器两大控制回路走向协同；NVIDIA将Run:ai平台以Apache 2.0协议全面开源，GPU编排栈从此可自由检视与自托管；Fortanix则宣布基于CNCF机密容器（CoCo）为Kubernetes工作负载提供机密AI能力。三者分别指向调度协同、生态开放与机密计算三个方向，勾勒出AI时代云原生基础设施的演进主线。

## 主要新闻

### 1. 一个硬件模型，两个消费者：AI负载正重塑Kubernetes自动伸缩

CNCF博客（10月19日，作者来自AWS）指出，Kubernetes十年来"调度器放置Pod、自动伸缩器补充节点"的分工在AI加速器时代开始失效。典型症状是：集群并非真正缺乏容量，Pod却持续Pending——因为自动伸缩器愿意添加的节点，并非调度器愿意使用的节点形态。文章系统梳理了社区的应对：Dynamic Resource Allocation（DRA）用结构化声明取代裸计数，表达加速器与网卡、NUMA域等拓扑关系；可切分设备与可消费容量模型让单卡可被多负载按份额共享；Workload/PodGroup API（现已Beta但默认关闭）让调度器把gang scheduling视为整体；Kueue的provisioning request则作为当前的"补丁桥梁"，让工作负载一次性请求整组容量。作者强调，SIG-Autoscaling已出现让两个回路直接对话的公开提案——调度器可看到"可被供应的容量"，并显式表达放置偏好与请求。

**Source:** [How AI workloads are reshaping Kubernetes autoscaling - CNCF](https://www.cncf.io/blog/2026/10/19/how-ai-workloads-are-reshaping-kubernetes-autoscaling/)

### 2. NVIDIA将Run:ai以Apache 2.0全面开源，纳入DSX AI Factory

NVIDIA已将完整的Run:ai平台以Apache 2.0协议发布至GitHub，涵盖控制面、集群服务、安装器、CLI与MCP服务器的单体仓库（约50个Go服务）。发布拆分为四个可独立采用的组件：KAI Scheduler（Kubernetes原生调度引擎，CNCF Sandbox项目，支持gang scheduling、时间公平份额、拓扑感知与DRA）、GPU Fractioning Operator（基于CUDA 13.4原生GPU分数与硬内存隔离）、KAI Resource Management（项目、部门、配额与节点池）以及Workload Map（描述PyTorchJob、RayCluster、KServe等工作负载类型的Go库）。社区版通过NGC Helm chart免费部署但不含NVIDIA企业支持，另有Crusoe、Mirantis、Nebius、Spectro Cloud等8家DSX生态伙伴提供商业发行版。伴随开源的Model Streamer在8台H100 VM基准中将模型加载提速3至6倍。

**Source:** [NVIDIA Open Sources Run:ai Under Apache 2.0 for Kubernetes GPU Orchestration - MarkTechPost](https://www.marktechpost.com/2026/10/18/nvidia-runai-open-source-gpu-orchestration-kubernetes/)

### 3. Fortanix基于CNCF机密容器发布机密AI方案

Fortanix于10月19日宣布，面向企业级Kubernetes工作负载推出机密AI（Confidential AI）能力，构建于CNCF机密容器（Confidential Containers, CoCo）之上。该方案旨在让受监管行业在共享集群中运行模型训练与推理时，依靠机密容器提供的硬件级可信执行环境隔离模型、数据与密钥，同时保持Kubernetes原生的部署与调度模型。此举把机密计算从"独立可信虚机"的旧范式推进到"托管Kubernetes集群内的机密Pod"，与近期机密容器项目的成熟节奏相呼应。

**Source:** [Fortanix Announces Confidential AI for Enterprise Grade Kubernetes Workloads on CNCF Confidential Containers (CoCo) - BusinessWire](https://www.businesswire.com/news/home/20261019435194/en/Fortanix-Announces-Confidential-AI-for-Enterprise-Grade-Kubernetes-Workloads-on-CNCF-Confidential-Containers-CoCo)

## 分析

这三条消息共同揭示了云原生生态在AI压力下的三条演进逻辑：

- **调度与伸缩的"裂缝"正在被制度化地弥合。** 十年来调度器与autoscaler各司其职的设计，建立在"计算可互换"的前提上，而加速器恰恰不可互换——形态、拓扑、预留与切分方式都会改变"可用容量"的定义。DRA、gang scheduling与provisioning request是三个局部修补，SIG-Autoscaling的新提案则试图把它们统一为一等公民接口。对平台团队的现实含义是：GPU集群中"节点有空位却无法调度"的问题，未来将更多通过调度器与autoscaler的协同设计解决，而不是简单加节点。谁先理解"调度器与自动伸缩器是否对'可用节点'达成一致"，谁就能减少昂贵加速器的闲置。
- **GPU编排栈的开放化，削弱了厂商锁定的最后一个技术支点。** NVIDIA开源Run:ai，与NVIDIA将部分能力反哺CNCF（KAI Scheduler为Sandbox项目）的姿态一致：当Kueue、Volcano、YuniKorn等开源调度方案日趋成熟时，闭源的GPU编排层反而成为采用阻力。以Apache 2.0开放全平台，本质上是把"是否付费订阅"的问题从"能否使用"中剥离——企业可以先自托管验证，再决定是否购买企业支持。对多云与混合云团队而言，这意味着GPU工作负载的可移植性显著提高，采购谈判中的替代选项更加真实。
- **机密容器正在成为AI合规的基础设施选项。** Fortanix将机密AI落在CoCo上，说明机密计算正在从"另起炉灶的可信虚机"转向"现有Kubernetes控制面下的机密Pod"。对金融、医疗与政府用户来说，这一路径保留了既有的编排、配额与可观测体系，同时满足数据驻留与推理过程隔离的监管要求。随着KubeCon + CloudNativeCon NA 2026（11月9-12日，盐湖城）临近，AI Inference + Agentic新赛道与机密容器、GPU调度议题的交汇值得关注。

展望未来，三条线索指向同一结论：Kubernetes正围绕加速器重构其核心抽象——资源声明从计数走向结构化关系（DRA），调度决策从单Pod走向整组原子性，安全边界从节点走向机密Pod。平台团队应尽早在实验环境中验证DRA与gang scheduling的实际收益，并评估机密容器对推理延迟的影响，而不是等待这些问题在生产环境中以成本或合规事故的形式暴露。

## 结论

今日三条云原生新闻指向同一趋势：AI负载正在重写Kubernetes的资源模型与商业模型。调度器与自动伸缩器的协同是技术必然，Run:ai开源是生态必然，机密AI落地CoCo则是合规必然。三者叠加意味着——加速器时代真正的平台竞争力，不在于拥有多少GPU，而在于能否让调度、供给与隔离三条链路对"一块可用的加速器"达成一致。随着KubeCon NA临近，这类围绕GPU与agentic工作负载的基础设施讨论只会更密集。
