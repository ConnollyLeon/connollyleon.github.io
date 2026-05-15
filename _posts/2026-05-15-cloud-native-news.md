---
layout: post
title: "云原生技术动态：Kubernetes 1.36正式发布与CNCF项目生态持续扩张"
date: 2026-05-15
author: "云原生观察"
source: "https://www.infoq.com/news/2026/05/kubernetes-1-36-released/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - cncf
  - tekton
  - cloud-custodian
  - scheduling
---

# 云原生技术动态：Kubernetes 1.36正式发布与CNCF项目生态持续扩张

2026年5月，云原生领域迎来多项重大进展。Kubernetes 1.36版本正式发布，带来70项增强功能；Tekton从CDF迁移至CNCF成为孵化项目；Cloud Custodian庆祝十周年并在Agentic AI时代焕发新生。

## 主要新闻

### Kubernetes v1.36 "Haru" 正式发布：安全默认增强与AI工作负载支持

Kubernetes项目正式发布v1.36版本，代号Haru，包含70项增强特性——18项升级至Stable、25项进入Beta、25项新增Alpha。最重要的安全里程碑是用户命名空间（User Namespaces）达到GA，将容器的root用户映射到主机的非特权用户，大幅减少对底层节点的管理访问。Mutating Admission Policies使用通用表达式语言（CEL）实现原生可变策略对象。细粒度Kubelet API授权提供最小权限访问控制。

AI/ML工作负载方面，Workload-Aware Preemption作为Alpha特性登场，消除分布式训练中的"部分抢占失败模式"。Gang Scheduling API进入Beta，支持作业队列的挂起与恢复而不销毁资源。新的Workload API与PodGroup API分离架构为拓扑感知调度和DRA资源分配奠定基础。Job控制器已原生集成Workload/PodGroup API，分布式AI训练作业无需额外工具即可实现组调度。

**Source:** [Kubernetes v1.36: Security Defaults Tighten as AI Workload Support Matures](https://www.infoq.com/news/2026/05/kubernetes-1-36-released/)
**Source:** [Kubernetes v1.36: Advancing Workload-Aware Scheduling](https://kubernetes.io/blog/2026/05/13/kubernetes-v1-36-advancing-workload-aware-scheduling/)
**Source:** [Kubernetes v1.36: Declarative Validation Graduates to GA](https://kubernetes.io/blog/2026/05/05/kubernetes-v1-36-declarative-validation-ga/)

### Tekton加入CNCF成为孵化项目：云原生CI/CD的新纪元

2026年5月11日，Tekton正式从持续交付基金会（CDF）迁移至云原生计算基金会（CNCF）成为孵化项目。作为Kubernetes原生CI/CD的事实标准，Tekton已实现Tekton Pipelines 1.0稳定版本。加入CNCF将使Tekton与Kubernetes、Argo CD、Helm等生态系统项目更紧密集成，获得超过150,000名贡献者的社区资源。Red Hat表示将继续通过OpenShift Pipelines支持Tekton，推动供应商中立的软件交付方案。

**Source:** [Tekton joins the CNCF as an incubating project](https://developers.redhat.com/articles/2026/05/11/tekton-joins-cncf-new-era-cloud-native-cicd)

### Cloud Custodian十周年：在Agentic AI时代的云治理新角色

Cloud Custodian庆祝开源十周年。作为CNCF孵化项目，这个无状态策略引擎从最初的云管理工具演变为AI时代的成本优化与安全治理基础层。在Agentic AI兴起、自主代理自动生成和部署基础设施代码的背景下，实时自动化治理已从"最佳实践"变为"生产必需"。Cloud Custodian通过声明式策略引擎，为AWS、Azure、GCP、Oracle Cloud、Kubernetes和Terraform提供一致的安全与成本治理，支持GPU集群、模型服务端点和训练管道的自动防护。

**Source:** [A decade of governance: Cloud Custodian at 10 and its role in the agentic AI era](https://www.cncf.io/blog/2026/05/12/a-decade-of-governance-cloud-custodian-at-10-and-its-role-in-the-agentic-ai-era/)

## 分析

Kubernetes 1.36的发布标志着容器编排平台进入"AI原生"阶段。v1.36中与AI工作负载相关的特性密度是前所未有的——从Workload-Aware Preemption到Gang Scheduling Beta，再到PodGroup API架构分离和Job控制器原生集成，Kubernetes正在从"通用容器调度平台"向"AI工作负载的一等公民调度平台"演进。Workload-Aware Preemption解决的核心问题是：在大规模分布式训练中，如果部分Pod被抢占，整个训练任务可能因等待而停滞。这一特性确保要么全部Pod被调度，要么全部不被抢占，这对于GPU集群的利用效率至关重要。

Tekton从CDF迁移到CNCF是一个有深意的生态事件。过去五年中，持续交付领域已经高度融合到云原生生态中——Argo CD是CNCF毕业项目，Flux是CNCF孵化项目，现在Tekton也加入了CNCF。这意味着CI/CD已不再是独立的技术领域，而是Kubernetes基础设施的自然组成部分。对于平台团队，这意味着CI/CD工具链的选择应更加关注与Kubernete API的原生集成深度，而非独立的功能特性。

Cloud Custodian的十周年里程碑恰好与Agentic AI浪潮重合并非偶然。当AI代理开始自动编写Terraform配置、部署Kubernete资源、管理云服务时，传统的人工审批流程和周期性的安全审计完全无法跟上节奏。Cloud Custodian的声明式策略引擎通过实时即时代码级防护解决了这一问题——策略在资源创建的同时被评估和强制执行，关闭了安全与成本风险的时间窗口。对于FinOps和安全团队而言，在AI驱动的自动化时代，策略即代码的能力不再是加分项，而是基础设施的底线要求。

## 结论

2026年5月的云原生生态呈现三大趋势：Kubernetes在AI工作负载调度能力上的系统性投入正在结出果实；CI/CD工具链正在全面融入CNCF生态成为基础设施标准组件；治理与合规能力正在从"事后审计"转向"实时内建"。对于平台工程师，建议优先评估Kubernete 1.36的Workload-Aware Scheduling特性集，规划Tekton在CNCF生态中的更深度集成方案，并关注Cloud Custodian等策略引擎在AI工作负载治理中的应用。

**Source:** [Kubernetes v1.36 InfoQ](https://www.infoq.com/news/2026/05/kubernetes-1-36-released/)
**Source:** [Workload-Aware Scheduling](https://kubernetes.io/blog/2026/05/13/kubernetes-v1-36-advancing-workload-aware-scheduling/)
**Source:** [Declarative Validation GA](https://kubernetes.io/blog/2026/05/05/kubernetes-v1-36-declarative-validation-ga/)
**Source:** [Tekton Joins CNCF](https://developers.redhat.com/articles/2026/05/11/tekton-joins-cncf-new-era-cloud-native-cicd)
**Source:** [Cloud Custodian at 10](https://www.cncf.io/blog/2026/05/12/a-decade-of-governance-cloud-custodian-at-10-and-its-role-in-the-agentic-ai-era/)
