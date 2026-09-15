---
layout: post
title: "军事科技动态：五角大楼为AI辅助软件开发立法立规、机密AI负载月底前全面撤离Anthropic、DroneShield把高功率激光纳入反无人机开放体系"
date: 2026-09-15
author: "云原生观察"
source: "https://defensescoop.com/2026/09/14/pentagon-sets-procedures-for-ai-assisted-software-development/"
categories: [military]
tags: [military, pentagon, dod, ai-software, genai, anthropic, counter-uas, droneshield, directed-energy, laser]
---

过去24小时，国防科技领域释放出三条重量级信号：五角大楼正式签署"加速任务软件"（Accelerated Mission Software）指令，为AI辅助的软件开发立下可追溯、可审计的明确规程，要求任何使用AI生成或测试的软件都要建立类比SBOM的"模型档案"；美国国防部机密AI工作负载已约九成完成从Anthropic的迁移，目标在10月前全部撤离，开放权重模型在高敏感环节赢得"信任战"；反无人机领域，DroneShield把AIM Defence的Fractl高功率激光纳入其开放式反无人机架构，软杀伤与硬摧毁的层次化防御格局进一步清晰。

## 主要新闻 (Main News)

### 五角大楼发布"加速任务软件"指令：AI辅助开发须留痕可溯

根据DefenseScoop的报道，美国国防部首席信息官（CIO）Kirsten Davies于8月31日签署了《Accelerated Mission Software》指令，9月8日正式生效，为使用GenAI（生成式AI）辅助软件开发、测试与部署的工作建立了程序性规范。核心要求在于"可追溯性"：任何利用AI模型生成的软件或其测试环节，都必须保留模型版本、所用数据集、生成时间线等信息，作为"综合软件证据包"的一部分——其设计思路明确类比于软件物料清单（SBOM）。此外，指令要求开发者检测并在交付前标记AI生成的代码与数据中的"非预期偏见"，对生成代码的文件格式与AI工具记录提出留存要求。此举的背景，是国防生态内GenAI使用量的指数级增长之下，对敏感信息泄露与被篡改代码入侵双重风险的担忧：五角大楼希望在保住"AI提效"的同时，不让"黑盒生成"成为供应链里的不可审计漏洞。

**Source:** [Pentagon Sets Procedures for AI-Assisted Software Development](https://defensescoop.com/2026/09/14/pentagon-sets-procedures-for-ai-assisted-software-development/)

### 机密AI负载约九成撤离Anthropic，开放权重模型赢得"信任战"

9月中旬披露的计划表显示，美国国防部对Anthropic的"去依赖"进程接近尾声：按9月11日DefenseScoop的报道口径，DOD计划在10月前把机密级AI工作负载全部从其平台上迁出；而9月14日的后续报道显示，迁移已完成约90%，余量将在本月底前收尾。此前，DOD于2026年初将Anthropic认定为国家安全供应链风险，缘由是该公司拒绝为"任何合法用途"提供无限制的模型访问，这与此前国防部与OpenAI达成的类似协议形成对照。同一波收缩也波及更广：Nvidia、Palantir与Booz Allen等主承包商都在限制或替换对Anthropic的使用，行业观察普遍认为，开放权重（open-weight）模型在高敏感、可自审计环境中正赢得"信任战争"，Nvidia主导的"Open Secure AI Alliance"也成为开放生态加速的注脚。对国防客户而言，"是否能完整审计"已取代"模型是否最强"，成为采购的首要问题。

**Source:** [DOD Poised to Move Classified AI Workloads Off Anthropic by October](https://defensescoop.com/2026/09/11/dod-poised-to-move-all-classified-ai-workloads-off-anthropic-by-october)

### DroneShield×AIM Defence：Fractl高功率激光进入反无人机开放架构

DroneShield在9月中旬宣布将其开放式反无人机（counter-drone）架构进一步扩展，正式把AIM Defence的Fractl高功率激光纳入作战末端——这意味着其DroneSentry作战平台所固有的C2（指挥控制）、电子战与多传感套件，可以向Fractl提供目标指示与作战协同，形成"射频侦察→软杀伤干扰→激光硬摧毁"的分层拦截链。DroneShield CTO Angus Harris表示，开放架构的价值在于让不同厂商的功能件像乐高一样组合，用户可按威胁等级弹性配置；AIM Defence联合创始人兼副总裁Jenelle Frewen则强调，Fractl是目前少数已实战部署的反无人机定向能激光之一，并正在向多个国家出口。此次“传感器网络＋高功率激光”整合，被业界视为反无人机市场从"单件装备竞标"走向"开放生态协同"的重要转折，也把成本议题推向台面——激光单发成本远低于拦截导弹，但这个“按次收费等价物”能否被军方采购体制接受，仍待观察。

**Source:** [DroneShield Expands Open Counter-Drone Architecture with AIM Defence's Fractl Laser](https://www.australiandefence.com.au/news/droneshield-expands-open-counter-drone-architecture-with-fractl-laser)

## 分析 (Analysis)

把本周三条国防科技消息放在一起看，一条主线清晰浮现：国防采购与研发正在从"追求峰值性能"转向"追求可审计的确定性"。五角大楼把AI辅助开发纳入"证据包"与SBOM式档案，是对"模型即供应商"这个新现实的制度化回应——代码是由谁、用什么模型、用什么数据生成的，必须像供应给军队的每一颗螺栓一样留痕。这与DOD撤出Anthropic的决策在逻辑上完全一致：不可审计=不可使用，开放权重模型正是因为"可自建、可验算、可复现"才在中枢环节胜出。可以预期，这种"可审计性优先"的原则会继续向国防AI供应链上游传导，影响模型选型与云服务采购的格局。

反无人机领域则展示了另一类确定性：功能件标准化。DroneSentry平台＋Fractl激光的开放整合，本质是国防市场复制软件业界"插件生态"逻辑的尝试——通过开放接口解耦感知、干扰与击杀环节，让威胁应对的组合随时可升级。对中小型国防科技公司而言，这是窗口期：只要能提供某个环节的"插件化能力"，就有机会进入体系，而不必承担整套系统集成的成本。对潜在对手而言，这意味着"无人机蜂群"失效的门槛在系统性抬升——从单一装备对抗变成体系对抗。

## 结论 (Conclusion)

本周军事科技的主题是"可信与可组合"：五角大楼用指令给AI开发装上"留痕"闸门，国防部用迁移为"可审计模型"投票，DroneShield用开放架构让硬杀伤与软杀伤按需拼接。未来数月可重点跟踪：AI辅助开发的证据包会否成为国防软件采购的强制项，以及开放权重模型在机密环节的渗透率能否真正取代封闭模型。