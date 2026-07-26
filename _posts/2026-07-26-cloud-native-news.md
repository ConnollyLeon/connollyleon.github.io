---
layout: post
title: "云原生技术动态：Kubernetes 1.37代码冻结与Confidential Containers晋升CNCF孵化项目"
date: 2026-07-26
author: "云原生观察"
source: "https://peoplearegeek.com/articles/kubernetes-1-37-code-freeze-containerd-2/"
categories:
  - cloud-native
tags:
  - kubernetes
  - containerd
  - confidential-containers
  - cncf
---

# 云原生技术动态：Kubernetes 1.37代码冻结与Confidential Containers晋升CNCF孵化项目

本周云原生领域迎来多项里程碑式进展。Kubernetes v1.37正式进入代码冻结阶段，标志着containerd 2.0成为强制运行时要求。同时，Confidential Containers项目获CNCF技术监督委员会投票通过，晋升为孵化项目，为机密计算在云原生环境中的落地铺平了道路。

## 主要新闻

### Kubernetes 1.37代码冻结：containerd 2.0成为强制要求

Kubernetes v1.37于7月22日达到代码冻结，计划于8月26日正式发布。此次版本带来两项重大变更：kubelet现在要求containerd 2.0或更高版本，旧版containerd 1.x和CRI v1alpha2 API已被移除。此外，cgroup v2成为默认要求，仍在使用cgroup v1的节点将无法启动kubelet，除非显式设置failCgroupV1为false。Dynamic Resource Allocation框架继续演进，Device Taints和Tolerations已达到GA状态。etcd v3.7.0引入的RangeStream功能将通过feature gate开放，大幅优化大规模list操作的性能。

**Source:** [Kubernetes 1.37 Code Freeze](https://peoplearegeek.com/articles/kubernetes-1-37-code-freeze-containerd-2/)

### Confidential Containers晋升CNCF孵化项目

CNCF技术监督委员会投票通过Confidential Containers成为孵化项目。该项目利用硬件可信执行环境（TEE）技术，在数据使用过程中提供加密保护，使组织能够在第三方基础设施上安全运行敏感工作负载。Confidential Containers通过Kata Containers运行时将硬件安全特性集成到Kubernetes生态中，支持Intel TDX和AMD SEV-SNP等多种TEE技术。该项目正在与KServe集成以支持机密AI推理用例，未来路线图聚焦于短期2-6个月和中期6-18个月的能力扩展。

**Source:** [Confidential Containers CNCF Incubation](https://www.cncf.io/blog/2026/07/22/confidential-containers-becomes-a-cncf-incubating-project/)

### Tigera推出基于eBPF的Calico for VMs on Kubernetes

Tigera发布了Calico for VMs on Kubernetes，这是业界首个基于eBPF的平台，通过单一Kubernetes原生控制平面为虚拟机和容器同时提供网络和网络安全能力。该产品专为从VMware迁移的企业设计，支持在迁移过程中保留现有IP地址、VLAN和防火墙规则，同时提供微分段、路由、负载均衡和可观测性等统一网络能力。Calico每日保护超过100万个集群，新平台将VM迁移从"保留对象"转变为"保留结果"。

**Source:** [Tigera Calico for VMs on Kubernetes](https://www.prnewswire.com/news-releases/tigera-launches-ebpf-powered-calico-for-vms-on-kubernetes-vm-migration-that-doesnt-require-rebuilding-the-network-302832765.html)

## 分析

Kubernetes 1.37的代码冻结标志着容器运行时生态的重大转折点。强制要求containerd 2.0和cgroup v2意味着仍在运行旧版基础设施的组织必须立即启动升级计划。这一变更的影响范围广泛——从边缘计算节点到生产集群的每个工作节点都需要更新。对于平台工程师而言，这是一个明确的信号：Kubernetes社区正在加速淘汰遗留技术债务，推动生态系统向更现代化的基础架构迁移。

Confidential Containers晋升孵化项目反映了云原生安全领域的深层趋势——数据保护正从静态加密和传输加密延伸到计算过程中的加密。随着AI工作负载处理越来越多的敏感数据，机密计算成为满足合规要求和保护知识产权的关键技术。该项目与KServe的集成预示着机密AI推理将成为下一个重要应用场景。

Tigera的Calico for VMs on Kubernetes则解决了VMware迁移这一实际痛点。许多企业在从VMware迁移到Kubernetes时面临网络复杂性挑战，而Calico通过统一的网络模型简化了这一过程，使得"先迁移后现代化"成为可行策略。

## 结论

本周的云原生新闻揭示了三个关键方向：运行时现代化（containerd 2.0）、安全增强（机密容器）和混合工作负载管理（VM+容器统一平台）。对于正在规划升级路径的团队，建议立即评估Kubernetes 1.37的兼容性要求，并在staging环境中测试release candidate。同时，关注Confidential Containers的演进将为未来的机密AI工作负载部署做好准备。
