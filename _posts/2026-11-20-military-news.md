---
layout: post
title: "军事应用：美国推进无人车队编排器与自主战争司令部，空军以AI重塑防空体系"
date: 2026-11-20
author: "云原生观察"
source: "https://www.war.gov/News/Releases/Release/Article/4655108/department-of-war-advances-orchestration-for-unmanned-vehicle-fleets/"
categories:
  - military
tags:
  - defense
  - autonomous-systems
  - drone-swarm
  - edge-computing
  - command-and-control
  - military
---

# 军事应用：美国推进无人车队编排器与自主战争司令部，空军以AI重塑防空体系

11月19日，美军自主化进程在软件、组织条令与数据治理三个层面同时推进：战争部推进自主车辆编排器（AVO），让单一操作员指挥跨域混合无人车队；国会研究处披露自主战争司令部（AUTOWARCOM）的筹建细节；空军发布Force Design 2026，把传感器、AI与自主系统置于防空现代化的核心；陆军则直指"数据管理"而非数据不足是战术AI的瓶颈。

## 主要新闻

### 战争部推进AVO：一名操作员编排跨域混合无人车队

美国战争部11月19日发布消息，推进自主车辆编排器（Autonomous Vehicle Orchestrator, AVO）软件开发项目：目标是用软件把非协同的无人系统整合为可协同的团队，让一名操作员跨域指挥混合无人车队。AVO挑战赛于2026年1月13日启动，评估重点是可扩展、与具体载具无关的技术，以及在实装测试中降低操作员负担、任务管理与态势理解的能力。项目官员称，AVO把操作员置于自主行动的中心，支持把低成本、可消耗的无人机大规模交付给作战部队；仅有平台不够，部队还需要把这些系统作为一体化力量来运用。挑战结果将在项目完成后公开。

**Source:** [Department of War Advances Orchestration for Unmanned Vehicle Fleets](https://www.war.gov/News/Releases/Release/Article/4655108/department-of-war-advances-orchestration-for-unmanned-vehicle-fleets/)

### 空军Force Design 2026：从单纯拦截转向早期探测与协同响应

TechRadar 11月19日报道，美国空军推出Force Design 2026，取代2024年10月发布的One Force Design：新框架把传感器、互联网络与人工智能置于防空现代化的核心，强调更早发现与跟踪威胁、协同响应，而非主要依赖拦截来袭飞机或无人机的武器。文件承认，新技术在带来能力的同时，也在威胁传统生成空中力量的方式，过去有效的系统在面对更精密的武器与互联防御网络时可能受限；重点是把自主能力、先进探测设备与指挥系统接入现有机平台，使各平台在通信与导航受阻时仍能协同。空军参谋长Wilsbach称这是一次重大转向，但大部分内容仍属机密。

**Source:** [US Air Force admits traditional airpower is facing threats it can't easily stop](https://www.techradar.com/pro/us-air-force-announces-new-focus-on-sensors-and-autonomous-warfare-with-drone-killing-kit-top-of-the-list)

### 国会研究处报告披露AUTOWARCOM筹建路径

USNI News 11月19日刊载国会研究处（CRS）11月18日报告：国防部长于9月30日指示无人系统直接报告组合经理牵头"Project Agincourt"，筹建由四星上将领导的功能性作战司令部AUTOWARCOM，目标于2027年10月1日成立，同时试点新的无人与自主系统采办模式。参议院版2027财年国防授权法案（S. 4784）包含授权设立机器人与自主系统功能性司令部的条款，众议院通过的版本（H.R. 8800）没有对应内容；众议院军委会主席Mike Rogers预测，该条款可能因"尚未成熟到可以写入法律"而在最终协商中被剔除。

**Source:** [Report to Congress on the Creation of an Autonomous Warfare Command](https://news.usni.org/2026/11/19/report-to-congress-on-the-creation-of-an-autonomous-warfare-command)

### 陆军：问题不在数据少，而在跨层级数据管理

Defense One 11月19日报道，驻波兰的"飞行捕手"（Project Flytrap）演习反复暴露一个缺口：作战单位、通信单位与司令部之间共享信息和决策的速度跟不上战场节奏。第2骑兵团前信号官、现卡内基梅隆大学研究生Gabriel Glazer上尉在AFCEA活动上表示，现有编制让基层指挥官几乎不可能以决策仍然有效的速度处理战场复杂性，AI有望缩短情报从一线传到师、军级司令部再分发到全军的链路。Anduril的NGC2项目经理Craven指出，即使有反辐射导弹预警，信息也要从情报部门传到作战部门、再传到通信营去实际调整电台配置，瓶颈"以人的速度"发生；L3Harris提出用AI感知频谱并在5G/6G信号中机动换频。

**Source:** [The Army wants its units to use more data, but many aren't built to do so](https://www.defenseone.com/technology/2026/11/army-wants-its-units-use-more-data-many-arent-built-do-so/417355/)

## 分析

这四条消息描述了自主战争的四个不同层次：AVO解决"谁来指挥一群无人平台"，Force Design 2026解决"用什么传感器和决策链发现并响应威胁"，AUTOWARCOM解决"由什么组织把各军种的自主能力变成联合作战体系"，陆军的反思则解决"数据如何在层级间流动"。它们共同说明，美军的重心已从采购更多无人机，转向构建调度、数据与标准构成的系统工程——这与云原生领域从"上容器"转向"平台工程"的演进路径高度相似。

AVO的关键词是"vehicle-agnostic"（与载具无关）和"non-collaborative"（非协同系统）。它试图在现有异构平台之上叠加一层编排软件，把原本各自为战的无人机纳入统一任务队列，这与Kubernetes屏蔽底层基础设施差异的思路如出一辙。难点在于实时性与容错：战场网络会被干扰、节点会失效，编排器必须在部分失联时仍保持任务一致性。这也解释了为何军方强调实装测试而非纸面评估。

AUTOWARCOM的推进则揭示组织变革的阻力。CRS报告显示，参众两院对是否把新司令部写入法律存在分歧，军委会主席甚至预测条款会被剔除；没有法定授权与专项预算，新司令部就难以在跨军种标准、采办权限和数据接口上形成强制力。另一篇同期评论文章主张，AUTOWARCOM应借鉴原联合部队司令部与特种作战司令部：中央统一技术标准与数据，边缘保留战区适配权。这种"标准集中、适应下沉"的架构，本质上与云平台控制面和数据面的分工逻辑一致。

对技术供应商而言，机会窗口不在单一平台，而在中间件：跨域C2数据标准、抗干扰通信下的状态同步、可验证的人机决策链路、以及对自主系统在拒绝/降级环境中的持续观测。陆军反馈尤其值得注意——当传感器已经足够多时，瓶颈是数据在层级间的流转与人工决策环节，而不是算力不足。任何声称能提升自主化水平的方案，都需要回答它能把"观察—判断—决策—行动"闭环压缩多少，以及压缩后由谁承担责任。

## 结论

11月19日的动态表明，军事自主化的下一阶段竞争围绕编排软件、联合标准与数据流转展开，而非单纯的平台数量。AVO与Force Design 2026验证了一体化编排和早期探测的方向，AUTOWARCOM的立法分歧则说明组织与预算仍是落地的硬约束。接下来值得跟踪的是FY2027国防授权法案的最终文本、AVO挑战结果的公开发布，以及陆军能否把战术级数据链问题转化为可规模化的工程方案。
