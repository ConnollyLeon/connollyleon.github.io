---
layout: post
title: "云原生技术动态：Kubernetes 1.37代码冻结与EKS版本回滚能力上线"
date: 2026-07-27
author: "云原生观察"
source: "https://www.infoq.com/news/2026/07/eks-version-rollback/"
categories:
  - cloud-native
tags:
  - kubernetes
  - eks
  - karpenter
  - agent-sandbox
  - containerd
  - gke
---

# 云原生技术动态：Kubernetes 1.37代码冻结与EKS版本回滚能力上线

本周云原生领域迎来多项重要进展。Kubernetes v1.37于7月22日达到代码冻结，正式锁定功能范围并将于8月26日GA发布，其中containerd 2.0成为硬性要求、cgroup v2成为默认配置。Amazon EKS首次推出Kubernetes控制平面版本回滚功能，为集群升级提供安全网。Red Hat将Karpenter引入OpenShift Service on AWS，Google Cloud的GKE Agent Sandbox正式GA。

## 主要新闻

### Kubernetes v1.37代码冻结：containerd 2.0成为硬性要求

Kubernetes v1.37于2026年7月22日达到代码冻结，功能范围正式锁定，GA发布定于8月26日。本次发布包含两个硬性变更：kubelet现在需要containerd 2.0或更高版本，containerd 1.x支持和旧版CRI v1alpha2 API已完全移除；cgroup v2成为事实上的默认配置，仍在cgroup v1上的节点需要显式设置`failCgroupV1`为false才能启动kubelet。此外，Dynamic Resource Allocation继续成熟，Device Taints和Tolerations达到GA状态，etcd v3.7.0中的RangeStream功能通过`EtcdRangeStream`特性门控在v1.37中可用，大型列表操作将分块流式传输而非缓冲整个响应，显著降低etcd CPU使用量。

**Source:** [Kubernetes 1.37 Code Freeze: containerd 2.0 Now Required](https://peoplearegeek.com/articles/kubernetes-1-37-code-freeze-containerd-2/)

### Amazon EKS推出Kubernetes版本回滚功能

Amazon EKS近日推出Kubernetes版本回滚支持，允许从业者在升级后7天内将集群控制平面回退到之前的Kubernetes版本。该功能通过回滚Kubernetes API服务器和控制平面组件实现，同时保留所有etcd数据、工作负载和持久卷。对于运行EKS Auto Mode的集群，EKS会自动在回滚控制平面之前回滚Auto Mode工作节点。回滚以逐次小版本的方式进行，与EKS的增量升级路径保持一致。开源Kubernetes此前缺乏控制平面回滚能力，这一功能一直是AWS社区的长期请求。

**Source:** [Amazon EKS Adds Kubernetes Version Rollback Within 7 Days of an Upgrade](https://www.infoq.com/news/2026/07/eks-version-rollback/)

### GKE Agent Sandbox正式GA与Karpenter登陆OpenShift

Google Cloud宣布GKE Agent Sandbox正式GA，为AI代理提供安全的、Kubernetes原生的执行环境。自2025年11月KubeCon预览以来，GKE上的sandbox采用量增长超过16倍。Agent Sandbox使用基于gVisor的沙箱化技术隔离代理执行，提供代理运行时与宿主内核之间的边界。Google还引入了Agent Substrate开源项目，旨在优化数百万代理沙箱的调度、网络和管理。与此同时，Red Hat发布了Red Hat build of Karpenter，将上游Karpenter项目的即时节点预配引入Red Hat OpenShift Service on AWS (ROSA)，与OpenShift 4.22同步发布。

**Source:** [Kubernetes Weekly: Karpenter Comes to OpenShift, GKE Agent Sandbox Hits GA](https://thestackobserver.com/kubernetes-weekly-karpenter-comes-to-openshift-gke-agent-sandbox-hits-ga-and-containerd-2-3-3-lands/)

### Amazon EKS支持EFA与Placement Groups

Amazon EKS现支持在EKS Auto Mode和开源Karpenter上配置Amazon EC2 Placement Groups和Elastic Fabric Adapter (EFA)网络设备。这些功能允许用户优化EKS工作负载的性能和可用性，控制EFA网络接口配置以及EC2实例在AWS基础设施上的物理分布。EFA-only接口不消耗IP地址，为分布式训练和推理工作负载提供精细的IP利用率控制和完整的互联带宽。

**Source:** [Amazon EKS now supports EFA and placement groups on Auto Mode and Karpenter](https://aws.amazon.com/about-aws/whats-new/2026/07/amazon-eks-efa-placement-groups/)

## 分析

Kubernetes 1.37的代码冻结标志着容器运行时生态的又一次强制升级。containerd 2.0成为硬性要求意味着仍在运行1.x版本的集群必须在升级前完成运行时迁移——这不是一个可选项，而是升级的前提条件。配合cgroup v2的强制化，v1.37实质上完成了Kubernetes对Linux内核现代化的全面拥抱。对于平台团队而言，`ctr deprecations list`命令应该成为标准检查流程的一部分，任何运行时级别的不兼容都应在升级前暴露。

EKS版本回滚功能的推出解决了Kubernetes运维中一个长期存在的痛点。此前，控制平面升级是一条单行道——一旦升级完成，唯一的选择就是升级到下一个版本。GKE此前已通过GKE 1.33引入了类似能力，EKS的跟进使得三大主要云提供商在托管Kubernetes升级安全性上趋于对齐。这对于生产环境中的Kubernetes集群运营意义重大，尤其是对于那些升级周期长、涉及大量节点的大型集群。

GKE Agent Sandbox的GA和Agent Substrate的引入表明，Kubernetes正在从"通用容器编排"演进为"AI原生工作负载平台"。Agent Sandbox不是带标签的普通容器运行时——它是为执行不可信代码的代理设计的全新隔离边界。当代理成为标准工作负载类型时，Kubernetes的功能将越来越多地围绕代理执行场景设计。Karpenter登陆OpenShift则反映了即时节点预配在混合云环境中的持续扩张。

## 结论

本周云原生领域的进展呈现出三条主线：运行时现代化正在加速——containerd 2.0和cgroup v2从可选变为强制；托管Kubernetes服务的运维安全性持续提升——EKS版本回滚为升级提供了安全网；AI代理正在重塑Kubernetes的工作负载模型——Agent Sandbox和Agent Substrate代表了为代理场景专门设计的新基础设施范式。从业者应立即检查集群的containerd版本和cgroup版本，为v1.37升级做准备，同时评估Agent Sandbox在AI代理生产化部署中的适用性。
