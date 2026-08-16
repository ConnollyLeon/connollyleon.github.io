---
layout: post
title: "云原生动态：CNCF公布KubeCon NA 2026议程并新增AI推理与Agentic轨道、日本云原生开发者近百万、KubeVirt与Calico实时迁移演示"
date: 2026-08-16
author: "云原生观察"
source: "https://www.prnewswire.com/news-releases/cncf-reveals-kubecon--cloudnativecon-north-america-2026-schedule-adds-new-ai-inference--agentic-track-302846486.html"
categories:
  - cloud-native
tags:
  - cncf
  - kubecon
  - kubernetes
  - ai-inference
  - agentic
  - vllm
  - kserve
  - japan
  - slashdata
  - kubevirt
---

# 云原生动态：CNCF公布KubeCon NA 2026议程并新增AI推理与Agentic轨道、日本云原生开发者近百万、KubeVirt与Calico实时迁移演示

8月10日至15日，云原生生态在"AI基础设施化"与"全球化社区扩展"两条主线上持续推进。CNCF于8月10日公布KubeCon + CloudNativeCon North America 2026完整议程，首次设立AI Inference + Agentic专题轨道，反映Kubernetes正在成为生产级AI推理与agent工作负载的默认底座；同周，CNCF与SlashData联合发布报告显示日本云原生开发者已接近100万人，其中约10万人正在基于云原生基础设施构建AI系统；此外，Tigera于8月6日通过CNCF On-Demand活动演示了KubeVirt与Calico的实时虚拟机迁移能力，进一步拓展了Kubernetes在混合工作负载场景下的覆盖范围。三件事分别对应AI平台标准化、亚太生态扩张与虚拟化负载治理三个维度。

## 主要新闻

### CNCF公布KubeCon NA 2026完整议程：首次设立AI Inference + Agentic轨道

PRNewswire于8月10日报道，CNCF公布KubeCon + CloudNativeCon North America 2026（11月9日至12日，盐湖城）完整议程，核心亮点包括：首次设立"AI Inference + Agentic"专题轨道，聚焦Kubernetes上的AI推理、agentic工作负载编排、GPU调度、模型服务与可观测性，涉及项目包括vLLM、KServe、Ray与OpenTelemetry；平台工程轨道延续对内部开发者平台与自助工作流的探讨；安全轨道覆盖供应链安全、身份治理与运行时防护。CNCF年度云原生调查显示，82%的容器用户在生产环境运行Kubernetes，66%使用生成式AI工作负载的组织依赖Kubernetes。11月9日的联合活动包括Cloud Native AI + Inference Day、ArgoCon、BackstageCon、CiliumCon与WasmCon。此举标志着Kubernetes社区正式将AI推理基础设施化——从"能不能跑AI"转向"如何规模化治理AI工作负载"。

**Source:** [CNCF Reveals KubeCon + CloudNativeCon North America 2026 Schedule](https://www.prnewswire.com/news-releases/cncf-reveals-kubecon--cloudnativecon-north-america-2026-schedule-adds-new-ai-inference--agentic-track-302846486.html)

### CNCF与SlashData报告显示日本云原生开发者近百万，AI开发者占比显著上升

CNCF Bluesky账号与官方博客于8月13日报道，《State of Cloud Native Development in Japan》报告显示日本云原生开发者总数已接近100万人，其中约10万开发者正在使用云原生基础设施构建AI系统。KubeCon + CloudNativeCon Japan（横滨）期间，SoftBank、Fujitsu、Preferred Networks、Subaru、LY Corporation与Hyundai AutoEver分别展示了基于Kubernetes的AI生产实践。Subaru案例尤其引人注目：通过云原生基础设施加速AI开发，其AI容器镜像拉取速度提升60倍。CNCF CTO Chris Aniszczyk在大会上分享了CNCF AI一致性计划的故事，强调该计划正在为AI平台带来与Kubernetes一致性认证对100+平台所做相同的标准化保障。该报告标志着亚太地区正在成为云原生AI基础设施的重要增长极。

**Source:** [CNCF Bluesky - KubeCon Japan Recap](https://bsky.app/profile/cncf.io)

### KubeVirt与Calico实时迁移演示：Kubernetes混合工作负载治理再进一步

CNCF于8月6日通过On-Demand活动发布了KubeVirt与Calico的实时虚拟机迁移演示。KubeVirt是CNCF沙箱项目，允许在Kubernetes集群中运行虚拟机工作负载；Calico是CNCF孵化项目，提供网络策略与eBPF数据平面。此次演示展示了在Kubernetes集群内对虚拟机进行实时迁移（live migration）的同时，Calico网络策略能够自动跟随虚拟机迁移保持网络连通性与安全策略的一致性。这对于需要同时运行容器化与虚拟化工作负载的企业（如电信、金融与政府行业）具有重要意义——它意味着Kubernetes可以作为统一的控制平面同时治理两类工作负载，而无需在虚拟机迁移时手动调整网络与安全策略。

**Source:** [CNCF On-Demand: Live Migration with KubeVirt and Calico](https://www.cncf.io/online-programs/cncf-on-demand-live-migration-with-kubevirt-and-calico/)

## 分析

KubeCon NA 2026议程中AI Inference + Agentic轨道的设立，是云原生社区对"AI工作负载需要专门基础设施治理"这一判断的正式回应。vLLM、KServe与Ray的入选表明，AI推理栈正在从"自建GPU集群"向"声明式、可观测、可审计的Kubernetes工作负载"演进。对平台团队而言，这意味着AI推理调度将与现有CI/CD、安全与可观测性体系整合，而非作为独立的GPU孤岛运营。

日本市场近百万云原生开发者、其中10万人构建AI系统的数据，则印证了CNCF"AI一致性计划"的商业化逻辑：当足够多的组织在Kubernetes上运行AI工作负载时，一致性认证就从"可选标签"变为"采购门槛"。Subaru的60倍镜像拉取加速案例也为其他制造业企业的AI转型提供了可复制的路径参考。

KubeVirt + Calico的实时迁移演示填补了混合工作负载治理的关键缺口。对于尚未完成容器化但需要Kubernetes统一管理的组织，这一能力降低了从虚拟机到容器迁移的网络策略风险，使渐进式现代化成为更现实的路径。

