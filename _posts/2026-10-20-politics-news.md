---
layout: post
title: "政策动态：DHS下令联邦系统移除DeepSeek、日本拟立数据中心云安全认证与FedRAMP 20x Class D征求意见"
date: 2026-10-20
author: "政策观察"
source: "https://www.wsj.com/tech/ai/dhs-orders-deepseek-technology-removed-from-federal-civilian-it-systems-060b6d3d"
categories:
  - politics
tags:
  - cloud-regulation
  - deepseek
  - fedramp
  - japan
  - data-sovereignty
  - ai-policy
  - cyber-security
---
# 政策动态：DHS下令联邦系统移除DeepSeek、日本拟立数据中心云安全认证与FedRAMP 20x Class D征求意见

过去24小时内，云与AI政策领域三条消息值得记录：美国国土安全部（DHS）下令联邦民用机构从IT系统中移除中国DeepSeek的AI技术并禁止未来采购；日本总务省与经产省计划在2027财年后为数据中心与云服务设立安全认证制度；美国FedRAMP就其最高等级20x Class D试点规则向业界公开征求意见，涉及后量子密码与外国所有权追踪。三条新闻分别指向供应链排除、主权云认证与联邦云合规三层政策工具的同步收紧。

## 主要新闻

### 1. DHS命令联邦民用机构移除DeepSeek并禁止未来采购

《华尔街日报》报道，美国国土安全部已下令联邦民用机构从其IT系统中移除中国DeepSeek开发的人工智能技术，并禁止未来采购该公司的产品与服务。DHS通告同时将限制范围延伸至DeepSeek关联方开发的产品，以及任何基于DeepSeek实现构建的第三方产品与服务。这是美国联邦政府首次以系统性行政命令方式排除某一特定外国AI模型，其影响将穿透到使用大模型的联邦SaaS工具、集成商与开源衍生实现——对供应商而言，"模型来源尽职调查"从此成为联邦合同的合规必选项。

**Source:** [DHS Orders Federal Civilian Agencies to Remove China's DeepSeek AI - The Wall Street Journal](https://www.wsj.com/tech/ai/dhs-orders-deepseek-technology-removed-from-federal-civilian-it-systems-060b6d3d)

### 2. 日本拟对数据中心与云服务设立安全认证，2027财年后实施

据AI Affairs报道（源起Financial News与日经），日本总务省与经济产业省计划在2027财年后引入针对数据中心与云服务的安全认证制度，评估对象包括在日本设有数据中心的运营商以及服务器位于日本境内的云提供商。审查内容涵盖企业所有权结构、防数据泄露措施与设备供应商来源。政府将向金融机构、医疗机构等处理敏感个人信息的组织推荐认证服务商——使用仍属自愿，但管理此类信息的公司将面临政府对其数据实践的审查。拟议的法律修订将要求存储或提供重要个人信息的公司提前通知，并授权政府在判定数据存储存在风险时发出暂停令或建议。相关《经济安全保障推进法》修正案拟于2027年1月开始的国会会期提交。

**Source:** [Japan plans security certification for data centres and cloud services - AI Affairs](https://www.aiaffairs.com/government/japan-plans-security-certification-data-centres-cloud-services/)

### 3. FedRAMP就20x Class D试点规则征求意见，聚焦后量子密码与FOCI

ExecutiveGov报道，FedRAMP已发布请求评论，就其FedRAMP 20x Class D云托管试点的拟议规则与关键安全指标征集业界意见，征求意见期至11月19日。Class D是FedRAMP最高等级认证（对齐High基线），20x路径要求申请人先持有Class C认证满六个月。拟议更新覆盖六个规则集：漏洞检测与响应（机器资源至少每三日核验一次）、漏洞评估与报告（以JSON格式至少每周发布漏洞活动）、安全决策记录、认证数据共享（通过API提供机器可读认证包）、密码模块使用（须记录后量子密码状态与迁移时间表）以及认证规则本身。FedRAMP还引入了"外国所有权、控制或影响（FOCI）"与"外国人"两项新定义：FOCI可接受性仍由各机构判定，FedRAMP仅核查提供方是否持续追踪相关指标。

**Source:** [FedRAMP Seeks Input on Proposed 20x Class D Pilot Rules - ExecutiveGov](https://www.executivegov.com/articles/fedramp-20x-class-d-pilot-rules-pqc-foci-input-request)

## 分析

三条政策消息展示了当前云治理的三种工具形态：

- **排除式工具：以采购禁令替代技术评估。** DHS对DeepSeek的禁令不区分模型本身与基于其实现的第三方产品，其执行难点恰在于此——联邦系统中究竟有多少工具底层调用了DeepSeek系模型，多数机构并不掌握完整清单。这一命令的实际效果，是把模型供应链可见性（SBOM式清单）变成联邦供应商的强制能力。对云服务商与集成商而言，这意味着模型来源披露将进入合同条款；对其他国家的采购方而言，美国的排除清单也提供了可复制的监管模板。
- **认证式工具：以"推荐+自愿"渐进推高主权门槛。** 日本的做法颇具代表性——认证使用自愿，但对处理敏感信息的机构会施加数据实践审查，形成事实上的软强制。审查维度（所有权、防泄露、设备供应商）明显带有经济安保色彩，与欧美"数据本地化+供应链审查"的组合拳如出一辙。值得注意的是其法律路径：通过修改《经济安全保障推进法》而非新设专门法，可在较短周期内获得暂停令等执法手段。
- **程序式工具：以透明化指标压缩合规不确定性。** FedRAMP 20x Class D的设计逻辑是把"最高安全等级"拆解为可机读、可自动核验的指标——每周JSON漏洞报告、API化的认证包、后量子密码迁移时间表。这既降低了政府审查成本，也让供应商能够工程化地管理合规。FOCI定义的引入尤其关键：它不直接禁止外国背景供应商，而是要求持续追踪与披露，把地缘判断留给各机构——与DHS的直接禁令形成鲜明对比。

三者叠加的一个共同趋势是：云服务的"信任"正被拆解为可审计的指标与可追责的披露，而非笼统的国别判断。对跨国云厂商与AI供应商而言，合规团队需要同时应对三种节奏——采购禁令的即时生效、认证制度的中期落地与试点规则的意见周期。

展望未来，需重点关注三个时间节点：11月19日FedRAMP意见期截止后的规则定稿、2027年1月日本国会的修法进度，以及DHS禁令在联邦采购系统（GSA等）中的具体落地条款。

## 结论

今日三条政策新闻表明，云与AI的监管正在从"原则宣示"进入"操作细则"阶段：美国用禁令划定不可触碰的边界，日本用认证设置渐进式门槛，FedRAMP用指标化规则重构最高安全等级。对从业者而言，政策风险的管理单位已从"国家"细化到"模型来源、数据中心所有权与密码迁移时间表"。能够提前建立模型供应链清单、主权认证路径与后量子迁移计划的企业，将在下一轮政府采购与跨国部署中占据主动。
