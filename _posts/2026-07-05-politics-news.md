---
layout: post
title: "政策动态：欧盟Cloud and AI Development Act推进立法，FBI警告供应链攻击威胁联邦IT安全，法国云主权条例生效"
date: 2026-07-05
author: "政策观察"
source: "https://digital-strategy.ec.europa.eu/en/policies/cloud-and-ai-development-act"
categories:
  - politics
tags:
  - EU
  - CADA
  - cloud-sovereignty
  - AI-regulation
  - FBI
  - teampcp
  - supply-chain
  - france
  - cloud-decree
  - australia
  - cloud-policy
  - data-sovereignty
---

# 政策动态：欧盟Cloud and AI Development Act推进立法，FBI警告供应链攻击威胁联邦IT安全，法国云主权条例生效

过去一周全球云与AI政策领域多项重要进展：欧盟《Cloud and AI Development Act》立法进程加速，法律分析界密集发布解读；FBI发布FLASH警报披露TeamPCP供应链攻击行动，引起联邦IT安全界高度关注；法国云敏感数据保护条例正式生效，为欧盟云主权监管树立国家先例；澳大利亚全政府云计算政策于7月1日生效。

## 主要新闻

### 欧盟Cloud and AI Development Act立法进程加速

欧盟委员会于6月3日通过的《Cloud and AI Development Act》（CADA）提案正在欧盟议会和理事会层面密集推进。该提案旨在解决欧盟在云计算和AI领域对第三国供应商的严重依赖问题——欧盟当前仍然严重依赖于受第三国控制或法律实体控制的少数几家云计算服务提供商。CADA聚焦三大目标：研究与创新（部署下一代云和AI技术）、容量（加速数据中心部署）、自主性（建立统一的云与AI主权评估框架）。提案引入Union assurance levels 1-4分级体系，要求公共部门采购须达到最低级别标准。第34条建立了欧洲公共部门云联盟（EuroCloud Federation），促进成员国间的数据中心和云服务共享。CADA与《芯片法案2.0》和EU Open Source Strategy形成政策包，共同支撑欧洲数字主权的战略目标。

**Source:** [Proposal for the Cloud and AI Development Act (CADA)](https://digital-strategy.ec.europa.eu/en/library/proposal-cloud-and-ai-development-act-cada)

### FBI发布FLASH警报：TeamPCP利用木马化开发工具实施供应链攻击

FBI于7月2日与DHS/CISA联合发布FLASH-20260702-01警报，详细披露了网络犯罪组织TeamPCP的TTP和IoC。该组织在2025年2月至5月间通过木马化更新篡改了Trivy、KICS、LiteLLM和Telnyx Python SDK等广泛使用的开发和安全工具。攻击载荷转储Runner.Worker进程内存以捕获GitHub Actions秘密、扫描文件系统获取SSH密钥、云凭证和Kubernetes配置。FBI确认TeamPCP还运营CanisterWorm（跨npm/PyPI生态的供应链蠕虫）和SANDCLOCK（专门窃取AWS凭证和K8s ServiceAccount令牌）。警报要求立即轮换所有受影响时间窗口内可访问的CI/CD密钥和发布令牌。

**Source:** [TeamPCP Supply Chain Attacks: FLASH-20260702-01](https://www.safebreach.com/blog/teampcp-supply-chain-attacks-fbi-flash-alert-20260702-01-safebreach-coverage/)

### 法国云敏感数据保护条例正式生效

法国第2026-272号法令于2026年4月17日正式生效，实施《数字空间安全与监管法案》第31条关于国家机关、运营商和公共利益团体的特别敏感数据在私有云服务商处处理的保护规定。该法令要求国家机关在处理最敏感数据时选择满足特定主权保障要求的云服务商，涉及数据本地化、防止第三国法律访问等核心要求。法国是欧盟首个通过专门法令实施云数据主权要求的成员国，为CADA框架下的国家实践提供了先行样本。

**Source:** [Decree No. 2026-272 on Sensitive Data Protection in Cloud Services](https://digitalpolicyalert.org/change/19135)

### 澳大利亚全政府云计算政策正式生效

澳大利亚数字化转型局（DTA）发布的《全政府云计算政策》于2026年7月1日正式生效。该政策为澳大利亚公共服务（APS）的云计算应用提供统一的实践框架，核心要求包括：实体在现代化IT基础设施时必须优先考虑云解决方案、利用云技术赋能AI创新、负责任和安全地采用云技术、实施FinOps管理云成本、以及培养APS内的云技能。政策通过数字投资计划实现云规划的嵌入式管理，告别澳大利亚公共服务在云计算应用上缺乏统一指导的历史。

**Source:** [Whole-of-Government Cloud Computing Policy](https://www.digital.gov.au/cloud-policy)

## 分析

欧盟CADA提案标志着全球云监管进入"主权化"新阶段。提案明确指出，虽然EU-US Data Privacy Framework解决了跨境数据传输问题，但数据主权超越了数据传输本身——涉及运营自主权、对第三国法律的暴露风险以及战略依赖。引入Union assurance levels分级体系意味着公共部门云采购将从价格导向转向安全能力导向。CADA与芯片法案2.0的协同效应值得关注：欧洲不仅想要自主的云服务，还想要自主的芯片供应链来运行这些云服务。提案第34条的EuroCloud Federation可能成为欧盟公共部门数字基础设施共享的变革性机制。

FBI的TeamPCP警报在政策层面提出了一个紧迫问题：当开发和安全工具本身成为攻击向量时，现有的联邦网络安全采购和供应链风险管理框架是否足够？FBI确认攻击者木马化了Trivy（安全扫描器）和KICS（IaC扫描器）——这意味着安全团队用来保护基础设施的工具可能正是破坏它的入口。这对美国行政管理和预算局（OMB）正在推进的软件供应链安全行政令执行提出了新的挑战。

法国的云敏感数据保护条例为欧盟范围内的云主权监管提供了国家层面的实践模板。法国选择先行一步而非等待CADA的最终通过，反映了成员国在数字主权问题上的紧迫感。结合法国此前对Microsoft 365在政府部门使用的限制，可以观察到一条清晰的"从劝阻到监管"的演进路径。这对AWS、Google Cloud和Azure在欧洲政府市场的竞争格局具有深远影响。

## 结论

全球云和AI政策正在加速从"促进发展"转向"主权管控"。欧盟CADA建立了云服务安全分级和政府采购的绑定关系；法国云法令为国家层面的数据主权监管提供了操作样本；FBI的TeamPCP警报将供应链安全提升到联邦网络安全优先事项的顶层。建议关注CADA在欧盟议会和理事会的立法辩论进展，尤其是对EuroCloud Federation的具体实施机制和Union assurance levels的认证安排。
