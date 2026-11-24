---
layout: post
title: "Kubernetes v1.38前瞻：cgroup驱动强制上报、IPv6-only集群与平台批量升级"
date: 2026-11-24
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/11/23/kubernetes-v1-38-sneak-peek/"
categories:
  - cloud-native
tags:
  - kubernetes
  - gke
  - cgroup
  - ipv6
  - platform-engineering
---

# Kubernetes v1.38前瞻：cgroup驱动强制上报、IPv6-only集群与平台批量升级

过去24小时云原生领域的三条线索都很"底层"：Kubernetes发布团队预告v1.38将移除多项遗留兼容机制，Google把单栈IPv6带进GKE预览以解决AI集群的地址耗尽问题，VMware则展示如何用500集群控制平面和快速部署把平台升级变成批量操作。它们共同指向一个现实：云原生的瓶颈已经从"有没有功能"转向"能否大规模、低中断地升级和运行"。

## 主要新闻

### Kubernetes v1.38 Sneak Peek：kubelet将依赖容器运行时上报cgroup驱动

Kubernetes发布团队于11月23日发布v1.38前瞻，计划12月16日发布。最值得注意的破坏性变化是：kubelet默认不再允许通过配置文件设置`cgroupDriver`，而是要求容器运行时在启动前通过CRI `RuntimeConfig` RPC上报驱动类型；若运行时未就绪或不支持该RPC，kubelet会在节点注册前直接退出。`LegacyCgroupDriverFallback`特性门只是临时逃生通道，cgroup v1支持也在继续退场。与此同时，`kubectl`的WebSocket开关环境变量将被移除，kuberc预计稳定并弃用allowlist中的`name`字段，Pod级资源、DRA可分区设备预计进入稳定，新的EvictionRequest API以alpha形式让应用在被驱逐前完成清理和数据迁移。使用`LimitedSwap`的节点还需注意Pod级内存设置会改变swap行为。

**Source:** [Kubernetes v1.38 Sneak Peek](https://kubernetes.io/blog/2026/11/23/kubernetes-v1-38-sneak-peek/)

### GKE单栈IPv6进入预览：每个节点65,536个Pod地址

Google于11月18日宣布GKE单栈IPv6集群进入预览，要求GKE 1.37.1-gke.3020000及以上版本。节点与Pod不再占用私有IPv4地址，每个节点获得一个`/112` Pod地址段（65,536个地址），通过DNS64与Cloud NAT的NAT64访问IPv4-only端点。预览支持Cloud TPU v6e以及E2、N1、N2、N4、C3、C4、Axion等CPU机型；Google内部测试称Pod生命周期、跨节点TCP/UDP延迟、eBPF服务负载均衡与NodeLocalDNS均与IPv4持平，但未公开原始数据。文档也列出明确限制：不支持GKE Ingress（需改用Gateway API）、不支持Cloud Service Mesh、不能就地转换现有IPv4集群，且元数据服务器端点需要改用`metadata.google.internal`。

**Source:** [Run AI/ML workloads on IPv6-only GKE clusters](https://cloud.google.com/blog/products/networking/run-aiml-workloads-on-ipv6-only-gke-clusters)

### VMware vSphere Kubernetes Service 3.6：单控制平面500集群与链式升级

VMware Cloud Foundation博客11月23日详解VKS 3.6：单个Supervisor控制平面可管理集群数从190提升到500，Fast Deploy借助按数据存储缓存和linked-mode差分磁盘，把集群创建时间从37分钟降到11分钟（约70%），升级时间缩短75%；同时新增多网卡隔离、原生组播与通过CNI Addon Framework托管的Cilium。博客还预告了VKS 3.8：自动化链式升级只排空一次工作节点、默认禁用SSH并引入AIDE完整性检查、支持Tekton集群内CI与Argo CD同步，并在上游发布60天内支持Kubernetes 1.37。

**Source:** [Escaping the Silos: A Deep Dive into vSphere Kubernetes Service 3.6](https://blogs.vmware.com/cloud-foundation/2026/11/23/escaping-the-silos-a-deep-dive-into-vsphere-kubernetes-service-3-6-and-the-hands-on-lab-you-need-to-take/)

## 分析

v1.38的兼容项清理传递出一个清晰信号：Kubernetes正在把"隐式便利"换成"显式契约"。cgroup驱动由运行时上报，意味着节点启动顺序和CRI实现正确性成为升级前置条件；这类变化单个看都很小，但对拥有成百上千异构节点的平台团队来说，恰恰是最容易在升级窗口中爆雷的部分。EvictionRequest API则补上了长期缺失的一环——过去PDB只能说"不能驱逐"，现在应用可以在真正终止前完成数据迁移和清理，这对有状态服务和AI训练任务的优雅迁移尤其重要。

GKE的单栈IPv6则揭示了AI基础设施一个非常具体的物理约束：GPU/TPU、推理副本、Ray worker和sidecar会先耗尽RFC 1918地址，再耗尽电力和预算。IPv6不是"更先进的协议"这种口号，而是把集群网络的地址维度从稀缺变为近乎无限，并顺带消除集群内NAT，让网络策略和遥测重新具备可归因性。但预览版的限制清单提醒我们，把它当作通用集群默认选项还为时过早：Ingress、Service Mesh、双栈节点池和就地迁移都不可用，DNS64/NAT64也可能成为新的瓶颈与故障点。

把三件事放在一起看，平台工程的竞争焦点正在变成"变更成本"。v1.38要求更严格的升级前检查，GKE IPv6集群无法就地转换而需要蓝绿迁移，VKS则用500集群控制平面和链式升级把维护窗口压缩到一次排空。谁能把升级、迁移和回滚做成可重复、可验证的流程，谁就能在AI负载快速迭代的时代释放更多工程产能。对 practitioners 来说，这意味着平台团队的核心指标不再是部署速度，而是升级成功率、单集群运维密度和变更带来的应用中断时长。

未来几天值得跟踪的包括：v1.38正式发布说明中对`LegacyCgroupDriverFallback`和swap行为的最终措辞、GKE IPv6预览是否扩展到GPU与更多TPU代际、以及主要托管Kubernetes厂商是否跟进"单控制平面管理数百集群"的能力。建议现在就盘点 kuberc 配置、cgroup v1 节点、swap依赖与Ingress/Service Mesh依赖，而不是等到升级窗口前才发现兼容性债务。

## 结论

云原生正在进入基础设施的"精修期"：更严格的上游契约、面向AI规模的网络重构、以及批量化的平台运维。短期内最务实的动作是做一次升级前审计并明确回滚路径；中期则应把地址规划、优雅驱逐和升级编排视为平台能力的一部分，而不是每次发布时临时补救的杂活。
