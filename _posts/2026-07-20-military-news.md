---
layout: post
title: "军事应用：五角大楼统一云市场与荷兰主权军事云建设"
date: 2026-07-20
author: "云原生观察"
source: "https://defensescoop.com/2026/06/01/pentagon-jwcc-ucm-draft-performance-of-work-statement/"
categories:
  - military
tags:
  - military-cloud
  - kubernetes
  - edge-computing
  - defense
---

# 军事应用：五角大楼统一云市场与荷兰主权军事云建设

本周国防云原生技术领域迎来两项重要发展。五角大楼发布JWCC统一云市场(UCM)草案，规划三层云生态系统支持AI、战术边缘和安全数据共享；荷兰国防部宣布与KPN和Thales合作建设主权军事云，减少对美国云服务的依赖。这些动态表明军事云原生技术正在从概念走向大规模部署。

## 主要新闻

### 五角大楼JWCC统一云市场：三层结构支持AI与边缘作战

美国国防信息系统局(DISA)发布了JWCC统一云市场(UCM)的草案工作说明书，规划了三层云生态系统架构：第一层为超大规模云服务商提供核心基础设施和平台服务；第二层为"一切即服务"(XaaS)提供软件、平台和基础设施即服务；第三层面向商业创新者和小企业提供满足国防部安全要求的云技术。草案特别强调了AI和机器学习能力需在所有分类和影响级别上提供，以支持在DDIL(拒绝、降级、间歇、低带宽)环境中的作战。

**Source:** [DefenseScoop](https://defensescoop.com/2026/06/01/pentagon-jwcc-ucm-draft-performance-of-work-statement/)

### 荷兰国防部建设主权军事云，减少对美国技术依赖

荷兰国防部与KPN和Thales合作，正在建设专属的主权军事云计算环境，旨在将敏感数据保持在荷兰国内控制之下。该云将从专用数据中心运行，确保荷兰对分类信息的完全控制并保证数据主权。State Secretary for Defense Derk Boswijk已向荷兰议会下院正式介绍了该计划。此前荷兰政府曾因美国云服务的风险报告引发争议，此次主权云建设被视为对数据主权关切的直接回应。

**Source:** [NL Times](https://nltimes.nl/2026/04/09/dutch-defense-build-sovereign-military-cloud-computing-reduce-us-tech-dependence)

### 云原生安全深度防御：Kubernetes加固实践指南

Corvus Intelligence发布了针对国防工作负载的Kubernetes加固指南，详细介绍了CNSA和NSA/CISA发布的Kubernetes加固指南在国防环境中的实践应用。指南强调了从CIS基准到NSA/CISA加固指南的全面覆盖，包括容器运行时安全(Falco)、seccomp配置文件、AppArmor强制访问控制等多层次防御策略。Kubernetes已成为从DoD Platform One到北约盟国国防云项目的核心部署平台。

**Source:** [Corvus Intelligence](https://corvusintell.com/blog/secure-cloud/kubernetes-defense-hardening)

## 分析

五角大楼UCM的三层结构设计反映了军事云需求的复杂性和多样性。第一层的超大规模云服务商提供弹性基础设施，第二层的XaaS提供灵活的服务组合，第三层则为小型创新企业打开国防市场大门。这种分层方法既保证了规模化运营的效率，又保留了技术创新的通道。值得注意的是，草案特别强调了AI/ML能力在DDIL环境中的支持——这直接回应了现代战场对战术边缘AI决策能力的迫切需求。

荷兰主权军事云的建设则是欧洲"数字主权"浪潮在国防领域的具体体现。作为北约成员国，荷兰选择自主建设军事云而非完全依赖美国商业云，反映了即使是盟国也对数据主权和供应链安全保持着高度警惕。这一模式可能被其他欧洲国家效仿，推动北约内部在国防云基础设施方面的多元化发展。

Kubernetes加固指南的发布则表明，云原生技术在国防领域的采用已从试点阶段进入标准化部署阶段。NSA/CISA的加固指南、CIS基准和CNCF安全最佳实践正在形成一套完整的国防级云原生安全框架。

## 结论

本周的军事云动态揭示了国防云原生技术发展的两条主线：一是规模化——五角大楼通过UCM统一市场整合云服务能力；二是主权化——各国国防部门在追求技术现代化的同时，越来越强调数据主权和供应链独立性。对于云原生技术从业者而言，国防市场正从"特殊客户"演变为"核心客户"，理解国防特有的安全合规要求（如IL5/IL6分类级别、DDIL环境、零信任架构）将成为重要的竞争优势。
