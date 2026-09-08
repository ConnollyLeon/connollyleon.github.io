---
layout: post
title: "云原生动态：Kubernetes v1.37无root运行时进入Beta、etcd RangeStream大幅降低大列表读取内存、CNCF聚焦AI驱动的K8s采用新常态"
date: 2026-09-08
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/09/04/kubernetes-v1-37-rootless-beta/"
categories:
  - cloud-native
tags:
  - kubernetes
  - rootless
  - usernamespace
  - etcd
  - rangestream
  - cncf
  - ai-workloads
  - kubelet
---

# 云原生动态：Kubernetes v1.37无root运行时进入Beta、etcd RangeStream大幅降低大列表读取内存、CNCF聚焦AI驱动的K8s采用新常态

9月初的云原生领域呈现出一幅"安全与规模化运维并进"的画面。Kubernetes v1.37（代号Garhwal）于8月底发布后，多项重量级特性在本周陆续推进到新阶段：其中`KubeletInUserNamespace`（即无root模式）特性于9月4日正式升入Beta并默认开启，标志着Kubernetes节点层"无root运行"从长期实验走向默认能力；同一版本中，etcd RangeStream也升入Beta，通过与etcd v3.7配合，大幅削减API Server与etcd在读取大型集合时的内存占用，让峰值资源使用更可预测。与此同时，CNCF官方博客于9月4日发表文章，聚焦AI如何重新点燃企业采用Kubernetes的热情——GPU训练、突发推理与数据管道正在让K8s再次成为"既熟悉又陌生"的运维学科。三个方向分别对应节点安全、控制平面性能与AI采用三个层面，构成Kubernetes在2026年9月第一天值得关注的三条主线。

## 主要新闻

### Kubernetes v1.37：KubeletInUserNamespace（无root模式）正式升入Beta

Kubernetes官方博客于9月4日宣布，`KubeletInUserNamespace`特性门控在v1.37中升入Beta并默认开启。该特性启用后，节点上的所有组件——包括kubelet、CRI与OCI运行时、CNI插件以及kube-proxy——都可以在宿主机上以非root用户身份运行，底层借助Linux用户命名空间（user namespace）实现，这一技术也被称为"无root模式"（rootless mode）。这一工作始于2018年的实验，并于2021年在Kubernetes v1.22中作为alpha特性（KEP-2033）合并。从Alpha到Beta的关键变化包括：特性门控现在默认开启（但仅开启并不会自动把kubelet放入用户命名空间，因此既有的"有root"集群不受影响）；`kubectl get nodes -o yaml`现在会通过`runningInUserNamespace`属性报告节点是否运行在用户命名空间内，管理员可据此设置节点标签或污点，避免把真正需要root权限的工作负载（如部分CNI插件安装器）调度到无root节点上；Kubernetes自身的CI/CD测试如今也在无root集群（ci-kubernetes-e2e-kind-rootless）上运行节点一致性端到端测试。配合此前版本的一系列铺垫——Linux内核v6.3对idmapped tmpfs的支持、Kubernetes v1.33的`UserNamespacesSupport`默认启用、以及containerd v2.1对可写cgroups的支持——一个`KubeletInUserNamespace`的集群如今甚至可以嵌套在`hostUsers: false`的Pod内部。社区计划根据反馈与采用情况，在未来的版本中将其推进到GA。

**Source:** [Kubernetes v1.37: KubeletInUserNamespace (aka Rootless mode) Graduates to Beta](https://kubernetes.io/blog/2026/09/04/kubernetes-v1-37-rootless-beta/)

### Kubernetes v1.37：etcd RangeStream将大列表读取内存占用从O(N)压低到稳定峰值

Kubernetes官方博客于9月1日宣布，etcd RangeStream在v1.37中升入Beta。etcd v3.7新增了流式版本的读取RPC——`RangeStream`，它接受与`Range`相同的请求并返回相同的结果集，但不再一次性在内存中构建整个响应，而是将结果集拆分成多个块进行流式传输。块的大小会根据返回对象的大小自适应调整（按字节而非键数量进行上限约束），并随着流的推进及时释放内存，而不是等待整页组装完成后才释放。特性启用后，API Server会在需要读取整个集合的地方使用`RangeStream`，包括watch缓存初始化以及无法从缓存满足的大规模list请求；无论哪种情况，API Server都会在接收到每一个块后立即解码并释放，再从etcd拉取下一块，从而让两端都不再持有整个集合。使用条件为Kubernetes v1.37及以上、etcd v3.7及以上，并启用`EtcdRangeStream`门控（v1.37中为Beta且默认开启）。API Server会在启动时解析etcd的能力，并在运行时遇到`Unimplemented`错误时自动回退到旧的分页`Range`路径，因此与旧版etcd搭配时仍可安全运行。这一特性对大规模集群意义重大：在租户众多、资源对象繁多的生产环境中，一次大型list读取峰值内存此前常常成为控制平面的压力源，而流式读取把"一次性爆发"变成"受限的平稳消耗"。

**Source:** [Kubernetes v1.37: etcd RangeStream Cuts Memory Use on Large List Reads](https://kubernetes.io/blog/2026/09/01/kubernetes-v1-37-etcd-range-stream/)

### CNCF：AI让Kubernetes"既新又险"——采用热潮之下更需平台治理

CNCF官方博客于9月4日发表由Fairwinds CTO Andy Suderman撰写的文章，讨论AI如何成为Kubernetes采用的新驱动力。文章指出，尽管Kubernetes已不再年轻，但对许多团队而言，采用它仍然令人望而生畏。与此同时，一批组织正以AI为主要驱动力涌入Kubernetes：AI栈带来了GPU、突发流量与更严格的数据边界，让Kubernetes——即便是已习惯了在K8s上部署的团队——看起来如同一门全新的运维学科。训练需要大规模的突发算力，推理需要干净的扩缩容与自动恢复，数据管道则需要一个与应用栈紧邻的一致控制平面。文章的核心观点是：如今搭建一个基本集群比以往任何时候都简单（可以轻松尝试GKE、AKS、EKS等托管方案），真正的考验在于能否在不烧穿GPU预算、不饿死集群内其他应用、不拖慢核心服务、不削弱安全性的前提下承载生产级AI工作负载。这意味着平台团队必须主动管理作业放置、保持GPU利用率、并在实验出错时为平台稳定性设立护栏。

**Source:** [Kubernetes isn't new, but AI makes It scary again | CNCF](https://www.cncf.io/blog/2026/09/04/kubernetes-isnt-new-but-ai-makes-it-scary-again/)

## 分析

无root模式升入Beta是一个值得解读的节点。它看起来只是又一个特性门控，实则标志着Kubernetes节点层的安全默认值正在发生迁移：让kubernetes的所有组件以非root用户运行，直接削减了容器逃逸与节点失陷时攻击者的权限收益，是纵深防御中"最小权限"在基础设施层面的落实。`runningInUserNamespace`属性的引入则把这一能力与调度决策打通——管理员可以在主机层面表达"此节点安全边界更高"的语义，从而在混合rootful/rootless集群中做出精细的资源放置。对安全要求苛刻的供应商（如托管K8s、边缘设备、多租户SaaS）而言，rootless即将成为可默认宣称的企业级卖点；而对自建集群的用户，这意味着需要在升级v1.37时重新审视节点标签、污点与工作负载的root依赖。

etcd RangeStream的Beta则是控制平面可扩展性的经典优化。Kubernetes控制平面的内存峰值压力，长期集中在"一次性list全量资源"这个模式上，尤其在API Server重启、watch缓存重建或大规模租户场景下尤为明显。RangeStream通过把"整体读取"变成"流式分块读取"，把应用逻辑从os-首页式的一次性加载改为可预测的持续消耗，配合自适应的块大小，能够在不改变API语义的前提下显著降低峰值。更重要的是，其优雅的回退机制（遇到不支持RangeStream的etcd时自动回到分页Range）体现了Kubernetes向后兼容的一贯哲学。对于运营大规模集群的平台团队，这一特性直接关系到控制平面的稳定性预算——值得在升级后通过压测验证其真实收益。

CNCF对"AI重启Kubernetes采用"的讨论，则把视角从单个特性拉回到生态层。近几周我们反复看到同一个叙事：66%的组织在Kubernetes上运行生成式AI工作负载，但只有少数能实现日常部署节奏。AI让Kubernetes"重新变难"，并非因为平台本身退化，而是因为AI负载在用平台团队不熟悉的节奏（突发、GPU紧耦合、按组调度）冲刷既有抽象。这提醒我们：AI落地的瓶颈往往不在模型而在平台治理——作业放置、配额、GPU利用率与安全护栏，才是决定AI上K8s成败的关键变量。

对实践者而言，值得跟踪三件事：其一，KubeletInUserNamespace从Beta走向GA的节奏，以及主流托管K8s是否会将no-root作为默认节点配置；其二，etcd RangeStream在真实大规模集群中的内存压测数据，以及与更老etcd版本混搭时的回退表现；其三，围绕"AI工作负载平台化"，Kubernetes的gang scheduling、HPA scale-to-zero、DRA等在v1.37集中涌现的新特性，能否真正改善AI负载的部署体验。

## 结论

9月首周的云原生新闻勾勒出一个正在"安全化与规模化运维"两端同时发力的Kubernetes：KubeletInUserNamespace把无root运行推向默认，etcd RangeStream把控制平面的大列表读取从O(N)内存爆发变成平稳的流式消耗，而CNCF则提醒我们，AI正在让Kubernetes重新获得战略重要性——但前提是平台团队能驾驭GPU、突发流量与数据边界带来的新复杂度。对平台团队的建议是：在升级v1.37时评估rootless节点的标签与调度策略，尽快通过RangeStream验证控制平面在大型list场景下的内存收益，并围绕AI负载建立从作业放置到安全护栏的完整治理闭环。
