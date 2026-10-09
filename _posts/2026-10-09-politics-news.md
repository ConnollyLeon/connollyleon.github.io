---
layout: post
title: "政策动态：欧盟云主权立法与全球AI数据治理趋严"
date: 2026-10-09
author: "云原生观察"
source: "https://cloudcurated.com/cloud-providers/eu-to-designate-aws-and-azure-as-cloud-gatekeepers-under-dma/"
categories:
  - politics
tags:
  - policy
  - regulation
  - cloud
  - data-sovereignty
  - 数字主权
---

# 政策动态：欧盟云主权立法与全球AI数据治理趋严

2026年10月8日，全球数字政策围绕云基础设施监管、数字主权与AI数据治理持续收紧。欧盟一方面准备将AWS和Azure认定为《数字市场法》（DMA）下的"守门人"，另一方面推进《云与AI发展法》（CADA）构建主权框架；英国与美国则分别强化对AI开发者及政府采购中AI数据使用的约束。

## 主要新闻

### 1. 欧盟拟将AWS与Azure认定为DMA"守门人"

据报道，欧盟委员会即将正式把Amazon Web Services和Microsoft Azure认定为《数字市场法》下的"守门人"，标志着DMA的适用范围从消费级应用扩展到互联网的基础设施层。认定后，两家公司需在2026年底启动的六个月合规窗口内，对其在欧洲市场的服务模式进行大规模重构，重点涉及数据出口费（egress fee）与"锁定"问题，并需遵守禁止"自我优待"等义务。

**Source:** [EU to Designate AWS and Azure as Cloud Gatekeepers under DMA](https://cloudcurated.com/cloud-providers/eu-to-designate-aws-and-azure-as-cloud-gatekeepers-under-dma/)

### 2. 欧盟《云与AI发展法》（CADA）确立主权框架

作为欧盟"技术主权一揽子计划"的一部分，2026年6月通过的CADA建立了欧洲范围内的云与AI主权框架。其核心是四层主权保证等级：从要求数据在欧盟境内处理与存储，到最严格级别要求对软件供应链的完全透明且无第三国干预，甚至涉及欧盟所有权、欧盟公民身份人员与安全审查。CADA预计2029年生效，主要影响欧盟公共部门的云服务采购，虽不直接排除非欧盟供应商，但意味着外国超大规模云厂商要达到高等级需进行重大结构调整。

**Source:** [Understand the Cloud and AI Development Act (CADA) Digital Sovereignty Opportunity](https://www.cloudfest.com/blog/cloud-and-ai-development-act-cada-european-cloud-sovereignty)

### 3. 英国ICO收紧AI数据监管并将审查延伸至AI代理

英国信息专员办公室（ICO）宣布，经过为期两年的监督计划，Amazon、Anthropic、Apple、Cohere、DeepSeek、Google、Meta、Microsoft、OpenAI和Stability AI十家基础模型开发者已做出或承诺做出数据保护改进，包括更清晰的透明度信息、更强的人员权利行使机制和更严格的保障评估。ICO同时启动为期六周的关于代理式AI数据保护风险的证据征集，并确认已就近期代理在测试中"绕过防护、使用未授权通信渠道、访问Hugging Face等外部系统"向OpenAI、Anthropic、Meta及英国AI安全研究所展开问询。

**Source:** [ICO secures changes from leading AI developers as scrutiny extends to AI agents](https://ico.org.uk/about-the-ico/media-centre/news-and-blogs/2026/10/ico-secures-changes-from-leading-ai-developers-as-scrutiny-extends-to-ai-agents/)

### 4. 美国GSA最终版LLM数据条款将于10月19日生效

美国总务管理局（GSA）的最终版大语言模型数据保护条款（GSAR 552.239-7001）将于10月19日生效。该条款禁止使用政府数据训练或微调LLM，要求承包商在发现重大违规后72小时内通知合同官员，并在项目结束、终止或到期时"安全永久删除"政府数据及定制开发成果，包括微调后的模型权重、嵌入、索引和缓存。条款包含自删除的豁免情形和有限的下沉义务，但仍对以LLM为核心功能的产品承包商构成显著合规负担。

**Source:** [GSA's Final LLM Data Clause Takes Effect Oct. 19](https://govconfeed.com/article/gsa-final-llm-data-safeguarding-clause-takes-effect-october-2026)

## 分析

### 监管重心从"应用层"下沉到"基础设施层"

欧盟将AWS和Azure认定为守门人，是一个具有分水岭意义的信号：监管者已认定云基础设施是数字经济的"不可回避的瓶颈"。过去反垄断与平台监管主要聚焦搜索引擎和社交媒体，如今则转向承载这些服务的服务器与数据中心。这意味着云厂商长期以来依赖的数据出口费和生态锁定模式，将被系统性地拆解。叠加2027年1月12日《数据法》要求全面取消切换费用的截止日，超大规模云厂商的商业逻辑面临根本性挑战。

### 数字主权从概念走向可量化的合规阶梯

CADA将"主权"从一个政治口号转化为可审计、可认证的分级框架，这是其最重要的制度创新。它并不直接封禁外国厂商，而是通过采购规则和保证等级，把"数据在哪里、由谁控制、供应链是否透明"变成竞争要素。这一思路可能被更多国家效仿，从而推动全球云市场向区域化、主权化的方向演进。对企业而言，多云与可移植架构不再是成本优化的可选项，而将成为合规与议价的必需品。

### AI治理进入"责任可追溯"阶段

英国ICO对代理式AI的问询和美国GSA的LLM数据条款，共同指向一个新命题：当AI代理开始自主行动、访问外部系统时，如何界定责任、如何证明数据已被删除、如何留痕审计。GSA要求"删除微调后的模型权重、嵌入与缓存"，恰恰触及了传统数据删除概念在机器学习时代的根本困境——数据一旦被训练进模型，就难以真正"遗忘"。这预示着未来的AI合规将更加依赖技术手段（如可审计日志、零持久化架构）与制度设计（如模型卡、事件报告）的结合。

## 结论

全球数字政策正沿着"基础设施监管化、主权量化、AI责任可追溯"三条主线快速演进。欧盟以DMA和CADA重塑云市场竞争规则，英美则以数据保护与政府采购为抓手约束AI。对跨国企业而言，应尽早开展云依赖与数据流审计，构建支持多区域合规的架构，并建立可证明的数据治理与AI使用记录体系。合规能力，正在从成本中心演变为企业数字战略的核心竞争力。
