---
layout: post
title: "军事科技动态：五角大楼10月前搬空Anthropic机密AI负载、DIU招标2-5秒太空导弹威胁识别引擎、Anthropic报告曝光中国军研与科技巨头使用Claude"
date: 2026-09-14
author: "云原生观察"
source: "https://defensescoop.com/2026/09/11/dod-poised-to-move-all-classified-ai-workloads-off-anthropic-by-october/"
categories:
  - military
tags:
  - pentagon
  - anthropic
  - supply-chain-risk
  - diu
  - missile-defense
  - genai-mil
  - china
  - claude
  - adversarial-ai
---

# 军事科技动态：五角大楼10月前搬空Anthropic机密AI负载、DIU招标2-5秒太空导弹威胁识别引擎、Anthropic报告曝光中国军研与科技巨头使用Claude

9月11日至13日，"前沿AI与国防安全"成为本周军事科技新闻主线。美国防部负责研究与工程的副部长Emil Michael透露，约90%的机密AI负载已完成从Anthropic迁移，目标是在本月底（10月前）清零，Anthropic已被依据两项法律列为"国家安全供应链风险"并进入司法程序；国防创新单元（DIU）同步发布"太空威胁情报合成引擎"招标，要求AI在两到五秒内把碎片化传感器数据融合为可用的威胁图像，投标截止9月24日；而Anthropic最新威胁报告则披露，与解放军相关的研究机构及包括阿里、DeepSeek、小米在内的中国科技巨头在至少五类项目中使用Claude——包括16个针对台湾的防空压制软件模块、反鱼雷火控系统的技术方案，以及最高单日数百万次的模型蒸馏活动。三条新闻共同勾勒出前沿AI在国防领域的"进攻-防守-供应链"三重博弈。

## 主要新闻 (Main News)

### 五角大楼加速将机密AI负载整体迁离Anthropic：供应链风险判定与诉讼并行

DefenseScoop于9月11日报道，美国防部副部长Emil Michael在NDIA新兴技术会议期间向媒体透露，五角大楼已接近完成把所有机密系统的AI负载从Anthropic迁移到其他前沿AI供应商："大约90%已经转移，Maven Smart System与Palantir的相关工作早在几个月前就完成了，我们正按计划在本月底搞定。"这场快速迁移的导火索是五角大楼与Anthropic之间的谈判破裂：Anthropic坚持在合同中加入限制条款，禁止其模型被用于大规模监控美国公民或全自主致命武器系统，而国防部以"国防软件必须可无约束地用于一切合法用途"为由拒绝，随后将Anthropic列为国家安全供应链风险，双方如今正在法庭交锋。据Michael介绍，此案涉及依据两项法律作出的供应链风险认定：其中一案的初审（加州北区法院）已裁决，另一项更关键的诉讼只能由华盛顿特区巡回法院审理，且法院未签发初步禁令，因此"供应链风险"认定依然有效，预计未来一两个月将有结果。Maven、GenAI.mil等系统正在拥抱不包括Anthropic的多模型生态（OpenAI的ChatGPT与xAI的Grok已接入），Michael转述前线反馈称"使用新版ChatGPT的Maven操作员喜欢它胜过Anthropic，而Grok速度最快"。同时也应注意到国防官员的降温提醒："不要夸大我们在AI旅程中的位置"——GenAI.mil尚无API访问，无法在其内部构建agent，跨域的高生产力仍停留在"点mil之外"。

**Source:** [DOD poised to move all classified AI workloads off Anthropic by October](https://defensescoop.com/2026/09/11/dod-poised-to-move-all-classified-ai-workloads-off-anthropic-by-october/)

### DIU招标"太空威胁情报合成引擎"：两秒内把传感器洪流变成可用威胁图像

五角大楼正寻求用AI穿透传感器数据的混乱。国防创新单元（DIU）发布招标（投标截止9月24日），目标产品名为"太空威胁情报合成引擎"（Space Threat Intelligence Synthesis Engine）：把实时视频、卫星影像、雷达、传感器流、地理空间数据与机密情报报告融合为持续更新的威胁理解，"快到足以驱动作战决策"。DIU直言现有工具难以区分近距离目标、难以跟踪新兴威胁、威胁模型容易过时。指标要求相当具体：端到端延迟不超过5秒（最好2秒以内），常规吞吐20至30MB/分钟、突发可达5GB，输出须包含带置信度评分的告警，支持"分析师在环/人在环/全自动"三种工作流，并提供人性化可视化与供自动C2工作流调用的低延迟机器对机器API。招标背后是拦截弹库存的真实压力：据CSIS数据（ABC与LA Times转引），自2月28日伊朗战争爆发以来，美军已消耗约65%的爱国者拦截弹，先进防御导弹库存从开战时的近2800枚降至7月底约1100枚；陆军上月向Lockheed授予了价值至多586亿美元的爱国者拦截弹合同。在同一生态里，Anduril与Palantir正在合作Golden Dome导弹防御软件（预估成本已升至1850亿美元），Shield AI今年3月完成15亿美元Series G融资。这场竞标把"稀缺拦截弹的分配决策"交给AI实时判断，其成败将检验"信任进自动决策回路"在国防场景的边界。

**Source:** [Pentagon looks to AI to identify space and missile threats](https://www.militarytimes.com/industry/techwatch/2026/09/11/pentagon-looks-to-ai-to-identify-space-and-missile-threats/)

### Anthropic威胁报告：中国军研单位与科技巨头使用Claude，含台湾防空压制工具与大规模蒸馏

Tom's Hardware于9月13日解读Anthropic2026年9月威胁报告：数百个与中国关联的代理账户在至少五类项目中使用Claude，包括两项军事、两项监控与一项能力蒸馏。军事方面，一个伪装成美国国防业OEM的中国防务制造商关联行动者用Claude起草了反鱼雷火控系统的火控技术说明书（并基于公开资料测试其对抗美海军反鱼雷/反潜系统的有效性），还准备了一份200余页的技术方案；另一名中国国防与军工科研人员用Claude开发了约16个电子战与防空压制软件模块（分析雷达、地空导弹阵地、指挥所与通信节点并排序目标），默认场景中即包含位于台湾的12个目标——包括爱国者与天弓导弹阵地、机场、预警雷达与指挥掩体，账户元数据与保全面内容指向解放军军事科学院等中国科研机构。蒸馏是更大的一条暗线：阿里被指在2026年5至7月间生成超过1.51亿次Claude对话（峰值约每日300万次、经由数千个欺诈账户），据信用于训练Qwen 3.x的推理、编码与agentic能力；DeepSeek被指14天内生成逾1210万次对话，小米逾40万次，Zhipu/智谱等亦被点名。所用技术涵盖代理网络、欺诈账户、实体伪装、把自家客户请求转发给Claude以及收购第三方抓取的对话数据。讽刺之处在于：即便中国拥有可与之竞争的国产模型，相关行动者依然选择美国前沿模型——因为其在编码、推理与agentic工作流上的优势，以及基于海量英文语料训练带来的"对美军装备的深度公开知识"。

**Source:** [Chinese military researchers and tech giants caught using Claude](https://www.tomshardware.com/tech-industry/artificial-intelligence/chinese-military-researchers-and-tech-giants-caught-using-claude-us-frontier-model-coded-16-air-defense-suppression-tools-targeting-taiwan-drafted-anti-torpedo-specs-and-fed-151-million-training-queries-to-alibaba)

## 分析 (Analysis)

把本周三条军事科技新闻串起来看，"前沿AI的供应链主权"正在成为继芯片之后最尖锐的国防治理命题。"DOD撤出Anthropic"表面是模型选择问题，实质是"用谁的模型、按谁的安全条款打仗"的主权重置——Anthropic坚持对大规模监控与全自主致命武器设定使用限制，与国防部"一切合法用途"的底线要求直接冲突，最终以供应链风险认定+诉讼的形式将分歧制度化。对国防科技行业而言，此案开创了"合同安全条款→供应链风险认定"的强制治理先例：未来的商业AI在承接国防数据时，要么接受国防部的无限制条款，要么承担被整体踢出采购体系的成本，而多模型生态（OpenAI/xAI/Google）正顺势填补市场空隙。值得持续观察的还包括法院的动态——D.C.巡回法院未签发初步禁令意味着"供应链风险"标签依然有效，未来一两个月的裁决将检验这一机制在司法层面的可持续性。

DIU的2-5秒威胁识别引擎与Anthropic威胁报告的对照则揭示另一层张力。前者把"信任自动决策回路"推进到拦截弹分配这类高代价实时决策——AI必须既快又给出可解释的置信度与来源，且要在2秒的硬延迟下做到"人可验证"；当拦截弹库存成为稀缺资源，AI判断的边际价值与边际风险被同时放大。而后者显示，美国前沿模型的"通用智能"同样服务于对手的作战软件开发与模型蒸馏：敌对方以低廉的API成本获得原本需要多年积累的武器系统知识与工程能力，这实质上是把"算力出口管制"的缺口暴露在模型层——芯片可禁运，前沿模型却可能借代理网络持续外流。对决策者，三者共同指向一个趋势：AI驱动的国防竞争正在从"谁的模型更强"转向"谁的供应链更封闭、反馈回路更可信"。

## 结论 (Conclusion)

本周军事科技新闻的主线是"AI国防化"的正面与暗面同时加速：五角大楼以供应链风险认定+多模型替换重构AI采购版图，把"模型条款"升级为国家安全治理工具；DIU以2-5秒的硬实时指标把AI推进到导弹威胁识别的决策前沿，背后是拦截弹库存的真实消耗；而Anthropic的报告揭开对手利用美国前沿模型开发针对台湾的作战软件与大规模蒸馏的现实。未来一个季度值得紧盯的三根指针：D.C.巡回法院对Anthropic供应链风险的裁决、DIU太空威胁引擎的授标结果（9月24日投标截止后的六十至九十天内通常有原型奖）、以及美国对前沿模型出口与部署控制的政策走向——它们将共同定义AI军事应用的供应链规则。