---
layout: post
title: "云原生技术动态：Kubernetes v1.35引领AI基础设施革新 安全与效率并重"
date: 2026-03-07
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/02/23/kubernetes-as-ais-operating-system-1-35-release-signals/"
categories:
  - cloud-native
tags:
  - kubernetes
  - AI
  - containers
  - cloud-native
  - service-mesh
---

# 云原生技术动态：Kubernetes v1.35引领AI基础设施革新 安全与效率并重

本周云原生领域迎来多项重要更新。Kubernetes v1.35版本强化了AI工作负载支持，Node Readiness Controller提升Pod调度可靠性，零信任AI代理系统开始在生产环境部署，云原生技术正在成为AI时代的基础设施核心。

## 主要新闻

### Kubernetes v1.35成为AI操作系统

Kubernetes v1.35版本被业界视为"AI基础设施发布"，该版本解决了长期困扰运维人员的重启难题，引入In-Place Pod Resizing（原地Pod资源调整）正式版，显著减少了Pod资源调整时的停机时间。同时新增的工作负载感知调度功能，使ML训练任务的协调放置更加高效。

**Source:** [Kubernetes as AI's operating system: 1.35 release signals](https://www.cncf.io/blog/2026/02/23/kubernetes-as-ais-operating-system-1-35-release-signals/)

### Node Readiness Controller提升Pod调度可靠性

Kubernetes项目引入Node Readiness Controller，旨在改善Pod调度的可靠性。该控制器通过更精确地跟踪节点状态，减少了因节点状态信息滞后导致的调度失误，提升了大规模集群的稳定性。

**Source:** [Kubernetes Introduces Node Readiness Controller to Improve Pod Scheduling Reliability](https://www.infoq.com/news/2026/02/kubernetes-node-readiness/)

### Red Hat发布Kagenti零信任AI代理系统

Red Hat发布Kagenti v0.2.0-alpha.19，这是一个基于Kubernetes的AI代理控制平面。该系统采用零信任架构，解决AI代理在生产环境中的身份验证、权限控制和审计追踪问题，为企业部署AI代理提供了安全基础。

**Source:** [Zero trust AI agents on Kubernetes: What I learned deploying multi-agent systems on Kagenti](https://next.redhat.com/2026/03/05/zero-trust-ai-agents-on-kubernetes-what-i-learned-deploying-multi-agent-systems-on-kagenti/)

### CNCF调查：82%组织使用Kubernetes AI inference成主流

CNCF 2026年1月发布的年度调查显示，82%的容器用户已在生产环境中运行Kubernetes，66%托管生成式AI模型的组织使用Kubernetes进行部分或全部推理工作负载。Kubernetes已从无状态Web服务扩展到分布式数据处理、LLM推理和自主AI代理。

**Source:** [The great migration: Why every AI platform is converging on Kubernetes](https://www.cncf.io/blog/2026/03/05/the-great-migration-why-every-ai-platform-is-converging-on-kubernetes/)

## 分析

Kubernetes v1.35版本的发布标志着容器编排平台进入"AI操作系统"时代。In-Place Pod Resizing的正式GA解决了困扰运维团队多年的"重启头痛"问题，这意味着生产环境中的AI推理服务可以在不中断的情况下调整资源配置，极大提升了服务可用性。

零信任AI代理系统的出现反映了云原生安全的新范式。随着AI代理在企业生产环境中执行越来越复杂的任务，传统的边界安全模型已不再适用。Kagenti等零信任解决方案的兴起，预示着云原生安全正在向"永不信任，始终验证"的方向演进。

CNCF调查数据揭示了一个重要趋势：AI工作负载正在成为Kubernetes的第二增长曲线。从82%的容器采用率和66%的AI推理工作负载渗透率来看，云原生技术已从"可选"变为"必需"。对于企业IT决策者而言，现在是将Kubernetes作为AI基础设施默认选择的时刻。

## 结论

本周的云原生动态表明，Kubernetes正在从通用的容器编排平台演变为AI时代的基础设施操作系统。技术层面，效率和安全是两大主线；生态层面，AI工作负载已占据越来越重要的地位。随着KubeCon Europe 2026即将召开，云原生社区将继续推动技术创新。对于企业和开发者而言，把握这些趋势将有助于在AI时代构建更具竞争力的基础设施。
