---
layout: post
title: "Kubernetes 1.37代码冻结：containerd 2.0强制升级与etcd v3.7带来RangeStream性能突破"
date: 2026-07-31
author: "云原生观察"
source: "https://peoplearegeek.com/articles/kubernetes-1-37-code-freeze-containerd-2/"
categories:
  - cloud-native
tags:
  - kubernetes
  - containerd
  - etcd
  - cloud-native
  - cgroup
  - DRA
---

# Kubernetes 1.37代码冻结：containerd 2.0强制升级与etcd v3.7带来RangeStream性能突破

Kubernetes社区本周迎来v1.37代码冻结里程碑，GA版本定于8月26日发布。本次版本带来多项硬性升级要求——containerd 2.0成为最低运行时版本、cgroup v2强制执行——同时etcd v3.7的RangeStream功能为大规模集群控制面性能带来显著提升。对于平台工程团队而言，代码冻结意味着升级规划的最后窗口已经打开。

## 主要新闻

### Kubernetes v1.37代码冻结：containerd 2.0和cgroup v2成为强制要求

Kubernetes v1.37于7月22日进入代码冻结阶段，GA定于8月26日。此次版本移除对containerd 1.x和CRI v1alpha2 API的支持，所有节点必须运行containerd 2.0或更高版本。同时FailCgroupV1标志默认为true，仍使用cgroup v1的节点将拒绝启动kubelet。DRA（Dynamic Resource Allocation）进一步成熟，Device Taints and Tolerations在该版本中达到GA，Partitionable Devices仍处于Alpha阶段。此外，etcd v3.7的RangeStream特性通过EtcdRangeStream功能门暴露，使大规模List操作以流式方式分块返回结果，降低控制面CPU负载。

**Source:** [Kubernetes 1.37 Code Freeze: containerd 2.0 Now Required](https://peoplearegeek.com/articles/kubernetes-1-37-code-freeze-containerd-2/)

### etcd v3.7正式发布：RangeStream与性能全面提升

etcd团队于7月8日正式发布v3.7.0，这是分布式键值存储的一个重大次要版本。核心特性RangeStream支持将大数据集分块流式传输，替代以往在服务端缓冲整个响应的方式。Keys-only范围请求优化使etcd仅从内存索引读取键，大幅减少bbolt I/O。LeaseRevoke请求在过载条件下获得优先处理，新的FastLeaseKeepAlive特性跳过等待提交索引的步骤来加速续约。此外，v3.7完成了从golang/protobuf和gogo/protobuf向google.golang.org/protobuf的迁移，并完全移除遗留的v2store依赖——etcd现在完全从v3store启动。

**Source:** [Announcing etcd v3.7.0](https://kubernetes.io/blog/2026/07/08/announcing-etcd-3.7/)

### Amazon EKS新增Kubernetes版本回滚功能

Amazon EKS近日推出了Kubernetes控制平面版本回滚功能，允许实践者在升级后7天内将集群恢复至先前的Kubernetes版本。该功能支持一次回滚一个次要版本，保留所有etcd数据、工作负载和持久卷。EKS在回滚前会运行集群洞察检查，识别节点版本不匹配或附加组件依赖等问题。GKE此前已引入控制面次要版本回滚，而Azure AKS仅提供节点池级别的有限回滚支持。该功能在所有EKS可用区域免费提供。

**Source:** [Amazon EKS Adds Kubernetes Version Rollback Within 7 Days of an Upgrade](https://www.infoq.com/news/2026/07/eks-version-rollback/)

### KubeElasti ProbeResponse：解决健康检查意外唤醒缩至零服务的难题

CNCF博客介绍了KubeElasti项目的新ProbeResponse功能。Scale-to-zero策略长期面临一个根本矛盾：负载均衡器和可观测性工具需要定期健康检查来确认服务存活，但这些检查会触发缩至零的服务重新扩容。ProbeResponse在KubeElasti的resolver层添加规则匹配能力——当服务处于零副本时，resolver拦截所有流量并根据预定义规则直接应答健康检查（返回200 OK），而不会触发扩容。该功能在服务运行时有零延迟开销，仅当resolver处于代理模式时才生效。

**Source:** [Your Kubernetes health checks are accidentally waking your services. Here's the fix.](https://www.cncf.io/blog/2026/07/29/your-kubernetes-health-checks-are-accidentally-waking-your-services-heres-the-fix/)

## 分析

本周云原生领域的三则消息共同指向一个清晰方向：Kubernetes平台正在从"灵活可选"走向"标准化强制"阶段。v1.37的containerd和cgroup v2硬性要求标志着社区在运行环境一致性方面迈出了决定性一步。对于仍然运行containerd 1.x或cgroup v1的集群——尤其自管节点和长期运行的环境——8月26日GA发布后，升级路径将是单向的。

etcd v3.7的RangeStream特性则从另一角度回应了大规模集群的性能痛点。控制面List/Watch流量一直是etcd CPU消耗的主要来源，RangeStream的分块传输机制直接降低控制面负载峰值。结合KubeElasti ProbeResponse对scale-to-zero模式的完善，这三项更新共同提升了Kubernetes在大规模生产环境中的运维可靠性和资源效率。

从行业视角看，EKS和GKE等托管服务率先提供版本回滚能力，正在改变Kubernetes升级的风险模型。托管服务商正在承担更多底层运维风险，而用户可以将精力集中在工作负载迁移和应用适配。这种"托管平台提供安全网、开源社区推进标准化"的分工格局，将加速企业对Kubernetes新版本的采用速度。

对于AI/ML工作负载用户，v1.37中DRA的Device Taints和Tolerations达到GA是一个值得关注的信号。这意味着GPU等特殊硬件设备的调度容错机制成为一等公民，为大规模AI训练集群的运维可靠性提供了标准化工具。

## 结论

本轮Kubernetes v1.37的升级要求虽有阵痛，但方向正确。平台团队应立即启动节点运行时审计（containerd版本、cgroup模式），在当前阶段完成预检。etcd v3.7的升级建议结合RangeStream基准测试进行规划。对于托管Kubernetes服务用户，利用好版本回滚这一新安全网功能。运行AI工作负载的团队应关注DRA的Device Taint功能在生产环境的实践路径。
