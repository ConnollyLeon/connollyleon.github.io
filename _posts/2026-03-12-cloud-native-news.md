---
layout: post
title: "云原生技术动态：Kubernetes v1.36即将发布与Gateway API全面GA"
date: 2026-03-12
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/03/09/announcing-ai-gateway-wg/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - gateway-api
  - AI
---

# 云原生技术动态：Kubernetes v1.36即将发布与Gateway API全面GA

本周云原生领域迎来多项重要更新，Kubernetes v1.36即将发布，同时AWS Load Balancer Controller正式支持Gateway API，Calico发布冬季2026版本。这些进展表明云原生技术正向AI工作负载支持和更精细的网络管理方向演进。

## 主要新闻

### Kubernetes v1.36版本即将发布

Kubernetes v1.36版本正式定于2026年4月22日发布，目前已进入最终测试阶段。该版本将继续优化节点管理、增强调度器的公平性，并提供更好的GPU资源调度支持。新版本将进一步提升大规模集群的稳定性和可管理性。

**Source:** [Kubernetes v1.36 — Sneak Peek](https://thekubeguy.com/kubernetes-v1-36-sneak-peek-7c5422ffd841)

### AWS Load Balancer Controller正式支持Gateway API

AWS宣布AWS Load Balancer Controller已正式支持Kubernetes Gateway API，达到通用可用状态（GA）。此前，该控制器仅支持Kubernetes Ingress和Service资源，现在用户可以直接使用Gateway API定义AWS负载均衡器，获得更精细的流量管理能力。

**Source:** [AWS Load Balancer Controller adds general availability support for Kubernetes Gateway API](https://aws.amazon.com/blogs/networking-and-content-delivery/aws-load-balancer-controller-adds-general-availability-support-for-kubernetes-gateway-api/)

### Kubernetes引入Node Ready Controller

Kubernetes项目近日宣布推出Node Ready Controller，这是一个新的核心控制器，旨在通过为API服务器提供更准确的节点就绪状态视图来增强调度可靠性和集群健康。该功能目前处于alpha阶段，解决了kubelet与API服务器之间短暂网络中断导致调度错误的问题。

**Source:** [Kubernetes introduces a node readiness controller to improve Pod scheduling reliability](https://longbridge.com/news/278033496)

### KubeCon EU 2026即将开幕

KubeCon + CloudNativeCon Europe 2026将于3月23日至26日在阿姆斯特丹举行。本次大会涵盖多个重要主题，包括AI代理的安全策略、最小权限模型、服务网格等。值得关注的是关于零信任AI代理和多代理系统在Kubernetes上部署的讨论。

**Source:** [KubeCon EU 2026 — 7 Talks We Can't Miss in Amsterdam](https://dev.to/matthiasbruns/kubecon-eu-2026-7-talks-we-cant-miss-in-amsterdam-5fce)

## 分析

AWS Load Balancer Controller对Gateway API的全面支持标志着Kubernetes网络管理进入新阶段。Gateway API提供了比传统Ingress更丰富的路由功能，包括请求镜像、重试策略、超时控制等高级特性。随着AWS的全面支持，企业在AWS上运行Kubernetes时将拥有更灵活的网络配置能力。

Node Ready Controller的引入解决了Kubernetes集群运维中的长期痛点。在大规模动态集群中，节点的短暂不可用经常导致调度问题，将Pod错误地分配给已标记为不可用的节点。这个新控制器通过更准确地跟踪节点状态，帮助避免不必要的Pod驱逐，提高工作负载稳定性。

从AI工作负载的角度看，Kubernetes正在成为AI基础设施的核心平台。CNCF的调查显示，82%的容器用户在生产环境中运行Kubernetes，66%托管生成式AI模型的企业使用Kubernetes进行推理工作负载。这一趋势将推动更多专门针对AI场景的Kubernetes优化和工具出现。

## 结论

本周云原生领域的进展表明，Kubernetes正在持续进化以满足现代工作负载的需求。Gateway API的全面支持为企业提供了更强大的网络管理能力，而Node Ready Controller则解决了运营中的实际痛点。随着KubeCon EU 2026的临近，我们可以期待更多创新的发布和讨论。对于在生产环境中运行Kubernetes的企业来说，及时关注这些更新并规划升级路径将非常重要。
