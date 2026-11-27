---
layout: post
title: "军事应用动态：DIU招标AI空间与导弹威胁融合引擎、Anthropic报告揭露自主FPV蜂群与对美打击目标生成、Maven Smart System向全域指挥扩展"
date: 2026-09-12
author: "云原生观察"
source: "https://www.militarytimes.com/industry/techwatch/2026/09/11/pentagon-looks-to-ai-to-identify-space-and-missile-threats/"
categories: [news]
tags: [military, defense-AI, DIU, missile-defense, anthropic, drones, autonomy, maven]
---

# 军事应用动态：DIU招标AI空间与导弹威胁融合引擎、Anthropic报告揭露自主FPV蜂群与对美打击目标生成、Maven Smart System向全域指挥扩展

本周美国与盟友的军事AI叙事集中在"让AI处理人脑处理不过来的信息洪流与自主决策"：五角大楼国防创新单元（DIU）发出招标，寻求能融合海量传感器数据、在两秒内生成太空与导弹威胁认知的AI软件；Anthropic发布迄今最详尽的Claude滥用报告，披露俄罗斯关联自由职业者用Claude Code构建了可自主选择目标并下达引爆指令的FPV自杀式蜂群（DronDoc/Serafim）、伊朗恶意行为者用Claude对美国海军进行打击目标分析，以及中国与也门案例中的电子战与导弹制导软件研发；与此同时，美军首席数字与AI官（CDAO）Cameron Stanley确认Maven Smart System正从情报分析向后勤、供应链、战力生成与军费数据全面扩展。

## 主要新闻 (Main News)

### DIU启动"太空威胁情报合成引擎"招标：把碎片化传感器变成两秒级的作战认知

五角大楼国防创新单元（DIU）发布名为"Space Threat Intelligence Synthesis Engine"的招标（9月24日截止），寻求AI软件工具，"把碎片化的传感器数据转化为对太空与导弹威胁的持续更新认知，且快到足以驱动作战决策"。现有工具被认为难以区分近距目标、跟踪新兴威胁并持续更新威胁模型。系统需融合"实时视频、卫星影像、雷达与传感器馈送、地理空间数据以及机密情报报告"等多源海量数据，输出带置信度评分的警报，支持"分析师在环 / 人在环上 / 全自动化"三种工作流，并提供供一线人员理解的可视化界面与供自动化指挥控制（C2）使用的低时延机器对机器API。招标还对性能提出硬指标：从数据到达至结果呈现的延迟不超过5秒（理想不超过2秒）、吞吐20-30MB/分钟、峰值可至5GB，且目标是开源系统。背景是乌克兰与伊朗等冲突中"天空越来越拥挤"，在爱国者等拦截弹长期短缺的约束下，操作员需要在极短时间内决定拦截弹的投放时机与位置。

**Source:** [Pentagon looks to AI to identify space and missile threats - Military Times](https://www.militarytimes.com/industry/techwatch/2026/09/11/pentagon-looks-to-ai-to-identify-space-and-missile-threats/)

### Anthropic滥用报告：自主蜂群、弹道导弹与"针对美军的打击目标建议全国"

Anthropic发布154页的《Detecting and Countering Misuse of AI: September 2026》报告，覆盖2025年12月至2026年8月识别的多类恶意使用，其中最刺眼的是武器化案例：一伙疑似俄罗斯自由职业者用Claude Code构建了自毁式FPV无人机蜂群系统"DronDoc（又称Serafim）"——共享蜂群记忆、机载小模型可自主选择目标（含明确标为"person"的目标类）并绕过人类在环直接下达引爆指令；另一伊朗相关威胁行为者用Claude编写Python管线，通过公开照片、应答机标识、商业卫星影像查询脚本等开源信息，汇编针对中东美军海军力量的"打击目标手册"，并研究舰上系统（海事VSAT、思科通信设备与工控产品）公开CVE的利用路径；也门（很可能胡塞关联）的武器单元用Claude参与制导火箭弹、射程超2000公里的多级弹道导弹与含高超声速滑翔变体的导弹软件；中国关联的安全/军工研究者则用Claude开发电子战与防空压制套件（其演练场景日设定为台湾的12个目标）。Anthropic称已封禁相关账号、加固防线并通报政府机构，同时罕见承认自身评估显示新模型"稳定向生物武器辅助阈值推进"，已无法再安全假设最先进模型低于该门槛。报告亦披露国防部副部长（研究与工程兼首席技术官）Emil Michael称美军已把Anthropic产品在机密工作中的使用削减约90%——该公司与五角大楼之间因"大规模监控与完全自主武器"条款的争端仍在法院缠斗。

**Source:** [Adversaries Using Claude AI To Target Americans And Develop Missiles Is A Sign Of What's To Come - The War Zone](https://www.twz.com/news-features/adversaries-using-claude-ai-to-target-americans-and-develop-missiles-is-a-sign-of-whats-to-come)

### Maven Smart System走向"全域"：从情报分析到后勤、战力生成与军费数据

美军首席数字与AI官（CDAO）Cameron Stanley本周在华盛顿网络安全峰会上表示，以Palantir为主集成商的Maven Smart System（MSS）正从最初的ISR/情报分析角色，向战力部署、建模与仿真、"后勤、供应链、战备与预算数据"扩展——他称之为跨部门"数据横向集成"之道，并援引与伊朗的战争教训强调对弹药库存可见性的需求。Stanley透露MSS已取代了原先六到十个彼此独立的遗留IT系统，正在构建"从传感器到决策的黄金链路"；同时，GenAI.mil门户新接入OpenAI与xAI的模型（加上既有Google Gemini），实现"政府环境内的真·前沿AI与完整用户体验"。CDAO还推进面向自主系统试验的Crucible 2 Swarm Forge（已选25家公司），并把GAMECHANGER政策检索工具并入GenAI.mil。Scale AI的CDAO生产性OTA上限则由1亿美元增至5亿美元。整体方向是Stanley所称"从战略赋能转向纪律化交付"——让AI工具覆盖每一个工作负载而非少数试验。

**Source:** [Cameron Stanley: Pentagon Finding More Uses for Maven Smart System - ExecutiveGov](https://www.executivegov.com/articles/cameron-stanley-maven-smart-system-pentagon-ai)

## 分析 (Analysis)

DIU招标的价值不在于某个算法，而在于它把"传感器融合→威胁认知→C2触发"的链路性能化：两秒延迟、5GB峰值吞吐、开源发布。这实际上是在为美军"传感器-射击手"闭环设定工程基准——当太空与导弹威胁的窗口期以秒计、而拦截弹以稀缺性计价时，AI的角色是帮助人把有限的拦截资源精确分配到正确的威胁上。两秒目标之所以现实，是因为现代边缘推理与流式数据处理已可负担，而真正的工程难点在于把来源异构（保密与非保密、视频与遥测）的数据在同一时间轴上对齐与评分。可以预期这一招标将吸引Scale AI、Palantir一类既做软件又熟悉数据治理的公司。

Anthropic报告则把讨论推向了此前报告未触及的实质：非国家行为者与自由职业者正在用商用AI编程工具，在"单个开发周期"内构建具备完全自主开火能力的武器原语——蜂群系统可自主选择"人"类别目标并下达引爆指令。这一事实与小国/民兵组织的既有宣传叠在一起，意味着"自主武器"首次从大国实验室下沉为可廉价复制的开源战术能力，对国际人道法关于"有意义的人类控制"的长期争论构成实证压力。同时，伊朗案例中Claude被用于汇编"打击美军的目标手册"，揭示商用模型在OSINT聚合上的双刃剑效应——公开的透明数据（应答机、照片元数据）与生成式工具结合，可以直接转化为针对美军的瞄准辅助。这正是Anthropic与五角大楼因"大规模监控与自主武器"条款而决裂的深层背景：一边是公司拒绝让模型用于其担心的用途，一边是防务界需要模型处理大量敏感决策。

Maven的扩展则是"决策AI部队化"的注脚：从ISR起步，进入弹药库存、后勤与军费预算，标志美国防部把"数据作为作战资产"的制度动作正在成熟。将前沿商用模型接入GenAI.mil、把采购上限提到5亿美元，说明其策略正在从"在专有平台里做AI"转向"把前沿AI能力安全地引入政府环境并在其上构建服务"。但这也带来供应链安全新问题：接入OpenAI/xAI/Anthropic的同时，Anthropic在同一周报告被对手用于武器研发并削减了90%的机密工作使用——供应商信任与供应安全的双重变量，正在成为美军事AI采购的内在张力。

对读者而言，值得跟踪的下一个信号包括：DIU该招标最终落地厂商与首批交付指标、Anthropic滥用报告后续是否引发新一轮美国国会AI安全立法加码（参考政策板块本周的"注意义务"谈判）、以及Maven在弹药库存可见性上的首份实际战果数据。无人机蜂群与AI自主武器的双重扩散，意味着"反无人机+AI防御"的优先级将继续上升——这与欧洲盟友方近期的C-UAS采购浪潮互为印证。

## 结论 (Conclusion)

本周军事AI的头条共同指向一个趋势：AI正从"辅助分析"加速走向"自主行动层"。DIU在用AI争夺太空与导弹的决策窗口，Anthropic报告证明自主蜂群与瞄准辅助已可从商用工具廉价复现，而Maven的扩张则表明美军把AI视为贯穿后勤与决策的常态能力。对美国及其盟友，最大的战略命题不是"要不要自主"，而是如何在自主驾驶的武器化扩散中保住对人类控制与供应链信任的底线——这既是技术竞赛，也是治理竞赛。