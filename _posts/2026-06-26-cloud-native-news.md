---
layout: post
title: "云原生动态：Google OpenRL开源LLM微调平台，NVIDIA Dynamo Planner自动化LLM推理调度，Kube-Wasm晋升CNCF毕业"
date: 2026-06-26
author: "云原生观察"
source: "https://techgig.com/news/software-devops/google-launches-openrl-for-fine-tuning-large-language-models/131983526"
categories:
  - cloud-native
tags:
  - kubernetes
  - openrl
  - nvidia
  - dynamo-planner
  - kube-wasm
  - webassembly
  - llm-inference
  - cncf
  - cloud-native
---

# 云原生动态：Google OpenRL开源LLM微调平台，NVIDIA Dynamo Planner自动化LLM推理调度，Kube-Wasm晋升CNCF毕业

本周云原生领域密集发布多项重量级进展。Google GKE Labs推出OpenRL开源项目，为Kubernetes上的LLM微调提供标准化API；NVIDIA与Microsoft联合发布Dynamo Planner，实现SLO驱动的LLM推理自动化调度；Kube-Wasm获CNCF技术监督委员会批准晋升毕业状态，WebAssembly成为Kubernetes一级计算实体。

## 主要新闻

### Google GKE Labs发布OpenRL：Kubernetes原生的LLM微调开源平台

Google GKE Labs于6月25日正式推出OpenRL，一个开源的自托管API，用于在标准Kubernetes集群上对大型语言模型进行后训练微调。OpenRL将强化学习基础设施从AI研究中抽象出来，使机器学习团队能够在其集群上直接扩展后训练工作流。Google工程师指出，在LLM上使用Agentic强化学习时，"极其容易陷入系统复杂性"——每个RL循环涉及数据准备、环境选择、训练循环调试、奖励设计以及管理硬件和基础设施等多个组件。OpenRL通过解耦基础设施与AI研究，使多个RL作业可并发运行，提高GPU利用率。该工具兼容macOS、Nvidia GPU和GKE，并与Tinker-Cookbook集成。

**Source:** [Google Launches OpenRL for Fine-Tuning Large Language Models](https://techgig.com/news/software-devops/google-launches-openrl-for-fine-tuning-large-language-models/131983526)

### NVIDIA与Microsoft联合发布Dynamo Planner：SLO驱动的LLM推理自动化调度

NVIDIA与Microsoft在Azure Kubernetes Service合作基础上，发布Dynamo Planner的两大核心组件——Dynamo Planner Profiler和基于SLO的Dynamo Planner，旨在解决分离式推理服务中最棘手的"速率匹配"挑战。LLM推理工作负载被拆分为预填充和解码操作分别在独立GPU池上运行，工程师需手动分配GPU资源。Dynamo Planner Profiler自动识别性能边界，而SLO-based Planner在运行时监控集群状态（包括KV缓存负载、预填充队列深度），动态缩放预填充和解码工作节点以确保服务等级目标。Dynamo Planner代表了从手动设置到自动化SLO驱动资源管理的重大飞跃。

**Source:** [NVIDIA Dynamo Planner: Automating LLM Inference with SLO-Driven Automation](https://vosaclub.org/article/nvidia-dynamo-planner-automating-llm-inference-with-slo-driven-automation-on-kubernetes)

### Kube-Wasm获CNCF毕业状态：WebAssembly成为Kubernetes一级计算

CNCF技术监督委员会已初步批准Kube-Wasm晋升毕业状态——基金会最高成熟度等级，待Q2 2026安全审计完成后正式生效。Kube-Wasm使WebAssembly模块可在Kubernetes集群内作为一级计算资源直接调度，平均冷启动仅2.3ms，对比标准runc容器的620ms提升超过两个数量级。内存方面，Wasm实例约3MB而对等容器约64MB。WebAssembly 3.0已于2026年6月正式发布，WASI 0.3.0支持原生异步，Component Model达到稳定。一旦安全审计关闭，Kube-Wasm将与Kubernetes、Prometheus、Envoy位列同一梯队。

**Source:** [Kube-Wasm Hits CNCF Graduation: Wasm on Kubernetes](https://byteiota.com/kube-wasm-cncf-graduation-kubernetes-webassembly/)

## 分析

这三项进展共同指向一个明确的趋势：Kubernetes正在从通用容器编排平台演变为AI基础设施的操作系统。

Google OpenRL的发布意义不仅在于一个新的开源工具。它标志着RLHF（基于人类反馈的强化学习）这一目前最有效的LLM对齐技术，正在从少数前沿AI实验室的专属工具转变为可通过Kubernetes标准化部署的通用能力。OpenRL解耦了AI研究与基础设施管理，这正是Kubernetes生态过去十年在应用层完成的变革在AI层的复现。对于平台工程团队而言，这意味着需要开始将RL工作流视为与Web服务或批处理作业同等重要的Kubernetes工作负载类型。

NVIDIA Dynamo Planner则解决了LLM推理部署中最棘手的运维问题。分离式推理架构（预填充与解码分离）虽然能显著提升吞吐量，但其资源管理的复杂性一直阻碍着大规模生产部署。Dynamo Planner将SLO直接映射为GPU分配和扩缩容决策，使SRE团队可用声明式方式管理推理基础设施。这预示着AI推理运维正在从"手工调优"走向"自动化SLO驱动"的时代。

Kube-Wasm的CNCF毕业是WebAssembly在云原生生态中取得的关键里程碑。2.3ms的冷启动时间和3MB的内存占用，使Wasm成为Serverless、FaaS、边缘计算和轻量级API网关等场景的理想运行时。对于那些正在为AI Agent构建高密度执行环境的团队而言，Wasm的低开销和多语言支持提供了比传统容器更经济的选择。随着Wasm 3.0和WASI 0.3.0的成熟，Wasm在Kubernetes上的采用将从实验走向生产。

## 结论

2026年6月26日的云原生动态揭示了Kubernetes生态系统的三大发展方向：AI工作负载的一等公民化（OpenRL、Dynamo Planner）、运行时多样性的成熟（Kube-Wasm毕业）、以及基础设施层自动化程度的持续提升。对于从业者而言，优先评估LLM微调和推理工作负载在K8s上的部署策略、关注Wasm在冷启动敏感场景的替代价值、以及建立AI运维的SLO驱动管理体系，将是下半年的关键行动方向。
