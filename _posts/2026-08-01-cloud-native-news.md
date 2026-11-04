---
layout: post
title: "Kubernetes v1.37发布前瞻：metrics.k8s.io转GA、StatefulSet新增Recreate策略与CRI检查点恢复RPC"
date: 2026-08-01
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/07/31/kubernetes-v1-37-sneak-peek/"
categories:
  - cloud-native
tags:
  - kubernetes
  - metrics.k8s.io
  - CRI
  - statefulset
  - GKE
  - OPI
  - cloud-native
---

# Kubernetes v1.37发布前瞻：metrics.k8s.io转GA、StatefulSet新增Recreate策略与CRI检查点恢复RPC

Kubernetes官方发布v1.37版本前瞻博客，确认发布计划定于8月26日。本次版本主打"成熟度毕业"：metrics.k8s.io API在历经约九年Beta后转正GA，kubelet Rootless模式进入Beta；同时v1.37.0-beta.0发布StatefulSet全新Recreate更新策略与CRI检查点/恢复RPC。此外，Google Cloud的GKE Agent Sandbox展示如何将AI代理密度提升3.5倍，Linux基金会OPI项目发布首个DPU/IPU标准化抽象层。

## 主要新闻

### Kubernetes v1.37发布前瞻：metrics.k8s.io九年Beta后转GA，kubelet Rootless进入Beta

Kubernetes团队于7月31日发布v1.37发布前瞻。metrics.k8s.io API预计在v1.37中正式毕业为GA（Stable），该API为Pod和Node提供标准化的CPU与内存用量获取方式，是Horizontal Pod Autoscaler（HPA）和kubectl top等核心功能的支撑，自Beta至今已近九年。KEP-2033"Kubelet in User Namespace（Rootless Mode）"自v1.22首次Alpha后终于进入Beta，允许kubelet等节点组件以宿主非root用户运行，同时在内命名空间中保持root权限，增强节点组件隔离性。CSI Volume Health方面，相关KEP重置为Alpha并新增四个CSI RPC（ControllerListVolumeHealth、ControllerGetVolumeHealth等），用于监控存储卷健康状态并写入PersistentVolumeClaim.status.healthStatus。同时cgroup v1的淘汰持续进行，现代Linux发行版与容器运行时已默认cgroup v2。

**Source:** [Kubernetes v1.37 Sneak Peek](https://kubernetes.io/blog/2026/07/31/kubernetes-v1-37-sneak-peek/)

### Kubernetes v1.37.0-beta.0发布：StatefulSet新增Recreate策略与CRI检查点恢复RPC

Kubernetes v1.37.0-beta.0在代码冻结期间发布，两大核心变更值得关注。其一，StatefulSet新增第三种更新策略Recreate——此前的RollingUpdate与OnDelete之外，Recreate策略将先拆除整个有状态服务集再启动新版本，与Deployment的Recreate策略形态一致，适用于具有稳定网络标识和挂载存储的工作负载。其二，KEP-5823为v1.RuntimeService CRI接口新增CheckpointPod与RestorePod两个RPC，将此前kubelet侧与运行时侧的实验性功能提升为所有符合规范的运行时必须响应的接口契约，为Pod热迁移和长期调试工作流（如侵入式变更前快照状态）铺路。该版本同时将PLEGOnDemandRelist与InPlacePodVerticalScalingInitContainers转GA，metrics.k8s.io切换到v1 API，ClusterTrustBundle转stable。同批发布的v1.36.3补丁修复了kubelet内存泄漏回归、DRA调度与allocator缺陷、server-side apply回归及kubeadm etcd learner相关改进。

**Source:** [Kubernetes 1.37 beta lands a StatefulSet Recreate strategy and CRI pod checkpoint RPCs](https://dev.to/leobaniak/kubernetes-137-beta-lands-a-statefulset-recreate-strategy-and-cri-pod-checkpoint-rpcs-2a95)

### GKE Agent Sandbox：编排优先将AI代理成本降低75%

Google Cloud发布GKE Agent Sandbox技术实测，展示如何通过gVisor沙箱与Pod快照编排将单节点AI代理密度提升至3.5倍、每代理成本降低最多75%。在n2-standard-48虚拟机上运行OpenClaw代理框架的测试中，微VM（如Kata容器）方案在61个代理时达到上限；迁移至GKE Agent Sandbox（基于gVisor开源安全容器沙箱）后提升至88个，增幅44%，每代理成本降低30%以上。更关键的是编排层：利用GKE Pod快照将空闲代理checkpoint到持久存储并释放CPU/内存资源，任务到达时在毫秒级恢复。成本优化配置下单节点可运行274个OpenClaw代理（基线3倍以上）且启动时间保持在5秒内；性能优化配置（Agent Sandbox Warm Pools）可运行133个。该服务自5月GA以来使用量在四周内增长超过7倍。

**Source:** [Reduce your agent's costs by 75% with GKE Agent Sandbox](https://cloud.google.com/blog/products/containers-kubernetes/reduce-your-agents-costs-with-gke-agent-sandbox)

### OPI项目发布首个协同版本Abstraction v0.1.0：标准化DPU/IPU生态

Linux基金会Open Programmable Infrastructure（OPI）项目发布首个协同版本OPI Abstraction v0.1.0，建立横跨26个仓库的厂商中立API层，使工作负载、编排器和平台无需硬件专属代码即可编程符合规范的DPU/IPU。该版本聚焦三大目标：开放API、与Kubernetes的无缝集成、以及可直接使用的终端用户Blueprint。首个官方Blueprint——Kubernetes Network Function Offload——由F5/NGINX、Red Hat等联合开发，采用Red Hat OpenShift进行编排、F5 NGINX作为应用交付控制器。Linux基金会表示，DPU/IPU提供了卸载、加速、安全与生命周期管理能力，但生态需要开放API和可复现的部署模式才能规模化落地。

**Source:** [Open Programmable Infrastructure Project Announces First Coordinated Release "Abstraction"](https://www.prnewswire.com/news-releases/open-programmable-infrastructure-project-announces-first-coordinated-release-abstraction-to-standardize-dpu-and-ipu-ecosystems-302839261.html)

## 分析

本周Kubernetes v1.37的发布前瞻与beta版本清晰地呈现了项目成熟度的演进方向：大量长期Beta特性迎来毕业。metrics.k8s.io在近九年后转GA，意味着其API契约正式稳定，依赖HPA等机制的自动扩缩容体系将获得更坚实的基座；ClusterTrustBundle转stable、Pod证书相关API稳定化，则反映了工作负载身份（mTLS）基础设施的成熟。对于平台工程团队而言，8月26日GA发布前的这段时间是审计API版本依赖与节点环境（尤其cgroup v1与containerd 1.x）的关键窗口。

CRI检查点/恢复RPC进入beta具有更深远的架构意义。将CheckpointPod/RestorePod纳入CRI接口契约，意味着Pod热迁移将不再依赖特定运行时实验能力，而成为平台工具可以依赖的标准接口。这与Kubernetes长期以来"Workloads are not guaranteed to be live migrated"的定位形成张力——虽然该API落地为标准化能力仍需工具链完善，但它预示着节点维护、集群重组与故障转移的运维范式可能出现变化。

GKE Agent Sandbox的测试数据揭示了AI代理经济学的转变。微VM隔离模型带来的每代理操作系统开销，在代理规模化部署时成为不可忽视的成本项；而gVisor沙箱加Pod快照的组合，将隔离边界与资源回收能力解耦。值得关注的是"thundering herd"问题——大量代理同时唤醒时的资源风暴——GKE通过warm pools与suspend/resume提供了可调的成本-延迟滑杆。这种"编排优先"的思路正成为运行大规模agentic工作负载的平台团队的标准范式。

OPI Abstraction的发布则从硬件抽象层面回应AI基础设施的碎片化问题。DPU/IPU作为AI集群Scale Up/Scale Out的关键组件，此前受困于各家专有SDK、工具链与API的割裂。厂商中立的抽象层加上Kubernetes集成的Blueprint（首个聚焦网络功能卸载），为云原生网络功能与AI工作负载在可编程硬件上的标准化部署提供了现实路径。综合来看，本周动态指向同一趋势：无论是控制面API毕业、运行时能力标准化、代理编排经济学还是可编程硬件抽象，云原生平台正在全面进入"生产级硬化"阶段。

## 结论

对于云原生从业者，接下来几周的行动重点明确：在v1.37 GA前完成API版本依赖审计（尤其metrics.k8s.io从beta/v1的迁移）、评估cgroup v2与containerd 2.x的升级路径，并在测试环境验证StatefulSet Recreate策略与CRI checkpoint RPC对自身工作负载的兼容性。运行大规模AI代理的团队应认真评估GKE Agent Sandbox式的编排模式（gVisor隔离+Pod快照恢复）以优化单位经济学。关注DPU/IPU的团队则应跟踪OPI Abstraction演进——它可能成为未来AI集群与网络功能标准化部署的重要基础设施。
