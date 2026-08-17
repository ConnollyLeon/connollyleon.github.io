---
layout: post
title: "军事应用动态：Project Convergence无人机实战测试与JWCC云市场推进"
date: 2026-08-17
author: "云原生观察"
source: "https://defensescoop.com/2026/08/11/how-soldiers-wrestled-with-drones-in-the-mojave-desert/"
categories:
  - military
tags:
  - drones
  - jwcc
  - cloud-native
  - edge-computing
  - military-ai
---

# 军事应用动态：Project Convergence无人机实战测试与JWCC云市场推进

美军在莫哈维沙漠完成了Project Convergence Capstone 6大规模实战测试，8,500名士兵参与了下一代指挥控制系统原型和新型无人机系统的评估。同时，五角大楼JWCC Next（联合作战云能力继任者）推进至统一云市场阶段，构建三层云生态系统以支持AI、战术边缘和跨域操作。

## 主要新闻

### Project Convergence Capstone 6：无人机实战测试暴露关键挑战

8月11日，美军在国家训练中心完成了Project Convergence Capstone 6（PC-C6），来自第4步兵师的8,500名士兵参与了为期10天的实战测试。测试重点评估下一代指挥控制（NGC2）原型生态系统以及多款新型无人机系统。士兵测试了Neros Archer FPV无人机、Anduril Bolt-M和Teledyne FLIR Defense的Rogue 1等系统。

关键发现包括：（1）重量是最大制约因素——在已有Javelin、AT-4和弹药基础上增加无人机和配件使士兵负荷达到极限；（2）沙漠高温导致部分系统过热，士兵不得不使用冰水冷却的T恤覆盖硬件；（3）无人机有效飞行距离远低于厂商宣传距离，受空域共享、电磁干扰和地形限制；（4）Bolt-M的AI辅助目标识别需要操作员在目标价值和弹药消耗之间做出实时权衡。Anduril表示正在加速更新操作流程和硬件热管理解决方案。

**Source:** [How Soldiers Wrestled with Drones in the Mojave Desert](https://defensescoop.com/2026/08/11/how-soldiers-wrestled-with-drones-in-the-mojave-desert/)

### JWCC Next推进至统一云市场，构建三层云生态系统

五角大楼的JWCC Next已演进为"联合作战云统一市场"（UCM），Draft Performance of Work Statement于5月发布。新架构分为三层：第一层为超大规模云服务提供商（AWS、Azure、Google Cloud、Oracle）提供核心基础设施和平台服务；第二层为"一切即服务"（XaaS）能力，包括软件、平台和基础设施即服务；第三层面向商业创新者和小企业，提供满足国防部安全要求的云技术。DISA预计2027年开始授予合同。军用云市场预计从2026年的138.5亿美元增长至2031年的343.2亿美元，复合年增长率19.9%。

**Source:** [Pentagon's JWCC Follow-On Would Create Cloud Marketplace](https://defensescoop.com/2026/06/01/pentagon-jwcc-ucm-draft-performance-of-work-statement/)

### DIA人工智能主管构想"代理对代理"军事交互

国防部情报局（DIA）人工智能主管提出了"代理对代理"交互概念，设想AI代理之间自主通信和协作以支持军事操作。这一愿景与五角大楼将AI深度嵌入指挥控制系统的战略高度一致。陆军正在使用AI辅助条令编写，空军探索AI工具预测飞机故障，海军陆战队举办GenAI.mil黑客松活动。Salesforce获得了在国防部部署AI代理的新授权。这些发展共同指向一个趋势：军事AI正从辅助工具向自主操作核心发展。

**Source:** [DIA AI Chief Envisions 'Agent-to-Agents' Interactions](https://defensescoop.com/2026/08/13/dia-artificial-intelligence-agent-to-agents/)

## 分析

PC-C6的无人机测试揭示了军事云原生技术部署的核心矛盾：商业无人机技术正在快速成熟，但将它们集成到现有军事体系面临巨大的物理和后勤挑战。士兵在沙漠中携带120磅以上装备同时操作多款无人机的场景，暴露了"全副武装+无人机"负荷模型的根本问题。乌克兰的经验（静态阵地不需要频繁携行）与美军的远征需求存在本质差异。美军正在开发的NGC2生态系统试图通过统一数据层解决互操作性问题，但PC-C6的测试表明，硬件限制（过热、重量、连接性）可能比软件集成更具制约性。

JWCC统一市场的三层架构设计反映了五角大楼对云原生军事基础设施的战略思考。第一层确保超大规模提供商的核心能力，第二层引入XaaS创新，第三层向小企业和初创公司开放——这种结构与CNCF/Kubernetes生态系统的治理模式惊人相似。军事云市场19.9%的复合增长率和343亿美元的市场规模，将吸引越来越多的云原生技术提供商进入国防领域。

DIA的"代理对代理"愿景代表了军事AI最前沿的概念。但PC-C6的经验也提醒我们，AI代理在真实军事环境中的部署面临远超实验室的挑战：电磁干扰、热管理、连接可靠性和操作员培训都可能成为瓶颈。军事AI的成功不仅取决于算法能力，更取决于底层云原生基础设施的鲁棒性和可部署性。

## 结论

美军正在将云原生架构和AI技术深度嵌入军事操作，但PC-C6的实战测试表明，从概念到部署仍存在显著鸿沟。企业应关注：（1）JWCC统一市场第三层为中小型企业进入国防云市场提供的机会；（2）军事边缘计算和AI代理对云原生基础设施的具体需求；（3）无人机系统与云平台集成的标准化需求。
