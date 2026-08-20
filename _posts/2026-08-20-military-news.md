---
layout: post
title: "军事应用动态：陆军NGC2 AI层选定与SOCOM去厂商锁定自主软件计划"
date: 2026-08-20
author: "云原生观察"
source: "https://breakingdefense.com/2026/08/striveworks-to-build-ai-layer-for-ngc2-at-corps-level-army-says/"
categories:
  - military
tags:
  - ngc2
  - mission-autonomy
  - cca
  - edge-computing
  - military-ai
---

# 军事应用动态：陆军NGC2 AI层选定与SOCOM去厂商锁定自主软件计划

美军本周在指挥控制与自主系统领域密集布局——陆军选定Striveworks为下一代指挥控制系统（NGC2）构建军级AI层，计划2027财年在太平洋方向部署；特种作战司令部（SOCOM）发布无人系统自主与互操作计划征询，明确要求避免"厂商锁定"；空军则测试了可全球快速部署的协同作战飞机便携式地面指挥站。从乌克兰归来的陆军通信军官同时警告，部队必须摆脱反恐战争时代的频谱思维定式。

## 主要新闻

### Striveworks为陆军NGC2构建军级AI层

美国陆军8月19日向Breaking Defense确认，总部位于奥斯汀的AI运营公司Striveworks将负责构建NGC2架构的基础AI层。此前6月，陆军已指定Anduril建立NGC2的数据层基线——被官员称为整个架构的地基，为上层软件和服务提供统一集成基础。Striveworks将提供模型注册、验证、部署和监控能力，其模型可将"数小时的参谋工作压缩至数秒"。NGC2原型已在第4步兵师和第25步兵师完成师级测试，2027财年将在驻刘易斯-麦科德联合基地、负责亚太方向的第1军进行野战部署和扩展。AI仓库机制使士兵开发的算法可供生态内所有单位使用，"让士兵以行业设计新AI能力的速度获取它们，而非等待数月或数年"。

**Source:** [Striveworks to build AI layer for NGC2 at corps level, Army says](https://breakingdefense.com/2026/08/striveworks-to-build-ai-layer-for-ngc2-at-corps-level-army-says/)

### SOCOM寻求去中心化自主软件，明确拒绝厂商锁定

SOCOM的特种作战数字应用项目执行办公室与SOFWERX创新中心于8月17日发布特别通告，为其无人系统自主与互操作（UxSAI）计划征集工业界、学术界和国家实验室方案，9月8日截止响应，12月进行最终遴选。通告直言传统垂直堆叠自主架构"受制于专有的、厂商锁定的软件体系，且在电磁 contested 环境中极易因通信被拒而失效"，寻求能无缝集成到CHAOS（协作异构自主作战软件）基线的去中心化协作任务自主方案——支持异构多平台多域无人系统的点对点协调、动态重规划和无集中指挥约束下的本地规划。关键要求是政府人员能够"自主"配置和维护该技术，避免对供应商的持续依赖。

**Source:** [SOCOM planning to test new mission autonomy software for unmanned systems program](https://defensescoop.com/2026/08/18/mission-autonomy-software-unmanned-systems-special-operations/)

### 空军测试协同作战飞机便携式地面指挥站

空军生命周期管理中心敏捷发展办公室8月13日披露，已在俄亥俄州斯普林菲尔德空中国民警卫队基地完成便携式指挥控制飞地（C2E）原型评估。C2E是可在全球任何地点——包括简陋环境——快速部署的地面指挥控制系统，用于指挥半自主协同作战飞机（CCA），与战斗机飞行员使用的软件分离，定位为"一系列网络上的应用套件，让合适的操作员以合适权限操控CCA"。评估验证了系统的机动性和足迹后，供应商又进行了软件运行演示。第二阶段原型即将启动，供应商将进一步展示云能力；选定系统将配属正在测试CCA的实验作战单元，直接控制量产型CCA。Anduril此前已演示其Menace-T双便携箱系统控制YFQ-44A的全流程。

**Source:** [Air Force Tests Portable Ground Stations for Commanding CCAs](https://www.airandspaceforces.com/air-force-portable-ground-stations-ccas/)

### 从乌克兰归来的信号军官：必须抛弃反恐战争频谱思维

DefenseScoop 8月19日报道，刚结束乌克兰支援任务近一年的陆军信号军官警告，部队仍需摆脱全球反恐战争（GWOT）时代的频谱思维。乌军每天产生超过600TB数据，无人机和传感器网络持续搜寻暴露的指挥所，战术单元的带宽需求远超商用传输能力，迫使部队依赖AI分析人力无法及时处理的信息洪流。"我们设备产生的每一个电磁特征、铺设的每一条线缆、每一根天线、甚至发电机的热量，都可能在几分钟内被对手探测并引导打击。"军官们透露，在近期NGC2原型测试中，士兵报告指挥所节点撤收速度远快于GWOT时代的"TOC宫殿"，但拆解仍需30分钟。陆军的"集成权"（Right to Integrate）倡议正试图解决商业前沿系统与遗留系统的互联互通问题。

**Source:** [Back from Ukraine support mission, Army signal officers say service still needs to shed old GWOT spectrum mindset](https://defensescoop.com/2026/08/19/back-from-ukraine-support-mission-army-signal-officers-spectrum-mindset/)

## 分析

NGC2的分层建设模式代表了军事软件现代化的方法论成熟：先以Anduril数据层统一战场数据的"地基"，再由Striveworks叠加模型注册、验证、部署、监控的AI能力层，最终形成类似云原生平台的分层架构。这种模式的价值在于解耦——数据层防止信息困于烟囱，AI层让最佳模型匹配正确数据，而模型仓库机制则引入了类似应用商店的能力分发模式。选择军级（而非师级）作为首个野战部署层级，且指向太平洋战区，说明陆军已意识到印太战场的地理跨度对指挥决策速度的要求与欧洲战场有本质差异。

SOCOM的UxSAI计划则把"去厂商锁定"从采购原则上升为作战需求。其逻辑链条清晰：传统垂直堆叠自主软件绑定单一供应商，在电磁 contested 环境中通信中断时即告瘫痪；而去中心化自主让无人系统具备点对点协调和本地规划能力，无需持续回传指挥链。要求政府"有机地"配置维护技术，实质是把软件主权从承包商手中收回——这与五角大楼整体上推动OTA合同、开放模块化平台的趋势一致。12月的最终遴选值得跟踪，因为它将检验"政府可控的开放式自主栈"是否真的能在商业方案面前保持竞争力。

便携式C2E与乌克兰频谱教训从两个方向指向同一结论：未来战场的指挥控制必须是分布式、低特征、可快速机动的。C2E让CCA控制能力跟随地面部队机动而非依赖固定设施或专用飞机；乌克兰经验则量化了代价——600TB/日的数据洪流、分钟级的"被发现即打击"时间窗、30分钟的指挥所撤收时间。两者共同印证了边缘计算和DDIL（断联、拒绝、降级、间歇、有限带宽）环境适应能力在军事云架构中的核心地位。

## 结论

本周动态揭示了美军军事AI基础设施的三条主线：分层解耦的平台化指挥控制（NGC2）、主权可控的开放式自主软件（UxSAI）以及前推至战术边缘的分布式指挥节点（C2E）。国防科技从业者应关注NGC2军级部署带来的集成机会与"集成权"倡议下的接口标准演进；无人系统开发商则需认真对待SOCOM释放的信号——无法证明去厂商锁定能力的方案将在下一轮采购中被边缘化。
