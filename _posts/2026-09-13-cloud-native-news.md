---
layout: post
title: "云原生动态：v1.37原生直方图进入Beta并默认启用、原地Pod扩缩容调度抢占进入Alpha、CNCF三项目毕业（Kubeflow/Karmada/Buildpacks）"
date: 2026-09-13
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/09/11/kubernetes-v1-37-native-histograms-beta/"
categories:
  - cloud-native
tags:
  - kubernetes
  - observability
  - native-histograms
  - prometheus
  - scheduler
  - cncf
  - kubeflow
  - karmada
---

# 云原生动态：v1.37原生直方图进入Beta并默认启用、原地Pod扩缩容调度抢占进入Alpha、CNCF三项目毕业（Kubeflow/Karmada/Buildpacks）

Kubernetes社区本周持续消化v1.37（Garhwal）这一大版本：原生直方图（Native Histograms）从v1.36的Alpha正式进入Beta并默认启用，为Kubernetes核心组件指标带来高分辨率、低基数的可观测性；v1.37还以Alpha形态引入"原地Pod扩缩容调度抢占"（Scheduler Preemption for In-Place Pod Resize），让调度器能在节点满载时为关键负载的原地扩容腾出容量。与此同时，CNCF宣布Kubeflow、Karmada与Cloud Native Buildpacks三个项目毕业，The New Stack也推出首期"Road to KubeCon"系列，直指社区向KubeCon NA 2026奔腾的另一条主线：AI工作负载正在重塑运维与访问控制。

## 主要新闻 (Main News)

### v1.37原生直方图进入Beta：核心组件指标迈向"低基数、高精度"的新度量范式

Kubernetes v1.37将原生直方图支持（KEP-5808，v1.36引入Alpha）提升为Beta并默认启用。这一特性让Kubernetes核心组件以Prometheus Native Histograms格式暴露延迟与时长类指标：与传统的固定桶直方图相比，原生直方图稀疏存储桶跨度（spans）与模式（schema），在不牺牲分位数精度的前提下大幅降低基数与存储开销。关键设计是"双暴露"（dual exposition）：同一protobuf载荷中同时保留经典桶（h.Bucket）与原生跨度（h.Schema/h.PositiveSpan），使不理解原生格式的经典Prometheus不破不立、零迁移风险；官方采用经过调优的指数配置（BucketFactor 1.1）在分辨率与序列数量间取得平衡。据社区测算，每个指标的时间序列数量最高可减少约90%，Prometheus内存与TSDB占用显著下降。对运维者而言，升级到v1.37即默认生效，唯一的动作是确认Prometheus版本与remote-write链路是否支持原生直方图，并把依赖经典桶的告警/看板逐步迁移到原生感知函数以获得更紧的分位数误差。

**Source:** [Kubernetes v1.37: Native Histograms Graduates to Beta](https://kubernetes.io/blog/2026/09/11/kubernetes-v1-37-native-histograms-beta/)

### 原地Pod扩缩容调度抢占（Alpha）：为动态资源配置补上"容量归属"的短板

Kubernetes v1.35将In-Place Pod Resize特性推向GA，使运行中容器的CPU/内存分配可动态调整而无需重启。但原地扩容有一个悬而未决的问题：当一个节点利用率已满、待扩容的Pod在该节点上"骑虎难下"时，静态的调度决策无法为新资源腾位。v1.37以Alpha引入调度抢占能力（特性门控`InPlacePodVerticalScalingSchedulerPreemption`），让调度器识别节点容量不足后，主动抢占节点上低优先级工作负载，从而为关键高优先级应用的原地扩容清出容量。该能力需在kube-apiserver、kube-scheduler与kubelet上统一启用。它把"资源分配"从Pod首次调度的静态一刻，延伸为运行期持续可变的动态博弈——结合优先级抢占语义，使企业级密度控制与工作负载优先级在"热调整"场景下首次得到调度器级的原生支持。

**Source:** [Kubernetes v1.37: Scheduler Preemption for In-Place Pod Resize (Alpha)](https://kubernetes.io/blog/2026/09/10/kubernetes-v1-37-scheduler-preemption-for-in-place-pod-resize-alpha/)

### CNCF三项目毕业：Kubeflow、Karmada与Cloud Native Buildpacks跨入"生产就绪"门槛

CNCF宣布Kubeflow、Karmada与Cloud Native Buildpacks三个项目正式毕业。Kubeflow作为Kubernetes原生的AI/ML训练平台（PyPI累计下载超2.6亿次），其毕业标志着"Kubernetes作为企业AI工作负载控制面"这一叙事获得CNCF成熟度最高级的背书，CNCF CTO Chris Aniszczyk称其为"Kubeflow作为Kubernetes上企业AI工作负载成熟选项的里程碑"。Karmada是多集群、多云Kubernetes编排项目，其v1.19版本把多组件调度推向分布式AI训练作业，为云无关、多云Kubernetes部署提供更多组合能力。Cloud Native Buildpacks则将应用代码标准化为OCI镜像。同一周期内，The New Stack首期Road to KubeCon还梳理了v1.37的其他要点：横向Pod自动扩缩"缩容到零"（scale to zero）进入Beta并默认启用、清单级准入控制进入Beta、KYAML迈向Stable，以及HPE把Morpheus Terraform Provider并入统一HPE Terraform provider（配套tfmigrator迁移工具）、AKS发布v1.37 preview等。11月9至12日将在盐湖城召开的KubeCon + CloudNativeCon NA 2026，将首次新增AI推理与智能体（agentic）专题轨道。

**Source:** [KubeCon, Kubernetes Updates, Security | The New Stack - Road to KubeCon](https://thenewstack.io/kubecon-kubernetes-updates-security/)

## 分析 (Analysis)

原生直方图默认启用，是Kubernetes可观测性基建的一次"静默升级"。它把指标范式的选择权从监控栈SDK移交给平台本身：Kubernetes以双暴露方式平滑过渡，避免重演历史上Prometheus格式演进时的断崖式迁移。对SRE与平台团队，其价值不只是省存储——存储在反指标基数爆炸的长期治理上，原生直方图的稀疏结构意味着我们可以在全集群范围启用p99/敏感分位数而不再担心"指标即负债"。实操上真正的坑在于隐性依赖：若remote-write与查询链路仍走经典桶，升级后并不会自动获得精度提升；而当前Prometheus对原生直方图的支持版本参差，误配可能导致看图"失真"。建议把"原生直方图升级清单"与v1.37升级并行推进，先在一组核心组件验证。

原地扩容的调度抢占则是调度语义从"第一次安置"向"持续治理"延伸的标志。In-Place Resize本身解决了"改YAML即重启"的性能问题，但若扩容容量无处安放，能力就是空转；这次Alpha补上了调度器侧的容量博弈。值得注意它触发的是抢占——涉及优先级驱逐，这意味着生产集群必须把PriorityClass治理真正落地，否则低优先级离线作业可能在关键负载扩容时被无差别洗牌。对企业级密度控制而言，这是"热扩缩"最后一块拼图；但对机制不完善、优先级定义混乱的集群，它带来的风险也不容小觑。建议在生产启用前先在测试集群观察抢占日志与STS/有状态应用的干扰半径。

Kubeflow的毕业与首届AGNTCon/MCPCon以及KubeCon NA新增agentic轨道放在一起看，是CNCF对"AI第一性"的又一次加注。Kubeflow夏天在中国KubeCon上获End User案例奖、招商银行将GPU利用率从35%提至60%+的案例说明，ML工作负载在Kubernetes上的"平台化回报"开始有可量化的战报；Trainer v2统一TrainJob API的演进，也让AI/ML训练与Kubernetes原生编排的粘合度进一步上升。Karmada毕业叠加多组件调度，则回应了AI训练的"多集群化"需求：当训练作业横跨多云资源池时，跨集群调度不再是行政区问题而是性能与成本问题。访问控制的提醒同样重要：OIDC+PKCE对自建集群是比长期静态证书更符合"最坏情况假设"的基线，Access control应该与网络和存储并列进入day-zero清单。

## 结论 (Conclusion)

本周v1.37的两项特性与CNCF三项目毕业，指向同一个判断：云原生平台正在把"可观测性精度、动态资源调度、AI/ML原生集成"三件事系统性嵌入发行版与治理默认值。原生直方图默认启用让指标基建免费升级，原地扩容抢占让调度器开始参与运行期容量博弈，而Kubeflow/Karmada毕业则把"Kubernetes是AI控制面"从口号变成经过安全审计与治理验证的正式地位。对实践者，未来一个季度的优先动作应是：完成Prometheus原生直方图链路验证、评估优先级抢占在动态扩容场景下的适用性，并把Kubeflow/Karmada纳入AI工作负载与多云方案的标准选型池。