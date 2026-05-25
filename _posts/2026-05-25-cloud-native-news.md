---
layout: post
title: "云原生技术动态：Kubernetes 1.36安全强化与OpenTelemetry毕业"
date: 2026-05-25
author: "云原生观察"
source: "https://infoq.com/news/2026/05/kubernetes-1-36-released/"
categories:
  - cloud-native
tags:
  - kubernetes
  - opentelemetry
  - etcd
  - ingress-nginx
  - cloud-native
---

# 云原生技术动态：Kubernetes 1.36安全强化与OpenTelemetry毕业

过去一周云原生领域迎来多项里程碑式更新：Kubernetes 1.36正式发布并收紧安全默认配置，OpenTelemetry项目正式从CNCF毕业，etcd 3.7.0进入beta阶段，同时社区NGINX Ingress控制器正式退役引发广泛迁移讨论。

## 主要新闻

### Kubernetes 1.36发布：安全默认收紧与AI工作负载支持成熟

Kubernetes项目发布了1.36版本（代号Haru），这是2026年首个主要K8s版本，包含70项增强功能。其中18项升级至Stable、25项进入Beta、25项为新增Alpha特性。最关键的变更之一是细粒度kubelet API鉴权正式GA，这标志着`nodes/proxy`这一长期存在的过度权限RBAC模式被彻底取代。安全研究人员此前证实，仅通过`nodes/proxy`的GET请求即可实现节点级远程代码执行。1.36提供了8个细粒度子资源（nodes/stats, nodes/metrics, nodes/log等），覆盖所有监控和可观测性用例。

AI工作负载方面，Workload-Aware Preemption（工作负载感知抢占）作为新增Alpha特性引入，将PodGroup视为单一抢占单元，解决了分布式训练中部分Pod被驱逐导致整体任务无法推进的难题。Dynamic Resource Allocation（DRA）的多项增强默认启用，包括可分区设备、可消耗容量和设备污点容忍。

**Source:** [Kubernetes 1.36 Release Blog](https://kubernetes.io/blog/2026/05/13/kubernetes-1-36-release/)

### OpenTelemetry正式从CNCF毕业

CNCF在可观测性峰会上宣布OpenTelemetry正式毕业，标志着其成为事实上的开源可观测性标准。该项目自2019年成立以来，已成为CNCF生态系统中项目活跃度第二高的项目（仅次于Kubernetes），拥有超过12,000名贡献者，来自2,800多家企业。过去12个月，OpenTelemetry JavaScript API包下载量超过13.6亿次，Python API包超过13亿次。新发布的Profiles信号进入Alpha阶段，为持续生产性能分析提供了标准化的遥测数据采集方式。

**Source:** [CNCF Announces OpenTelemetry Graduation](https://www.prnewswire.com/news-releases/cloud-native-computing-foundation-announces-opentelemetrys-graduation-solidifying-status-as-the-de-facto-observability-standard-302778233.html)

### etcd 3.7.0-beta.0发布：RangeStream与v2store彻底移除

SIG-etcd宣布了etcd v3.7.0的首个beta版本。该版本引入了长期期待的RangeStream RPC特性，允许客户端分块接收大型结果集，显著降低了大规模键值数据集操作中的延迟和内存压力。v3.7彻底移除了遗留的v2store、v2发现、v2客户端等所有v2时代组件，成为首个100%基于v3store的版本。同时etcd v3.4已于5月15日结束生命周期（EOL），用户应尽快规划升级。

**Source:** [Announcing etcd 3.7.0-beta.0](https://kubernetes.io/blog/2026/05/20/etcd-370-beta/)

### containerd 2.3.1发布：修复CVE-2026-46680并强化默认seccomp策略

containerd 2.3.1发布了安全更新，修复了CVE-2026-46680漏洞，并默认阻止了AF_ALG套接字地址族。该版本还修复了非runc运行时的沙箱任务API端点，改进了OCI规范中越界USER值的处理。

**Source:** [containerd 2.3.1 Release Notes](https://github.com/containerd/containerd/releases/tag/v2.3.1)

### LinkedIn基于cert-manager构建Kubernetes身份安全体系

LinkedIn详细介绍了其基于cert-manager构建的Kubernetes安全框架，该框架为每个工作负载绑定可验证的数字身份。系统通过自动证书签发、工作负载证明和策略检查，在数千节点、数十万Pod的规模下运行。Linkedin的Lipki-Controller组件负责证书请求审批，Kyverno策略限制证书申请权限，并通过SPIFFE风格的身份与mTLS集成。

**Source:** [LinkedIn Kubernetes Security with cert-manager](https://oracore.dev/en/news/linkedin-kubernetes-security-cert-manager-framework-en)

## 分析

过去一周的云原生发展呈现出三个明确趋势。首先是安全左移的加速——Kubernetes 1.36对`nodes/proxy`的废弃和细粒度鉴权的GA，以及ingress-nginx社区版的退役，都表明云原生生态正系统性地消除长期存在的安全债务。这不仅是功能更新，更是一种架构层面的安全治理思维转变。

其次是可观测性标准化进入新阶段。OpenTelemetry的毕业确认了其作为云原生可观测性事实标准的地位，而Profiles信号的引入则将可观测性的覆盖范围从日志、指标、链路扩展到持续性能分析。对于平台工程团队而言，这意味着可以基于统一的遥测数据标准构建更深度的可观测性能力。

第三，AI工作负载正在重新定义Kubernetes的调度和资源管理范式。从1.35引入的工作负载API到1.36的PodGroup调度周期和DRA增强，Kubernetes正从面向微服务的容器调度器演进为面向AI分布式训练和推理的工作负载编排平台。LinkedIn的身份管理方案则展示了大型企业如何在云原生环境中标准化安全信任体系。

## 结论

云原生基础设施正经历从"容器编排"到"AI工作负载编排"的根本性转变。平台团队应优先处理ingress-nginx迁移、nodes/proxy权限审计以及OpenTelemetry的标准化接入，同时关注etcd 3.4 EOL的升级窗口。这些变化共同指向一个更安全、更标准化、更AI原生的云原生生态。
