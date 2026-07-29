---
layout: post
title: "KubeCon Japan 2026开幕、Kubernetes 1.37冻结与EKS版本回滚：云原生生态三线并进"
date: 2026-07-29
author: "云原生观察"
source: "https://www.techtimes.com/articles/321774/20260728/kubecon-japan-2026-kubernetes-gpu-scheduling-otel-graduation-converge-ai-era.htm"
categories:
  - cloud-native
tags:
  - kubernetes
  - kubecon
  - eks
  - containerd
  - cncf
  - gpu
  - opentelemetry
---

# KubeCon Japan 2026开幕、Kubernetes 1.37冻结与EKS版本回滚：云原生生态三线并进

KubeCon + CloudNativeCon Japan 2026于今日在横滨正式开幕，大会宣布OpenTelemetry正式毕业及多项AI基础设施里程碑；同时，Kubernetes v1.37代码冻结完成，containerd 2.0成为硬性要求；AWS EKS新增控制平面版本回滚功能，为集群升级提供安全网。

## 主要新闻

### KubeCon Japan 2026开幕：GPU调度、OTel毕业与AI基础设施SIG成立

KubeCon + CloudNativeCon Japan 2026今日在横滨PACIFICO会展中心开幕，主会议程于7月29日至30日进行。大会开幕前宣布三项重要进展：OpenTelemetry（OTel）正式达到CNCF毕业状态，成为继Kubernetes和Prometheus之后的毕业级项目；Dynamic Resource Allocation（DRA）作为Kubernetes GPU调度框架已在1.34达到GA，此次大会是首次DRA成为成熟生产级选项的KubeCon；Cloud Native Community Japan同步宣布成立AI基础设施特别兴趣小组（AI Infra SIG），由LY Corporation和IBM Research Tokyo工程师领导，聚焦DRA、Kueue、KubeRay、KServe及Gateway API Inference Extension等AI工作负载技术栈。

**Source:** [KubeCon Japan 2026: Kubernetes GPU Scheduling, OTel Graduation Converge for AI Era](https://www.techtimes.com/articles/321774/20260728/kubecon-japan-2026-kubernetes-gpu-scheduling-otel-graduation-converge-ai-era.htm)

### Kubernetes v1.37代码冻结：containerd 2.0强制要求、cgroup v2成默认

Kubernetes v1.37于7月22日达到代码冻结，GA预计8月26日发布。本次版本包含两项硬性变更：kubelet要求containerd 2.0或更新版本，旧CRI v1alpha2 API被移除；FailCgroupV1标志默认设为true，cgroup v1节点将拒绝启动kubelet。此外，Device Taints and Tolerations通过resource.k8s.io/v1 API达到GA，etcd v3.7.0的RangeStream功能通过EtcdRangeStream特性门控提供，将大容量list操作流式传输以降低etcd CPU负载。

**Source:** [Kubernetes 1.37 Code Freeze: containerd 2.0 Now Required](https://peoplearegeek.com/articles/kubernetes-1-37-code-freeze-containerd-2/)

### Amazon EKS支持控制平面版本回滚

AWS宣布Amazon EKS支持Kubernetes版本回滚功能，允许用户在集群升级后7天内将控制平面恢复到先前版本。该功能在升级过程中保留所有etcd数据、工作负载和持久卷。EKS Auto Mode节点也会自动回滚。版本回滚一次仅支持一个次要版本，与EKS的增量升级路径一致。该功能在所有EKS可用区域免费提供。

**Source:** [Amazon EKS Adds Kubernetes Version Rollback Within 7 Days of an Upgrade](https://www.infoq.com/news/2026/07/eks-version-rollback/)

### Tigera发布eBPF驱动Calico for VMs on Kubernetes

Tigera宣布推出Calico for VMs on Kubernetes，业界首个基于eBPF的、为虚拟机提供容器级网络和安全能力的平台。该方案允许从VMware迁移的企业在Kubernetes上保留现有IP地址、VLAN和防火墙规则，无需重新设计网络。Calico统一了VM和容器的网络策略、路由、QoS和可观测性模式，支持L2 Bridge、BGP路由、分布式防火墙等功能。

**Source:** [Tigera Launches eBPF-powered Calico for VMs on Kubernetes](https://www.prnewswire.com/news-releases/tigera-launches-ebpf-powered-calico-for-vms-on-kubernetes-vm-migration-that-doesnt-require-rebuilding-the-network-302832765.html)

## 分析

KubeCon Japan 2026标志着云原生生态的一个重要转折点。正如大会所展示的，Kubernetes正在完成从微服务编排平台到AI原生基础设施核心的转型。DRA的GA、OTel的毕业以及新的AI Infra SIG的成立，共同宣告了在Kubernetes上运行AI工作负载的生产就绪状态——GPU调度、可观测性和授权三个关键基础设施层已同时达到生产成熟度。

Kubernetes 1.37的变更则从另一个角度揭示了云原生平台的演进方向。containerd 2.0的强制要求和cgroup v2的默认化是对运行时的现代化改造，而DRA的Device Taints则直接服务于GPU故障管理。对于运维团队而言，v1.37的升级准备窗口仅剩约五周，检查containerd版本和cgroup版本应是最高优先级。

EKS版本回滚功能填补了托管Kubernetes服务的一个长期空白。此前GKE已率先支持此功能，AWS的跟进将促使更多组织敢于更快地采用新版Kubernetes——回滚安全网的存在降低了升级风险，可能加速整个生态的版本更新节奏。

Calico for VMs的发布则反映了VMware迁移浪潮中的关键需求。对于大量计划从VMware迁移到Kubernetes的企业，网络和安全策略的保留是最复杂的挑战之一。Tigera以纯Kubernetes原生方式解决此问题，而非引入额外的抽象层，这符合云原生社区的架构理念。

## 结论

本周KubeCon Japan展示了AI与云原生的深度融合正从愿景走向现实。Kubernetes 1.37的硬性运行时升级要求需要运维团队立即行动，而EKS的回滚功能和Calico的VM支持则分别降低了Kubernetes升级和VMware迁移的门槛。对于平台工程团队，关注DRA成熟度、评估OTel迁移路线图、规划containerd 2.0升级路径应是短期内最高优先级的任务。
