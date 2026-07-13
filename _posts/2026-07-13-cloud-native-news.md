---
layout: post
title: "Kubernetes 1.36 GPU调度革新与OpenTelemetry毕业：云原生进入AI时代"
date: 2026-07-13
author: "云原生观察"
source: "https://tfir.io/kubernetes-1-36-gpu-scheduling-dra-kubelet-security/"
categories:
  - cloud-native
tags:
  - kubernetes
  - gpu-scheduling
  - opentelemetry
  - ai
  - cncf
---

# Kubernetes 1.36 GPU调度革新与OpenTelemetry毕业：云原生进入AI时代

本周云原生领域迎来两项重磅进展：Kubernetes 1.36"Haru"版本正式引入了原生GPU调度能力，同时OpenTelemetry宣布从CNCF毕业。这两项里程碑标志着云原生技术栈正从传统的容器编排平台全面演进为面向AI时代的分布式操作系统。

## 主要新闻 (Main News)

### Kubernetes 1.36发布：原生GPU调度与Workload Aware Scheduling

Kubernetes 1.36代号"Haru"于2026年4月22日发布，带来了面向AI/ML工作负载的原生调度能力。核心特性包括引入PodGroup API实现原子化的gang scheduling——所有Pod要么全部调度成功，要么全部不调度，彻底解决了分布式训练任务中部分Pod成功调度导致GPU资源闲置的问题。

动态资源分配(DRA)在1.36中进一步演进，Workload和PodGroup两个API的分离使得GPU声明可以精确到工作负载级别。NVIDIA和Google已在KubeCon Europe 2026上分别将DRA GPU驱动和TPU驱动捐赠给CNCF，标志着DRA已成为GPU管理的标准接口。此外，Mutating Admission Policies通过CEL表达式达到稳定状态，Kubelet细粒度授权也已GA。

**Source:** [Kubernetes 1.36 GPU Scheduling, DRA, and Kubelet Security](https://tfir.io/kubernetes-1-36-gpu-scheduling-dra-kubelet-security/)

### OpenTelemetry从CNCF毕业，成为云原生可观测性事实标准

CNCF宣布OpenTelemetry(OTel)正式毕业，加入Kubernetes、Prometheus等核心项目的行列。OTel目前拥有来自2800多家公司的12000多名贡献者，JavaScript和Python API包的年下载量分别超过13.6亿次和13亿次，项目速度在CNCF生态中仅次于Kubernetes。

CNCF CTO Chris Aniszczyk表示："OTel已经成为可观测性世界的Kubernetes。"GenAI语义约定已集成到VS Code Copilot、OpenAI Codex和Claude Code中，为AI工作负载提供标准化的遥测数据采集能力。Azure Monitor、Amazon CloudWatch和Google Cloud Observability均已原生支持OTLP摄入。

**Source:** [CNCF Announces OpenTelemetry's Graduation](https://www.cncf.io/announcements/2026/05/21/cloud-native-computing-foundation-announces-opentelemetrys-graduation-solidifying-status-as-the-de-facto-observability-standard)

## 分析 (Analysis)

Kubernetes 1.36的Workload Aware Scheduling从根本上改变了GPU资源的调度模型。在传统的Device Plugin模式下，用户只能请求"1个GPU"这样的整数资源，调度器无法感知GPU的具体型号、显存大小或NVLink拓扑。DRA引入的ResourceClaim API将硬件需求描述与Pod调度分离，使得工作负载可以声明具体需要什么（如"80GB显存的H100 GPU"），由调度器的控制面来决定如何满足这一需求。这对于运行大规模LLM训练和推理的企业来说，意味着GPU利用率可以显著提升，运维复杂度大幅降低。

OpenTelemetry的毕业同样具有深远意义。随着AI工作负载的爆发式增长，传统的可观测性工具面临严峻挑战——分布式AI agent、临时推理节点、GPU原生基础设施的遥测需求远超传统微服务的范畴。OTel的GenAI语义约定为LLM调用提供了标准化的追踪维度（模型名称、token用量、延迟、完成原因），使得团队可以在不同LLM供应商之间切换而无需重新插桩。这与CNCF CTO所比喻的"Linux从服务器扩展到手机和太空"的路径完全一致。

两项进展的结合预示着一个清晰趋势：Kubernetes正在从"运行容器的平台"演变为"运行AI的分布式操作系统"。2026年CNCF年度调查发现，66%运行生成式AI推理的组织使用Kubernetes管理部分或全部工作负载。随着DRA和gang scheduling的成熟，这一比例将继续攀升。

## 结论 (Conclusion)

Kubernetes 1.36和OpenTelemetry毕业共同勾勒出云原生技术的下一个十年蓝图。GPU调度的原生化消除了AI基础设施的关键瓶颈，而标准化的可观测性为复杂AI系统的运维提供了坚实基础。对于平台工程师和SRE团队来说，现在是将AI工作负载视为一等公民进行架构设计的最佳时机。随着KubeCon Japan 2026（7月28-30日）的临近，更多关于云原生AI的技术创新值得期待。
