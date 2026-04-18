---
layout: post
title: "军事应用动态：DoD DevSecOps与Kubernetes在战术边缘的部署"
date: 2026-04-18
author: "防务观察"
source: "https://www.secondfront.com/resources/blog/the-dod-enterprise-devsecops-initiative-dsop-what-you-need-to-know/"
categories:
  - military
tags:
  - dod
  - kubernetes
  - devsecops
  - defense
  - cloud-native
---

# 军事应用动态：DoD DevSecOps与Kubernetes在战术边缘的部署

本周军事技术领域传来多项重要进展。美国国防部的企业DevSecOps倡议（DSOP）正在推动军事软件开发的范式转变，将传统瀑布式开发周期从3-8个月缩短到一周。Marine Corps的Operation StormBreaker实现了15分钟内获得安全授权（ATO）的能力。TITAN计划展示了AI赋能的战术情报节点。同时，DoD继续推进Kubernetes在F-16战斗机和军舰上的部署，体现了云原生技术在现代战争中的关键作用。

## 主要新闻 (Main News)

### DoD企业DevSecOps倡议（DSOP）深度解析

DoD的企业DevSecOps倡议（DSOP）正在彻底改变军事软件开发方式。该倡议将传统瀑布式开发周期从3-8个月缩短到一周，在37个项目中节省了100多年计划时间。DSOP的三个技术支柱包括：云原生基础设施（Kubernetes和OCI容器）、基础设施即代码（IaC）和不可变环境、零信任和边车容器安全栈（SCSS）。DSOP要求使用CNCF认证的Kubernetes进行容器编排，确保工作负载可以在商业云（AWS GovCloud）、DoD数据中心或战术边缘平台（如战斗机、军舰、卫星）上无缝运行。

**Source:** [The DoD Enterprise DevSecOps Initiative (DSOP)](https://www.secondfront.com/resources/blog/the-dod-enterprise-devsecops-initiative-dsop-what-you-need-to-know/)

### Marine Corps实现15分钟ATO

Marine Corps的Operation StormBreaker实现了15分钟内获得安全授权（ATO）的能力。该平台建立在云原生enclave之上，遵循DoD CIO的连续ATO、DevSecOps指南。Raley首席数字官表示，该平台使用分层控制继承enclave，支持约85%的控制。任务所有者继承支持代码安全审查、SBOM创建和漏洞扫描的自动化流程。代码在容器中构建和扫描，任何更改都会自动重新扫描漏洞。Operation StormBreaker目前支持Marine Corps和Defense Innovation Unit的应用。

**Source:** [DoD Modernization Exchange 2026: Marine Corps' David Raley on reducing burdens of security ATOs](https://federalnewsnetwork.com/defense-main/2026/04/dod-modernization-exchange-marines-david-raley-on-reducing-burdens-of-security-atos)

### TITAN计划展示AI赋能的战术情报

TITAN（战术情报目标接入节点）计划是陆军的下一代AI赋能、远征、可机动地面站，支持多域作战和远程精确火力。该计划提供多域深度感知分析、处理、利用和分发，以缩短传感器到射手的 timeline。MAJ Chris Foster作为TITAN助理项目经理，在Project Convergence Capstone 5、III Corps Warfighters和Soldier Touch Points等演习中展示了该系统。作为双轨收购计划，TITAN正在为未来的软件 pathway奠定基础。

**Source:** [TITAN APM "hits the ground running" every day](https://cpeisw.army.mil/2026/04/07/titan-apm-hits-the-ground-running-every-day/)

### Kubernetes在F-16和军舰上的部署

美国空军在45天内将Kubernetes和Istio部署到F-16战斗机上，展示了云原生技术在战术边缘的可行性。该项目名为SoniKube，由Hill空军基地的团队实现。DoD Enterprise DevSecOps参考设计将Kubernetes作为抽象层，确保跨不同环境的一致行为。Envoy和Istio提供网络层安全。该项目展示了Kubernetes不仅适用于数据中心，还可部署在战术环境中。

**Source:** [How the U.S. Air Force deployed Kubernetes and Istio on F-16 fighters in 45 days](https://www.laitimes.com/en/article/6jlhx_6zxsl.html)

### 联邦云市场持续增长

联邦云市场持续增长，FedRAMP授权继续增加。政府采用云原生技术的方式正在从简单的"提升和转移"转向更加复杂的架构。Merit的Ray Hall指出，DoD面临的挑战核心是遗留系统。许多关键任务系统仍在数十年前的硬件上运行，或作为整体 monolith 被"提升和转移"到云中。由于这些应用从未被重新架构为云无关，它们无法水平扩展，蓝绿部署或Kubernetes式编排变得不可能。

**Source:** [Beyond Lift and Shift: A Vision for Secure, Scalable DOD Cloud](https://cdn.meritalk.com/articles/beyond-lift-and-shift-a-vision-for-secure-scalable-dod-cloud/)

## 分析 (Analysis)

本周的军事技术发展呈现出几个显著趋势。

首先，连续授权to Operate（cATO）正在取代传统的安全审批流程。Operation StormBreaker实现的15分钟ATO代表了军事软件交付的重大突破。传统的ATO流程可能需要18个月，而新的连续模型通过预先批准的安全控制和自动化合规检查，实现了近乎实时的软件部署。这种转变对于应对现代威胁环境至关重要，因为网络威胁的演变速度远超传统审批周期。

其次，Kubernetes正在成为军事数字化转型的基础设施。从F-16战斗机到海军舰艇，Kubernetes证明了其在极端环境下的可行性。DoD选择Kubernetes作为"抽象层"，确保工作负载可以在不同环境间无缝移动，这对于多域作战和联合作战至关重要。

第三，AI正在成为军事能力的关键驱动力。TITAN计划展示了AI赋能的战术情报系统如何缩短传感器到射手的时间。随着AI在战场上的应用持续扩展，对边缘计算和实时AI处理的需求将继续增长。

## 结论

本周的军事技术动态表明，美国防部正在经历深刻的数字化转型。从DevSecOps到Kubernetes，从连续ATO到AI赋能的战术系统，云原生技术正在重新定义军事软件开发和部署的方式。

对于国防技术供应商而言，这些发展意味着需要重新评估其产品和技术战略。特别是那些能够支持云原生架构、零信任安全和边缘计算解决方案的供应商将在未来国防市场中占据优势。随着DoD继续推进其数字化转型，对能够满足这些严格要求的商业技术的需求将持续增长。