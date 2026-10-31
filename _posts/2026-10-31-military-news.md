---
layout: post
title: "军事应用动态：协同自主飞行、无人僚机测试与舰载无人直升机自主化"
date: 2026-10-31
author: "云原生观察"
source: "https://www.militaryaerospace.com/uncrewed/article/55415405/honeywell-shield-ai-demonstrate-coordinated-autonomous-aircraft"
categories:
  - military
tags:
  - autonomous-systems
  - drone-swarm
  - shield-ai
  - xq-67a
  - defense
---

# 军事应用动态：协同自主飞行、无人僚机测试与舰载无人直升机自主化

本周军事自主系统领域出现多项实质性进展：Honeywell与Shield AI完成两架飞机的协同ISR演示，其中一架发现目标后由另一架自主导航、投放载荷并返航；美国空军在XQ-67A上测试新的自主任务系统、传感器和超视距通信；Leonardo选择Shield AI的Hivemind SDK为Royal Navy的Proteus无人直升机开发反潜、ISR和 contested logistics 能力。自主软件正在从单平台演示走向多平台协同与有人-无人编组。

## 主要新闻

### Honeywell与Shield AI完成协同自主飞行演示

Honeywell Aerospace与Shield AI完成两次自主飞行演示，最后一次在10月8日于凤凰城附近进行协同情报、监视与侦察（ISR）任务。演示使用Shield AI的Hivemind Enterprise自主平台：一架侦察机用机载相机和Honeywell AI模型探测、识别并跟踪目标，Hivemind把目标位置 relay 给第二架飞机，后者自主导航至目标、投放载荷，并与侦察机一起返回基地。两架飞机均搭载Honeywell o480惯性导航系统。Honeywell工程师约用三个月开发并部署目标检测与跟踪模型，在明尼苏达和亚利桑那完成仿真与飞行测试。Shield AI称Hivemind已在40多个平台上使用，包括F-16、喷气式无人机、直升机、无人水面艇、地面车辆和低轨卫星。

**Source:** [Honeywell, Shield AI demonstrate coordinated autonomous aircraft](https://www.militaryaerospace.com/uncrewed/article/55415405/honeywell-shield-ai-demonstrate-coordinated-autonomous-aircraft)

### 美国空军在XQ-67A上测试新型自主任务系统

美国空军研究实验室（AFRL）与空战司令部实验作战单位在内华达测试与训练靶场，用XQ-67A实验无人机测试新的自主任务系统。该机携带新传感器、任务计算机，以及为新增设备升级的电气和冷却系统，并测试了超视距通信，使无人机在超出直接无线电链路范围时仍能交换信息。AFRL还把XQ-67A接入 live、virtual、constructive 仿真环境，让真实飞机与模拟飞机和威胁交互，以更低成本验证自主系统在复杂作战场景中收集、处理和共享信息的能力。XQ-67A仍是技术验证平台，而计划服役的FQ-42A才是具备内置弹舱和低可探测特征的无人战斗机。

**Source:** [US Air Force tests new autonomous mission systems on XQ-67A](https://www.airdatanews.com/us-air-force-tests-new-autonomous-mission-systems-on-xq-67-a/)

### Leonardo选择Shield AI Hivemind开发Proteus无人直升机自主能力

Shield AI于10月29日宣布，Leonardo将使用Hivemind软件开发套件，为Proteus无人垂直起降旋翼机开发新的自主能力，重点覆盖反潜战（ASW）、情报监视侦察（ISR）和 contested logistics。Proteus由Leonardo与Royal Navy、UK Defence Innovation合作，在Rotary Wing Uncrewed Air System（RWUAS）项目下研制，可携带约一吨载荷或两个北约463L标准托盘，已于2026年1月16日在英国康沃尔完成首飞，首飞使用的是Leonardo自主开发的自主能力。Hivemind将用于进一步发展这些能力。Shield AI表示，合作方可以开发、集成、测试、部署并持续更新自己的自主飞行员，并拥有其构建的任务自主软件。

**Source:** [Leonardo selects Shield to further its rotary-wing autonomy development](https://shield.ai/leonardo-selects-shield-to-further-its-rotary-wing-autonomy-development/)

## 分析

这三条新闻的共同主题是“自主软件的平台化”。Honeywell与Shield AI的演示表明，自主能力不再局限于单机飞行控制，而是扩展到多机任务分配、目标信息 relay 和载荷投放。Hivemind作为跨平台的自主软件层，让不同厂商的飞机、传感器和任务模型可以在同一框架下协同。对国防承包商而言，这意味着竞争焦点从“造出更好的飞行器”转向“谁能提供可移植、可更新、可认证的自主栈”。但平台化也带来锁定风险：如果核心自主层由少数供应商掌握，军方在升级、审计和盟国合作上可能受制于人。

XQ-67A的测试则展示了无人僚机与有人-无人编组的工程路径。新传感器、任务计算机、冷却与供电升级、超视距通信，以及 live-virtual-constructive 仿真，都是把自主系统从实验室推向复杂作战环境的关键环节。仿真环境让真实飞机与模拟威胁交互，可以降低试飞成本和风险，但也对仿真可信度、数据链安全和跨域互操作提出更高要求。未来协同作战飞机（CCA）的竞争力，不仅取决于平台性能，更取决于软件迭代速度、开放架构和与现有指挥控制体系的融合能力。

Proteus项目说明海上自主系统正在向高价值任务延伸。反潜战和 contested logistics 都是高风险、长航时、对传感器融合和自主决策要求很高的任务；无人直升机可以避免让有人机组进入危险区域，同时携带约一吨载荷或两个北约标准托盘，具备一定的后勤价值。Leonardo保留任务自主软件的所有权，Shield AI提供SDK，这种“核心 autonomy 引擎+伙伴自研任务层”的模式，可能成为欧洲防务承包商与美国自主软件公司合作的常见结构。真正的挑战在于适航认证、交战规则、人在回路中的权限边界，以及在电子战和通信受限环境下的可靠性。

从云原生视角看，军事自主系统的软件架构正在借鉴民用云原生实践：容器化任务负载、边缘计算、持续交付、遥测与可观测性、零信任身份和仿真测试。但军事场景对延迟、断网自治、抗干扰和安全认证的要求远高于民用系统，不能简单照搬公有云方案。未来值得关注的是：Shield AI与Honeywell、Leonardo的合作能否进入实际型号项目；XQ-67A验证的技术有多少会迁移到FQ-42A；以及Royal Navy对Proteus的后续试验和采购决策。自主系统的竞争，最终会落在软件更新速度、跨平台互操作和作战可信度上。

## 结论

本周的军事自主系统新闻显示，竞争正从单机 autonomy 演示转向多平台协同、有人-无人编组和海上高价值任务。Honeywell与Shield AI验证了协同ISR的可行性，XQ-67A推进了无人僚机的任务系统与仿真验证，Leonardo则把Hivemind引入舰载无人直升机。对从业者而言，真正的分水岭不是一次演示成功，而是能否建立开放、可认证、可持续更新的自主软件体系，并在电子战与 contested 环境中保持可靠。
