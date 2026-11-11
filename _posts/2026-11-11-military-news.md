---
layout: post
title: "军事动态：多机协同自主飞行、北约反无人机采购与边缘AI传感器"
date: 2026-11-11
author: "云原生观察"
source: "https://interestingengineering.com/military/hivemind-coordinates-multiple-combat-drones"
categories:
  - military
tags:
  - autonomous-systems
  - collaborative-combat-aircraft
  - shield-ai
  - hivemind
  - nato
  - counter-uas
  - royal-navy
  - edge-ai
---

# 军事动态：多机协同自主飞行、北约反无人机采购与边缘AI传感器

11月上旬的军事技术新闻集中在“自主系统的编队化与商品化”：Shield AI让两架协同作战飞机以编队完成模拟超视距空战，北约推出反无人机装备市场以便成员国绕过冗长招标，英国皇家海军成立首支自主舰艇中队，比利时Phoenix AI则把反无人机视觉模型塞进不依赖云端的边缘盒子。四条新闻共同说明，自主系统的竞争正在从单平台性能转向软件协同、采购速度与边缘算力。

## 主要新闻

### Shield AI Hivemind完成双机协同与模拟超视距空战

Shield AI于11月9日宣布，两架FQ-44A Fury协同作战飞机（CCA）于10月26日在内华达测试与训练靶场，在人类操作员监督下以编队飞行并执行模拟超视距（BVR）空战战术。测试中，Hivemind自主软件负责编队机动、传感器协同与战术执行，飞行员保持指挥权；此前在10月8日，一名F-22飞行员已通过Hivemind直接指挥一架FQ-44A。Hivemind采用A-GRA开放架构，已集成到40多种无人系统中，使不同厂商的平台能够共享自主能力。Shield AI强调测试未使用实弹，并明确由人类对武器使用负责。美国空军计划到2032年拥有500架以上自主作战飞机，协同作战飞机是其中核心。

**Source:** [Shield's Hivemind flies multiple Air Force CCAs as a coordinated team for the first time](https://shield.ai/shields-hivemind-flies-multiple-air-force-ccas-as-a-coordinated-team-for-the-first-time)

### 北约推出反无人机装备市场，16种方案可直接采购

北约通信与信息局（NCIA）于11月5日推出“Counter-UAS Marketplace”，作为“Drone Edge”计划的一部分。该市场从五家公司——Alta Ares、Axon Enterprise、Northrop Grumman、OSL UK和Quantum Systems——选出16种反无人机解决方案，经过18个月评估，覆盖探测、识别、跟踪与拦截。北约成员国可以通过市场直接采购，无需再走单独招标流程。北约称这是“从需求到采购”的新路径，计划在未来五年投入40亿美元，并已在拉脱维亚的DiBaX 2026演习中用商业5G网络测试无人机探测与跟踪。Drone Edge于2026年7月在安卡拉峰会上提出，目标是建立覆盖陆海空的无人机与反无人机能力。同期“Crossed Swords 2026”网络演习中，红蓝双方都使用了AI智能体，OpenAI的Daybreak模型被用于模拟攻击与防御。

**Source:** [NATO launches counter-drone marketplace to speed procurement](https://www.army-technology.com/news/nato-c-uas-marketplace-procurement/)

### 英国皇家海军成立首支自主舰艇中队

英国皇家海军于11月5日在朴茨茅斯成立第一自主中队（1st Autonomous Squadron），11月9日对外公布。该中队约有180名人员，采用“两班制”保持持续作战能力，装备Kraken K3 Scout和Rattler无人水面艇，取代此前的Project Beehive。皇家海军称这是“混合海军”转型的一部分，未来四年将投入15亿英镑，用于自主系统、人员训练和基础设施。中队任务包括监视、打击、后勤支援和反无人机探测，部分无人艇将搭载Saab传感器。K3 Scout长约8.4米，有效载荷400公斤，可模块化换装；Rattler长约7.2米，强调高速与机动。海军表示，自主中队不是把有人舰艇简单无人化，而是用新的编制、维护和指挥流程，把无人系统嵌入日常作战。

**Source:** [Royal Navy commissions first autonomous squadron](https://www.naval-technology.com/news/royal-navy-autonomous-squadron/)

### Phoenix AI推出不依赖云端的边缘反无人机视觉系统

比利时Phoenix AI在布鲁塞尔BEDEX 2026上展示PAI Box边缘AI系统。该系统运行在NVIDIA嵌入式GPU上，所有推理在设备本地完成，不依赖云连接，也不回传遥测数据；官方称可探测20公里外的船只和2公里外的无人机。针对反无人机场景，PAI Box融合可见光与射频传感器，完成探测、分类、跟踪，并支持对低成本无人机蜂群的告警；系统可独立运行并向指挥节点推送警报。Phoenix AI强调其面向 maritime、港口、机场和关键基础设施，优势在于低带宽、低延迟和数据主权——现场不需要把视频流传到云端，也不会因通信中断而失效。

**Source:** [Belgian Phoenix AI develops edge AI cameras for autonomous counter-drone detection](https://www.armyrecognition.com/archives/archives-defense-exhibitions/2026-archives-news-defense-exhibitions/bedex-2026/belgian-phoenix-ai-develops-edge-ai-cameras-for-autonomous-counter-drone-detection)

## 分析

Shield AI的双机测试说明，协同作战飞机的关键不再是单机飞得多快，而是软件能否让多架飞机共享态势、分配目标并在通信受限时保持编队。Hivemind把自主能力从特定机体中解耦，通过A-GRA开放架构适配40多种平台，这与云原生“控制平面与执行平面分离”的思路高度相似：机体是执行器，自主软件是控制平面，未来可以通过OTA更新战术行为。10月8日F-22飞行员直接指挥CCA，则展示了“有人-无人编队”的过渡路径——短期内由有人机保留决策权，无人系统承担高风险侦察、诱饵与火力投射。真正的门槛在于测试、验证与责任链：模拟空战可以证明战术逻辑，但实弹使用、电子战干扰、通信拒止和误伤责任，仍需要更严格的认证。

北约反无人机市场的意义不在16种装备本身，而在于采购模式的改变。传统跨国装备采购动辄数年，而无人机与反无人机技术迭代以月计；市场机制让成员国在完成联合评估后直接下单，把“需求定义—评估—采购”压缩成可重复的流程。18个月评估、五家公司、16种方案、五年40亿美元，这些数字显示北约试图在标准化与多样性之间取得平衡：既不想锁定单一供应商，也不愿每个国家重复测试。DiBaX 2026用商业5G测试探测与跟踪，说明北约也在探索“商用基础设施+军事应用”的路径，这对云原生边缘计算、5G切片和零信任架构都是机会。但市场化采购也带来互操作与维护挑战：不同国家的装备如何共享目标数据、如何更新软件、如何避免供应链风险，需要统一的标准与认证。

皇家海军第一自主中队的成立，是组织创新而非单纯装备采购。180人、两班制、K3 Scout与Rattler混编，说明海军正在把无人艇当作需要持续维护、训练和指挥的“舰艇”来管理，而不是临时试验项目。15亿英镑四年投入，覆盖的不只是艇体，还包括人员、基地和保障体系。对云原生从业者而言，这对应的是“边缘集群”的运维问题：无人艇在海上可能长时间断网，软件更新必须安全可回滚，传感器数据要在本地处理，指挥链要在带宽受限时保持一致性。谁能把GitOps、零信任身份、模型生命周期管理和断点续传做成舰载标准能力，谁就能进入这个市场。

Phoenix AI的PAI Box则把“边缘AI”的经济学讲得很清楚：不传视频、不依赖云、不产生遥测，既降低带宽成本，也降低数据泄露风险。2公里无人机探测、20公里船只探测的参数针对的是港口与沿海基础设施的近距离防护，而不是广域防空；其价值在于低成本、可快速部署、可独立运行。这与北约市场中的低成本反无人机方案形成互补：高端系统负责区域防空，边缘盒子负责点状防护。技术上的关键挑战是模型在雨雾、逆光、夜间和蜂群场景下的误报率，以及如何在不回传原始数据的前提下完成模型更新与事件取证。

## 结论

四条新闻共同描绘了自主系统的下一阶段：软件定义协同、采购商品化、编制常态化、感知边缘化。短期应关注三个信号：Shield AI是否会在2027年进行实弹或电子战环境下的多机测试；北约市场能否在首批订单中证明“评估一次、多国采购”的效率；皇家海军自主中队能否在一年内形成可持续的作战值班能力。对产业界而言，机会不只在平台本身，更在使能层——开放自主架构、边缘算力、抗干扰通信、模型验证与供应链安全。谁能把这些能力做成可认证、可维护、可快速迭代的模块，谁就能在“混合战争”的基础设施竞赛中占据位置。
