---
layout: post
title: "云原生动态：KubeCon北美大会发布含AI推理+智能体新轨道的完整议程、OpenCost实现Kubernetes推理成本追踪与HAMi/DRA之争揭示GPU共享演进"
date: 2026-08-10
author: "云原生观察"
source: "https://www.prnewswire.com/news-releases/cncf-reveals-kubecon--cloudnativecon-north-america-2026-schedule-adds-new-ai-inference--agentic-track-302846486.html"
categories:
  - cloud-native
tags:
  - kubecon
  - cncf
  - kubernetes
  - ai-inference
  - agentic
  - opencost
  - llm-d
  - inference-cost
  - dra
  - hami
  - gpu-sharing
  - cve
---

# 云原生动态：KubeCon北美大会发布含AI推理+智能体新轨道的完整议程、OpenCost实现Kubernetes推理成本追踪与HAMi/DRA之争揭示GPU共享演进

8月10日，云原生生态围绕"AI负载如何上Kubernetes"展开新一轮集中讨论。CNCF正式公布KubeCon + CloudNativeCon北美2026完整议程，首次设立AI推理+智能体（AI Inference + Agentic）独立轨道；OpenCost 1.121.0与llm-d集成，把推理成本以Token粒度纳入成本分配引擎；Datadog发文讨论"无法修复的Kubernetes CVE"的可见性边界；CNCF博客则以"Does Kubernetes DRA Replace HAMi?"为题，拆解DRA与GPU共享的长期关系。

## 主要新闻

### KubeCon + CloudNativeCon北美2026议程公布：新增AI推理+智能体轨道

CNCF正式发布KubeCon + CloudNativeCon North America 2026的完整日程，大会将于2026年11月9日至12日在美国犹他州盐湖城举行。今年议程首次引入"AI推理+智能体"（AI Inference + Agentic）轨道，与平台工程、安全等既有轨道并行，回应AI系统在生产环境运行所面临的工程挑战。CNCF年度调查显示，82%的容器用户已在生产环境部署Kubernetes，其中66%的组织依赖Kubernetes承载生成式AI工作负载。CNCF执行总监Jonathan Bryce表示："AI正迅速成为行业有史以来最大的算力工作负载之一，从训练模型到生产运行模型的转变，才是当前真正的工程挑战所在。"该轨道将覆盖集群调度、GPU利用率、推理延迟优化（vLLM、KServe）、推理管线可观测性等议题，其中Google的Tim Hockin与Dmitry Berkovich将主讲"Kubernetes Solutions for Agent-Shaped Problems"。标准注册截止9月2日，ArgoCon、BackstageCon、Cloud Native AI + Inference Day、CiliumCon等同期活动将于11月9日举办。

**Source:** [CNCF Reveals KubeCon + CloudNativeCon North America 2026 Schedule, Adds New AI Inference + Agentic Track](https://www.prnewswire.com/news-releases/cncf-reveals-kubecon--cloudnativecon-north-america-2026-schedule-adds-new-ai-inference--agentic-track-302846486.html)

### OpenCost 1.121.0：首个Kubernetes原生推理成本追踪

CNCF孵化项目OpenCost发布1.121.0，与同为CNCF沙箱项目的llm-d（Kubernetes分布式LLM推理）完成集成，成为首个把"基础设施成本"与"Token流量"直接挂钩的Kubernetes成本追踪方案。此前OpenCost的成本分配逻辑已覆盖CPU、内存与通用GPU成本，但缺少推理层：无法把vLLM生成的Token流转换为可决策的成本指标。新版本通过读取llm-d部署中已有的指标（`vllm:prompt_tokens_total`、`vllm:generation_tokens_total`）与OpenCost分配引擎的GPU成本数据，生成新的推理成本指标——`llm_total_hourly_cost`（每模型每小时成本）与`llm_cost_per_million_tokens`（每百万Token混合成本，含输入/输出拆分标签），并支持KV cache命中计量。该功能已在包含109块GPU、30个已部署AI模型的集群上完成概念验证。OpenCost后续将聚焦浪费GPU容量测量、LLM特定空闲GPU检测与优化成本节省估算。

**Source:** [OpenCost 1.121.0: First-of-a-kind Kubernetes inference cost tracking](https://www.cncf.io/blog/2026/08/05/opencost-1-121-0-first-of-a-kind-kubernetes-inference-cost-tracking/)

### Datadog：无法修复的Kubernetes CVE，什么能检测、什么不能

Datadog于8月10日发布技术文章，讨论"unfixed Kubernetes CVEs"（尚无上游补丁的Kubernetes漏洞）的管理边界。文章指出，Kubernetes组件（kube-apiserver、kubelet等）的漏洞通常无法通过重建镜像或更换依赖解决，只能等待上游补丁并升级集群；而这类漏洞在"可检测性"上存在显著差异——部分漏洞可通过准入控制、运行时扫描或配置审计提前发现暴露面，另一些则只能在补丁落地后被工具"确认已升级"。文章建议平台团队建立分层策略：将CVE扫描与漏洞"可利用路径"分析结合，优先治理可被攻击者直接触达的组件，而非对所有未修复漏洞同等对待；同时强调SBOM、镜像签名与配置基线是弥补"补丁未到"窗口期的关键控制手段。

**Source:** [Understanding unfixed Kubernetes CVEs: What you can and can't detect](https://www.datadoghq.com/blog/how-to-manage-unfixed-kubernetes-cves/)

### CNCF深度解析：DRA会取代HAMi吗？

CNCF博客发布Mesut Oezdil的技术长文，系统拆解Kubernetes Dynamic Resource Allocation（DRA）与GPU共享项目HAMi的关系。DRA核心在v1.34达GA、v1.35起默认启用，consumable capacity自v1.36起默认开启后，Pod已可原生向调度器请求GPU显存与算力的"切片"——这正是HAMi多年来以mutating webhook + scheduler extender + 注解体系"绕开"API缺口所实现的能力。作者的结论是：DRA不会取代HAMi，而是"收敛"——编码部分（把`nvidia.com/gpumem: 8000`这类请求转为标准ResourceClaim）被DRA吸收，而容器内CUDA调用粒度的强制（enforcement）仍是HAMi-core（libvgpu.so）不可替代的工作。HAMi通过HAMi-DRA webhook让存量manifest无需改动即可迁移，且不再耦合特定调度器（可直接跑在Volcano、KAI Scheduler上）。文章坦承三个现实约束：consumable capacity尚未稳定、k8s-dra-driver的Helm chart仍是WIP、DRA生态的厂商覆盖（目前NVIDIA成熟，Ascend/Enflame/Hygon在途）远小于传统模式12+设备族的规模。

**Source:** [Does Kubernetes DRA Replace HAMi?](https://www.cncf.io/blog/2026/08/07/does-kubernetes-dra-replace-hami/)

## 分析

本周云原生领域最显著的信号，是"AI推理"正在从社区热点升级为官方议程与产品功能的一等公民。KubeCon北美2026设立AI推理+智能体轨道，OpenCost把Token成本纳入Kubernetes原生计量，连同此前CoHDI入沙箱、kagent推动的Agent Substrate讨论，共同指向一个判断：Kubernetes正在被系统性重构为AI工作负载的通用底座。对平台团队而言，这既是机遇也是负担——集群调度的对象从"无状态微服务"扩展到"GPU共享、推理延迟敏感、Token计费"的混合负载，资源建模与成本归属的复杂度同时上升。

OpenCost与llm-d的集成值得特别关注，它把AI成本的讨论从"GPU数量"推进到"Token粒度"的运营语言。`llm_cost_per_million_tokens`这类指标让平台团队能够回答此前难以回答的问题：哪个模型、哪个租户、哪次推理真正烧钱？结合Datadog对"无法修复CVE"的提醒，可以看出一条运营主线——AI时代的Kubernetes治理，正在把成本可见性、供应链安全与升级策略捏合成同一套日常流程。建议团队把OpenCost的推理指标纳入既有FinOps看板，同时为"等待上游补丁"的窗口期建立以SBOM和配置基线为基础的补偿控制。

HAMi与DRA的"收敛"叙事则揭示了一个更普遍的模式：Kubernetes上游API演进的速度，决定了第三方生态的护城河边界。当请求语言、调度决策与强制执行三者统一到标准API后，厂商锁定被削弱，平台可移植性增强。对正在选型GPU共享方案的团队，文章给出了务实的决策框架：NVIDIA集群且控制面可配feature gate（v1.36+）者，可先在staging验证DRA+HAMi-DRA路径；异构加速器（Cambricon、Iluvatar、Moore Threads等）舰队则应继续走传统模式，直到DRA驱动覆盖到位。

## 结论

KubeCon北美2026的AI推理+智能体轨道、OpenCost的推理成本追踪与HAMi/DRA的技术拆解，共同勾勒出云原生平台"为AI重构"的当前坐标：议程在变、计量在变、资源模型在变。对平台工程团队，建议尽早熟悉DRA的ResourceClaim/consumable capacity语义（v1.36起默认开启，升级窗口已打开），将OpenCost推理指标纳入成本治理，并以Datadog提出的分层CVE策略补齐补丁窗口期的控制缺口。云原生的下一个主战场，正从"把容器跑起来"转向"把AI负载跑得清楚、跑得便宜、跑得安全"。
