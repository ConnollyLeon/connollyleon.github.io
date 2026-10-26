---
layout: post
title: "云原生技术动态：GPU多租户调度测试、Cilium安全补丁与托管Kubernetes版本更新"
date: 2026-10-26
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/10/23/multi-tenant-gpu-kubernetes-on-simulated-hardware-with-kamaji-and-hami/"
categories:
  - cloud-native
tags:
  - kubernetes
  - GPU
  - cilium
  - cloud-native
  - platform engineering
---

# 云原生技术动态：GPU多租户调度测试、Cilium安全补丁与托管Kubernetes版本更新

本周云原生领域的焦点集中在AI基础设施的可验证性与平台稳定性上：社区开始探索在模拟GPU硬件上测试多租户调度策略，Cilium发布新一轮补丁版本，主流托管Kubernetes服务则持续跟进上游版本。这些进展共同指向一个趋势——云原生平台正在从"能用"走向"可验证、可运营"。

## 主要新闻

### 用Kamaji与HAMi在模拟GPU硬件上验证多租户Kubernetes

CNCF博客介绍了如何结合Kamaji与HAMi，在模拟GPU硬件上构建多租户GPU Kubernetes环境。Kamaji提供托管控制平面能力，使每个租户拥有独立控制面；HAMi则负责GPU虚拟化与共享调度。借助模拟硬件，团队无需采购昂贵GPU即可在CI中复现多租户资源争用、配额与调度策略，从而降低测试成本并提升平台交付的可重复性。

**Source:** [Multi-tenant GPU Kubernetes on simulated hardware with Kamaji and HAMi](https://www.cncf.io/blog/2026/10/23/multi-tenant-gpu-kubernetes-on-simulated-hardware-with-kamaji-and-hami/)

### Cilium发布v1.20.4等维护版本

Cilium项目发布v1.20.4，同时为v1.19和v1.18分支提供v1.19.10与v1.18.16维护版本。作为基于eBPF的Kubernetes网络、安全与可观测性方案，Cilium的补丁版本通常聚焦稳定性修复与安全加固。对于生产集群而言，及时跟进受支持分支的补丁是降低网络与策略面风险的基本动作。

**Source:** [Cilium v1.20.4 release](https://github.com/cilium/cilium/releases/tag/v1.20.4)

### Oracle OKE支持Kubernetes 1.36.4

Oracle容器引擎OKE发布说明显示，其已支持Kubernetes 1.36.4版本。托管Kubernetes服务跟进上游补丁，意味着用户可以在控制面托管的前提下获得更新的稳定性与安全修复。对于采用多云策略的企业，各托管服务的版本节奏差异仍是需要纳入平台生命周期管理的重要变量。

**Source:** [OKE Kubernetes 1.36.4 support](https://docs.oracle.com/en-us/iaas/releasenotes/services/conteng/conteng-K8s-1-36-4-support.htm)

## 分析

首先，AI基础设施的测试方式正在发生变化。GPU资源昂贵且供给紧张，直接在真实硬件上验证多租户隔离、配额与调度策略成本极高。Kamaji与HAMi的组合展示了"控制面隔离＋GPU虚拟化＋模拟硬件"的思路，使平台团队能够在开发与CI阶段覆盖更多边界场景，这对提升AI平台的可靠性具有现实意义。

其次，网络与安全组件的补丁节奏值得持续关注。Cilium同时维护多个分支，说明企业环境中版本碎片化仍然普遍。平台团队需要建立清晰的版本支持矩阵与升级窗口，避免因长期停留在旧分支而累积安全债务。

第三，托管Kubernetes的版本跟进反映出上游发布节奏对云服务商的影响。OKE对1.36.4的支持提醒用户，集群版本管理不能只依赖云厂商的默认行为，而应结合自身工作负载的兼容性测试制定升级计划。

对云原生从业者而言，当前的重点不只是"上GPU"，而是建立可重复、可观测、可治理的AI平台工程能力。这包括调度策略的自动化验证、网络策略的持续测试，以及集群版本与补丁的常态化管理。

## 结论

云原生平台正在进入精细化运营阶段。无论是模拟硬件上的GPU多租户验证，还是Cilium与托管Kubernetes的补丁更新，都说明生态的关注点正从功能扩张转向可靠性与可运营性。企业若能在测试自动化和版本治理上提前布局，将在AI基础设施的长期竞争中占据更有利的位置。
