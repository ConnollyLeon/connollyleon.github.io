---
layout: post
title: "军事科技动态：五角大楼与Nvidia、Microsoft、AWS签约部署AI至机密网络"
date: 2026-05-03
author: "云原生观察"
source: "https://techcrunch.com/2026/05/01/pentagon-inks-deals-with-nvidia-microsoft-and-aws-to-deploy-ai-on-classified-networks/"
categories:
  - military
tags:
  - dod
  - ai
  - classified-networks
  - kubernetes
  - edge-computing
---

# 军事科技动态：五角大楼与Nvidia、Microsoft、AWS签约部署AI至机密网络

美国国防部正在加速推进AI-first军事转型。五角大楼与Nvidia、Microsoft、AWS和Reflection AI签署协议，允许在机密网络上部署其AI技术和模型；Nutanix Kubernetes Platform通过Platform One为国防机构提供服务；classified环境中的Kubernetes部署实践日益成熟。这些进展表明，云原生技术正在深度融入国防基础设施。

## 主要新闻

### 五角大楼签署AI机密网络部署协议

美国国防部宣布与Nvidia、Microsoft、Amazon Web Services和Reflection AI签署协议，允许在IL6和IL7级别的机密环境中部署其AI硬件和模型，用于"合法作战使用"。此前国防部已与Google、SpaceX和OpenAI达成类似协议。超过130万国防部人员已使用GenAI.mil安全企业平台进行非机密任务。国防部表示这些协议"加速了将美国军方建立为AI-first战斗力的转型"，并强调将继续构建防止AI供应商锁定的架构。

**Source:** [Pentagon Inks AI Deals with Nvidia, Microsoft, AWS](https://techcrunch.com/2026/05/01/pentagon-inks-deals-with-nvidia-microsoft-and-aws-to-deploy-ai-on-classified-networks/)

### Nutanix Kubernetes Platform通过Platform One提供服务

Nutanix宣布其Kubernetes平台(NKP)现已通过Platform One的P1 Solutions Marketplace提供，使国防组织能够轻松获取NKP。NKP提供纯CNCF上游Kubernetes，避免专有分叉和供应商锁定，支持跨数据中心、云和战术边缘环境的统一操作。平台具备空中隔离环境就绪的工作流、IL5/IL6合规性和战术边缘部署能力，支持国防部DevSecOps、零信任和FedRAMP要求。

**Source:** [Nutanix KCP Through Platform One](https://www.nutanix.com/blog/nkp-now-available-through-platform-one)

### 情报级Kubernetes部署实践详解

在情报社区级（IC tier）环境中，Kubernetes已成为新服务部署的默认方式，但需要在显著约束下运行。Red Hat OpenShift Container Platform是最常见的选择，因其STIG支持、FIPS-140模式和Red Hat支持。RKE2在国防部和情报足迹中增长显著，因其攻击面小和FIPS-140认证。Cilium正在成为高吞吐量或eBPF可观测性工作负载的首选CNI。所有部署都需要STIG加固的基础镜像、运行时安全执行和网络策略限制。

**Source:** [Kubernetes in the IC Tier](https://precisionfederal.com/insights/kubernetes-in-the-ic-tier)

### DOD参考设计：CNCF多集群Kubernetes

国防部企业DevSecOps参考设计系列中的CNCF多集群Kubernetes参考设计，为国防部组织提供在Kubernetes上构建和部署云原生软件的架构和设计指导。该设计强调多集群设计范式可减少爆炸半径、实现更好的隔离和资源分配，并利用组合式工具链。每个集群在创建时即具备生产就绪的安全、合规和稳定性能力。

**Source:** [DOD Reference Design - CNCF Multi-Cluster Kubernetes](https://dodcio.defense.gov/Portals/0/Documents/Library/DoDReferenceDesign-CNCFMulti-ClusterKubernetes.pdf)

## 分析

五角大楼与多家AI供应商签署机密网络部署协议，这一系列动作反映了国防部AI战略的几个关键方向。首先，在与Anthropic就AI模型使用条款发生争议后，国防部正在积极推行供应商多元化策略。与Nvidia、Microsoft、AWS和Reflection AI的新协议，加上之前与Google、SpaceX和OpenAI的合作，构建了一个多样化的AI供应商生态系统，确保军方不会被单一供应商锁定。

IL6和IL7级别的部署要求是这一战略的技术核心。这些高级别安全分类意味着数据系统对国家安全至关重要，需要通过严格的物理保护、访问控制和审计来保障。能够在这些环境中部署AI硬件和模型，是AI从辅助工具向作战决策系统转变的前提条件。

Nutanix KNP通过Platform One的提供，以及IC级Kubernetes部署实践的发展，表明Kubernetes在国防领域的应用正在从实验性部署走向标准化、规模化。Platform One作为美国军方的软件交付引擎，集成了Iron Bank的加固容器、零信任sidecar安全和CNCF认证的Kubernetes，形成了一个完整的DevSecOps自动化管道。

值得注意的是，边缘计算在国防Kubernetes部署中扮演着越来越重要的角色。RKE2因其小攻击面在战术边缘环境中增长显著，K3s和MicroK8s等轻量级Kubernetes发行版也在断开连接的环境中发挥作用。这种"边缘对称性"——在云区域和战术边缘部署相同的工作负载而无需改变基础设施或安全态势——正在成为国防云架构的关键设计原则。

## 结论

国防部的AI-first转型正在加速推进，从企业级AI辅助工具到机密网络上的作战AI系统，从单一云部署到多云、边缘对称的架构。云原生技术特别是Kubernetes，正在成为国防软件基础设施的核心。对于国防科技从业者而言，理解IL5/IL6环境的技术要求、掌握安全加固的Kubernetes部署实践、以及适应多云和边缘计算架构，将是参与这一转型的关键能力。随着更多AI供应商加入国防部生态系统，AI在军事领域的应用预计将进一步深化和多样化。
