---
layout: post
title: "云原生动态：Kubeflow正式从CNCF毕业、Buildpacks晋升成熟项目与DRA重塑GPU共享格局"
date: 2026-08-23
author: "云原生观察"
source: "https://www.cncf.io/announcements/2026/08/17/cncf-announces-kubeflows-graduation-solidifying-the-standard-for-cloud-native-ai-operations/"
categories:
  - cloud-native
tags:
  - kubernetes
  - kubeflow
  - cncf
  - buildpacks
  - dra
  - gpu
---

# 云原生动态：Kubeflow正式从CNCF毕业、Buildpacks晋升成熟项目与DRA重塑GPU共享格局

云原生基金会（CNCF）本周迎来双重里程碑：Kubeflow作为首批AI原生项目之一正式毕业，Cloud Native Buildpacks也宣布达到毕业级别；与此同时，Kubernetes动态资源分配（DRA）的GA化正在从根本上改写GPU共享的技术路线，HAMi等孵化项目的应对策略为平台团队提供了迁移路线图。此外，KubeCon北美大会新增"AI推理与智能体"专题，标志着社区议程全面转向生产级AI基础设施。

## 主要新闻

### CNCF宣布Kubeflow毕业：云原生AI运维的事实标准确立

CNCF于8月17日正式宣布Kubeflow毕业，这是继其2023年进入孵化期后的重大里程碑。该项目2017年诞生于Google，现已成长为覆盖数据处理、交互式开发、分布式训练、微调、推理与模型服务全生命周期的统一AI平台。截至目前，Kubeflow拥有超过6600名贡献者、来自1000多个组织，GitHub累计星标超过33000个。要达到毕业状态，项目完成了第三方安全审计、建立了正式指导委员会治理架构，并保持CII最佳实践徽章认证。CNCF CTO Chris Aniszczyk表示，毕业标志着Kubeflow成为企业AI工作负载在Kubernetes上的成熟选项。项目下一阶段路线图聚焦LLM编排扩展、后训练微调能力增强以及面向数据与AI生命周期的大规模数据工程和智能体工作负载。

**Source:** [CNCF Announces Kubeflow's Graduation, Solidifying a Standard for Cloud Native AI Operations](https://www.cncf.io/announcements/2026/08/17/cncf-announces-kubeflows-graduation-solidifying-the-standard-for-cloud-native-ai-operations/)

### Cloud Native Buildpacks毕业：容器构建标准化再进一步

8月11日，CNCF宣布Cloud Native Buildpacks（CNB）正式毕业。该项目源自Pivotal与Heroku 2018年的合并成果，能够从应用源代码直接构建符合OCI规范的容器镜像——自动识别Java、Python、Go、Node.js、Ruby等语言并生成生产就绪镜像，无需手工维护配置文件。毕业反映了项目在生产采用度、厂商中立治理和安全实践上的成熟度：Bloomberg与Heroku by Salesforce等组织不仅是用户，更是活跃的代码贡献者。在实际收益上，某大型金融企业横跨500多个应用的实施案例显示，通过集中化的buildpack补丁分发，漏洞修复时间从数周缩短至数小时。项目未来路线图包括扩展OCI Artifacts支持、强化SBOM工作流以及兼容WebAssembly等新一代工作负载格式。

**Source:** [CNCF Announces Graduation of Cloud Native Buildpacks, Advancing the Standard for Container Builds](https://www.cncf.io/announcements/2026/08/11/cncf-announces-graduation-of-cloud-native-buildpacks-advancing-the-standard-for-container-builds/)

### DRA与HAMi之争尘埃未定：Kubernetes GPU共享进入双轨时代

CNCF博客的一篇深度技术分析回应了社区热议的问题："Kubernetes DRA是否会取代HAMi？"答案是分层的。DRA（动态资源分配）核心API在v1.34达到GA并在v1.35默认启用，其consumable capacity特性让Pod可以直接向调度器请求设备内存切片（如8000 MiB和10% GPU算力），这恰好吸收了HAMi传统管线中"用注解编码分数请求"的那一半职责；但HAMi的另一项核心能力——在容器内以CUDA调用粒度强制执行限额——从来不是DRA的设计目标。为此HAMi采取拆分策略：保留HAMI-core执行层，同时在三个仓库中基于DRA重构编码层（k8s-dra-driver、HAMi-DRA转换webhook），v2.9版本已宣告HAMi-DRA v0.2.0生产就绪。分析同时给出务实建议：混合厂商加速器集群继续走设备插件路径，而NVIDIA集群在v1.36下应尽快在预发环境验证DRA模式。

**Source:** [Does Kubernetes DRA Replace HAMi?](https://www.cncf.io/blog/2026/08/07/does-kubernetes-dra-replace-hami/)

### KubeCon北美2026日程公布：新增AI推理与智能体专题

CNCF公布了11月9日至12日在盐湖城举行的KubeCon + CloudNativeCon North America 2026完整日程，最大亮点是新增"AI Inference + Agentic"专题，聚焦生产AI系统所需的Kubernetes调度、GPU利用率优化、模型服务（vLLM、KServe）、自主智能体编排模式以及推理管道的动态路由与可观测性。这一调整背后是CNCF年度调查的数据支撑：82%的容器用户已在生产环境运行Kubernetes，66%使用生成式AI工作负载的组织依赖Kubernetes承载。同期的ArgoCon、BackstageCon、Cloud Native AI + Inference Day和CiliumCom等联合活动也将围绕AI与平台工程展开。

**Source:** [CNCF Reveals KubeCon + CloudNativeCon North America 2026 Schedule, Adds New AI Inference + Agentic Track](https://www.cncf.io/announcements/2026/08/10/cncf-reveals-kubecon-cloudnativecon-north-america-2026-schedule-adds-new-ai-inference-agentic-track/)

## 分析

Kubeflow与Buildpacks在同一个月内相继毕业，绝非时间上的巧合，而是CNCF生态重心迁移的明确信号。回望CNCF的历史，第一批毕业项目（Kubernetes、Prometheus、Envoy）定义了"基础设施云原生化"，第二批（Istio、Argo、Flux）完成了"应用交付与流量治理云原生化"，而Kubeflow作为最早一批以AI为核心使命的毕业项目，宣告生态正式进入第三阶段："AI工作负载生命周期云原生化"。对企业用户而言，毕业的意义在于采购决策可以大幅简化——经过第三方安全审计、中立治理和大规模生产验证的项目，其风险等级已经接近"默认选项"。特别是在监管趋严的环境下，受监管行业（金融、医疗）需要一个厂商中立、可自托管的MLOps基座来满足数据主权要求，Kubeflow的毕业恰好补上了这块拼图。

DRA与HAMi的关系则揭示了云原生演进的一条普遍规律：上游标准化的过程不是替代，而是分层吸收。DRA把"声明式资源请求"纳入了Kubernetes核心API词汇表，这是正确的抽象层级——任何DRA感知的调度器（Volcano、KAI Scheduler）都能理解ResourceClaim，彻底解耦了过去scheduler extender带来的侵入式集成；但"执行"永远无法被API标准化，因为它是运行时行为。HAMi选择保留内核级强制执行、放弃编码层的策略非常清醒。对平台团队的启示是：评估GPU共享方案时应当区分"请求语言"与"隔离 enforcement"两个维度，前者应尽快对齐上游标准以获得调度生态红利，后者则需要根据合规要求独立选型。值得注意的是，consumable capacity在v1.36仍是beta且托管集群可能无法开启feature gate——迁移时间表必须考虑控制面可控性。

KubeCon新增AI推理与智能体专题，配合CNCF调查中66%的生成式AI用户依赖Kubernetes的数据，说明"AI on Kubernetes"已从概念验证走向规模化生产议题。训练是资源密集型的阶段性任务，而推理是延迟敏感、持续运行的分布式负载——后者的工程挑战恰恰落在Kubernetes社区的舒适区：调度、弹性伸缩、服务网格、可观测性。可以预见，KServe、vLLM类项目与DRA/GPU调度的组合将在未来两年内形成类似当年"Ingress + Service Mesh"的标准栈。对于尚未布局的平台团队，现在开始积累AI推理运维经验的时间窗口仍然充裕，但竞争者的经验差距会迅速拉开。

## 结论

本周动态勾勒出云原生AI基础设施的成熟路线图：Kubeflow毕业解决了"MLOps用什么"的问题，DRA解决了"GPU怎么分配"的问题，KubeCon新专题则预示了社区下一步将攻克"推理如何规模化"的问题。给从业者的三个建议：第一，正在使用或评估ML平台的团队可将Kubeflow毕业视为重新评估的契机，尤其是多云和私有化部署场景；第二，管理NVIDIA集群的团队应在v1.36环境中启动DRA模式的预发验证，利用HAMi-DRA webhook实现存量清单零改动迁移；第三，关注11月盐湖城KubeCon的AI推理专题，提前储备模型服务与智能体编排的平台能力。云原生运动正在证明其最大的价值主张——让每一代新的计算范式都能站在同一套久经考验的分布式系统基座之上。
