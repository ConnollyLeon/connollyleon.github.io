---
layout: post
title: "军事应用动态：美军将AI引入软件认证与数据运营，边缘自治持续升温"
date: 2026-11-22
author: "云原生观察"
source: "https://defensescoop.com/2026/11/20/army-project-gatekeeper-openai-gabe-chiulli/"
categories:
  - military
tags:
  - defense
  - ai
  - devsecops
  - edge-computing
  - military
---

# 军事应用动态：美军将AI引入软件认证与数据运营，边缘自治持续升温

过去24小时的防务科技消息显示，美军正在把AI从概念演示推向流程内部：陆军计划在下季度把OpenAI模型接入Project Gatekeeper的软件认证流程，国防部长赫格塞思呼吁加速AI采用并开放军事数据，五角大楼则把负责AI的办公室更名为“Super Intelligence Office”。在战术边缘，无人机平台的本地处理与视觉导航也在持续演进。

## 主要新闻

### 陆军计划在Project Gatekeeper中率先与OpenAI合作

DefenseScoop报道，陆军代理CIO Gabe Chiulli表示，将在下季度把AI模型引入Gatekeeper，第一阶段与OpenAI合作确定检查项并使用Daybreak等工具做验证，避免重复已有扫描能力。Gatekeeper旨在把动辄数月的ATO认证流程压缩为向陆军DevSecOps平台提交代码后的快速验证，通过后可进入IL5环境；后续将开放给其它开源与商业模型，并鼓励企业自带API密钥。

**Source:** [Army plans to work with OpenAI on Project Gatekeeper](https://defensescoop.com/2026/11/20/army-project-gatekeeper-openai-gabe-chiulli/)

### 赫格塞思在Starbase呼吁全面拥抱AI

KRGV报道，美国国防部长Pete Hegseth在“Arsenal of Freedom”参访中宣布国防部将设立六个“执行组织”，以更快决策推动创新，并提出把AI用于打造“AI-enabled fighting force”。他称将把军方IT系统与情报数据库中的“所有适当数据”开放给AI使用，同时透露2027财年国防预算提案将超过1万亿美元。

**Source:** [Hegseth calls for use of AI in defense department during Starbase visit](https://www.krgv.com/videos/hegseth-calls-for-use-of-ai-in-defense-department-during-starbase-visit/)

### 五角大楼把AI办公室更名为“Super Intelligence Office”

Military Times报道，国防部把原Chief Digital and Artificial Intelligence Office改名为Super Intelligence Office（SIO），并由Cameron Stanley领导。官方称此举“不是任务变化”，但表述从“超越实验原型”转向“主权超级智能”与跨领域军事优势；专家指出，super intelligence目前仍是理论概念，并非现实能力。

**Source:** [What AI’s rebrand to ‘super intelligence’ means for the Pentagon](https://www.militarytimes.com/news/pentagon-congress/2026/11/18/what-ais-rebrand-to-super-intelligence-means-for-the-pentagon/)

### Sky-Watch：把ISTAR处理前移到传感器与无人机本机

Sky-Watch案例文章介绍，其RQ-35 Heidrun与RQ-70 Dainn把EO/IR影像处理分布在Zentra载荷与机载计算上，运行DRI、视觉导航与Call for Fire工作流，减少回传原始数据和带宽压力；在GNSS受扰或链路降级时，视觉跟踪与地图关联可支持导航，AI只辅助分类，最终由操作员验证并决定移交目标。

**Source:** [How Sky-Watch processes ISTAR data at the edge](https://sky-watch.com/insights/case-studies/edge-processing-on-the-uav-closer-to-the-mission/)

## 分析

Gatekeeper的价值不在于“用AI扫代码”这一动作本身，而在于它把安全审查从采购后的瓶颈前移到供应商提交阶段。对军方而言，ATO周期过长意味着商业技术进入部队时已经落后；对供应商而言，提前获得可重复的验证反馈可以降低进入门槛。第一阶段选择闭源模型、后续引入开源与自带API密钥，说明陆军在能力开放与代码保密之间做了分层设计，这种工程细节比口号更能决定项目成败。

数据开放计划则带来另一类问题。把IT系统与情报数据提供给AI，前提是有严格的分类、访问控制和审计链；否则效率提升会以误用和泄露风险为代价。五角大楼把办公室改名为“Super Intelligence Office”，在技术层面并未改变能力边界，但在组织层面可能改变预算、采购与对外叙事的口径。观察者需要区分品牌调整与真实的部署进展，避免被术语带偏。

战术边缘的案例提醒我们，战场AI的核心约束不是模型有多强，而是链路被干扰、带宽有限、GNSS不可靠时还能否产出可用情报。把处理前移到传感器和机体，本质上是一种分布式边缘计算架构：数据在本地被压缩、筛选和分类，只把结论交给指挥系统，并保留人类在识别与移交环节的判断权。这与云原生中“把计算推向数据”的逻辑高度一致，只是可靠性要求更高。

未来需要重点跟踪三件事：Gatekeeper的AI检查能否形成可审计、可复现的安全结论；所谓“所有适当数据”开放会配套怎样的权限与审计机制；以及边缘自治系统在真实对抗环境中的误报率与人机协同流程。军事AI的竞争，最终会落在部署速度、可信度和持续运维能力上。

## 结论

美军正在同时推进流程再造、组织调整和边缘计算部署，目标是把AI变成可规模化的作战与保障能力。对国防科技从业者而言，机会集中在安全认证自动化、数据治理和受扰环境下的边缘推理，而不是单一模型性能。真正的考验在于：这些系统能否在高压、受限、可审计的条件下稳定工作，并让人类始终掌握最终决策权。
