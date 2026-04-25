---
layout: post
title: "云原生技术动态：Kubernetes 1.36生产就绪与Ingress-NGINX退役影响分析"
date: 2026-04-25
author: "云原生观察"
source: https://kubernetes.io/blog/2026/03/30/kubernetes-v1-36-sneak-peek/
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - container
  - ingress-nginx
  - gateway-api
---

# 云原生技术动态：Kubernetes 1.36生产就绪与Ingress-NGINX退役影响分析

本周云原生领域最重要的新闻是Kubernetes 1.36的正式发布及其对生态系统的影响。这一版本不仅带来了多项关键功能升级，还标志着ingress-nginx正式退役后云原生入口管理进入新阶段。对于平台工程师而言，正确理解和应对这些变化将是未来几个月的重要任务。

## 主要新闻

### Kubernetes 1.36 "Haru"正式发布

Kubernetes 1.36于2026年4月22日正式发布，代号"Haru"，带来了约71项增强功能。本次发布的安全性提升尤为突出，三个关键安全特性同时升级为稳定版：

**User Namespaces**：Pod级别的内核隔离功能正式进入生产就绪状态。这项功能确保即使恶意攻击者获得容器权限，也无法轻易获取宿主机底层权限，从根本上增强了容器边界隔离能力。

**Fine-grained kubelet API authorization**：集群运营商现在可以精细控制对特定kubelet端点的访问权限，监控工具可以获得精确所需的访问级别，而无需广泛的权限。

**Mutating Admission Policies**：现在可以使用CEL定义变更逻辑，无需Webhook服务器或TLS配置，大幅简化了准入控制的实现方式。

**Source:** [Kubernetes v1.36 Released with 71 Improvements](https://www.digitaltoday.co.kr/en/view/50212/kubernetes-1-36-released-with-71-improvements-what-changed)

### Ingress-NGINX正式退役——迁移窗口紧迫

2026年3月24日，Kubernetes SIG Network和Security Response Committee正式宣布退役ingress-nginx项目。这意味着从该日期起不再有版本发布、漏洞修复或CVE补丁。现��部署将继续运行，但已暴露于不断累积的安全风险中。

社区推荐的迁移目标是Gateway API——这一CNCF支持的面向角色的路由标准。值得注意的是，这不是建议而是硬截止日期。每拖延一天，安全暴露风险都在增加。

**Source:** [Kubernetes 1.36: What Platform Engineers Need to Know](https://dev.to/mateenali66/kubernetes-v136-drops-april-22-what-platform-engineers-actually-need-to-know-3l81)

### Gateway API v1.5发布

Gateway API v1.5于2026年3月14日发布，是迄今为止最大的版本更新。该版本将六个广泛请求的功能升级至标准通道：

- **ListenerSet**：简化多个类似监听器的管理
- **TLSRoute升级为稳定版**：提供更灵活的TLS路由配置
- **HTTPRoute CORS过滤器**：简化跨域资源共享配置
- **客户端证书验证**：增强mTLS场景的证书管理
- **Gateway TLS源的证书选择**：优化证书管理流程
- **ReferenceGrant升级为v1版本**：提供跨命名空间引用保障

**Source:** [Gateway API v1.5: Moving features to Stable](https://kubernetes.website.cncfstack.com/blog/2026/04/21/gateway-api-v1-5/)

### HPA Scale-to-Zero与成本优化

v1.36引入了HPA scale-to-zero作为默认启用功能。通过设置`minReplicas: 0`，企业可将空闲计算成本降低高达73%。这对于处理周期性工作负载或事件驱动型应用的企业来说是重大利好。

同时，Gang Scheduling for AI和批处理作为Alpha功能引入，使相关Pod组可作为单一实体进行调度。当需要为高优先级作业腾出空间时，整个组会被抢占而非单个Pod。

**Source:** [Kubernetes 1.36: What's New and Should You Upgrade?](https://hubkub.com/dev-it-ops/kubernetes-1-36-whats-new/)

## 分析

**安全范式转变**：User Namespaces和Mutating Admission Policies的稳定化表明云原生安全正在从外围防御向内层隔离演进。传统的容器安全主要关注边界防护，而现在开始在运行时层面构建深度防御。对于处理敏感工作负载的团队，这两项功能值得优先评估。

**入口控制器的结构性变革**：ingress-nginx的退役不仅是技术更替，更反映了云原生网络理念的根本转变。Gateway API的面向角色模型比传统的Ingress资源更加灵活和声明式。然而，大量现有部署意味着迁移工作量巨大。企��应立即开始评估当前ingress-nginx的使用模式，并制定分阶段迁移计划。

**AI工作负载的原生支持**：DRA对可分割设备的支持和工作负载感知抢占机制的引入，标志着Kubernetes正在成为AI基础设施的标准编排层。单个GPU可以分裂成多个逻辑单元分配给不同工作负载，这解决了AI部署中的核心资源利用问题。

**平台团队的角色演变**：随着Kubernetes功能日益丰富，平台团队需要从单纯的基础设施运维转向更高级的能力建设。HPA scale-to-zero等功能使成本优化更加自动化，但同时也需要更精细的容量规划和监控。

## 结论

Kubernetes 1.36是一个生产就绪性版本，填补了长期存在的功能空白。实践建议：在两周内在非关键集群上测试HPA配置、准入Webhook和容器运行时兼容性；验证现有应用是否兼容User Namespaces；制定ingress-nginx到Gateway API的迁移路线图。对于运行AI推理工作负载或关注集群安全的团队，这个版本是必读内容。对于使用云托管Kubernetes(EKS、GKE、AKS)的用户，需等待云服务商提供v1.36支持后再进行升级规划。