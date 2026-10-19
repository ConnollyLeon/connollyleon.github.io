---
layout: post
title: "军事应用：五角大楼拟投500亿美元于自主系统、无人机批量订单落地与F-22指挥AI僚机试验"
date: 2026-10-19
author: "云原生观察"
source: "https://www.war.gov/News/News-Stories/Article/Article/4625816/hegseth-autonomous-warfare-command-has-always-been-end-state/"
categories:
  - military
tags:
  - defense
  - autonomy
  - drones
  - ai
  - edge-computing
  - pentagon
---
# 军事应用：五角大楼拟投500亿美元于自主系统、无人机批量订单落地与F-22指挥AI僚机试验

过去24小时，美国防务领域的自主化与边缘AI继续加速：国防部长Hegseth在AUSA年会上披露约500亿美元的和解资金拟投入自主与机器人系统生产，并宣布筹建四星级"自主作战司令部"；五角大楼"无人机主导"计划Gauntlet II首批超2.03亿美元订单曝光；空军则完成F-22飞行员在模拟空战中指挥自主YFQ-44A" Fury"无人机的试验。与此同时，云原生与边缘计算架构正持续渗入战场指挥系统的底层。

## 主要新闻

### 1. 五角大楼拟投500亿美元扩产自主系统，筹划四星级自主作战司令部

在10月14日AUSA年会Project Agincourt面板上，国防部长Pete Hegseth表示，五角大楼正寻求约500亿美元的和解（reconciliation）资金，一次性加速自主与机器人系统生产，目标是将自主武器库存从数千台提升至数百万台级别；该请求独立于FY2027预算中536亿美元的"无人机主导"（Drone Dominance）计划（其中169亿用于无人系统采购、144亿反无人机、135亿 contested logistics、45亿协作自主）。Hegseth同时确认，Project Agincourt是设立四星级"自主作战司令部"（Autonomous Warfare Command）的过渡步骤，该司令部计划于2027年10月1日成立，作为功能型作战司令部统一领导无人自主作战。陆军同日宣布成立未来与自主系统司令部（FASCOM），作为军种层面的整合机构。

**Source:** [Hegseth: Autonomous Warfare Command Has Always Been End State - U.S. Department of War](https://www.war.gov/News/News-Stories/Article/Article/4625816/hegseth-autonomous-warfare-command-has-always-been-end-state/)

### 2. Gauntlet II首批无人机订单超2.03亿美元，覆盖17,000架以上

GovConFeed报道，五角大楼已开始为"无人机主导"计划Gauntlet II竞赛支付首批订单：Neros获1亿美元、XTEND AI Robotics获4050万美元（6,000架STRIKER，单价6,750美元）、Orqa US获3800万美元（7,000架）、Swarm Defense至少2500万美元（4,000架Kiwi单向攻击无人机），已披露总额至少2.035亿美元、合计超17,000架。国防创新单元（DIU）按"纵深打击"与"近距离作战"两个任务领域排名供应商，国防部计划从该池采购约60,000架无人机，全计划到2027年采购超200,000架无人系统。同期，台湾Thunder Tiger宣布完成向美国防部交付1,520架FPV攻击无人机（约760万美元，经Blue UAS认证硬件与Auterion飞控，满足NDAA供应链审查要求）。

**Source:** [$203.5M+ in Drone Dominance Gauntlet II Orders: Neros $100M, XTEND $40.5M, Orqa $38M, Swarm $25M+ - GovConFeed](https://govconfeed.com/article/drone-dominance-gauntlet-ii-awards-neros-xtend-orqa-swarm-october-2026)

### 3. F-22飞行员指挥自主YFQ-44A无人机完成模拟空战试验

美国空军披露，一架F-22"猛禽"飞行员在模拟空战任务中向自主YFQ-44A" Fury"无人机下达战术指令，无人机将指令转化为自主飞行任务序列执行，展示了有人机指挥多架无人僚机的协同作战模式。该试验属协同作战飞机（CCA）计划的一部分，目标是让单架有人战机管理多名无人队友执行警戒、护屏与接战任务。官员强调，自主程度、武器授权、电子干扰下通信中断等安全与后勤问题仍有待解决，距中队列装尚有距离。空军部长Troy Meink表示，自主系统使部分战斗力投送成本降低5至10倍，首批自主战机从首飞到进入 Creech 基地实验作战单元仅用两年。

**Source:** [F-22 autonomous drone test shows pilot directing AI wingman - Talk With Tech](https://talkwithtech.com/f-22-pilot-commands-autonomous-drone-simulated-combat/)

## 分析

本轮防务新闻与云原生/边缘计算领域存在清晰的技术同构：

- **采购模式从"平台采办"转向"软件定义的快速迭代"。** NGC2的通用数据层（Anduril Lattice为基础，Palantir、Raft参与）本质上是一个战场级的"平台工程"实践：传感器、应用与武器通过统一数据层解耦接入，新能力无需重建底层架构即可上线——与Kubernetes CRD扩展控制面的逻辑如出一辙。Anduril的18亿美元合同选项与9家厂商9,360万美元的应用层合同分层，也类似云生态"底层平台+应用市场"的结构。
- **自主系统的规模化前提是机构改革而非单一技术。** 从DRPM-UxS、Project Agincourt、Task Force Easy到FASCOM与未来的四星司令部，五角大楼在一年内重构了自主系统的组织链路，说明瓶颈更多在采办流程与跨军种协同。500亿美元和解资金目前仍是需求信号而非可用拨款，但108份CSO投稿、60,000架Gauntlet II采购计划等已授出工作表明，批量廉价无人系统的"云原生式"快速迭代文化正在军工体系内复制。
- **边缘AI在DDIL环境下的架构选择与云原生同源。** webAI的1450万美元项目ARIA合同强调"去云化"、在士兵既有设备上运行并通过IDN组网，应对拒绝、降级、间断、有限（DDIL）链路——这正是边缘Kubernetes（K3s/KubeEdge类）与联邦推理场景的军用镜像：本地自治节点+链路恢复后同步，与云原生的离线优先设计一致。
- **人机协同的边界仍在摸索。** F-22试验与陆军Project Griffin（AI代理在规定参数内自主响应网络威胁，首批合同即将授予）都采取"人在环上"的渐进路径——代理可检测、可提案，但行动需人类授权或事后审核。这与民用云原生领域"AI推理、确定性控制器执行"的治理共识殊途同归。

未来6-12个月的关键观察点是：和解资金能否落地、Gauntlet II.5"轰炸机"类无人机招标节奏，以及2027年10月自主作战司令部正式成立后对各军种采办权的重新划分。

## 结论

五角大楼正在用组织重构+批量资金+快速竞赛三管齐下，把自主系统从"项目"变为"军种能力"。对技术观察者而言，其中最具借鉴意义的并非某型无人机，而是其架构思想：统一数据层解耦系统、边缘节点在断联下自治、代理提案而人类授权——这些原则与云原生生态过去十年的积累高度重合，也预示军民技术在边缘AI与自主系统上的持续双向流动。
