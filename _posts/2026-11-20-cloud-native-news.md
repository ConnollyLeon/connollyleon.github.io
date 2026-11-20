---
layout: post
title: "云原生技术动态：GKE原地迁移Dataplane V2、EKS流日志注入Pod元数据与Kubernetes 1.38的AI调度演进"
date: 2026-11-20
author: "云原生观察"
source: "https://cloud.google.com/blog/products/networking/gke-dataplane-v2-in-place-migration"
categories:
  - cloud-native
tags:
  - kubernetes
  - gke
  - eks
  - ebpf
  - ai-scheduling
  - cloud-native
---

# 云原生技术动态：GKE原地迁移Dataplane V2、EKS流日志注入Pod元数据与Kubernetes 1.38的AI调度演进

11月19日至20日，云原生基础设施围绕AI工作负载出现三项关键进展：Google为GKE Dataplane V2推出原地迁移预览，AWS让VPC流日志直接携带EKS的Pod元数据，Kubernetes 1.38则把etcd对象压缩、成组调度与动态资源分配推向新阶段。这些更新共同指向一个方向：Kubernetes正在为大集群、GPU调度与智能体工作负载重做底层管道。

## 主要新闻

### GKE Dataplane V2推出原地迁移预览

Google Cloud于11月19日宣布GKE Dataplane V2原地迁移进入预览。Dataplane V2基于eBPF与开源Cilium构建，用于替代传统iptables路由与kube-proxy；此前承载有状态工作负载、已有固定IP分配的集群要迁移，往往需要并行重建集群，现在可直接在原集群上分三阶段完成：先做资格与预检（检查Pod IP段容量、通过Active Assist排查不兼容配置如托管接口上的自定义eBPF程序），再用一条gcloud update命令启动，最后由GKE按维护窗口、排除项与升级策略自动滚动升级，并在最终确认前随时回滚。该功能支持VPC-native且运行GKE 1.35及以上的集群，不支持routes-based或运行Calico的集群。启用网络策略时最多支持15,000节点，禁用时可达65,000节点，同时承载GPU/TPU集群与基于DRA的网络设备分配。

**Source:** [GKE Dataplane V2 in-place migration](https://cloud.google.com/blog/products/networking/gke-dataplane-v2-in-place-migration)

### AWS让VPC流日志直接携带EKS的Pod元数据

AWS于11月19日宣布Amazon VPC Flow Logs为每条记录加入Amazon EKS元数据：发送或接收流量的Pod名称，以及所属集群、命名空间与标签。此前流日志只显示网络接口与IP地址，而Pod生命周期短暂，安全排查时该IP可能已属于另一个Pod，团队不得不在每个节点上运行监控软件或自建关联工具；现在一条日志同时给出VPC与Kubernetes上下文，即使Pod被替换也能追溯到正确的租户。该能力适用于EC2上的Pod（含EKS Auto Mode、托管节点组与自管节点组）中使用Amazon VPC CNI的场景，无需修改集群或应用，无额外费用，并在所有支持EKS的区域提供。

**Source:** [Amazon VPC Flow Logs now supports Amazon EKS metadata](https://aws.amazon.com/about-aws/whats-new/2026/11/amazon-vpc-flow-logs-amazon-eks-metadata/)

### Kubernetes 1.38聚焦AI调度、GPU分配与超大集群

CloudNewsWired 11月19日报道，KubeCon北美大会期间CNCF与厂商披露了Kubernetes面向AI工作负载的演进路线：CNCF 2026年1月年度调查显示，66%托管生成式AI模型的组织使用Kubernetes做推理。AWS把Kubernetes从常规5,000节点推向10万节点集群；在百万Pod基准测试中，API server watch cache中的锁曾让写入等待超过半秒，改用惰性快照后降到2毫秒；HPA处理去除串行化、调度器改用增量卷引用计算，已在1.37发布。1.38计划把API对象压缩后再写入etcd（alpha，代码已合入）。成组调度通过Workload与PodGroup API让分布式训练任务"凑齐人再开跑"，拓扑感知放置与CompositePodGroups目标进入beta；DRA则推进可分区设备、分数容量范围与设备绑定条件。Karpenter开始建模实例上的设备，让GPU容量从零按需扩容；containerd 2.2的并行解包把10GB镜像从仓库到节点的耗时从两分钟降到45秒以内（AWS测试数据）。

**Source:** [Kubernetes Work Targets AI Scheduling, GPU Allocation and Large-Cluster Scale](https://cloudnewswired.com/2026/11/19/src-19ab315c/)

### GKE支持在纯IPv6集群上运行AI/ML工作负载

Google Cloud于11月18日宣布GKE单栈IPv6进入预览：节点与Pod均使用IPv6地址、不分配私有IPv4地址，适用于Cloud TPU v6e与包括Axion在内的CPU节点池，并通过DNS64/NAT64访问IPv4端点。对大规模AI训练集群而言，这直接缓解了IPv4地址耗尽与IP地址规划的复杂度。

**Source:** [Run AI/ML workloads on IPv6-only GKE clusters](https://cloud.google.com/blog/products/networking/run-aiml-workloads-on-ipv6-only-gke-clusters)

## 分析

这四条消息放在一起看，云原生平台正在同时解决两类瓶颈：控制平面的规模，以及数据平面的可观测性。GKE把eBPF数据平面做成可原地迁移的能力，本质上是把"网络架构升级"从重建集群的工程项目降格为一次可回滚的运维操作；对运行有状态服务的团队来说，这消除了采用新数据平面的最大心理障碍。AWS把Pod身份直接写进VPC流日志，则把网络层与Kubernetes层的取证链路合并，减少了安全事件中"IP属于谁"的猜测成本。两者都说明，平台竞争已从功能有无转向迁移成本与运维体验。

Kubernetes 1.38的路线图透露出更深层的结构性变化：AI工作负载正在倒逼调度语义升级。传统调度器以单个Pod为单位做放置决策，而分布式训练与拆分推理需要"整组成功才启动"的成组准入、拓扑感知的通信局部性，以及能描述GPU分区与分数容量的DRA。AWS把集群推到10万节点、百万Pod，还要压缩etcd对象，说明大集群瓶颈已不在节点数量本身，而在API server、存储与调度器的协同效率。对企业而言，升级到1.38前应重新审视自己的资源请求模型：按整块GPU申请的习惯，很可能无法利用即将成熟的可分区设备能力。

智能体工作负载也在改变基础设施假设。Google把15,000节点网络策略能力、GPU/TPU网络初始化与单栈IPv6一起推进，是因为智能体会带来大量短生命周期沙箱与高频IP churn，传统iptables与IPv4规划都难以承受。Kubernetes从"调度无状态容器"走向"调度多类计算单元"，网络层必须先完成重构，容器运行时、调度器与存储层的演进才有意义。

对平台运维团队来说，接下来需要关注三件事：一是GKE原地迁移预览期的边界条件（IP容量、自定义eBPF程序、Calico不支持），应在测试集群先跑一遍；二是EKS流日志中的新字段如何接入现有SIEM与成本归因流程，避免多一套日志格式又多一套查询；三是提前评估成组调度与DRA对现有GPU队列策略的影响——如果训练任务长期因部分 worker 无法放置而空占GPU，升级带来的收益会远超版本本身。

## 结论

11月19日至20日的更新表明，云原生的下一轮竞争不再围绕"是否支持AI"，而是围绕"能否以可迁移、可观测、可调度的底层管道承载AI"。原地迁移、Pod级流日志、成组调度与DRA看似分散，实则都在为同一目标铺路：让Kubernetes在超大集群和多类加速器环境中保持可运维性。建议团队在1.38发布前完成一次集群规模与GPU利用基线测量，并把网络与调度改造列入2027年的平台路线图。
