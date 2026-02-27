---
layout: post
title: "云原生技术动态：Kubernetes 1.35引领AI基础设施变革"
date: 2026-02-27
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/02/23/kubernetes-as-ais-operating-system-1-35-release-signals/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - AI
  - container
---

# 云原生技术动态：Kubernetes 1.35引领AI基础设施变革

本周云原生领域迎来多项重要更新，Kubernetes 1.35版本的发布标志着容器编排平台在AI工作负载支持方面迈出重要一步。该版本被业界视为"AI基础设施版本"，体现了云原生技术与人工智能深度融合的趋势。

## 主要新闻

### Kubernetes 1.35版本发布：AI工作负载成为核心焦点

Kubernetes 1.35（代号"Timbernetes"）版本带来多项针对AI工作负载的优化。该版本强化了混合生产工作负载的协调能力，包括服务、批处理作业、数据管道和机器学习训练。版本更新降低了运营开销，提升了大规模AI推理工作负载的扩展性。

**Source:** [Kubernetes as AI's operating system: 1.35 release signals](https://www.cncf.io/blog/2026/02/23/kubernetes-as-ais-operating-system-1-35-release-signals/)

### Kubernetes 1.35 VPA原地调整功能成亮点

Kubernetes 1.35引入了VPA（Vertical Pod Autoscaler）原地调整功能，这一特性对有状态工作负载的扩展性带来革命性变化。开发者现在可以在不重启Pod的情况下调整资源配额，大幅提升了生产环境的灵活性和稳定性。

**Source:** [Why Kubernetes 1.35 is a game-changer for stateful workload scaling](https://thenewstack.io/kubernetes-vpa-inplace-resize/)

### Kubernetes逐步淘汰Ingress NGINX

Kubernetes社区决定逐步淘汰Ingress NGINX控制器，这标志着云原生网络领域的重大变革。新的替代方案将提供更现代的Ingress管理方式，推动生态系统向更标准化的方向发展。

**Source:** [Why Kubernetes is retiring Ingress NGINX](https://thenewstack.io/kubernetes-to-retire-ingress-nginx/)

### Dragonfly v2.4.0发布

CNCF孵化项目Dragonfly发布v2.4.0版本，新增负载感知调度算法和Vortex协议支持，优化了点对点文件传输性能。该版本的两阶段调度算法结合了中央调度和节点级二次调度，显著提升了P2P下载效率。

**Source:** [Dragonfly v2.4.0 is released](https://www.cncf.io/blog/2026/02/05/dragonfly-v2-4-0-is-released/)

## 分析

Kubernetes 1.35版本的发布反映了云原生生态系统的几个关键趋势。首先，AI工作负载已从边缘用例演变为核心基础设施需求，66%的AI adopters现在使用Kubernetes来扩展推理工作负载。其次，Kubernetes的生产使用率已达到82%，98%的受访组织已采用云原生技术，印证了其作为行业标准的地位。

Ingress NGINX的退役计划则提醒我们，即使是最流行的工具也需要持续演进以满足现代需求。VPA原地调整功能的引入表明，Kubernetes正在解决有状态工作负载这一长期挑战，为数据库和消息队列等关键应用提供更好的支持。

## 结论

云原生技术正在加速与AI的融合，Kubernetes已从单纯的容器编排工具演变为现代基础设施的核心支柱。随着AI应用规模的持续扩大，云原生平台将在支持大规模推理和训练工作负载方面发挥越来越重要的作用。组织需要密切关注这些技术演进，提前规划基础设施升级策略。
