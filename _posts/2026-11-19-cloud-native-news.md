---
layout: post
title: "云原生技术动态：Kubernetes准入控制性能突破与OpenTelemetry可观测性治理"
date: 2026-11-19
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/11/18/optimizing-kubernetes-admission-control-where-kyvernos-cel-admission-cost-actually-goes/"
categories:
  - cloud-native
tags:
  - kubernetes
  - kyverno
  - opentelemetry
  - performance
---

# 云原生技术动态：Kubernetes准入控制性能突破与OpenTelemetry可观测性治理

过去24小时内，CNCF生态连续发布了两篇面向生产实践的深入文章，分别聚焦Kubernetes准入控制的性能瓶颈与OpenTelemetry采集管线的配置陷阱。它们共同指向一个清晰趋势：云原生平台已经从“是否有能力”进入“能否以可接受成本稳定运行”的阶段，控制平面与可观测性链路本身正在成为性能优化的第一线。

## 主要新闻

### Kyverno揭示CEL准入控制成本的真实来源

CNCF博客于11月18日发布文章，系统分析了Kyverno基于CEL的准入控制开销来源。文章指出，在旧版本中，约86.8%的内存分配来自Kubernetes对象向`unstructured`结构的转换，而非策略表达式求值本身；修复该问题后，在64条策略的测试中，准入延迟从20.01毫秒降至0.36毫秒，分配次数从148,131次降至8,672次。变更类策略中，分配次数从258,943次降至52,689次，延迟从10.59毫秒降至2.97毫秒。文章还比较了Kyverno与原生ValidatingAdmissionPolicy：在16条策略场景下，Kyverno约20毫秒、3.2个CPU核心，而原生方案约29毫秒、8.2个核心，说明实现质量而非“原生与否”才是性能关键。

**Source:** [Optimizing Kubernetes admission control: Where Kyverno's CEL admission cost actually goes](https://www.cncf.io/blog/2026/11/18/optimizing-kubernetes-admission-control-where-kyvernos-cel-admission-cost-actually-goes/)

### OpenTelemetry管线常见配置问题被系统梳理

CNCF博客于11月17日发布文章，总结了OpenTelemetry Collector在生产环境中最常见的五类性能陷阱：批处理参数不合理、重复或过度添加资源属性、过激的抓取间隔、缺少或错误配置 trace sampling，以及memory limiter在处理器链中的位置不当。文章强调，可观测性并非“采集越多越好”，而是需要在信号完整性、下游存储成本与采集器自身开销之间取得平衡，并提出分层采集器架构：边缘节点负责过滤与聚合，中心集群负责富化与路由。

**Source:** [Is your OpenTelemetry pipeline becoming a performance bottleneck?](https://www.cncf.io/blog/2026/11/17/is-your-opentelemetry-pipeline-becoming-a-performance-bottleneck/)

## 分析

这两篇文章反映出Kubernetes生态正在进入精细化运营阶段。准入控制是集群策略执行的关键路径，过去平台团队往往只关注策略覆盖率与合规性，而忽视对象转换、序列化、分配等底层成本。Kyverno的案例分析表明，一次数据结构层面的优化就能带来两个数量级的性能提升，这对大规模多租户集群、GitOps流水线以及需要高频部署的平台至关重要。对于运行数千节点或高频扩缩容的组织，准入延迟的下降意味着更短的发布窗口和更稳定的控制平面。

同时，OpenTelemetry文章揭示了一个更广泛的误区：可观测性工具本身也是分布式系统，默认配置并不等于生产最佳配置。批处理、采样与内存限制看似只是参数调优，实则决定了遥测数据是否在高压下丢失、是否压垮后端存储，以及是否在故障期间反而加剧系统负载。分层采集器架构的提出，说明社区正在把可观测性视为需要容量规划、故障隔离和成本治理的基础设施，而非简单的日志与指标转发器。

从更宏观的角度看，这两项工作都体现了云原生从“功能驱动”向“工程经济学驱动”的转变。平台团队不再只追求引入更多策略、更多指标和更多自动化，而是开始量化每项能力的CPU、内存、延迟与运维成本。这种转变与FinOps、Platform Engineering以及AI工作负载对资源效率的极端要求高度一致：未来的平台竞争力，将更多取决于能否在有限资源下提供可预测的性能。

接下来值得关注的是，Kyverno的优化是否会被上游Kubernetes和CEL实现吸收，以及OpenTelemetry Collector是否会提供更智能的默认配置与自适应采样。随着AI推理服务大量进入Kubernetes，启动延迟、准入风暴和高基数遥测将成为新的常态压力源。能够提前建立性能基线与治理机制的团队，将更有能力支撑下一阶段的云原生工作负载。

## 结论

本期云原生动态的核心信号是：性能优化正在深入控制平面与可观测性管线内部。Kyverno的CEL准入成本分析证明，深入代码路径的剖析可以带来数量级收益；OpenTelemetry的配置陷阱梳理则提醒团队，遥测系统本身也需要架构设计与持续调优。对于平台工程师而言，下一步行动应是建立准入延迟与遥测链路的量化基线，并把这些指标纳入SLO与成本治理体系。
