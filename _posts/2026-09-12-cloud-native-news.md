---
layout: post
title: "云原生动态：Kubernetes v1.37蝉联主线、In-Place Pod Resize抢占式调度Alpha落地、Atlassian拆解分布式AI训练的可观测性基建"
date: 2026-09-12
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/09/10/kubernetes-v1-37-scheduler-preemption-for-in-place-pod-resize-alpha/"
categories: [news]
tags: [cloud-native, kubernetes, v1.37, scheduler, karmada, AI, observability]
---

# 云原生动态：Kubernetes v1.37蝉联主线、In-Place Pod Resize抢占式调度Alpha落地、Atlassian拆解分布式AI训练的可观测性基建

随着KubeCon + CloudNativeCon North America（11月9-12日，盐湖城）临近，云原生社区的叙事正围绕Kubernetes v1.37 "Garhwal"密集展开：The New Stack本周盘点v1.37的67项增强、Karmada与Kubeflow、Cloud Native Buildpacks三连毕业，并重提"访问控制应该进入Day-0清单"的警示；Kubernetes官方博客发布了In-Place Pod Resize抢占式调度（Alpha）的技术细节；CNCF博客则刊出Atlassian工程师关于分布式AI训练如何做好可观测性与容错基座的实践长文。算力上行、调度深入与AI训练基建，仍是云原生舞台的三根主梁。

## 主要新闻 (Main News)

### Road to KubeCon首期盘点：Kubernetes v1.37 "Garhwal"的67项增强与CNCF三连毕业

The New Stack本周推出Road to KubeCon系列首期，为11月的北美峰会热身。看点集中在三处：其一，Kubernetes v1.37带来67项增强（16项稳定、23项Beta、27项Alpha、1项弃用），其中弹性watch缓存初始化、HPA scale-to-zero进入Beta并默认启用、基于清单的准入控制进入Beta、Pod级checkpoint/restore进入Alpha；其二，CNCF在近期（尤其KubeCon China期间）接连宣布Kubeflow、Karmada与Cloud Native Buildpacks毕业——Karmada v1.19为多集群分布式AI训练的多组件协同调度、优先级调度（Beta默认开启）提供了新能力，2800+ GitHub star与Bloomberg、Alibaba Cloud、华为、Trip.com等生产级采用者背书；其三，CNCF大使Kolawole Olowoporoku在CNCF博客重申"访问控制应与网络、存储一并写入Day-0清单"，抨击大量自建集群仍依赖静态客户端证书与长期token，推荐OIDC Provider + PKCE的集成路径。此外，VMware Cloud Foundation 9.1.1把K8s观测周期从五分钟拉低到两秒、内置VCF AI助手，AKS则发布v1.37 preview与节点池自动扩缩容GA。

**Source:** [Kubernetes v1.37 brings 67 enhancements. Which matter for operators? - The New Stack](https://thenewstack.io/kubecon-kubernetes-updates-security/)

### In-Place Pod Resize + 抢占式调度（Alpha）：让"Deferred"扩容不再卡死在满节点上

Kubernetes官方博客详解v1.37引入的关键调度能力：为In-Place Pod Resize加入调度器抢占（`InPlacePodVerticalScalingSchedulerPreemption` feature gate，Alpha）。此前Pod热扩容受限于所在节点剩余可分配容量——若低优先级工作负载占满了headroom，高优先级Pod的动态扩容请求会被标记为`Deferred`并无限期挂起，运维者只能在"低利用率但有余量"与"关键服务扩容被阻塞"之间二选一。新特性让kube-scheduler锁定携带`Deferred`状态的Pod参与活跃调度，在其所在节点上通过抢占低优先级"牺牲者"Pod来腾出本地容量，且抢占严格限定在同一节点、遵循PodDisruptionBudget与优雅终止语义；Kubelet则完全让渡抢占决策，避免双头操作。架构上，该特性把"资源扩容也视为已占用"以避免双重分配竞态，并允许管理员通过Node的`spec.podPreemptionPolicy`按节点关闭此行为。官方同时给出Alone测试路径：两个PriorityClass + 3CPU低优先级Pod + 4CPU高优先级Pod，在8核节点上复现`ResizeDeferred`→`ResizeStarted`→`ResizeCompleted`的完整生命周期。

**Source:** [Kubernetes v1.37: Scheduler Preemption for In-Place Pod Resize (Alpha) - Kubernetes Blog](https://kubernetes.io/blog/2026/09/10/kubernetes-v1-37-scheduler-preemption-for-in-place-pod-resize-alpha/)

### Atlassian：为分布式AI训练打造可靠的云原生基座

CNCF博客刊出Atlassian工程师Abhi Kulkarni与Shishir Jindal的实践分享：当训练任务跨出单节点后，瓶颈几乎都出现在应用层很少当作问题的位置——集群协调、容错、可观测性与存储。文章核心观点是"把GPU拉起来、把集群立起来不再是目标"，真正的挑战在于让跨节点的同步训练（如PyTorch torchrun/弹性模式）在上百个GPU规模下稳定运行：需要在训练流程中内置checkpointing与故障重试、把Kubernetes的Pod/Job语义与训练框架的弹性调度对齐，并用Prometheus/Tempo/OpenTelemetry一类的CNCF栈把显存压力、梯度同步耗时、E2E延迟与丢失节点事件全部指标化。作者以Atlassian生产实践说明，云原生基金会对分布式AI训练的价值不在于"编排本身"，而在于用一套供应商中立的可观测与恢复语义，把昂贵的GPU训练任务变成可诊断、可恢复的确定性过程。

**Source:** [Building a reliable cloud native foundation for distributed AI training - CNCF Blog](https://www.cncf.io/blog/2026/09/11/building-a-reliable-cloud-native-foundation-for-distributed-ai-training/)

## 分析 (Analysis)

本周云原生新闻的主题词是"规模化之后的精细度"。Kubernetes v1.37把67项增强中的绝大多数投向了AI工作负载的调度与生命周期管理：In-Place Pod Resize抢占解决的是"GPU/CPU份额寸土寸金时的优先级秩序"，HPA scale-to-zero与弹性watch缓存优化服务的是成本与超大集群的可用性，Karmada v1.19的多组件协同调度则把多集群、多云编排推进到分布式训练的落地场景。这标志着一个清晰的分层演进：从"把容器跑起来"→"把集群跑稳定"→"把昂贵算力用彻底"。对平台团队而言，v1.37的Beta/GA数量提醒我们，升级规划需要把调度语义变化（尤其scale-to-zero默认开启）纳入工作负载兼容性评估，而不是当普通安全补丁处理。

In-Place Pod Resize抢占的技术意义同样值得关注。热扩容此前是"靠预留率换确定性"的二元博弈——要么保持低利用率换取突发吞吐，要么接受扩容被`Deferred`挂起。把抢占引入动态扩容，等于把已有的placement抢占语义扩展到了运行时资源再平衡，且由调度器统一裁决、尊重PDB与优雅终止，设计上相当克制。它的实践风险与我们上期讨论的容灾话题一脉相承：任何"自动腾挪"都必须有可验证的预算与恢复路径，否则节省的容量会被一次误抢占的线上事故全部赔回去。粒度的越界仍是一个待讨论问题——本地抢占是否会引发长尾多次抢占抖动，尚需真实集群的观测数据。

Atlassian与Karmada两个案例则从两侧印证了"AI训练的基础设施化"方向：开放治理的多集群控制面（Karmada）解决跨云资源协同，工程实践（Atlassian）把可观测与容错变成训练任务的默认能力。两者的共同前提是承认一个现实——AI训练任务的价值密度极高，任何缺乏可见性与恢复保障的编排都是对GPU预算的浪费。这与CNCF上周强调的"可观测、可恢复、可治理"三要素完全闭环。

展望下周，值得关注的新信号包括：KubeCon Chicago系列路演对v1.37落地反馈的汇总、Karmada v1.19在实际AI训练集群的采用曲线，以及In-Place Pod Resize抢占特性在CNCF生态（如Karpenter、Cluster Autoscaler）中的集成计划。对美国中部与全球云原生团队而言，"v1.37 + AI训练 + 多集群"大概率是未来两三个月KubeCon讨论的主轴。

## 结论 (Conclusion)

Kubernetes v1.37把调度精细度、成本效率与多集群协同推到了一个新高度，而Atlassian的实践再次确认：在AI训练成为核心负载的时代，云原生的价值主张正从"提供抽象"转向"提供可验证的确定性"。对实践者，建议立即核查三件事——集群是否已具备OIDC/PKCE身份集成（而不是静态证书）、是否评估过HPA scale-to-zero对现有有状态工作负载的影响、以及分布式训练任务是否有可复现的恢复演练。算力越贵，工程纪律越值钱，这是云原生在AI时代不变的底层逻辑。