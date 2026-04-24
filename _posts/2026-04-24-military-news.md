---
layout: post
title: "美国国防部云原生战略：JWCC Next与DevSecOps initiative"
date: 2026-04-24
author: "防务观察"
source: https://www.meritalk.com/articles/dod-cio-says-jwcc-next-will-improve-cloud-oversight/
categories:
  - military
tags:
  - DOD
  - kubernetes
  - cloud
  - defense
---

# 美国国防部云原生战略：JWCC Next与DevSecOps initiative

本周美国国防部传来多项云原生和军事技术进展。JWCC Next将在2026财年第二季度推出，提供增强的财务监督和多云管理能力。DoD Enterprise DevSecOps Initiative (DSOP)正在推进Kubernetes和Zero Trust架构的全面采用。同时，欧盟委员会推进云主权战略采购。

## 主要新闻

### JWCC Next将于2026财年推出

美国国防部首席信息官Kirsten Davies在2026年3月24日于参议院武装部队委员会网络安全小组委员会作证时表示，JWCC Next将于2026财年第二季度推出。

JWCC Next的关键改进包括：

- 统一的云市场，整合更多云提供商
- 嵌入财务运营、自动化和多云管理
- 实现企业成本控制和互操作性
- 增强资产识别和安全性

2022年，国防部授予Google、Oracle、AWS和Microsoft JWCC合同上价值100亿美元、10年的合同。该合同已产生超过30亿美元的任务订单。

**Source:** [DOD CIO Says JWCC Next Will Improve Cloud Oversight](https://www.meritalk.com/articles/dod-cio-says-jwcc-next-will-improve-cloud-oversight/)

### DoD Enterprise DevSecOps Initiative (DSOP)

DSOP是国防部企业范围内的倡议，旨在用基于Kubernetes、基础设施即代码和Zero Trust架构的持续自动化的DevSecOps流水线取代传统的瀑布式软件开发。

关键要求包括：

- CNCF认证的Kubernetes用于容器编排
- OCI合规容器
- Zero Trust嵌入每个集群
- Sidecar Container Security Stack自动为每个任务应用注入安全容器

**Source:** [The DoD Enterprise DevSecOps Initiative (DSOP) and What You Need to Know](https://www.secondfront.com/resources/blog/the-dod-enterprise-devsecops-initiative-dsop-what-you-need-to-know/)

### Leidos获签Cloud One现代化合同

Leidos于2026年3月获得4.549亿美元合同，用于现代化美国空军的Cloud One平台。该项目将设计与AWS、Azure、Google Cloud Platform和Oracle Cloud Infrastructure合作，将空军的multi-cloud环境转型。

改进将提高安全性、增加自动化、简化日常运营，同时帮助降低成本，使空军团队能够更快、更自信地管理云运营。

**Source:** [Leidos to modernize and secure U.S. Air Force cloud operations](https://www.leidos.com/insights/leidos-modernize-and-secure-us-air-force-cloud-operations-faster-safer-mission-readiness)

### JADC2与软件定义战场

联合全域指挥与控制(JADC2)是美国国防部的战略框架，旨在将传感器、决策者和武器系统连接至陆、海、空、天和网络五个作战域的统一作战画面。

关键技术要素包括：

- 容器化任务应用：能力必须部署到任何边缘节点——舰船、战斗机、装甲车、前沿基地——无需定制硬件配置
- Zero Trust安全：在对抗性、降级、断续通信环境中，周界安全是虚构的。每笔交易都必须进行身份验证、授权和加密
- 国防部已在Enterprise范围内强制实施Zero Trust实现，计划在2027年前完成

**Source:** [JADC2 and the Software-Defined Battlefield](https://atakuzi.com/2026-03-22-jadc2-software-defined-battlefield/)

### EU云主权框架

欧盟委员会开发了云主权框架，从八个方面衡量主权：战略、法律、运营、环境、供应链透明度、技术开放性、安全性和欧盟法律合规性。框架引入了主权有效性保证级别(SEAL)，从SEAL-0到SEAL-4不等。

供应商需要达到SEAL-2级别(数据主权级别)才能符合条件，大多数获奖供应商达到了SEAL-3级别(数字韧性级别)。

**Source:** [Commission advances cloud sovereignty through strategic procurement](https://commission.europa.eu/news-and-media/news/commission-advances-cloud-sovereignty-through-strategic-procurement-2026-04-17_en)

## 分析

这些发展反映了国防领域云原生采用的关键趋势：

**云的集中化与专业化**：JWCC Next代表了对当前JWCC计划经验的直接回应。教训包括：多合同和授权点的效率低下需要解决。下一个版本将提供统一的云市场，这意味着国防部正在从云服务的拼图方法转向更集成的方法。

**DevSecOps的制度化**：DSOP不再是一个试点或倡议，而是整个国防部范围内的强制性标准。这要求供应商理解并符合国防部特定的安全要求。

**边缘计算的就绪**：JADC2的技术挑战——在战术边缘的 Kubernetes部署——已经不再是理论而是在生产中。这对商业云原生技术供应商有直接影响：国防部需要的解决方案必须能够在极端环境中工作。

**Zero Trust的强制实施**：国防部已在Enterprise范围内强制实施Zero Trust实现，计划在2027年前完成。这为所有供应商设定了最后期限。

## 结论

对于国防技术供应商和决策者来说，关键要点包括：

- JWCC Next将在2026财年第二季度推出，需要提前准备应对新的采购要求
- 零信任架构是强制要求，2027年是最后期限
- 云原生解决方案必须在边缘环境中工作，这是关键技术要求
- 欧洲主权要求正在影响全球云市场格局