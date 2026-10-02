---
layout: post
title: "军事应用动态：NATO首次整体放行AWS处理联盟受限级数据、美军Maven智能系统用户破10万且'Epic Fury'38天打击1.3万目标、Thales发布HexaForce跨域AI指挥控制系统"
date: 2026-09-23
author: "云原生观察"
source: "https://www.defenseone.com/technology/2026/09/nato-aws-europe-america/416131/"
categories: [military]
tags: [military, nato, aws, restricted, cloud, dod, maven-smart-system, palantir, epic-fury, ai, targeting, thales, hexaforce, command-control, edge-computing]
---

9月22日，军用AI与国防云在三线并举：生态侧，AWS成为首个获北约全体成员国批准、可处理NATO RESTRICTED级敏感信息的云服务商——与西班牙国家密码中心（CCN）多年测评的成果，标志着联盟级多云数据共享首次有了统一合规基准；应用侧，五角大楼证实Palantir的Maven智能系统（MSS）用户数在"Epic Fury"行动推动下从1月的约5万翻倍至逾10万，且该系统支撑美军在38天内打击1.3万个目标，国防部常务副部长的备忘录要求本财年内把MSS转为正式项目记录（program of record）；平台侧，Thales发布HexaForce——覆盖陆、海、空、天、网、电磁频谱与信息作战七个域、以LLM与agentic AI驱动的分布式指挥控制系统，试射目标从日产100提升到1,000个，并已在NATO CWIX 2026中验证互操作。

## 主要新闻 (Main News)

### AWS获北约首个联盟级批准：可处理全体成员国的RESTRICTED级数据

Defense One于9月22日报道，AWS已获得北约联盟级批准，成为首个被授权处理所有北约成员国敏感信息的云服务商。该批准针对NATO RESTRICTED级别——非机密但需保护的数据。尽管欧盟数据法（2024年欧盟数据法）要求云服务商保护欧盟数据免受其他国家政府（包括美国）调取，AWS仍凭借与西班牙国家密码中心（CCN）多年联合测评、并把测评结论共享至全部成员国的"多年持续努力"拿下这一首个整体性blanket approval，领先于微软等主要竞争对手。AWS现为欧洲最大的商业云运营者，拥有英国在内的9个欧洲区域。此次批准恰逢欧洲军队融合雷达、卫星甚至声学信息以更好探测俄罗斯无人机等威胁——联盟内快速数据与信息共享能力的战略价值由此凸显。分析认为，该决定印证了美国科技能力仍是北约军事体系的核心组成，且欧盟数据存储监管并未真正阻碍美国云服务商在欧立足。

**Source:** [NATO's thumbs-up for AWS shows Europe still needs America | Defense One](https://www.defenseone.com/technology/2026/09/nato-aws-europe-america/416131/)

### Maven智能系统用户破10万：Epic Fury行动38天打击1.3万目标

DefenseScoop于9月22日在DefenseTalks会议报道，美国防部研发与工程副次长James Mazol确认：Maven智能系统（MSS）的用户数自年初约5万增长至当前逾10万，增长主要由针对伊朗的"Epic Fury"行动推动。国防部首席数字与AI官（CDAO）Cameron Stanley指出，Maven在Epic Fury期间支持美军在38天内打击13,000个目标——"这就是数据中心战（data-centric warfare），是规模化使用AI"。MSS可融合异构系统、数据流与情报信息，显著加快指挥官对目标的定位与打击流程。国防部常务副部长Steve Feinberg已于3月签发备忘录，要求本财年末前将MSS转正为正式项目记录；去年该系统的合同上限已被提升至逾10亿美元。同时，Mazol强调美军的核心瓶颈是"安全算力（secure compute）"——无法用商业数据中心在机密数据上训练模型，为此五角大楼正推动"AI Arsenal"计划，建设"政府所有、承包商运营"的主权数据中心，并把算力"容器化"推到战场边缘（containerized at the edge）。

**Source:** [More than 100K personnel use Maven Smart System: Pentagon official | DefenseScoop](https://defensescoop.com/2026/09/22/maven-smart-system-ai-james-mazol-cameron-stanley-defensetalks/)

### Thales发布HexaForce：七域覆盖的AI驱动指挥控制（C2）系统

Thales于9月22日发布HexaForce——面向多域联合指挥控制的AI赋能力平台，设计覆盖陆地、海上、空中、太空、网络、电磁频谱与信息作战七个领域，采用分布式架构连接各国部队与联军的既有系统，并保留参与国对进出数据的主权控制。HexaForce基于Thales的cortAIx套件（集成大语言模型与agentic AI），用于缩短规划周期、实时共享态势图、加速决策与火力配属。官方称其目标是在实弹演练中实现每天处理1,000个目标的吞吐（此前为100个/天），并从军事、开源与民用来源融合数据。系统在NATO CWIX 2026演习中完成互操作验证，支持数据为中心安全（Data-Centric Security）与联邦任务网络（Federated Mission Networking）标准。HexaForce脱胎于自2023年即部署于法国国防部的Artemis.IA，与SkyDefender空天防御架构共享cortAIx底座。

**Source:** [Thales Launches HexaForce AI-Driven Command & Control System | GovConExec](https://www.govconexec.com/2026/09/thales-hexaforce-ai-command-control/)

## 分析 (Analysis)

MSS用户数翻倍与"38天1.3万目标"这两个数字，把"AI辅助目标打击"从宣传语变成可度量的指挥流程事实。用户翻倍的诱因不是产品发布会而是作战需求——Epic Fury行动以实战需求倒逼系统在全军扩散，这印证了AI军事应用的第一定律：采纳速度由作战迫切性而非技术完备性决定。1.3万个目标在38天内被打击，背后是"数据融合→候选目标→人机确认→武器配属"整条流水线的压缩。但Mazol坦承的"安全算力"瓶颈同样关键：机密数据训练需要主权数据中心，边缘算力需要容器化——这正把五角大楼的采购语言（AI Arsenal、政府所有承包商运营）推向与商业云原生完全同构的技术栈：Kubernetes编排、边缘容器、机密计算。可以说，美军正在把"云原生AI平台"复制为国防版的标准化底座。

AWS拿下北约首个联盟级批准的象征意义，比其商业份额更重要。它回答了三个悬而未决的问题：其一，北约内"敏感数据能不能上美国云"——可以，前提是经联盟统一的CCN式测评基准；其二，欧盟数据法与北约数据共享是否冲突——不冲突，AWS以欧洲本土部署与数据保护承诺化解了跨境调取疑虑；其三，美国云厂商在欧洲是否被地缘政治挡在门外——相反，竞标中"美国身份"反而成为安全信任的背书。对德军方与技术买办而言，这意味着联盟多云战略出现可复制的"一次性认证、全体成员复用"的授权路径，数据主权维护从白名单制转向了"根证书制"——每个成员国不必各自验证，信任由联盟级验证锚定。

Thales HexaForce代表欧洲军工对美军MSS范式的"主权化"回应：同样是LLM+agentic AI，同样强调多源数据融合与自动目标处理，但HexaForce把"保留各国对数据的控制权"作为第一设计约束——分布式架构、可插拔的国际互操作与Federated Mission Networking支持，让联军成员在没有统一指挥数据池的情况下也能按国家边界共享态势。1,000目标/天的设计吞吐是对美军1.3万目标/38天战绩的量化对标。三件事合看，2026年国防AI竞争的实质正在从"谁有更好的模型"迁移到"谁的算力与信任架构能让模型安全地在主权边界内外奔跑"——这也是"AI Arsenal"、北约批准与HexaForce三者的共同注脚。

## 结论 (Conclusion)

过去24小时的军事动态共同指向"可信算力+联盟信任"成为国防AI的主战场。AWS以联盟级批准解决北约"数据可共享性"的信任问题；MSS用10万用户、38天1.3万目标验证"作战可采纳性"的规模化拐点，并把"安全算力"与"边缘容器化"推成五角大楼的核心采购方向；HexaForce则以主权控制的分布式C2展示了欧洲的并行方案。对关注国防云与军用AI的从业者：应跟踪AWS此番NATO批准是否演化为"北约云市场"的统一入盟标准，紧随Maven转正为program of record后释放的采购预算与安全算力招标，以及HexaForce在CWIX之外向实战演习的延伸——本季度的胜负手，在于谁先把"主权边界内的容器化AI计算"做进联盟级的部署手册。