---
layout: post
title: "军事云原生：DoD推进Kubernetes边缘部署与Palantir扩展授权边界"
date: 2026-04-15
author: "防务观察"
source: https://palantir.medium.com/introducing-pfcs-forward-d8755d34c429
categories:
  - military
tags:
  - kubernetes
  - DoD
  - edge computing
  - security
---

# 军事云原生：DoD推进Kubernetes边缘部署与Palantir扩展授权边界

本周军事云原生领域传来多项进展。Palantir宣布PFCS Forward，将IL5/IL6临时授权从云扩展至边缘；DoD发布Cloud Security Playbook第二卷，涵盖容器和微服务安全；国防部继续推进基于Kubernetes的DevSecOps现代化战略。

## 主要新闻

### Palantir PFCS Forward实现边缘授权

Palantir宣布推出PFCS Forward，将同样的软件功能和安全保障从云端扩展至边缘。PFCS Forward将Palantir联邦云服务(IL5和IL6)的临时授权从超大规模云扩展到本地、边缘和战术环境。该平台基于三个核心技术：Rubix(硬化的Kubernetes基础设施平台)、Apollo(自主软件部署平台)和Ontology(可扩展治理)。Rubix提供容器编排，同时增加安全硬化和合规控制，包括Cilium网络分段、Pod安全上下文、不可变基础设施和多租户隔离。

**Source:** [Introducing PFCS Forward: Extending IL5/IL6 Authorization from Cloud to Edge](https://palantir.medium.com/introducing-pfcs-forward-d8755d34c429)

### DoD Cloud Security Playbook第二卷聚焦容器安全

国防部发布Cloud Security Playbook第二卷，重点讨论容器和微服务安全。文档涵盖Kubernetes安全最佳实践、Sidecar安全容器(SSC)方法以及服务网格概念。Playbook强调，DoD要求使用CNCF认证的Kubernetes，并详细说明了使用Kubernetes部署SSC进行安全隔离的方案。该指南是DoD Enterprise DevSecOps Reference Design系列的组成部分。

**Source:** [Cloud Security Playbook Volume 2](https://dodcio.defense.gov/Portals/0/Documents/Library/CloudSecurityPlaybookVol2.pdf)

### DoD IL5 Kubernetes现代化蓝图

2i公司发布DoD IL5 Kubernetes on OCI OKE现代化蓝图，阐述国防部如何使用Oracle Container Engine for Kubernetes(OKE)满足任务平台需求。该方案采用Kubernetes作为"云操作系统"，抽象底层基础设施，使团队能够一致且安全地跨云部署和管理应用。OCI的OKE管理控制平面(负责调度、扩展和维护集群)，而用户管理工作节点和工作负载。这一分工使国防部任务团队能够专注于应用弹性和安全，而非底层平台维护。

**Source:** [DoD IL5 Kubernetes on OCI OKE: Modernization Blueprint](https://ikedainnovations.com/modernizing-dod-mission-platforms-with-kubernetes-on-oracle-cloud-infrastructure-oci/)

### DoD DevSecOps多集群Kubernetes参考设计

国防部发布CN​CF Multi-Cluster Kubernetes参考设计，为在Kubernetes上构建和部署云原生软件提供架构指导。该设计针对DoD特殊需求进行了优化，包括在断开或连接受限的环境中运行工作负载的能力。多集群Kubernetes设计范式减少了将正确工具带入正确环境的摩擦，使开发者能够在不同安全域之间保持一致性，同时支持工作负载在断开或有限连接环境中的运行。

**Source:** [DOD Reference Design - CNCF Multi-Cluster Kubernetes](https://dodcio.defense.gov/Portals/0/Documents/Library/DoDReferenceDesign-CNCFMulti-ClusterKubernetes.pdf)

## 分析

国防部云原生战略的核心挑战是平衡安全要求与作战敏捷性。传统上，授权(ATO)流程是向Warfighter交付边缘能力的主要限制因素。PFCS Forward通过预授权的安全架构解决了这一瓶颈，使政府客户能够继承经过验证的安全设计，而无需从头构建软件基线。

Kubernetes在国防部的作用已从实验性技术演变为任务关键平台。多集群Kubernetes参考设计体现了DoD对分布式作战环境的深刻理解——在国防信息网络上运行的工作负载通常处于敏感且与公网隔离的环境中。

云边协同成为本周主题。随着战术环境对计算能力的需求增长，将云端安全能力延伸至边缘变得至关重要。Palantir的Mission Manager提供了完全托管且经过授权的Kubernetes环境，抽象了硬件差异，显著降低了授权负担。

## 结论

2026年国防部云原生技术呈现出几个明显趋势：从云向边缘扩展安全授权能力、容器和微服务安全实践的标准化、多云和混合云策略的成熟。对于国防技术供应商而言，理解DoD的DevSecOps参考架构并提供符合STIG和SRG要求的产品将是在联邦市场保持竞争力的关键。随着AI工作负载在军事领域的应用扩展，云原生平台将成为战术边缘智能的关键支撑。
