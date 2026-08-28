---
layout: post
title: "云原生技术动态：Kubernetes 1.37正式发布，工作负载感知调度与nftables网络转型"
date: 2026-08-28
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/08/26/kubernetes-v1-37-release/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - AI
  - scheduling
  - networking
---

# 云原生技术动态：Kubernetes 1.37正式发布，工作负载感知调度与nftables网络转型

8月26日，Kubernetes v1.37（代号Garhwal）正式发布，为容器编排平台带来67项增强，其中16项进入Stable、23项进入Beta、27项为全新Alpha特性。围绕AI/ML工作负载的工作负载感知调度、kube-proxy向nftables的迁移，以及Metrics API在蛰伏九年后终于毕业到GA，成为本次发布最受关注的三大看点。

## 主要新闻

### Kubernetes 1.37正式发布：工作负载感知调度瞄准AI

Kubernetes 1.37的核心主轴是让调度器"看懂"工作负载的整体形状。Gang调度（KEP-4671）进入Beta，为分布式训练任务提供原生"全有或全无"的Pod放置；工作负载感知抢占（KEP-5710）让调度器在抢占低优先级载荷时按PodGroup整体权衡，而非逐个Pod破碎处理；全新的Alpha级CompositePodGroup API（KEP-5841）更允许以层级化方式刻画复杂的AI/ML工作负载。HPA scale-to-zero（KEP-2021）进入Beta并默认启用，可用对象/外部指标在负载消失时把副本缩到零，对昂贵的GPU推理负载意义重大。

**Source:** [Kubernetes v1.37: Garhwal](https://kubernetes.io/blog/2026/08/26/kubernetes-v1-37-release/)

### kube-proxy转向nftables，IPVS正式进入淘汰倒计时

1.37延续Kubernetes集群网络从IPVS/iptables向nftables的迁移主线。IPVS后端在KEP-5495下被正式弃用，nftables成为新安装的默认后端，计划在1.40禁用、1.43彻底移除。nftables依赖Linux内核5.13+，通过增量规则更新提供更优的大集群性能。未显式设置kube-proxy模式的集群将收到弃用警告（KEP-5343），运营团队需要在升级前核对内核版本并制定迁移计划。

**Source:** [Kubernetes 1.37 advances workload-aware scheduling and cluster networking](https://www.networkworld.com/article/4214824/kubernetes-1-37-advances-workload-aware-scheduling-and-cluster-networking.html)

### Metrics API九年Beta终毕业，Pod级检查点与原生PKI就位

已蛰伏Beta状态九年的metrics.k8s.io API在1.37终于毕业到GA，为kubectl top与Horizontal Pod Autoscaler提供了锁定、版本化的契约，让成本与容量工具能够更稳健地基建。安全侧，Pod级checkpoint/restore（KEP-5823）以Alpha引入，Pod证书（KEP-4317）与ClusterTrustBundles（KEP-3257）一起毕业到Stable，首次为Kubernetes提供了完整的原生工作负载PKI故事，使Pod可在无cert-manager或SPIRE外部工具的情况下实现mTLS。

**Source:** [Kubernetes cleans house, bins legacy kube-dns, IPVS, and cgroup v1](https://www.theregister.com/devops/2026/08/26/kubernetes-cleans-house-bins-legacy-kube-dns-ipvs-and-cgroup-v1/)

### 升级须知：三个叠加的破坏性变更

1.37被普遍视为一次"计划性迁移"而非例行升级。静态Pod引用API对象（configMapRef/secretRef）的隐藏bug被修复，PreventStaticPodAPIReferences特性门控被彻底移除；kubelet要求containerd 2.0+，仍在1.7的节点升级后将无法启动；cgroup v1节点需显式设置failCgroupV1:false。叠加IPVS弃用，面向受监管、本地和政务K8s部署的团队需提前做升级审计。

**Source:** [Kubernetes 1.37 Release: 3 Breaking Changes to Fix Now](https://shattered.io/kubernetes-1-37-release-breaking-changes-2026/)

## 分析

Kubernetes 1.37最鲜明的信号是平台对AI工作负载的"重塑"。CNCF的年度调查显示，82%的容器用户已在生产运行Kubernetes（2023年为66%），且三分之二的gen-AI组织用Kubernetes承载推理负载。从Gang调度、CompositePodGroup到DRA设备污点、HPAScaleToZero，1.37把"GPU与专用硬件调度"正式提升为一等公民。对平台工程团队而言，这意味着AI基础设施的编排正从靠外部工具拼装，转向Kubernetes原生能力——与CNCF博客同期讨论的"AI工厂"蓝图（以DRA、Kueue、vLLM、KServe等云原生组件搭建GPU基础设施）形成呼应。

对运维从业者，1.37是一次必须亲自规划而非自动平滑升级的版本。三个叠加的破坏性变更（静态Pod凭据引用、containerd 2.0门槛、cgroup v1硬性要求）加上IPVS弃用，意味着受监管、政务、本地集群需要把1.37当作迁移项目对待。同时，nftables转型揭示了Kubernetes愿意承受迁移阵痛以换取长期内核路线对齐的决心——这也符合社区一贯的"清理技术债"取向。

值得注意的还有原生PKI与Pod检查点的落地。Pod证书与ClusterTrustBundles让mTLS成为开箱即用的原生能力，降低了服务网格与零信任架构的落地门槛；而Pod级checkpoint/restore则为GPU冷启动优化与故障恢复打开想象空间。这些特性共同指向一个趋势：Kubernetes正从"编排容器"走向"编排可信、可恢复、面向AI的高价值基础设施"。

## 结论

Kubernetes 1.37标志着这个项目在2026年把重心明确押注在"AI原生"与"生产就绪"之上。对平台团队，建议把IPVS→nftables迁移、静态Pod凭据审计、cgroup/containerd版本核对纳入升级检查清单；对AI基础设施构建者，DRA设备污点、HPAScaleToZero与工作负载感知调度是值得立即评估的能力。下一版本1.38预计在2026年底发布，届时值得关注DRA与GPU调度特性是否继续稳定毕业，以及AI工具是否开始在社区开发流程中扮演更大角色。
