---
layout: post
title: "云原生动态：Red Hat推出Project Navigator AI部署优化，KubeCon India 2026成功举办，CNCF启动CARE认证扩展计划"
date: 2026-06-23
author: "云原生观察"
source: "https://www.redhat.com/en/blog/introducing-project-navigator-ai-intent-optimized-deployment-red-hat-openshift-ai"
categories:
  - cloud-native
tags:
  - red-hat
  - openshift-ai
  - project-navigator
  - kubecon
  - cncf
  - flipkart
  - geo-distributed-ai
  - certification
  - cloud-native
---

# 云原生动态：Red Hat推出Project Navigator AI部署优化，KubeCon India 2026成功举办，CNCF启动CARE认证扩展计划

今日云原生领域多项重要进展。Red Hat发布Project Navigator，为OpenShift AI提供智能模型选择与部署优化；KubeCon + CloudNativeCon India 2026在孟买成功举办；CNCF启动CARE计划，CKS持证人可免费获取CKA认证；Flipkart赢得CNCF用户案例研究竞赛；同时深度技术文章探讨了地理分布式AI运营实践。

## 主要新闻

### Red Hat推出Project Navigator：从AI意图到优化部署

Red Hat发布了Project Navigator，这是一个构建在Red Hat OpenShift AI之上的新组件，旨在帮助数据科学家和平台工程师更智能地选择和部署AI模型。Project Navigator通过分析集群资源状况和模型特性，提供智能模型选择建议，并自动生成针对特定集群优化的Kubernetes清单。它能够从用户的模型目录中推荐最佳匹配，并生成优化的部署配置，显著减少手动选择和调优的工作量。Project Navigator的发布标志着OpenShift AI在降低AI部署复杂性和加速模型投入生产方面迈出了重要一步。

**Source:** [Introducing Project Navigator: From AI intent to optimized deployment on Red Hat OpenShift AI](https://www.redhat.com/en/blog/introducing-project-navigator-ai-intent-optimized-deployment-red-hat-openshift-ai)

### KubeCon + CloudNativeCon India 2026在孟买成功举办

KubeCon + CloudNativeCon India 2026于6月18日至19日在印度孟买成功举办。这是CNCF在印度举办的首次大型KubeCon活动，吸引了来自全球的云原生技术专家和社区成员。会议重点讨论了Kubernetes在AI工作负载中的角色、平台工程的演进、以及云原生技术在新兴市场的应用实践。大会还举办了多场技术研讨会和项目维护者会议，进一步巩固了印度作为全球云原生技术发展重要引擎的地位。

**Source:** [KubeCon + CloudNativeCon India 2026](https://events.linuxfoundation.org/kubecon-cloudnativecon-india/)

### CNCF启动CARE计划：CKS持证人可免费获取CKA认证

CNCF宣布启动CARE（CKA Accreditation and Recertification Expansion）计划，允许已获得CKS（Certified Kubernetes Security Specialist）认证的持证人在当前认证周期内免费获取CKA（Certified Kubernetes Administrator）认证。该计划旨在鼓励安全专业工程师同时掌握Kubernetes管理与安全两个维度的技能，响应行业对综合型Kubernetes人才日益增长的需求。CARE计划的启动也降低了多认证获取的经济门槛，有助于提升整个云原生生态的安全运营水平。

**Source:** [CARE - Expanded certification offerings for you](https://www.cncf.io/care/)

### Flipkart赢得CNCF最终用户案例研究竞赛

Flipkart在CNCF最终用户案例研究竞赛中获胜，展示了其在大规模Kubernetes和混沌工程领域的实践经验。作为印度最大的电商平台之一，Flipkart分享了如何利用Kubernetes和混沌工程工具在大规模微服务架构中保持系统可靠性的深入案例。这一案例为其他大型电商和在线服务平台提供了宝贵的参考——如何在亿级用户规模下通过混沌工程实践提前发现和修复系统弱点，确保核心交易系统的稳定性。

**Source:** [Flipkart Wins CNCF End User Case Study Contest for Kubernetes and Chaos Engineering Scale](https://www.cncf.io/announcements/2026/06/17/flipkart-wins-cncf-end-user-case-study-contest-for-kubernetes-and-chaos-engineering-scale/)

### 地理分布式AI运营：k0smos平台的实践

CNCF博客发表了一篇关于地理分布式AI运营的深度技术文章，探讨了如何利用k0smos平台突破单一数据中心限制。文章提出了一套在多个地理区域分布AI工作负载的架构模式，优化延迟、数据主权和成本之间的平衡。随着AI监管要求（如欧盟AI Act）和边缘AI场景的增多，地理分布式AI运营正从可选方案变为必选方案。k0smos平台通过跨集群Kubernetes编排，实现了AI推理工作负载在多个地理位置间的智能路由和资源调度。

**Source:** [Breaking free of a single datacenter: Practical geo-distributed AI operations with the k0smos platform](https://www.cncf.io/blog/2026/06/08/breaking-free-of-a-single-datacenter-practical-geo-distributed-ai-operations-with-the-k0smos-platforms/)

## 分析

今日的云原生动态显示了几个重要趋势。

Project Navigator的发布标志着Red Hat在AI基础设施领域的重要产品化方向。传统上，OpenShift AI主要提供模型开发和部署平台能力，而Project Navigator在此基础上增加了智能决策层。这一组件通过将集群状态感知、模型特性分析和部署优化自动化，直接回应了企业在将AI模型投入生产时面临的核心痛点——模型选择困难症和部署配置复杂性。对于平台工程团队，这意味着可以减少对个别专家的依赖，通过工具化的方式实现AI部署的最佳实践。

KubeCon India的成功举办反映了亚太地区云原生技术生态的快速增长。印度拥有全球增长最快的开发者社区之一，KubeCon进入印度标志着CNCF对新兴市场战略投入的深化。Flipkart赢得案例竞赛也呼应了这一趋势——印度企业在大规模分布式系统和混沌工程领域的实践经验正在获得全球认可。

CNCF的CARE计划则反映了认证体系的演进方向。随着Kubernetes生态系统的成熟，单一维度的认证已不足以满足行业需求。安全与管理的融合要求专业人士同时理解两个领域，CARE计划通过降低跨领域认证的成本，推动全栈Kubernetes人才的发展。

## 结论

2026年6月23日的云原生动态表明，平台工程、AI基础设施和社区生态正在三个维度同步演进。Red Hat Project Navigator推动了AI部署的智能化，KubeCon India扩展了社区地理版图，CARE计划降低了认证门槛。对于云原生从业者，关注AI与Kubernetes的深度整合、参与区域社区活动、以及拓展认证技能组合将是保持竞争力的关键方向。
