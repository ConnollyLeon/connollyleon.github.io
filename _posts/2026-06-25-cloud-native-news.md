---
layout: post
title: "云原生动态：IBM/Red Hat/Palo Alto扩展Project Lightwell应对漏洞响应，K8s 1.36最AI导向版本发布，CNCF 82%生产采用率"
date: 2026-06-25
author: "云原生观察"
source: "https://newsroom.ibm.com/2026-06-24-ibm,-red-hat-and-palo-alto-networks-expand-project-lightwell-to-help-organizations-respond-to-software-vulnerabilities"
categories:
  - cloud-native
tags:
  - kubernetes
  - cncf
  - ibm
  - red-hat
  - palo-alto
  - lightwell
  - k8s-v1-36
  - ai-native
  - cloud-native
---

# 云原生动态：IBM/Red Hat/Palo Alto扩展Project Lightwell应对漏洞响应，K8s 1.36最AI导向版本发布，CNCF 82%生产采用率

本周云原生领域多项重要进展。IBM、Red Hat与Palo Alto Networks宣布扩展Project Lightwell合作，帮助组织加速软件漏洞响应；Kubernetes v1.36正式发布，成为迄今为止最AI导向的版本；CNCF年度调查显示82%的容器用户已在生产环境中运行Kubernetes；KCD Kuala Lumpur即将于6月27日举行。

## 主要新闻

### IBM、Red Hat与Palo Alto Networks扩展Project Lightwell合作

IBM、Red Hat和Palo Alto Networks于6月24日宣布扩展Project Lightwell合作，旨在帮助组织更快速地响应软件漏洞。Project Lightwell最初于2025年启动，通过集成IBM的漏洞分析、Red Hat的开源安全工具和Palo Alto Networks的威胁情报，建立从漏洞发现到补丁部署的加速管道。此次扩展将引入新的自动化能力，涵盖Kubernetes环境中的容器镜像扫描、运行时安全策略自动更新，以及基于AI的漏洞优先级排序。对于运行大规模Kubernetes集群的企业而言，这一合作直接回应了容器供应链安全领域最棘手的挑战——如何在海量CVE中识别真正需要优先处理的威胁。

**Source:** [IBM, Red Hat and Palo Alto Networks Expand Project Lightwell](https://newsroom.ibm.com/2026-06-24-ibm,-red-hat-and-palo-alto-networks-expand-project-lightwell-to-help-organizations-respond-to-software-vulnerabilities)

### Kubernetes v1.36正式发布

Kubernetes v1.36已正式发布，包含70项增强功能，被社区称为迄今为止最AI导向的版本。核心亮点包括：原生gang调度（gang scheduling）的GA——确保分布式训练和多Pod推理任务以全有或全无方式启动，避免部分调度导致的死锁问题；SELinux卷挂载改进的全面可用性；以及动态资源分配（DRA）分区设备增强支持。该版本共有来自106家公司的491位贡献者参与。在AI工作负载管理方面，v1.36标志着Kubernetes从通用容器编排平台向AI基础设施操作系统的关键转型。

**Source:** [Kubernetes v1.36 Release](https://github.com/kubernetes/website/blob/main/content/en/blog/_posts/2026/kubernetes-v1-36-release/index.md)

### CNCF年度调查：82%生产采用率，66%的GenAI推理运行在K8s上

CNCF发布的2026年度云原生调查显示，82%的容器用户在生产环境中运行Kubernetes，较2023年的66%显著增长。关键发现还包括：96%评估过Kubernetes的组织最终选择采用；79%的用户使用托管服务（EKS、GKE、AKS）而非自建集群；66%托管生成式AI模型的组织使用Kubernetes进行部分或全部推理工作负载。全球Kubernetes开发者已达560万，自2020年增长67%。CNCF生态系统已扩展到超过230个项目，拥有超过30万贡献者。调查还显示AI工作负载已成为Kubernetes增长的主要驱动力，将平台工程、FinOps和AI基础设施需求融合在一起。

**Source:** [CNCF Annual Cloud Native Survey 2026](https://www.cncf.io/reports/the-cncf-annual-cloud-native-survey/)

### KCD Kuala Lumpur 2026即将举行

Kubernetes Community Days（KCD）Kuala Lumpur将于6月27日在马来西亚吉隆坡举行。这是东南亚KCD系列的重要一站，议程涵盖Kubernetes在AI推理部署、边缘计算、平台工程和金融科技领域的实践分享。KCD活动的持续扩展反映了云原生技术在全球范围内，特别是亚太地区的加速普及。

**Source:** [KCD Kuala Lumpur 2026](https://community.cncf.io/events/details/cncf-kcd-kuala-lumpur-2026-presents-kcd-kuala-lumpur-2026/)

## 分析

本周的云原生动态展示了几个关键趋势的加速融合。

IBM/Red Hat/Palo Alto的Project Lightwell扩展代表了云原生安全领域的行业级协作模式。在Kubernetes成为AI基础设施标配的背景下，供应链安全已从"可选"变为"必须"。三个不同领域的领导者（企业IT、开源平台、网络安全）联手建立端到端漏洞响应管道，这种模式比任何单一厂商的解决方案都更具说服力。对从业者而言，这意味着容器安全策略需要从"部署时扫描"扩展到"持续运行时保护"。

Kubernetes v1.36的发布是一个里程碑。70项增强功能中，gang scheduling的GA和DRA增强直接服务于AI/ML工作负载，这与CNCF调查中66%的GenAI推理运行在K8s上的数据高度吻合。Kubernetes正在从一个"可以运行AI的平台"演变为"为AI而设计的平台"。这一转变对基础设施工程师的影响深远——服务网格、可观测性、安全和成本管理等配套技术栈都需要适应AI工作负载的特殊需求（长训练任务、GPU/TPU调度、大模型分发等）。

CNCF调查中96%的评估后采用率和79%的托管服务使用率共同说明：Kubernetes的竞争格局已经从"要不要用"转向"怎么用好"。托管服务的普及降低了运维门槛，但同时也意味着对平台工程能力的需求正在从集群管理转向应用层优化和AI工作负载编排。

## 结论

2026年6月25日的云原生动态表明，Kubernetes已正式确立为AI基础设施的核心操作系统。从v1.36的原生AI能力到82%的生产采用率，从行业级安全协作到亚太社区的活力增长，云原生生态系统正在经历从"技术采用"到"行业基础设施"的关键跃迁。对于从业者而言，深化Kubernetes与AI工作负载的集成能力、建立全生命周期的容器供应链安全策略、以及关注托管服务生态的创新动态，将是下半年的关键行动方向。
