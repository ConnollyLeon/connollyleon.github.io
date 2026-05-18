---
layout: post
title: "军事科技动态：美国防部扩大AI合作至8家公司，Navy发布容器原生平台招标"
date: 2026-05-18
author: "云原生观察"
source: "https://defensescoop.com/2026/05/01/dod-expands-classified-ai-work-with-8-companies-excluding-anthropic/"
categories:
  - military
tags:
  - DOD
  - AI
  - kubernetes
  - cloud-native
  - defense
  - IL6
---

# 军事科技动态：美国防部扩大AI合作至8家公司，Navy发布容器原生平台招标

美国国防部在人工智能和云原生技术应用方面取得多项重要进展，与8家科技公司签署合同在机密网络上部署前沿AI能力，海军发布名为"Specter"的容器原生平台招标，NIWC Pacific的COSMOS云平台将新能力交付时间从数月缩短至数小时。

## 主要新闻

### 美国防部与8家公司签署机密网络AI部署协议

美国国防部宣布与SpaceX、OpenAI、Google、NVIDIA、Reflection、Microsoft、Amazon Web Services和Oracle等8家公司签署正式协议，将各自的前沿AI能力部署在国防部的Impact Level 6（IL6）和Impact Level 7（IL7）机密网络上"用于合法的作战用途"。值得一提的是，Anthropic因持续纠纷未能入选。五角大楼表示这些协议将"加速向AI优先作战力量的转型"。

**Source:** [DOD expands its classified AI work with 8 companies](https://defensescoop.com/2026/05/01/dod-expands-classified-ai-work-with-8-companies-excluding-anthropic/)

### 美国海军发布"Specter"容器原生平台招标

美国海军通过RCO CSO发布"Specter"容器原生平台招标，寻求一种面向海军战术和企业应用的标准化企业级容器化应用托管解决方案。该平台需要能够在从企业云数据中心到DDIL（拒止、中断、间歇性和低带宽）战术边缘环境的全频谱环境中运行，要求支持零信任架构、减少总体拥有成本、加速软件交付。

**Source:** [Specter - Container-Native Platform for Navy](https://piee.eb.mil/sol/xhtml/unauth/search/oppMgmtLink.xhtml?noticeId=N6523626SC002&noticeType=SolicitationNotice)

### NIWC Pacific的COSMOS平台将交付时间从月缩短至小时

海军信息战中心太平洋（NIWC Pacific）开发的COSMOS云平台通过自动化安全、监控和管理工作流，将新数字能力的交付时间从数月缩短至数小时。该零信任云环境托管在AWS GovCloud的IL4和IL5级别，目前已为4000多个任务所有者提供服务，托管近200个独特任务产品。COSMOS计划在FY2027进入全面生产环境并推出类似应用商店的COSMOS Storefront。

**Source:** [COSMOS Platform Slashes Bureaucracy, Delivers Secure Tech](https://www.doncio.navy.mil/CHIPS/ArticleDetails.aspx?ID=20470)

### 国防部发布CNCF多集群Kubernetes参考设计

美国防部首席信息官办公室持续推动Kubernetes在国防领域的标准化应用。CNCF多集群Kubernetes参考设计为国防部机构构建和部署云原生软件提供了架构和设计指导，涵盖DevSecOps全生命周期的可验证属性和工具选型。该设计强调"生产就绪的Kubernetes即使在开发环境也要具备合规能力"。

**Source:** [DOD Reference Design - CNCF Multi-Cluster Kubernetes](https://dodcio.defense.gov/Portals/0/Documents/Library/DoDReferenceDesign-CNCFMulti-ClusterKubernetes.pdf)

### 美军IC层级Kubernetes部署模式日益成熟

在情报界（IC）和国防部机密环境中，Kubernetes已成为新服务交付的默认方式。Red Hat OpenShift占据主导地位，而SUSE Rancher RKE2因其较小的攻击面和FIPS-140认证在战术边缘场景快速增长。AWS EKS GovCloud和OCI OKE分别在高保证级和成本敏感型任务中找到定位。Cilium因eBPF可观测性和高吞吐量成为CNI新宠。

**Source:** [Kubernetes in the IC Tier](https://precisionfederal.com/insights/kubernetes-in-the-ic-tier)

## 分析

美国防部与8家科技公司签署机密网络AI部署协议标志着军事AI应用的重大转折。从战略角度看，将OpenAI、Google等商业前沿AI能力部署到IL6/IL7环境意味着五角大楼正在认真对待AI作为"作战赋能器"的潜力。值得注意的是Anthropic的缺席——这反映了军事AI应用中伦理治理与作战需求之间的根本性张力。Anthropic的态度引发了国防部的强烈反应（将其标记为"供应链风险"），而OpenAI和Google显然更愿意接受国防部的使用条款。市场正在形成一个明确的信号：愿意与国防部合作的AI公司将获得巨大的政府市场准入，而拒绝合作的将失去这个市场。

海军"Specter"容器原生平台招标反映了美军对统一技术栈的追求。过去，海军各系统各自为政，导致大量互操作性问题和高昂的维护成本。Specter要求一个能够从企业数据中心到战术边缘全频谱运行的标准容器平台，这实际上是在要求一个"军事级的Kubernetes发行版"——既要有商业Kubernetes的灵活性和生态兼容性，又要满足严格的合规和安全要求。

COSMOS平台的成就是零信任架构在军事应用中的典型案例。通过自动化安全评估和合规流程，COSMOS将安全从"审批瓶颈"变成了"自动化管道"，这不是降低安全标准，而是通过技术手段消除安全审批中的人为延迟。COSMOS Storefront的概念——用信用卡式交易替代传统采购流程——对军工行业的数字化转型具有示范意义。

## 结论

美国军方正在加速推进云原生和AI技术的实战化应用。Kubernetes已从试验性技术演变为国防部标准化基础设施的核心组件。AI的军事化应用正面临关键的分水岭：供应商的选择标准不再仅是技术能力，还取决于其对军事应用的伦理立场。未来12个月，随着JWCC Next合同的推进和更多容器原生平台的上线，美军的技术现代化进程将进一步加速。
