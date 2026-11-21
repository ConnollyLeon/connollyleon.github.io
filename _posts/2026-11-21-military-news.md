---
layout: post
title: "军事应用：美军推进无人系统编排与数据层重构，反无人机向边缘智能演进"
date: 2026-11-21
author: "云原生观察"
source: "https://www.executivegov.com/articles/dow-autonomous-vehicle-orchestrator-diu-prize-challenge-unmanned-fleets"
categories:
  - military
tags:
  - defense-tech
  - autonomous-systems
  - counter-uas
  - edge-computing
  - command-and-control
  - military
---

# 军事应用：美军推进无人系统编排与数据层重构，反无人机向边缘智能演进

过去24小时的国防技术新闻集中在“如何让大量无人系统真正可指挥、可理解、可生存”。美国战争部推进自主车辆编排器（AVO）奖金竞赛，陆军阐述NGC2以统一数据基础重塑指挥控制，Xtremis获合同开发频谱AI反无人机方案，Curtiss-Wright则把加密存储塞进小型无人机。四条新闻共同说明，军事优势正从单平台性能转向软件定义的数据、编排与边缘处理。

## 主要新闻

### 美国战争部推进自主车辆编排器奖金竞赛

美国战争部与国防创新单元（DIU）推进自主车辆编排器（Autonomous Vehicle Orchestrator，AVO）项目，奖金规模最高可达1亿美元。项目目标是让单个操作员通过通用界面指挥跨空中、地面、海上等多域的无人载具，而不必逐个平台单独控制；操作员可用自然语言描述任务意图，系统再分解为具体动作并适配不同载具。AVO源自2026年1月13日启动的AVO Challenge，强调车辆无关、可扩展，并与陆军Project Agincourt等低成本可消耗无人机工作衔接。项目将通过冲刺开发和实兵测试迭代，重点降低操作员认知负担，在通信受限或高动态环境下为指挥官提供更多选项。

**Source:** [DOW Moves Ahead With Autonomous Vehicle Orchestrator Program](https://www.executivegov.com/articles/dow-autonomous-vehicle-orchestrator-diu-prize-challenge-unmanned-fleets)

### 陆军NGC2以“一个数据基础、多个应用层”重塑指挥控制

美国陆军正在通过下一代指挥控制（Next Generation Command and Control，NGC2）把分散的作战系统重构为统一数据层加可组合应用层的架构。项目负责人强调，目标不是再建一个单体指挥系统，而是让数据在边缘、云端和战术节点间持续流动，使不同应用共享同一事实源，并通过开放接口快速替换或新增能力。NGC2已在第25步兵师及相关演习中验证，包括Lightning Surge 3和4；生态中有60多家企业与机构参与，涉及AWS Wickr、Raft、Rune TyrOS等组件。陆军官员同时强调，AI只作为决策辅助，最终杀伤决策仍由人类作出；模块化开放系统方法（MOSA）是避免供应商锁定的关键。

**Source:** [One data foundation and many application layers drive the Army's NGC2 transformation](https://breakingdefense.com/2026/11/one-data-foundation-and-many-application-layers-drive-the-armys-ngc2-transformation/)

### 陆军选择Xtremis用变化射频信号探测无人机

美国陆军与Xtremis签署合同，开发其“AUGUR SHIELD”反无人机能力，重点利用无人机为规避传统探测而改变射频信号的行为特征。Xtremis的SpectrumOS平台把射频分析与电光/红外、雷达和声学传感器融合，并把算法压缩到紧凑的边缘计算设备上，以便在战术前沿快速给出告警与跟踪结果。相关能力面向战斗训练中心与南部边境场景，目标是应对小型无人机在低空、复杂电磁环境中的饱和使用。该方法的核心不是依赖固定频段签名，而是识别异常频谱行为和意图线索。

**Source:** [US Army Taps Xtremis to Detect Drones Using Changing Radio Signals](https://thedefensepost.com/2026/11/20/us-army-xtremis-drone-detection/)

### Curtiss-Wright把加密任务数据存入小型无人机

Curtiss-Wright推出DTS1 Nano，一款面向Group 2和Group 3小型军用无人机的加固型网络化存储设备。设备体积不到31立方英寸、重量低于2.5磅，支持高速数据 ingest、加密存储和机载处理，并采用两层加密，按照NSA商业解决方案（CSfC）框架设计，相关批准组件预计2027年到位。DTS1 Nano还符合MIL-STD-810环境标准，目标是即使无人机丢失或被俘，任务数据也不被读取。该设备反映了小型平台从“只回传视频”转向“在本地保存、处理和保护数据”的趋势。

**Source:** [Curtiss-Wright's DTS1 Nano stores encrypted mission data on small military drones](https://www.dronenews.org/story/curtiss-wright-s-dts1-nano-stores-encrypted-mission-data-on-small-military-drones)

## 分析

AVO与NGC2解决的是同一问题的两端：前者要让操作员能够指挥大量异构无人平台，后者要让这些平台产生的数据能被不同应用一致理解。没有统一数据基础，多域编排只会把每个平台的控制界面堆在一起；没有编排层，统一数据也只能改善态势感知，无法快速转化为行动。把自然语言意图、车辆无关接口和通用数据模型结合起来，是美军从“平台中心”走向“网络中心”的关键一步。

这对软件架构有直接启示。战场系统与云原生平台一样，正在从单体应用转向数据层、服务层和边缘节点的组合。MOSA和开放接口相当于避免供应商锁定的API策略；DTS1 Nano的加密存储则相当于把零信任和静态数据保护下沉到最前沿设备。当无人系统可能被捕获、通信可能被干扰时，数据不能只在中心机房受保护，而必须在设备端就具备机密性和完整性。

反无人机领域的变化同样体现边缘智能的价值。传统频谱探测依赖已知签名，而Xtremis关注的是无人机改变频率、跳频或压制发射时的行为特征，并把多传感器融合压到边缘设备上。这类能力避免把所有原始传感器数据回传中心处理，从而降低延迟和带宽依赖。但频谱环境高度对抗，算法需要持续更新和验证；与AVO类似，真正的考验来自演习和真实电磁环境，而不是演示。

需要保持谨慎的是：AVO奖金规模不代表能力已成熟，NGC2目前仍在有限部队和演习中验证，Xtremis与Curtiss-Wright的合同也不等于立即形成战斗力。下一阶段应观察AVO冲刺评审结果、NGC2是否向更多旅级部队推广、反无人机算法在密集民用电磁环境中的误报率，以及加密组件何时完成NSA CSfC批准。

## 结论

今日军事科技新闻显示，无人化竞争正在进入“软件与数据主导”的阶段。谁能把多域载具编排、统一数据层、边缘感知和设备级加密连成闭环，谁就更可能在通信受限和强对抗环境中保持决策速度。对国防科技团队而言，开放架构、可验证的边缘AI和数据安全，已经与平台性能同等重要。
