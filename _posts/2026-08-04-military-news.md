---
layout: post
title: "乌克兰5万架Shrike无人机获AI自主瞄准，法国AI引导拦截弹对抗Shahed，美国空军寻求廉价MQ-9替代方案"
date: 2026-08-04
author: "云原生观察"
source: "https://arstechnica.com/ai/2026/08/ukraines-drones-get-ai-upgrades-for-kamikaze-strikes-future-swarm-attacks/"
categories:
  - military
tags:
  - drone
  - ai-targeting
  - ukraine
  - counter-uas
  - air-force
  - mma
  - swarm
  - edge-ai
---

# 乌克兰5万架Shrike无人机获AI自主瞄准，法国AI引导拦截弹对抗Shahed，美国空军寻求廉价MQ-9替代方案

本周军事AI与无人机领域呈现"进攻与防御并行进化"的图景。进攻端，乌克兰军队自7月中旬起开始接收由美国Auterion公司提供AI自主瞄准能力的5万架Shrike自杀式无人机，操作员只需将无人机飞抵目标区域后"拨动开关"，即可进入"发射后不管"的末端制导模式，且全程不依赖GPS；防御端，乌克兰"General Cherry"部队与法国Alta Ares签署协议，为反Shahed的Bullet拦截弹集成AI视觉制导；与此同时，美国空军正通过"大规模模块化飞行器"（MMA）计划，为MQ-9 Reaper寻求廉价、可消耗的替代方案，标志着美国也加入了这场以"低成本+AI自主"为核心的无人机战争叙事。

## 主要新闻

### Auterion与SkyFall交付5万架AI瞄准Shrike无人机：无GPS"发射后不管"

乌克兰军方自7月中旬起接收由美国Auterion与乌克兰SkyFall合作生产的5万架Shrike自杀式无人机。这批价值1亿美元、由德国资助（路透社报道）的无人机搭载Auterion的Skynode S打击套件：操作员将FPV无人机飞抵目标区域、在约半英里外圈定移动目标后"拨动开关"，机载AI便基于主摄像头视觉信息自动跟踪并实施末端制导攻击——完全不需要GPS，在俄军GPS干扰密集的战场上尤为关键。此前Shrike已击毁大量俄军装甲车、电子战系统与火炮，并据报击落两架俄Mi-28直升机（单机价值高达1,900万美元）。该打击套件基于一块价值18美元的Arm SoC，可通过软件更新扩展至"一人指挥、蜂群协同"模式——Auterion已在佛州Camp Blanding靶场演示过一名操作员指挥三架自主攻击无人机同时打击三个目标的能力。Auterion强调"人在目标选择环节"的保留原则，其长期愿景是为多厂商无人机打造类似"开源操作系统"的软件生态。

**Source:** [Ukraine's drones get AI upgrades for kamikaze strikes, future swarm attacks - Ars Technica](https://arstechnica.com/ai/2026/08/ukraines-drones-get-ai-upgrades-for-kamikaze-strikes-future-swarm-attacks/)
**Source:** [Auterion and SkyFall to ship 50,000 Shrike strike drones to Ukraine's front lines](https://auterion.com/auterion-and-skyfall-to-ship-50000-shrike-strike-drones-to-ukraines-front-lines/)

### 法国AI制导进入乌克兰：Bullet拦截弹将获Pixel Lock与Cyclop C2视觉制导

乌克兰"General Cherry"防务公司与法国Alta Ares于8月3日签署合作备忘录，为Bullet反Shahed拦截无人机集成两套AI制导方案：Pixel Lock负责末端飞行阶段的持续目标锁定，Cyclop C2负责全程飞行引导，两者均依靠计算机视觉与多传感器数据融合在GPS拒止环境下保持跟踪。Bullet拦截弹此前已部署于海面无人机用于保卫沿海城市，可在6公里高度、20公里射程内以310公里/小时速度拦截Shahed-136，已于去年12月获准列装。Alta Ares刚完成5,000万欧元A轮融资，并曾在2025年春季赢得北约滑翔与制导炸弹反制方案招标——俄军电子战通过干扰控制链路击败制导无人机，是拦截高速机动Shahed的核心难题，而"以视觉跟踪目标"恰恰绕开了这一软肋。乌克兰作战经验正在成为北约及其盟友AI制导技术"实战验证"的入口。

**Source:** [Ukrainian anti-Shahed Bullet drone to receive French AI guidance - Ukrainska Pravda](https://www.pravda.com.ua/eng/news/2026/08/03/8047073/)

### 美国空军寻求廉价MQ-9替代方案：'大规模模块化飞行器'瞄准可消耗机队

美国空军正通过国防创新单元（DIU）的"大规模模块化飞行器"（MMA）概念，为MQ-9 Reaper的持久ISR与打击任务寻找廉价、可消耗的替代方案。DIU的招标书直言："联军对超过3,000万美元的'精致'有人/无人机的依赖，面对用低成本防空能力构建分层防御的对手是不可持续的。"MMA设想一支可成群作战、即使部分被击落仍保持任务能力的无人机编队——成本定位介于高端弹药与小飞机之间，采用类似"协同作战飞机"（CCA）的竞争性采购流程，计划于今年年底前授予多份合同。此前在"Epic Fury"行动中被誉为"最有价值球员"的MQ-9 Reaper在对抗伊朗的行动中损失约30架，而新造MQ-9已停产、更大型的MQ-9B单价约3,000万美元——昂贵的"精致平台"损耗率已迫使美军转向"能承受损失"的机队哲学。General Atomics已表示将为MMA提供全新设计。

**Source:** [Air Force Seeks New Ideas for Cheap MQ-9 Alternatives by Year End - Air & Space Forces Magazine](https://www.airandspaceforces.com/air-force-seeks-new-ideas-for-cheap-mq-9-alternatives-by-year-end/)

### 印度空军直升机将配备微型导弹与AI识别系统反制巡飞弹

印度空军在SANKALP 2026研讨会上发布的手册显示，其计划为直升机装备专用微型导弹、AI威胁与目标识别系统，以反制低空飞行的"神风"无人机与巡飞弹——这一趋势正受到伊朗-美国与乌克兰-俄罗斯冲突的启示。计划包括：为电光/红外吊舱加入AI目标识别、前向20毫米机炮与机载射频/GPS干扰器，其中Solar Defence的"Bhargavastra"反蜂群无人机系统已在2.5公里射程上成功拦截无人机，并向三军演示。印度空军计划将此类反无人机能力部署于Apache或国产Prachand武装直升机，把反无人机作战从地面系统延伸到空中平台。

**Source:** [IAF plans to arm its helicopters with micro-missiles, AI-based identification systems to kill kamikaze drones - Times of India](https://timesofindia.indiatimes.com/defence/news/iaf-plans-to-arm-its-helicopters-with-micro-missiles-ai-based-identification-systems-to-kill-kamikaze-drones/articleshow/132836338.cms)

## 分析

本周军事新闻的核心信号是：低成本自主弹药正在改写无人机战争的单位经济与指挥结构，而世界各国正以不同的方式吸收乌克兰战场的经验。

第一，"廉价+AI末端制导"正在成为消耗战的标准武器形态。5万架Shrike的价值不在任何单一指标，而在其成本结构与可替换性：18美元的Arm SoC、以相机视觉替代GPS、操作员训练门槛大幅降低——这使乌克兰可以承受大规模损耗，同时让"用一万美元的无人机换两千万美元的直升机"成为现实。Auterion强调的"人在目标选择环节"（human in the loop）值得注意：这既是对自主武器伦理压力的回应，也暗示了作战效能的边界——AI负责末端跟踪与攻击执行，而价值判断仍留给人。这种"人在环"的自主分级，正在成为各国AI武器化的默认共识。

第二，反无人机作战的攻防竞赛进入"以AI对AI"阶段。Bullet拦截弹引入法国AI视觉制导、印度为直升机加装AI识别系统、Quantum Systems为Vector侦察机加装后视热成像+AI自动规避——这三者指向同一逻辑：当无人机之间的交战不再依赖无线电链路与GPS，电子战的传统优势被削弱，视觉认知与机载AI计算成为新的制胜维度。乌克兰战场的经验表明，这轮"无人机军备竞赛"的演化速度已经快到"采购周期追不上战场需求"的程度——Quantum Systems直言"乌克兰的作战环境变化快于采购周期"。

第三，美国正在经历从"精致平台"到"可消耗机队"的哲学转变。MMA计划与DIU招标书那句"对3,000万美元精致平台的依赖不可持续"是全周最直白的战略表述。这不仅是预算问题，更是作战概念的重构：MQ-9这类高价值平台按"少而精"设计，而MMA按"多而廉、能承受损失"设计。值得关注的是，美国没有照搬乌克兰的低成本FPV路径，而是试图建立"以AI自主架构为底座、以开放生态为扩展"的软件驱动机队——从CCA的竞争流程到"自主政府参考架构"，五角大楼押注的是软件与生态的标准化。这恰恰呼应了Auterion"为多厂商无人机构建开源操作系统"的野心：无人机战争的下一步竞争，可能是"共同操作系统"的争夺。

对关注国防科技与云原生的读者而言，本周还隐藏着一条技术线索：无论是Skynode S的端侧推理、Bullet的视觉制导，还是MMA的自主参考架构，其核心都是"边缘AI+实时数据处理"在严苛的无线/拒止环境下的部署——这正是边缘计算与自主系统交叉的前沿，也是云原生工具链（容器化推理、模型生命周期管理、空中升级）向国防应用延伸的通道。

## 结论

本周军事AI的主线是"低成本自主打击的扩散与反制的AI化"。乌克兰以5万架AI瞄准Shrike重新定义消耗战的单位经济，法国与印度以AI视觉制导强化反无人机体系，美国则以MMA计划正式拥抱"可消耗机队"哲学。三者共同指向一个判断：无人机战争的下一阶段，胜负手将从"谁能造出更精密的平台"转向"谁的能量产低成本自主弹药、谁能在电磁干扰下保持AI感知、谁能为异构机队建立标准化的软件与指挥架构"。对各国军队而言，乌克兰战场验证的"快速迭代+实战反馈"研发循环，正在成为比单一武器系统更宝贵的战略资产。
