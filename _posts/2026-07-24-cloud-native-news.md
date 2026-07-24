---
layout: post
title: "云原生技术动态：Confidential Containers晋级CNCF孵化与Calico跨入VM时代"
date: 2026-07-24
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/07/22/confidential-containers-becomes-a-cncf-incubating-project/"
categories:
  - cloud-native
tags:
  - confidential-containers
  - cncf
  - calico
  - ebpf
  - etcd
  - gke
---

# 云原生技术动态：Confidential Containers晋级CNCF孵化与Calico跨入VM时代

本周云原生领域迎来多项里程碑式进展。CNCF技术监督委员会投票接纳Confidential Containers为孵化项目，标志着机密计算正式成为云原生安全标准组件。Tigera发布业界首个eBPF驱动的Calico for VMs on Kubernetes，为VMware迁移浪潮提供网络统一方案。Google Cloud发布GKE AI安全蓝图，为生产环境AI工作负载建立三层安全架构。etcd v3.7.0发布，完成v2store依赖清除并引入RangeStream功能。

## 主要新闻

### Confidential Containers晋级CNCF孵化项目

CNCF技术监督委员会(TOC)投票接纳Confidential Containers为孵化项目。该项目利用硬件级可信执行环境(TEE)在数据使用过程中进行加密，允许组织在第三方基础设施上运行敏感工作负载，同时确保基础设施运营商无法访问正在处理的数据。项目始于2021年Red Hat、Intel、IBM等的合作，通过Kata Containers运行时将硬件安全特性集成到Kubernetes生态中。目前获得Microsoft Azure、Intel、AMD、NVIDIA、阿里巴巴和Red Hat等主要组织支持。项目正与Kyverno集成实现声明式策略管理，并与KServe集成支持机密AI用例。

**Source:** [Confidential Containers becomes a CNCF incubating project](https://www.cncf.io/blog/2026/07/22/confidential-containers-becomes-a-cncf-incubating-project/)

### Tigera发布Calico for VMs on Kubernetes

Tigera推出Calico for VMs on Kubernetes，业界首个eBPF驱动的统一网络与安全平台，同时支持虚拟机和容器在单一Kubernetes原生控制平面上运行。该方案为从VMware迁移的企业提供关键价值——保留现有IP地址、VLAN和防火墙规则，同时获得Kubernetes原生的微分段、路由、负载均衡和可观测性能力。Calico平台目前保护超过100万集群，获NVIDIA、Royal Bank of Canada、Bloomberg等企业采用。VMware NSX的每个功能都有对应的Kubernetes原生Calico方案，使企业可以"先迁移、后现代化"。

**Source:** [Tigera Launches eBPF-powered Calico for VMs on Kubernetes](https://www.prnewswire.com/news-releases/tigera-launches-ebpf-powered-calico-for-vms-on-kubernetes-vm-migration-that-doesnt-require-rebuilding-the-network-302832765.html)

### Google Cloud发布GKE AI安全蓝图

Google Cloud发布GKE AI安全蓝图，为生产环境AI工作负载提供三层安全架构：基础设施层使用Confidential GKE Nodes（支持Nvidia H100 GPU和TPU的硬件级内存加密）、Workload Identity Federation和VPC Service Controls；模型安全层引入k8s-aibom开源控制器自动生成AI BOM，Model Armor检测提示注入和敏感数据泄露；应用层使用GKE Sandbox（基于gVisor）隔离执行生成代码的AI代理。蓝图建议分三阶段部署：Deploy（基线控制）、Operate（生产加固）、Govern（组织级护栏）。

**Source:** [GKE Security Blueprint Joins Growing List of Cloud AI Frameworks](https://www.infoq.com/news/2026/07/google-gke-ai-security-blueprint/)

### etcd v3.7.0发布：数据平面重大更新

SIG etcd发布etcd v3.7.0，这是分布式键值存储和Kubernetes核心组件的重要版本。关键更新包括RangeStream功能（流式传输大型结果集而非缓冲整个响应）、keys-only范围请求优化、更快的租约管理，以及完全从v3store启动消除了对v2store的长期依赖。该版本还完成了protobuf大检修，替换过时的protobuf库。RangeStream功能将通过`EtcdRangeStream`特性门控在即将发布的Kubernetes v1.37中可用。etcd成员的整体CPU使用量相比v3.6有显著下降。

**Source:** [Announcing etcd v3.7.0](https://kubernetes.io/blog/2026/07/08/announcing-etcd-3.7/)

## 分析

Confidential Containers晋级CNCF孵化标志着机密计算从实验性技术走向云原生主流。该项目解决了云原生安全中"数据使用中保护"这一长期空白——传统的静态加密和传输加密无法保护内存中正在处理的数据。对于运行敏感AI推理工作负载的企业而言，这意味着可以在公共云上运行机密AI模型，而无需担心基础设施运营商或恶意租户访问模型权重和推理数据。与KServe的集成更进一步指向了机密AI推理的生产化场景。短期内，关注Intel TDX和AMD SEV-SNP硬件支持的企业应评估Confidential Containers在现有Kubernetes集群中的集成路径。

Calico for VMs on Kubernetes的发布则直接回应了VMware迁移这一当前最大的企业基础设施挑战。VMware NSX用户在向Kubernetes迁移时面临的最大痛点不是计算或存储——而是网络身份的硬编码依赖。Calico通过保留IP地址、VLAN和现有安全策略的方式解决了这一问题，使企业可以采取渐进式迁移策略。从行业趋势看，eBPF驱动的统一网络平面正在成为混合工作负载环境的标准配置，Calico在这一领域的先发优势可能进一步巩固其市场地位。

Google GKE AI安全蓝图的发布表明，AI工作负载安全正在从"附加功能"演变为"平台核心能力"。k8s-aibom（AI物料清单）的引入尤为值得关注——传统SBOM无法捕获数据集、模型框架等AI特有构件，而AI BOM填补了这一空白。Model Armor对提示注入的检测则回应了AI代理自主决策场景下的新型应用层威胁。分三阶段部署的方法为企业提供了可操作的实施路径。

## 结论

本周云原生领域的进展呈现出三条清晰主线：安全正在向"数据使用中保护"和"AI原生"方向深化；混合工作负载（VM+容器）的统一管理成为企业刚需；核心数据平面组件持续演进以支撑更大规模的工作负载。从业者应密切关注Confidential Containers在Kubernetes v1.37中的RangeStream集成、Calico VM方案在VMware迁移项目中的实际表现，以及GKE AI安全蓝图中k8s-aibom对AI治理框架的影响。云原生生态正在从"容器编排平台"演进为"企业级安全计算平台"。
