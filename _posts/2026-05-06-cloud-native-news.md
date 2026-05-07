---
layout: post
title: "云原生技术动态：Kubernetes 1.36发布与Velero加入CNCF"
date: 2026-05-06
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/05/05/kubernetes-v1-36-declarative-validation-ga/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - cncf
  - velero
  - kyverno
---

# 云原生技术动态：Kubernetes 1.36发布与Velero加入CNCF

本周云原生领域迎来多项重大更新，Kubernetes 1.36版本正式发布，带来声明式验证GA和静态准入策略等重要特性。同时，Broadcom将Velero项目捐赠给CNCF，Kyverno发布1.18版本，VMware VCF 9.1增强了容器服务能力，云原生生态系统持续快速发展。

## 主要新闻

### Kubernetes v1.36：声明式验证正式发布GA

Kubernetes v1.36正式将声明式验证（Declarative Validation）提升为通用可用性（GA）状态。这项功能通过新的代码生成器`validation-gen`，将验证规则从手写Go代码迁移到结构化标记，大幅提升了API的一致性和可维护性。新框架支持"环境棘轮"机制，允许在不破坏现有对象的情况下立即收紧或放松验证规则。对于用户而言，这意味着更可靠、可预测且文档更完善的API。对于贡献者和生态开发者，这一变化取代了数千行手写验证代码，统一为维护框架。

**Source:** [Kubernetes v1.36: Declarative Validation Graduates to GA](https://kubernetes.io/blog/2026/05/05/kubernetes-v1-36-declarative-validation-ga/)

### Broadcom将Velero捐赠给CNCF成为沙箱项目

Broadcom宣布将其Kubernetes原生备份、恢复和迁移项目Velero贡献给云原生计算基金会（CNCF）作为沙箱项目。Velero在Kubernetes API层运行，通过自定义资源定义（CRD）捕获集群状态，而非通过虚拟机管理程序或存储层快照。该项目目前维护者包括Broadcom、Red Hat和Microsoft。Velero加入CNCF后，将获得供应商中立的家园，促进社区协作和增长。Broadcom同时与etcd社区合作开发诊断和恢复工具，并继续与Cluster API社区合作进行集群配置和升级编排。

**Source:** [Broadcom Donates Velero to CNCF](https://www.infoq.com/news/2026/05/broadcom-velero-cncf/)

### Kyverno 1.18发布：安全增强与CLI能力提升

Kyverno发布1.18版本，这是该项目在CNCF毕业后的首个版本。此版本在安全性、CLI能力和策略引擎可靠性方面进行了重大投资，并继续向基于CEL的策略类型过渡。主要更新包括：增强HTTP策略执行的安全控制、多个CVE缓解措施；CLI增强支持测试和应用现代策略类型；策略引擎在性能、可观测性和可扩展性方面的改进，包括基于内存的HPA自动扩展和TLS支持。Kyverno 1.18采用"main + 1"补丁支持模型，当前版本和前一个版本将获得关键和高严重性CVE的补丁支持。

**Source:** [Announcing Kyverno release 1.18!](https://www.cncf.io/blog/2026/05/05/announcing-kyverno-release-1-18/)

### VMware VCF 9.1：vSphere Kubernetes Service加速现代应用部署

VMware Cloud Foundation（VCF）9.1通过vSphere Kubernetes Service（VKS）组件带来容器和虚拟机统一平台，内置CNCF认证的Kubernetes运行时。VCF 9.1将在三个关键支柱上提供增强：规模与性能（每个控制平面500个集群，集群配置速度提升70%，升级速度提升75%）；运营效率（智能节点池放置、每个区域多个集群、分布式传输网关）；安全与合规（自动化密钥注入和细粒度访问控制）。VKS采用与VCF发布计划解耦的发布周期，每年三次VKS更新，确保与上游CNCF Kubernetes版本无缝对齐。

**Source:** [Deploy Modern Apps Faster with VKS on VCF 9.1](https://blogs.vmware.com/cloud-foundation/2026/05/05/deploy-modern-apps-faster-scale-smarter-and-lower-your-tco-with-vks-on-vcf-9-1/)

## 分析

Kubernetes 1.36的发布标志着云原生编排平台走向更加成熟和声明式的未来。声明式验证的GA不仅是一个技术改进，更代表了Kubernetes API设计哲学的转变——从命令式、手写代码向结构化、可维护的声明式模型演进。这一变化将使API评审更加透明，工具链（如kube-api-linter）能够静态分析API类型并自动执行API约定，显著减少人工审查负担。

Velero加入CNCF是云原生数据保护领域的重要里程碑。在Kubernetes成为事实上的"操作系统"的背景下（CNCF 2025年调查显示82%的生产环境使用Kubernetes），有状态应用的数据保护和灾难恢复能力变得至关重要。Velero以CRD为基础的设计理念与Kubernetes原生架构完美契合，其加入CNCF将加速多云和混合云环境下的数据管理标准化。值得注意的是，Broadcom在KubeCon + CloudNativeCon Europe 2026上宣布这一消息，同时展示了与etcd社区和Cluster API社区的合作，表明即使在大型并购后，Broadcom仍在持续推动上游贡献。

Kyverno 1.18的发布验证了CNCF毕业项目的活力。作为Kubernetes原生策略引擎，Kyverno正在从策略执行向策略驱动运营演进。1.18版本对CEL（Common Expression Language）的持续投资反映了云原生生态对统一策略表达语言的追求。随着AI工作负载在Kubernetes上的广泛部署，Kyverno路线图中提到的"扩展到AI治理"将成为一个重要发展方向。策略即代码（Policy as Code）不再仅是安全合规工具，而是成为平台工程的核心组成部分。

VMware VCF 9.1的增强反映了企业级Kubernetes平台对规模、性能和运营效率的综合追求。每个控制平面支持500个集群的能力，加上70%的配置速度提升，直接回应了大型企业容器平台的痛点。VKS的独立发布周期设计（每年三次）是一个明智的决策，它确保了与上游Kubernetes版本的快速对齐，同时不破坏VCF整体平台的稳定性。Container as a Service的引入（直接在ESX上执行，无需集群开销）为从简单容器部署到完整Kubernetes能力的过渡提供了温和的入口。

这些进展共同描绘了一个趋势：云原生技术正在从"如何运行容器"向"如何大规模、安全、智能地运营容器化应用"演进。声明式API、策略驱动安全、统一数据保护和企业级平台能力，这些都是支撑这一演进的关键支柱。

## 结论

2026年5月初的云原生技术动态展示了生态系统的强劲发展势头。Kubernetes继续巩固其作为云原生基础设施核心的地位，通过声明式验证等特性提升API质量和可维护性。Velero的CNCF化将推动Kubernetes数据保护标准的建立，Kyverno的持续发展强化了策略即代码的实践，而VMware VCF 9.1则展示了企业级平台如何整合这些创新。

对于从业者而言，现在是关键时刻： adopting声明式验证、评估策略引擎迁移路径、规划有状态应用的云原生备份策略，以及选择适合企业需求的多集群管理平台。随着AI工作负载的快速增长，这些技术决策将直接影响组织的敏捷性、安全性和成本效益。

展望未来，我们需要关注：Kubernetes API的进一步声明式化、策略引擎在AI治理中的角色、云原生备份和恢复的标准化进展，以及企业平台如何平衡创新速度与控制稳定性。云原生技术正在书写其下一章，而这一章的主题是：规模化、智能化、安全化。
