---
layout: post
title: "云原生动态：OpenTelemetry毕业成为可观测性标准，Kubernetes 1.36 AI调度能力成熟"
date: 2026-06-22
author: "云原生观察"
source: "https://www.cncf.io/announcements/2026/05/21/cloud-native-computing-foundation-announces-opentelemetry-graduation/"
categories:
  - cloud-native
tags:
  - opentelemetry
  - kubernetes
  - cncf
  - ai
  - dgpu-scheduling
  - digital-sovereignty
  - observability
  - cloud-native
---

# 云原生动态：OpenTelemetry毕业成为可观测性标准，Kubernetes 1.36 AI调度能力成熟

本周云原生领域迎来多项里程碑式进展。CNCF宣布OpenTelemetry正式毕业，确立其作为云原生可观测性事实标准的地位；Kubernetes 1.36版本的AI工作负载支持能力持续成熟；CNCF CTO展望云原生十年发展路径；同时多篇技术深度文章探讨了云原生在AI和数字主权领域的架构演进。

## 主要新闻

### OpenTelemetry正式毕业：确立可观测性标准地位

CNCF在明尼阿波利斯举行的Observability Summit上宣布OpenTelemetry正式毕业，标志着这一开源可观测性框架已准备好投入大规模生产使用。OpenTelemetry通过统一指标、日志和链路追踪的采集与处理标准，解决了工具碎片化问题，使组织可以更换分析后端而无需重写代码。自2019年由OpenTracing和OpenCensus合并成立以来，OpenTelemetry社区已发展至超过12,000名贡献者，来自2,800多家企业，项目活跃度在CNCF生态中排名第二。

**Source:** [Cloud Native Computing Foundation Announces OpenTelemetry's Graduation](https://www.cncf.io/announcements/2026/05/21/cloud-native-computing-foundation-announces-opentelemetry-graduation/)

### Kubernetes 1.36：AI工作负载调度能力全面成熟

Kubernetes 1.36版本（代号Haru）发布了70项增强功能，成为迄今为止最具AI导向的版本。其中，原生gang调度功能使分布式训练和多Pod推理任务能够全或无方式启动，避免了半调度状态导致的死锁问题。Dynamic Resource Allocation（DRA）达到GA阶段，NVIDIA已在KubeCon Europe 2026上将其GPU DRA驱动捐赠给CNCF，Google也开源了TPU DRA驱动。此外，llm-d——一个由Red Hat、Google Cloud、IBM Research、CoreWeave和NVIDIA联合构建的Kubernetes原生分布式LLM推理框架——已进入CNCF Sandbox。

**Source:** [Kubernetes v1.36 Released: Security Defaults Tighten as AI Workload Support Matures](https://www.infoq.com/news/2026/05/kubernetes-1-36-released/)

### CNCF CTO展望云原生十年：Kubernetes成为AI的操作系统

CNCF联合创始人兼CTO Chris Aniszczyk在接受采访时回顾了云原生计算基金会成立十年来的发展历程。CNCF从最初围绕Kubernetes和约20个成员起步，已发展为一个拥有超过230个项目、300,000名贡献者、覆盖190多个国家的生态系统。Kubernetes已超越容器编排的原始范畴，正在成为AI工作负载的事实操作系统——82%的容器用户在生产环境中运行Kubernetes，66%的AI采用者使用Kubernetes进行推理和生成式AI工作负载管理。Aniszczyk强调，可观测性与安全性的融合正在加速，OpenTelemetry数据将成为AI运维和安全分析的基础。

**Source:** [State of Cloud-Native 2026: CNCF CTO's Insights and Predictions](https://horovits.medium.com/state-of-cloud-native-2026-cncf-ctos-insights-and-predictions-479e6bbf793c)

### 从数据驻留到数字主权：云原生平台架构模式

CNCF博客发表了一篇关于云原生平台架构模式的重要文章，探讨了如何从数据驻留演进到数字主权的架构设计。文章提出了多种架构模式，帮助企业在多云和混合云环境中平衡合规性要求和运营效率，包括数据分类分域存储、加密密钥的本地控制、以及工作负载的地域亲和性调度策略。该文章的发布正值欧盟CADA提案引发全球云主权讨论的背景下，为云原生从业者提供了可操作的技术指导。

**Source:** [From data residency to digital sovereignty: Architectural patterns for cloud native platforms](https://www.cncf.io/blog/2026/06/16/from-data-residency-to-digital-sovereignty-architectural-patterns-for-cloud-native-platforms/)

### Docker加入Athena Coalition加强供应链安全

Docker宣布加入Athena Coalition，这是一个跨行业合作的供应链安全联盟。Docker的CISO Mark Lechner指出，2026年最大的安全事件表明攻击者越来越多地利用AI加速攻击。Athena Coalition旨在通过行业协作建立更强的软件供应链安全标准，应对AI时代日益复杂的安全威胁。

**Source:** [Docker joins the Athena coalition: a cross-industry collaboration for supply chain security](https://www.docker.com/blog/docker-joins-the-athena-coalition-a-cross-industry-collaboration-for-supply-chain-security/)

## 分析

本周的云原生动态呈现出几个关键趋势。首先，OpenTelemetry的毕业标志着云原生可观测性从碎片化走向标准化的重要转折。作为一个从合并两个重叠项目起步的社区项目，OpenTelemetry在七年内成为CNCF中项目活跃度第二高的项目，证明了行业对统一可观测性标准的强烈需求。对于平台工程团队而言，这意味着可以基于单一标准构建可观测性层，避免供应商锁定，同时保持对AI工作负载的深度可见性。

其次，Kubernetes 1.36的发布确认了Kubernetes作为AI基础设施核心平台的地位。原生gang调度、DRA标准化以及NVIDIA和Google的硬件驱动捐赠，表明Kubernetes正在从通用容器编排平台演变为AI工作负载的首席调度员。特别是llm-d进入CNCF Sandbox，标志着分布式LLM推理的Kubernetes原生方案正在走向成熟。对于AI工程团队而言，这意味着可以利用Kubernetes的声明式管理能力来编排复杂的AI推理流水线，而无需构建自定义调度基础设施。

第三，CNCF CTO的十年回顾揭示了云原生生态的深层次演进逻辑。Kubernetes的模块化设计（将存储、运行时等分离为CSI、CRI等接口）使其能够灵活适应从边缘到AI的多样化需求。这种架构哲学使得Kubernetes在十年后仍然保持活力，并成为AI工作负载的自然选择。

最后，数字主权架构模式的提出反映了地缘政治对技术架构的深远影响。企业不仅需要关注功能性和性能，还需要考虑数据驻留和合规性要求。这推动了对多云和混合云架构中数据治理模式的重新思考。

## 结论

2026年6月的云原生动态表明，云原生技术生态正在从基础设施层向AI原生平台演进。OpenTelemetry的标准化、Kubernetes AI工作负载支持的成熟、以及数字主权架构的兴起，共同勾勒出云原生技术的下一阶段发展图景。对于从业者而言，掌握基于OpenTelemetry的可观测性实践、Kubernetes DRA的AI调度能力，以及多云环境下的数据治理架构，将是保持技术领先的关键。
