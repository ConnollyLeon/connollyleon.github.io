---
layout: post
title: "云原生技术动态：Kubernetes成为AI"操作系统"与Ingress NGINX退役倒计时"
date: 2026-02-21
author: "云原生观察"
source: https://www.devopsdigest.com/kubernetes-established-as-de-facto-operating-system-for-ai
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - AI
  - ingress-nginx
  - container
---

# 云原生技术动态：Kubernetes成为AI"操作系统"与Ingress NGINX退役倒计时

本周云原生领域迎来重要变革，Kubernetes已稳固确立为人工智能事实上的"操作系统"地位，同时广受欢迎的Ingress NGINX控制器即将退役，引发业界大规模迁移潮。

## 主要新闻

### Kubernetes成为AI基础设施的"操作系统"

根据2026年CNCF年度云原生调查，82%的容器用户已在生产环境中运行Kubernetes，这一数据标志着Kubernetes已成为AI工作负载的核心平台。调查显示，Kubernetes已成为云原生规模、稳定性和创新的通用标准，尤其在企业将AI投入生产环境方面发挥着关键作用。

**Source:** [Kubernetes Established as De Facto "Operating System" for AI](https://www.devopsdigest.com/kubernetes-established-as-de-facto-operating-system-for-ai)

### Ingress NGINX退役进入倒计时

Kubernetes社区于2025年11月宣布Ingress NGINX将于2026年3月底正式退役，由于维护资源不可持续，届时将停止所有安全补丁和错误修复。这一组件在约50%的生产Kubernetes环境中使用，其"IngressNightmare"漏洞（CVE-2025-1974）允许未经认证的远程代码执行，可完全控制Kubernetes集群。

**Source:** [Kubernetes project issues warning on Ingress NGINX retirement](https://securitylabs.datadoghq.com/articles/kubernetes-ingress-nginx-retirement-warning/)

### Node Readiness Controller增强Kubernetes调度能力

Kubernetes v1.36版本引入了Node Readiness Controller（NRC），旨在解决节点就绪状态的长期挑战。该功能可自动检测和处理未就绪节点，提升生产环境的工作负载调度效率，减少因节点状态问题导致的部署延迟。

**Source:** [Scheduling Sanity in Kubernetes: Introducing the Node Readiness Controller](https://medium.com/@usamakhaninsights/scheduling-sanity-in-kubernetes-introducing-the-node-readiness-controller-nrc-fef4d1725728)

### VMware发布vSphere Kubernetes Service 3.6

VMware发布了vSphere Kubernetes Service 3.6版本，专注于提升企业Kubernetes的安全性、灵活性和可操作性。新版本重点解决了集群升级、安全运行和支持数据库及受监管应用等挑战。

**Source:** [VMware vSphere Kubernetes Service 3.6](https://blogs.vmware.com/cloud-foundation/2026/02/11/vmware-vsphere-kubernetes-service3-6-making-enterprise-kubernetes-safer-more-flexible-and-easier-to-operate/)

## 分析

Kubernetes在AI领域的主导地位反映了云原生技术的范式转变。82%的采用率不仅是一个数字，更代表着整个行业在基础设施标准化方面的共识。对于AI从业者而言，Kubernetes提供了统一的可扩展性、容错能力和资源管理框架，使得大规模AI模型的部署和运维变得更加可预测。

然而，Ingress NGINX的退役给广大用户带来了紧迫的迁移压力。50%的生产环境使用率意味着全球数万个Kubernetes集群需要在新版本发布后的短短一个月内完成替代方案的实施。这既是挑战也是机遇——它推动着整个生态向更安全、更现代化的Ingress解决方案演进。

从技术发展角度看，Node Readiness Controller的引入表明Kubernetes正在从"能运行"向"运行好"的方向进化。vSphere K8s 3.6的发布则显示了企业级市场对云原生平台的持续投入。

## 结论

云原生领域正处于AI驱动的基础设施转型期。Kubernetes作为AI"操作系统"的角色将进一步巩固，同时围绕服务网格、安全、边缘计算等领域的创新将持续加速。对于企业用户而言，现在正是评估和规划迁移方案的关键时机，以确保在Ingress NGINX退役前完成平滑过渡。
