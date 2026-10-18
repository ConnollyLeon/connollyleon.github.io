---
layout: post
title: "军事科技动态：空军寻求多级安全云与DevSecOps支持，陆军推行Project Gatekeeper加速软件审批"
date: 2026-10-18
author: "军事科技观察"
source: "https://orangeslices.ai/air-force-opens-rfi-for-multi-x-security-classified-cloud-and-devsecops-support/"
categories:
  - military
tags:
  - air-force
  - dod
  - classified-cloud
  - devsecops
  - mxs
  - rmf
  - project-gatekeeper
  - army
  - software-approval
  - c2
---
# 军事科技动态：空军寻求多级安全云与DevSecOps支持，陆军推行Project Gatekeeper加速软件审批

本周军事科技领域重点关注美军在软件能力与云基础设施方面的改革：美国空军发布RFI，寻求为多级安全（Multi-X Security，MXS）平台提供运维、持续现代化及DevSecOps支持；美国陆军计划于10月23日启动Project Gatekeeper，旨在将软件安全审批时间从数月压缩至数分钟。这些举措反映美军持续推动“软件定义战力”（software-defined warfare）和敏捷作战能力建设的迫切需求。

## 主要新闻

### 1. 空军发布RFI：多级安全分类云与DevSecOps支持

美国空军生命周期管理中心（AFLCMC）发布RFI，征求对多级安全平台（MXS）的运维、维护和持续现代化支持。MXS是一个云原生环境，支持跨多个安全级别的软件开发与安全信息共享，基于开放标准和协议构建。平台设计目标是支持第三级防护（PL-3）环境下由第三方开发者开展软件开发，可在非密、Secret//SAR、Top Secret//SAR、Top Secret//SCI//SAR等多种密级云环境中运行。

未来承包商需提供7×24×365平台运维与全生命周期维持，包括容器化基础设施（Kubernetes、Service Mesh、API Gateway）、基础设施即代码（IaC）、自动化CI/CD流水线、遥测与资源监控、企业ICAM与证书服务、托管数据库及API中介等。同时需提供持续平台增强、租户入驻与集成、1-3级技术支持，以及网络安全相关工作（维持现有RMF ATO、应用与容器安全测试、软件依赖评估、漏洞修复及安全文档维护）。RFI还指出潜在安全要求：人员需具备活跃的Top Secret许可并能获取SCI/SAP准入，且需具备经认证的SCIF/SAPF设施。

**Source:** [Air Force Opens RFI for Multi-X Security Classified Cloud and DevSecOps Support](https://orangeslices.ai/air-force-opens-rfi-for-multi-x-security-classified-cloud-and-devsecops-support/)

### 2. 陆军Project Gatekeeper：将软件审批从数月缩至数分钟

美国陆军宣布将于10月23日启动Project Gatekeeper，这是一套基于AI增强的网络安全沙箱，旨在简化商业软件在陆军网络上的安全评估流程。当前，商业软件要获准接入陆军网络往往需要经过冗长的、临时性的审批流程，耗时数周甚至数月。Gatekeeper将创建一个运行在陆军云上但与作战网络和敏感数据隔离的沙箱环境，企业无需已有陆军合同或项目经理担保，即可将软件提交至该环境进行评估。

陆军首席信息官Gabe Chiulli表示，理想状态是企业能在数分钟内登录、提交代码并获得“通过”标记，或收到详细的失败原因及修复建议。Gatekeeper还将集成陆军的DevSecOps软件开发工具包，帮助企业在沙箱内修正问题。初期访问需CAC卡，预计11月中旬将集成GSA Login.gov以支持非军方人员安全访问。该项目的核心理念不是降低安全要求，而是通过自动化和标准化流程，让合规反馈更及时、更可操作，从而加速合格软件的采纳。

**Source:** [Army's Project Gatekeeper aims to cut software approval times from months to ‘minutes’](https://breakingdefense.com/2026/10/armys-project-gatekeeper-aims-to-cut-software-approval-times-from-months-to-minutes/)

## 分析

这两项举措共同体现了美军向“敏捷软件交付”转型的系统性思路：

- **分类环境也要拥抱云原生与DevSecOps。** MXS平台采用Kubernetes、Service Mesh、IaC、自动化CI/CD等云原生技术，表明即使在高密级（包括SAP/SCI）环境中，美军也在尝试将商用最佳实践引入软件开发与部署流程。这有助于缩短作战软件迭代周期、支持第三方创新者参与国防软件生态，并提升多域作战所需的信息共享能力。
- **审批流程是制约软件战力的关键瓶颈。** Project Gatekeeper直指当前最普遍的痛点：合规审批慢、门槛高、反馈滞后。通过预先评估、自动化检测和清晰反馈，陆军希望将“合规左移”（shift-left compliance），让供应商在正式立项前就解决安全问题。这种思路与商业软件DevSecOps中“早期发现早期修复”高度一致。
- **平衡速度与安全。** 两项举措都强调不降低安全要求。MXS仍需满足RMF ATO要求并开展全面安全测试；Gatekeeper保留全套网络安全检测工具并结合AI辅助评估。关键在于用自动化替代人工繁琐流程、用标准化沙箱消除临时性安排、用即时反馈减少来回沟通，从而在安全基线不变的前提下大幅提升吞吐量。
- **向更开放的国防软件生态迈进。** Gatekeeper允许“未签合同”的企业先行评估，配合未来Login.gov接入，实质上降低了小型创新企业进入国防市场的准入门槛。MXS也明确支持第三方开发者在受限环境中开发PL-3软件。这些变化有助于打破传统国防采办中“先签合同再做技术评估”的僵局，更好地对接硅谷及新兴技术企业的创新节奏。

## 结论

本周军事科技动态显示，美军正系统性地改革软件与云基础设施治理。空军通过MXS平台构建跨密级的云原生开发环境，为敏感作战软件提供现代化交付能力；陆军通过Project Gatekeeper重塑合规审批路径，力求让“安全合规”不再成为拖慢软件部署的最大阻力。这些改革若能落到实处，将显著提升美军对新兴威胁的响应速度和作战软件的迭代能力，在软件定义的未来战场中赢得时间优势。