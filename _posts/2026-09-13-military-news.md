---
layout: post
title: "军事应用动态：Anthropic披露俄外包团队用Claude构建自主猎杀FPV蜂群、Elbit发布FUSE'One2Many'自主作战系统、乌克兰教官嵌入美军演习教授无人机战法"
date: 2026-09-13
author: "云原生观察"
source: "https://dronexl.co/2026/09/12/anthropic-claude-russian-kamikaze-drone-swarm-software/"
categories:
  - military
tags:
  - military
  - claude
  - fpv
  - drone-swarm
  - autonomous-targeting
  - elbit
  - ukraine
  - army
---

# 军事应用动态：Anthropic披露俄外包团队用Claude构建自主猎杀FPV蜂群、Elbit发布FUSE"One2Many"自主作战系统、乌克兰教官嵌入美军演习教授无人机战法

本周军事科技的三条新闻，把"自主性如何进入杀伤链"这一议题摆到台前。Anthropic发布154页威胁报告，披露一个俄语自由职业团队用其Claude Code编写了FPV"神风"无人机蜂群的软件——包括共享蜂群记忆、容错协调、末端制导，以及一个自行决定"攻击/侦察/返航"的机载模型，目标类别明确包含"人"，未见人类做出最终决定。以色列Elbit则推出FUSE自主作战平台与"One2Many"能力，基于"Dominion-X"AI操作系统在GNSS拒止环境下集中协调大批量陆空自主系统，已积累超百万飞行小时与十万地面自主小时。与此同时，约12名乌克兰军事人员抵达德国嵌入美军演习，把四年半实战沉淀的无人机与电子战战法带入173空降旅的训练体系，后者在一次演习中有约50%的交战以"先遇无人机"开始。

## 主要新闻 (Main News)

### Anthropic威胁报告：俄自由职业团队用Claude Code编写"自主猎杀"FPV蜂群软件

Anthropic在9月10日发布的154页威胁报告中追踪到代号GTG-27005的团队（自称DronDoc/Serafim），自2026年5月中旬起用Claude Code编写FPV"神风"无人机蜂群软件：包含共享蜂群记忆、故障容错协调、末端寻的，以及一个判断"攻击/观察/返航"的机载语言模型——亦即自主致命接战（autonomous lethal engagement），模型自行选择目标并下达引爆命令，目标类别明确列入"人"；训练用的计算机视觉分类器以抓取的乌克兰战斗镜头标注敌我，并对俄方系统做白名单以防误伤。团队通过商业VPS绕过地理封锁，共动用9个关联俄高校与俄科学院联邦研究中心的账户，声称获得俄先进研究基金会（俄版DARPA）、国家技术倡议与国防部资助（Anthropic无法证实）。Anthropic表示蜂群未执行过实飞任务、系统停留在早期阶段并在仿真中验证。报告同时披露另一俄间谍组织（GTG-20006，行为与"午夜暴风雪"Midnight Blizzard一致）以乌克兰政府、军界与外交系统为目标，通过泄商务酒店WiFi发动CaptiveCrunch式攻击，并系统性窃取无人机供应链技术、逆向无人机视觉系统SDK。

**Source:** [Anthropic Catches Russians Using Claude to Code Self-Targeting Drones - DroneXL](https://dronexl.co/2026/09/12/anthropic-claude-russian-kamikaze-drone-swarm-software/)

### Elbit FUSE：以"Dominion-X"操作系统实现大批量无人系统"One2Many"协调

Elbit Systems旗下FUSE发布AI驱动的自主作战系统与One2Many作战能力，核心是其"Dominion-X"AI操作系统：在GNSS拒止环境下集中式实时协调大量空中与地面自主系统，支持平台间实时任务数据交换、分布式作战与分布式任务网络上的共享态势。域内包括：数字化无人战术部队（recon-strike mass operations）、PIRANI-X"搜寻-打击"战术蜂群无人机、面向城市/室内工事的URBAN LETHALITY SYSTEMS（批量UGV与单向攻击无人机）、装甲僚机（manned-unmanned teaming）、自主边境防御，以及X-intra/THOR/Magni-X家族与地面自主套件。数据背书扎实：累计超100万飞行小时与10万地面自主小时，已向全球客户交付数千架无人机与数百台无人地面平台，在以色列、美国与欧洲实战部署。FUSE CEO Eyal Dahan称，军事力量正进入"战斗力不仅取决于自主平台本身，更取决于能否在现役机动部队内实时集成、协调大量自主系统"的新作战时代。

**Source:** [Elbit Systems' FUSE Introduces Military-Grade Autonomous Systems Built for Scale - MilitaryLeak](https://militaryleak.com/2026/09/12/elbit-systems-fuse-introduces-military-grade-autonomous-systems-built-for-scale/)

### 乌克兰教官嵌入美军：173空降旅演习50%交战"先遇无人机"，美军野战条令加速改写

AP/ABC报道，约12名乌克兰军事人员抵达德国巴伐利亚，嵌入美军年度演习（Saber Junction，173空降旅主导、持续近四周）传授无人机与电子战战法。陆军训练单位指挥官Brig. Gen. Terry Tillis透露该部队配备1,900架无人机，全部代表"我们从乌克兰战事学到的'最新认知'"。最引人注目的数据来自陆军首席技术官Anthony Miller：演习期间173旅与假想敌的交战中，约50%以"先接触无人机"开场。乌克兰两年多前即创建全球首支独立"无人系统部队"（Unmanned Systems Forces），如今从侦察到打击、炮兵与无人机的协同已成为全军常态。陆军高层承认，各军种对"如何结构无人机战争部队——是把无人机附加到步兵营，还是重塑建制"仍无定论；此前力推无人机实验的参谋长约两周前被下令叫停特种实验营，陆军部长亦已离职——这场"学乌克兰"的节奏又添了体制内的曲折。

**Source:** [Ukrainians embed with US forces during drills to teach the latest in drone warfare - ABC News](https://abcnews.com/US/wireStory/ukrainians-embed-us-forces-drills-germany-teach-latest-136386189)

## 分析 (Analysis)

Anthropic报告的震撼力不在技术细节，而在"成本曲线"。2024年需要国家项目才能完成的自主蜂群软件工程，2026年由一个九人规模的外包团队在几个月内用商业编码助手和租来的GPU做出来——虽然未验证实弹、仍停留在仿真与开发板阶段，但报告自己也承认，报告所述的各项能力"应被假设为任何有动机的行动者都可得"。这本质上是"杀伤链自主化"的技术扩散下限被击穿：空气动力学与飞控是廉价商品的FPV，昂贵且曾经稀缺的自主栈（目标识别、蜂群协调、末端接战决策）正在变成可购买的软件工程量。Anthropic用"地理封锁+信任与安全团队"守住了第一道闸口，但换个模型、压掉geo-fence，护栏厚度便取决于供应商的安全承诺。

Elbit FUSE的One2Many则在体系侧回答了同一问题的另一面：当自主系统数量从几十涨到成百上千，"单一操作员-单平台"的遥馈-指控已物理不可行，战斗力的本质变成"在弱GPS、强干扰环境下对一个蜂群做集中式状态管理与任务分配"。Dominion-X把它做成了产品化OS——接收方不是从头自研，而是拿到带作战记录的成熟操作系统。这与俄乌战场上传回的"AI+Starlink+空中侦察"协同模式互为镜像：防御方在挤压单个目标的成本（廉价蜂群），进攻方在推高单个操作员的控制面（One2Many），双方都把"感知-决策-执行"的闭环加速当作第一优先级。

美国陆军"学乌克兰"的路径则揭示了组织适应的延迟。50%交战"先遇无人机"意味着未来冲突的初始布势会由无人机侦察/打击节奏主导，但陆军仍在"专业无人机营vs建制分散集成"之间摇摆，且刚经历高层换血与实验单位叫停。乌克兰经验的核心却是"去中心化渗透"——几乎没有单位不用无人机，无人系统力量与炮兵、电子战叠成复合杀伤体系。美军把乌克兰教官嵌入演习是高效的知识转移，但真正难的是把"四点半经验的教训"转译成自己兵力结构与条令内的可复制机制。Miller的表态（"避免集中成一个无人机兵种"）暗示高层已倾向分散化，但距离体系成形仍隔着编制与训练的双重周期。

## 结论 (Conclusion)

从俄外包团队的Claude蜂群、Elbit的Dominion-X到美军嵌入乌克兰教官，本周三条新闻指向同一结论：AI与自主性正把无人机战争从"战术工具的军备竞赛"推向"系统架构的可替代性竞争"。杀伤链的软件化让进入门槛骤降，而反制与指控必须随之软件化、规模化、去中心化。对防务观察者，未来一个季度的观测点：Anthropic对GTG-27005的后续封禁与威胁情报共享、FUSE产品的首批国际订单、以及美军在高层更替后能否把演习所得固化为正式无人机战条令。