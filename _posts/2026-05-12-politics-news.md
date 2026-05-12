---
layout: post
title: "政策动态：欧盟将限用美云服务处理敏感政府数据——云主权法案即将出台"
date: 2026-05-12
author: "云原生观察"
source: "https://www.cnbc.com/2026/05/07/eu-commission-cloud-sensitive-data.html"
categories:
  - politics
tags:
  - cloud-sovereignty
  - eu-regulation
  - data-privacy
  - cloud-act
  - caida
  - digital-sovereignty
  - compliance
---

# 政策动态：欧盟将限用美云服务处理敏感政府数据——云主权法案即将出台

欧盟正在酝酿一项具有里程碑意义的数字主权立法。CNBC报道，欧盟委员会正在讨论限制成员国政府使用美国云平台处理敏感数据，作为5月27日即将公布的"技术主权一揽子计划"（Tech Sovereignty Package）的一部分。该计划的核心是《云与AI发展法案》（CAIDA），旨在将敏感政府数据限制在欧盟主权云基础设施内处理。这一举措被视为对美国CLOUD Act（允许美国执法机构跨境调取数据）的直接回应。

## 主要新闻

### 欧盟拟限制美云服务处理敏感政府数据

欧盟委员会正在讨论一项提案，计划限制成员国政府使用美国云提供商处理敏感数据。据CNBC报道，提案不会完全禁止海外公司获得政府合同，但将根据数据敏感程度限制其在公共部门组织中处理敏感数据的角色。金融、司法和健康数据可能被要求使用主权云基础设施。美国CLOUD Act（2018年生效）允许美国执法机构要求美国科技公司交出数据，无论数据存储在哪里——这是欧盟推动云主权的核心动因之一。

**Source:** [EU considers curbs on US cloud for sensitive government data](https://www.cnbc.com/2026/05/07/eu-commission-cloud-sensitive-data.html)

### CAIDA法案：欧盟主权云的战略规划

据Politico报道，欧盟委员会正在起草《云与AI发展法案》（Cloud and AI Development Act, CAIDA），该法案定于5月27日发布。CAIDA将定义"欧盟主权云"的合规标准，并规定哪些关键部门必须依赖本土云基础设施。欧盟委员会未来网络主管Thibaut Kleiner表示，该法案旨在确保欧洲不会成为技术"殖民地"。法案将涉及采购中的"主权定义"标准，包括法律暴露风险、组件来源等八项评估指标。法国和德国正同步推进共同主权技术标准的制定，计划6月公布。

**Source:** [European industry fears 'back door' for US in cloud law](https://www.politico.eu/article/eu-cloud-plan-us/)

### 法国签署云敏感数据保护法令

法国总理签署了关于国家行政机关、运营商和公共利益团体通过私有云服务商处理的特别敏感数据保护法令（第2026-272号），并于4月17日正式生效。此法实施了关于加强网络安全和数字空间监管法案的第31条，要求在政府云服务中实施数据本地化限制。这为欧盟整体层面的CAIDA法案提供了国家层面的先行实践。

**Source:** [Decree No. 2026-272 on sensitive data protection in cloud services](https://digitalpolicyalert.org/change/19135-decree-no-2026-272-on-sensitive-data-protection-in-cloud-services-provided-to-state-administrations)

### 美国IaaS客户身份识别提案推进中

美国商务部工业与安全局（BIS）正在推进IaaS提供商客户身份识别计划（CIP）的最终规则制定，要求美国IaaS提供商和外国经销商验证客户身份，监控并报告外国恶意网络活动。规则还要求报告外国人员使用IaaS产品训练"具有恶意网络活动潜力的大规模AI模型"的情况。不遵守将面临最高25万美元民事罚款或两倍交易金额，以及最高100万美元或20年监禁的刑事处罚。

**Source:** [Cloud Services Compliance Scrutiny: Foreign Access to US Infrastructure](https://natlawreview.com/article/cloud-services-compliance-scrutiny-foreign-access-us-infrastructure-service)

## 分析

欧盟CAIDA法案和美国CLOUD ACT之间的法律冲突代表了全球云计算领域最根本的地缘政治断层线。美国CLOUD Act在2018年确立了一项原则——只要数据由美国公司控制，无论数据存储在哪里，美国执法机构都可以要求调取。这对欧盟成员国政府构成了直接的管辖权挑战：当政府部门将敏感数据存放在AWS、Azure或GCP上时，该数据在理论上可能面临美国执法机构的合法调取，即使数据从未离开欧洲数据中心。

CAIDA法案的"技术主权一揽子计划"实际上构建了一个三层防御体系：第一层是定义"欧盟主权云"的标准——不仅涉及数据存储位置，还涉及法律管辖权、组件来源、公司治理结构和第三方法律风险；第二层是采购限制——将公共部门的敏感工作负载导向符合主权标准的云服务；第三层是产业政策——通过Chips Act 2.0和资金支持培育本土云基础设施能力，目标是在5-7年内将欧洲数据中心容量翻三倍。

然而，CAIDA面临一个根本矛盾：美国云巨头（AWS、Azure、GCP）已经深度嵌入欧洲数字经济的核心基础设施。Politico报道指出，"美国资本、专有硬件和嵌入式游说基础设施支撑着欧洲数字经济，这些不会因立法指令而变为欧洲"。欧盟委员会高级官员承认，CAIDA遭遇了"非常有效的游说"。美国驻欧盟外交官也根据国务卿卢比奥签署的电报，正积极游说反对数据主权和数据本地化法律。

法国第2026-272号法令的先行实施提供了观察窗口。法国的做法是渐进式的——不是一刀切排除美国公司，而是为不同敏感度级别的数据设定不同的处理要求。这为欧盟层面CAIDA的设计提供了参考路径：通过"保证级别"（assurance levels）划分，允许在低风险领域继续使用外国云服务，同时将最高风险的工作负载限制在主权基础设施内。

## 结论

欧盟即将公布的CAIDA法案标志着全球云计算市场进入"地缘政治碎片化"的新阶段。对于跨国企业和云服务提供商而言，这意味着需要构建"多主权"云战略——在欧盟、美国、中国等不同监管辖区内建立独立的数据基础设施和治理体系。CAIDA的最终版本将在5月27日揭晓，届时美欧之间的数字基础设施博弈将进入一个新回合。企业应立即开始评估其数据资产的地域敏感度分布，并在各主要司法管辖区准备合规方案。

**Source:** [EU considers curbs on US cloud for sensitive government data](https://www.cnbc.com/2026/05/07/eu-commission-cloud-sensitive-data.html)
**Source:** [European industry fears 'back door' for US in cloud law](https://www.politico.eu/article/eu-cloud-plan-us/)
**Source:** [Decree No. 2026-272 on sensitive data protection in cloud services](https://digitalpolicyalert.org/change/19135-decree-no-2026-272-on-sensitive-data-protection-in-cloud-services-provided-to-state-administrations)
**Source:** [Cloud Services Compliance Scrutiny: US IaaS Proposed Rule](https://natlawreview.com/article/cloud-services-compliance-scrutiny-foreign-access-us-infrastructure-service)
