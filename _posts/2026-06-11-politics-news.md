---
layout: post
title: "政策动态：欧盟CADA法案提议限制美国云服务商处理敏感政府数据"
date: 2026-06-11
author: "云原生观察"
source: "https://digital-strategy.ec.europa.eu/en/library/proposal-cloud-and-ai-development-act-cada"
categories:
  - politics
tags:
  - eu
  - cloud-act
  - data-sovereignty
  - cad
  - regulation
  - public-cloud
  - compliance
---

# 政策动态：欧盟CADA法案提议限制美国云服务商处理敏感政府数据

欧盟委员会在6月3日发布的技术主权法案包中，提出了《云与AI发展法案》（CADA）提案，这是欧盟迄今最系统性的数字主权立法尝试。该法案通过四级主权保障框架，实质性地限制了AWS、Microsoft Azure和Google Cloud等美国云服务商处理欧盟敏感政府数据的能力。同时，欧盟委员会同时发布了主权云框架（Sovereign Cloud Framework）的实施指南，为公共部门云采购提供了可操作的主权评估标准。

## 主要新闻

### 欧盟CADA法案定义四级云主权保障框架

欧盟委员会于6月3日发布《云与AI发展法案》（CADA）提案，引入四级"主权保障等级"框架。Level 1要求满足基本安全标准；Level 2以上需经第三方审计审查数据使用合规性；Level 3和Level 4要求服务提供商"不受第三国控制"——这一条直接针对美国《云法案》（Cloud Act）。欧盟技术主权执行副总裁Henna Virkkunen明确表示，由于Cloud Act的存在，美国公司很难达到Level 3的要求。该法案同时设定了量化目标：欧洲云服务商市场份额从目前的约15%提升至2035年的30%。

**Source:** [European Commission - Proposal for the Cloud and AI Development Act (CADA)](https://digital-strategy.ec.europa.eu/en/library/proposal-cloud-and-ai-development-act-cada)

### 欧盟主权云框架发布实施指南

欧盟委员会发布了主权云框架的详细实施指南，引入了两个关键评估维度：主权效能保障等级（SEAL，从SEAL-2到SEAL-4）和基于48项具体标准的总体主权评分。这些标准覆盖战略、法律与管辖、数据与AI、运营、供应链、技术、安全与合规、环境可持续性八大类别。欧盟已于4月授予价值1.8亿欧元的主权云采购合同，本次指南旨在将主权评估方法推广至所有欧盟公共机构。

**Source:** [European Commission - Sovereign Cloud Framework explained](https://commission.europa.eu/news-and-media/news/sovereign-cloud-framework-explained-2026-06-01_en)

### EU CADA或推动欧洲云提供商市场份额翻倍

据CADA影响评估报告显示，欧盟委员会计划到2035年实现100%的政府高敏感用例使用主权云服务，其中约70%的用例需Level 1保障，20%需Level 2，9%需Level 3，1%需Level 4。对于Level 1，美国超大规模云提供商基本能满足要求；Level 2要求"证明无第三国干扰"；Level 3以上则要求更严格的网络安全认证和软件供应链控制。欧盟评估认为，Level 4实际上只有欧洲公司能够满足。

**Source:** [Agence Europe - European Commission wants European providers of cloud services to double market share to 30% in Europe](https://agenceurope.eu/en/bulletin/article/13883/9/european-commission-wants-european-providers-of-cloud-services-to-double-market-share-to-30-in-europe)

### 美国Cloud Act成为欧盟立法核心障碍

安全与基础设施媒体深入分析了CADA法案对AWS、Azure和Google Cloud的潜在影响。目前三家美国超大规模云提供商合计占据欧洲云基础设施收入约70%。CADA法案并非全面禁令——私有部门的云使用不受影响——但政府数据采购层面的限制足以改变市场格局。法案要求公共部门进行正式的主权风险评估，定义哪些工作负载必须托管在经过验证的主权云上。争议焦点在于最终法律中SEAL门槛的确定：如果要求Level 3以上，"包装式"的本地运营商托管美国技术栈将不再通过合规审查。

**Source:** [Raconteur - EU restricts US cloud services plan: key rules and questions](https://www.raconteur.net/cloud-computing/eu-restricts-us-cloud-services-plan-key-rules-and-questions)

## 分析

CADA法案将"数字主权"从政策口号转化为具有法律约束力的采购规则，其影响可能远超欧盟边界。从技术角度看，法案的核心技术逻辑是"数据管辖权与数据存储地必须分离"——即云服务提供商不能同时受制于其所在国的法律管辖。这对于全球运营的科技公司而言是一个根本性挑战。

一个值得关注的技术细节是：CADA的Level 3保障要求实际上将迫使美国云服务商在其欧洲基础设施上实现"结构性独立"——意味着欧洲子公司需要从所有权、人员到技术堆栈都独立于美国母公司。这一标准比"数据本地化"（如GDPR的数据驻留要求）严格得多。对于AWS、Azure和Google Cloud而言，实现这一标准可能需要彻底的架构重组，甚至可能涉及欧盟境内的独立法律实体的技术子公司。

25家欧洲云企业已联合呼吁在CADA中引入"有效控制"标准，明确排除受非欧盟法域域外法律命令约束的企业。法国2024年SREN法律已在敏感政府数据层面实施了类似限制。欧洲内部在此问题上的分歧主要体现在门槛设置上——北欧和东欧国家倾向于较宽松的标准以维持对美国云服务的访问，而法国和德国推动更严格的标准。

CADA的最终文本预计将在2027年第四季度前通过。在此之前，欧盟委员会、欧洲议会和欧盟理事会将进行多轮谈判。美国科技公司和美国政府已开始通过外交渠道表达关切。

## 结论

2026年6月的CADA提案标志着全球云计算市场从"自由市场"向"主权隔离"的分水岭时刻。这不仅是监管事件，更是重新定义全球云基础设施架构的拐点——技术提供商需要为"多法域合规"重构其全球架构。对于欧洲以外的企业而言，这一法案的影响同样深远：如果欧盟成功实施技术主权路线，其他国家和地区很可能跟进类似立法，世界云计算市场将从单一的全球化模式转向"互联的本地化孤岛"模式。

---

*本报告基于2026年6月1-10日公开信息，来源包括European Commission官方文件、Wilson Sonsini法律分析、Raconteur、Agence Europe、BankInfoSecurity等。*
