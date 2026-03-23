---
layout: post
title: "云原生技术动态：Kubernetes 1.35原地Pod资源调整与Agent Sandbox项目发布"
date: 2026-03-23
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/03/20/running-agents-on-kubernetes-with-agent-sandbox/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - container
  - service-mesh
---

# 云原生技术动态：Kubernetes 1.35原地Pod资源调整与Agent Sandbox项目发布

本周Kubernetes生态系统迎来多项重要更新，包括原地Pod资源调整稳定版的发布、Agent Sandbox项目的推出、Ingress2Gateway 1.0版本的正式发布，以及Kubernetes镜像促进工具的全面重写。这些更新标志着容器编排平台在生产可用性和AI工作负载支持方面迈出重要一步。

## 主要新闻

### Kubernetes 1.35原地Pod资源调整正式稳定

Kubernetes 1.35正式将原地Pod资源调整（In-Place Pod Resource Resize）提升为稳定功能，这意味着运行中的Pod现在可以直接调整CPU和内存请求，而无需重启容器。这项功能从v1.27的alpha版本开始，经过v1.33的beta阶段，终于在1.35版本达到生产就绪状态。

对于StatefulSet工作负载如数据库和缓存服务，原地调整意味着JIT缓存不会丢失、WAL重放无需重新开始、缓存预热不再是生产事件。Vertical Pod Autoscaler的InPlaceOrRecreate模式也随之升级为beta，与原地调整功能形成完整闭环。

需要注意的是，该功能要求cgroup v2环境，1.35版本已正式移除cgroup v1支持。

**Source:** [Kubernetes 1.35 In-Place Pod Resize](https://www.rack2cloud.com/kubernetes-1-35-in-place-pod-resize-production/)

### Kubernetes Agent Sandbox项目：AI Agent运行时的云原生抽象

SIG Apps正式推出Agent Sandbox项目，旨在为Kubernetes上的AI Agent工作负载提供标准化抽象。项目引入了Sandbox CRD（自定义资源定义），作为运行AI Agent运行时的轻量级单容器环境。

Sandbox CRD的核心特性包括：稳定网络标识（每个Sandbox拥有稳定主机名）、生命周期管理（支持空闲环境的弹性扩缩容）、安全隔离（原生支持gVisor和Kata Containers等运行时）、以及SandboxWarmPool（预配置池以消除冷启动延迟）。

该项目解决了AI工作负载与Kubernetes传统原语之间的抽象差距，Agent典型的隔离、有状态、单例工作负载模式与Kubernetes的stateless导向设计存在根本差异。

**Source:** [Running Agents on Kubernetes with Agent Sandbox](https://kubernetes.io/blog/2026/03/20/running-agents-on-kubernetes-with-agent-sandbox/)

### Ingress2Gateway 1.0正式发布：Ingress-NGINX迁移利器

SIG Network正式发布Ingress2Gateway 1.0版本，该工具帮助团队从Ingress资源迁移到Gateway API。随着Ingress-NGINX将于2026年3月正式退役，这一工具变得尤为重要。

1.0版本大幅扩展了Ingress-NGINX注解支持，从此前的3个注解增加到30多个。工具能够翻译Ingress资源配置及实现特定注解，同时警告不支持的配置并提供替代建议。

该版本改进了通知的格式和内容，使不支持的行为和不支持的配置一目了然。对于仍在使用Ingress-NGINX的组织，建议立即开始评估Gateway API迁移路径。

**Source:** [Ingress2Gateway 1.0 Release](https://kubernetes.io/blog/2026/03/20/ingress2gateway-1-0-release/)

### Kubernetes镜像促进工具全面重写

Kubernetes镜像促进工具（kpromo）完成全面重写，代码库缩减20%，同时增加了 provenance 认证、管道引擎和漏洞扫描能力。重写采用分阶段方式，每阶段可独立审查、合并和验证。

新架构将注册表和认证操作置于清晰接口之后，构建了管道引擎以顺序执行推广步骤。在性能方面，所有操作均实现显著提升。这是确保registry.k8s.io上每个容器镜像安全可靠分发的关键基础设施。

**Source:** [The Invisible Rewrite: Modernizing the Kubernetes Image Promoter](https://kubernetes.io/blog/2026/03/17/image-promoter-rewrite/)

## 分析

本周的更新反映了Kubernetes生态系统演进中的几个关键趋势。首先是对Stateful工作负载的持续优化。长期以来，Kubernetes的运维心智模型偏向无状态应用，原地资源调整的稳定化标志着平台正在消除这一历史包袱。对于企业基础设施中的主流工作负载——数据库、缓存、消息队列——这项改变意味着运维团队不再需要在资源效率和运行稳定性之间做艰难取舍。

其次是AI工作负载的原生支持成为优先事项。Agent Sandbox项目的推出表明Kubernetes社区认识到AI Agent与传统微服务在工作模式上存在本质差异。长时间运行、有状态、需要安全隔离的"数字工作空间"模式，与Kubernetes擅长的无状态、横向扩展模型并不完全匹配。SIG Apps选择通过CRD而非修改核心API来解决问题，体现了Kubernetes扩展性的设计哲学。

第三是网络层面的代际更替加速。Ingress-NGINX的退役和Ingress2Gateway的成熟，标志着Kubernetes网络从Ingress向Gateway API的过渡进入倒计时。对于运维团队，这意味着需要重新审视现有的 ingress controller部署模式和流量管理策略。

## 结论

Kubernetes 1.35周期发布的这些更新，共同指向一个更成熟、更广泛适用的容器编排平台。原地资源调整解决了困扰企业多年的运维痛点，Agent Sandbox为AI工作负载提供了规范化路径，Ingress2Gateway简化了网络层升级路径。对于正在运行生产Kubernetes的组织，建议优先评估1.35版本的升级计划，特别关注cgroup版本要求和IPVS模式废弃公告。同时，对于仍在使用Ingress-NGINX的集群，Ingress2Gateway 1.0的发布是启动迁移评估的信号。
