---
layout: post
title: "云原生技术动态：Kubernetes 1.36发布与服务网格新标准"
date: 2026-04-24
author: "云原生观察"
source: https://kubernetes.io/blog/2026/03/30/kubernetes-v1-36-sneak-peek/
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - container
  - service-mesh
---

# 云原生技术动态：Kubernetes 1.36发布与服务网格新标准

本周云原生领域迎来重要更新，Kubernetes 1.36正式发布，带来多项关键功能升级。同时，Gateway API v1.5的发布标志着服务网格领域的重大进步。这些发展反映了云原生生态系统在安全性和多云支持方面的持续演进。

## 主要新闻

### Kubernetes 1.36 "Haru"正式发布

Kubernetes 1.36于2026年4月22日正式发布，代号"Haru"，带来了约70项增强功能，涵盖稳定版、测试版和Alpha版本。本次发布的核心亮点包括：

- **User Namespaces升级为稳定版**：Pod级别的内核隔离功能正式进入生产就绪状态，即使恶意攻击者获得容器权限也无法获取宿主机底层权限
- **Mutating Admission Policies稳定化**：现在可以使用CEL定义变更逻辑，无需Webhook服务器或TLS配置
- **动态资源分配(DRA)增强**：支持可分割设备，单个GPU可以分裂成多个逻辑单元分配给不同工作负载
- **HPA scale-to-zero默认启用**：设置minReplicas: 0可将空闲计算成本降低高达73%

**Source:** [Kubernetes v1.36 Sneak Peek](https://kubernetes.io/blog/2026/03/30/kubernetes-v1-36-sneak-peek/)

### Ingress-NGINX正式退役

2026年3月24日，Kubernetes SIG Network和Security Response Committee正式宣布退役ingress-nginx项目，不再发布版本、修复漏洞或发布CVE补丁。社区建议迁移至Gateway API——这一CNCF支持的面向角色的路由标准。

**Source:** [Kubernetes 1.36: What's New and Should You Upgrade?](https://hubkub.com/dev-it-ops/kubernetes-1-36-whats-new/)

### Gateway API v1.5发布

Gateway API v1.5于2026年3月14日发布，是迄今为止最大的版本更新，重点是将现有实验功能升级为标准通道。六大功能升级至稳定版：

- ListenerSet
- TLSRoute升级为稳定版
- HTTPRoute CORS过滤器和客户端证书验证
- Gateway TLS源的证书选择
- ReferenceGrant升级为v1版本

**Source:** [Gateway API v1.5: Moving features to Stable](https://kubernetes.website.cncfstack.com/blog/2026/04/21/gateway-api-v1-5/)

### kcp v0.31发布

kcp社区于2026年4月13日发布v0.31版本，实现了Kubernetes 1.35 rebase，引入了跨分片服务账户验证的TTL缓存，以及类似clusterloader2的负载测试框架。

**Source:** [kcp v0.31 Release](https://www.kubermatic.com/blog/kcp-v0-31-release/)

## 分析

Kubernetes 1.36的发布体现了云原生生态系统的几个关键趋势：

**安全优先**：User Namespaces和Mutating Admission Policies的稳定化表明社区对容器安全的重视程度显著提升。这反映了在容器化部署日益普及的背景下，对隔离和权限控制的更高要求。

**成本优化**：HPA scale-to-zero的默认启用直接响应了企业在成本控制方面的需求。在云资源成本持续上升的环境下，这一功能可以帮助企业显著减少空闲计算资源的浪费。

**AI/ML工作负载支持**：DRA对可分割设备的支持和工作负载感知的抢占机制表明Kubernetes正在加强对AI/ML工作负载的原生支持。这对于正在大规模部署机器学习系统的企业来说是重要进步。

**入口控制器转型**：ingress-nginx的退役不是终点，而是标志着云原生入口管理进入了新阶段。Gateway API提供了更现代、更灵活的解决方案，这一转变需要企业提前规��迁移策略。

## 结论

Kubernetes 1.36是一个生产就绪性版本，填补了长期存在的功能空白。对于平台工程师而言，本次发布需要关注的重点包括：在非关键集群上测试HPA配置、验证准入Webhook和容器运行时兼容性。对于运行AI推理工作负载或关注集群安全的团队，这个版本是必读内容。建议在两周内在测试环境完成验证，然后逐步推广到生产环境。对于使用云托管Kubernetes(EKS、GKE、AKS)的用户，需等待云服务商提供v1.36支持后再进行升级规划。