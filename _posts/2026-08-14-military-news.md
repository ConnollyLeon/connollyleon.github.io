---
layout: post
title: "军事科技动态：俄S-71巡航导弹发现Nvidia Jetson AI芯片、DISA公布JWCC统一云市场采购计划、洛克希德NetSense用5G网络探测无人机"
date: 2026-08-14
author: "云原生观察"
source: "https://www.tomshardware.com/tech-industry/artificial-intelligence/nvidia-jetson-chip-found-in-russian-cruise-missile-ukraine-claims-presence-in-s-71-monochrome-weapon-may-indicate-use-of-ai-tech"
categories:
  - military
tags:
  - nvidia-jetson
  - russia
  - ai-edge
  - disa
  - jwcc
  - cloud-computing
  - netsense
  - 5g
  - counter-uas
---

# 军事科技动态：俄S-71巡航导弹发现Nvidia Jetson AI芯片、DISA公布JWCC统一云市场采购计划、洛克希德NetSense用5G网络探测无人机

8月11日至14日，军事科技领域的三条新闻分别触及AI的进攻性应用、国防云采购格局与反无人机能力。乌克兰国防部情报总局（GUR）声称在俄军S-71"单色"巡航导弹中发现Nvidia Jetson Orin AI模块，暗示其具备自主末端制导能力；美国国防信息系统局（DISA）宣布将于8月24日发布下一代联合云能力合同（JWCC Unified Cloud Marketplace）的征集文件，把采购范围从四大超大规模云服务商扩展到中小企业；洛克希德·马丁则联合Verizon、Nvidia等演示了基于现有5G网络的无人机探测跟踪系统NetSense。三者叠加，勾勒出AI算力在攻防两端、以及国防云在采购端的双向演变。

## 主要新闻

### 俄S-71"单色"巡航导弹中发现Nvidia Jetson AI芯片

乌克兰国防部情报总局（GUR）周三声称，俄军新一代S-71"单色"（Monochrome）巡航导弹使用了配备Nvidia Jetson Orin模块的AI计算硬件。据Tom's Hardware与Militarnyi报道，导弹中发现的芯片标记为SNVUP6.MOP TE980M-A1，与Jetson Orin NX 8GB/16GB系统模组高度相似——这是一款车规级SoM，基于最多8核Arm Cortex-A78AE、集成1024 CUDA核与32个Tensor核的Ampere架构GPU（提供最高157稀疏INT8 TOPS的AI算力）、NVDLA引擎与视觉加速器，2023年起量产，据芯片标记推测该模组封装于2025年3月。Nvidia回应称Jetson Orin是面向学生、开发者与初创企业的消费级产品，"不在俄罗斯销售，也未按军用目的设计"，但承认二手模组可通过诸多经销商渠道流通，并表示若确认客户违反美国出口管制将采取适当行动。在S-71中，Orin NX可能作为光电感知计算平台（结合中国制造的光学模块），对图像进行实时识别并辅助末端制导。S-71M可搭载于Su-57战斗机或S-70"猎户座"无人机，射程约300公里，携带250公斤高爆弹。此前乌克兰情报机构已报告俄方在Shahed MS001自主无人机中使用Jetson Orin NX进行末端目标识别。该事件暴露了美国出口管制的一个结构盲区：受管制的是可训练模型的高端加速器，而能在本地运行AI模型的边缘硬件几乎不受限制。

**Source:** [Nvidia Jetson Chip Found in Russian Cruise Missile, Ukraine Claims (Tom's Hardware)](https://www.tomshardware.com/tech-industry/artificial-intelligence/nvidia-jetson-chip-found-in-russian-cruise-missile-ukraine-claims-presence-in-s-71-monochrome-weapon-may-indicate-use-of-ai-tech)

### DISA公布JWCC"统一云市场"：国防云采购从四大巨头扩展到中小企业

美国国防信息系统局（DISA）8月11日在月度采购公告中宣布，下一代联合云能力合同（JWCC）的征集文件将于8月24日发布，新版本名为"JWCC Unified Cloud Marketplace"（统一云市场）。现行JWCC是五角大楼向四大超大规模云服务商（AWS、Microsoft Azure、Google、Oracle）采购云服务的顶层合同，上限90亿美元——据Deltak数据，AWS迄今获得5.265亿美元任务订单居首，其后为Microsoft（2.21亿美元）、Oracle（7690万美元）与Google（3590万美元）。新合同将显著扩大采购范围并采用三层结构：第一层面向超大规模云服务商；第二层覆盖"一切即服务"，包括软件、平台及非超大规模基础设施；第三层专为DISA所称的"商业创新者与小企业"预留，使新兴公司与中小企业得以进入国防云生态。DISA尚未公布JWCC Unified Cloud Marketplace的预估合同额。

**Source:** [Pentagon to Solicit Entrants for Next Giant Cloud-Service Contract Vehicle (Defense One)](https://www.defenseone.com/defense-systems/2026/08/disa-sets-release-date-follow-cloud-solicitation/415345/)

### 洛克希德NetSense：用现有5G网络把无人机"看"出来

洛克希德·马丁8月12日宣布，联合Verizon、Nvidia、Keysight Technologies、ODC与旗下Astris AI，演示了NetSense"空域感知即服务"系统——在7月于迈阿密地区的实测中，该系统仅凭现有Verizon 5G网络频谱即可识别、跟踪与监控无人机。其原理是利用Nvidia AI Aerial平台与ODC的AI原生无线接入网（RAN）软件实时分析RF信号场扰动，AI解读无人机进入空域引起的电磁场变化，即使无人机自身不发送任何信号也能被探测，并预测其飞行轨迹、自动触发告警。整个链路基于商用现货（COTS）组件，无需新增专用传感器，可快速部署于体育场馆、电站、学校、医院与机场等关键设施，也可服务市、州与联邦政府客户。洛克希德技术与战略创新高级副总裁Sarah Hiza表示，"无人机日益廉价普及，空域感知技术必须快速演进以超越潜在威胁"。据行业报道，Verizon与洛克希德计划于2027年初开始商业化销售该感知能力，并将于今年晚些时候在美国大型活动上进行规模化实测。

**Source:** [Lockheed Martin, Verizon, Keysight, ODC and Astris AI Demonstrate Technology for Public Airspace Protection with NVIDIA Technology (Lockheed Martin)](https://news.lockheedmartin.com/2026-08-12-Lockheed-Martin,-Verizon,-Keysight,-ODC-and-Astris-AI-Demonstrate-Technology-for-Public-Airspace-Protection-with-NVIDIA-Technology)

## 分析

俄S-71导弹中的Nvidia Jetson芯片，是"边缘AI算力军用化"的一个标志性样本，也暴露了出口管制体系与AI技术现实之间的脱节。高端训练加速器（如H100、B200）受严格管制，但Jetson Orin NX这类能在设备本地运行AI推理的边缘SoM全球海量流通、不受出口限制——这意味着即便训练环节被卡住，任何国家都能通过公开市场获得"本地推理+自主决策"的算力底座。俄乌冲突已多次证明此类硬件会进入巡航导弹、自杀式无人机等平台，且俄方在供应链上日益依赖中间商与中国零部件。对政策制定者而言，问题正从"要不要管制AI"转向"如何管制已经无处不在的AI"。对防御技术团队而言，这意味着对手的威胁模型必须默认"边缘自主决策已可用"，针对干扰、欺骗与地理围栏的对抗手段将变得同等重要。

DISA的JWCC统一云市场则标志着国防云采购的结构性转向。现行JWCC由四大超大规模服务商主导，而新合同通过"三层结构"明确向第二层（一切即服务）与第三层（中小商业创新者）开放，实质是把国防云的"菜单"从IaaS扩展到SaaS、平台服务与新兴技术。这对国防工业的云原生采用是明确的利好信号：任务应用上云、AI/ML工作负载、零信任与数据治理都将获得更多供应商选择，竞争也将把采购成本进一步压低。值得注意的是，DISA选择"未公布预估合同额"，暗示规模可能显著超过现行90亿美元上限——国防云作为常青预算池的地位进一步巩固。

NetSense的深层含义在于，它把"传感"从专用硬件重新定义为"网络本身的感知能力"。传统反无人机系统依赖专用雷达或RF侦听设备，成本高、部署慢；而NetSense将现有5G网络、AI-RAN与商用手机基站转化为分布式传感网格，使"空域态势感知即服务"成为可能。这与DISA的云市场逻辑一脉相承——国防能力正越来越多地建立在商业基础设施之上，军事采购者采购的不再是"装备"，而是运行于民用网络与云平台之上的"能力即服务"。5G网络同时承担通信与感知，也预示6G时代"通信-感知一体化"将成为军民用融合网络的核心设计原则。

三条新闻合起来看，军事AI正沿着"算力边缘化、能力服务化、网络基础设施融合化"三条路径演进。对行业观察者而言，下一步应关注三件事：其一，美国是否会就Jetson类边缘AI硬件收紧出口规则，及Nvidia对第三方渠道的合规管控力度；其二，8月24日发布的JWCC统一云市场征集文件将如何界定第二、三层资格与安全基线，以及哪些新兴厂商有望入围；其三，NetSense在年底美国大型活动上的规模化实测结果，以及"感知即服务"模式能否推广到城市与关键基础设施防护。

## 结论

8月中旬的军事科技新闻显示，AI与云的攻防两面都在快速演进：进攻侧，俄罗斯将消费级Nvidia Jetson芯片用于巡航导弹自主制导，凸显边缘AI算力的不可管制性与威胁模型的新常态；采购侧，DISA以三层结构重构90亿美元级国防云合同，向非超大规模服务商与中小企业打开国防云生态；防御侧，洛克希德NetSense把5G网络转化为无人机感知网格，推动反无人机能力向"服务化、商用基础设施承载"转型。对从业者而言，建议持续跟踪边缘AI硬件出口政策的走向、JWCC统一云市场的征集细则，以及商业网络承载国防感知能力的规模化验证结果。
