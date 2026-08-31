---
layout: post
title: "军事应用动态：美军向DoDNet迁移与蜂群AI边缘作战加速"
date: 2026-08-31
author: "云原生观察"
source: "https://defensescoop.com/2026/08/28/combatant-command-it-migration-dodnet-disa/"
categories:
  - military
tags:
  - military-cloud
  - edge-computing
  - drone-swarm
  - AI
  - defense
---

# 军事应用动态：美军向DoDNet迁移与蜂群AI边缘作战加速

本周军事技术领域聚焦于美军计算基础设施的整合与自主作战能力的实战化。DISA发布新的行业征集通知，为将全部11个作战司令部约231,000名用户的遗留IT迁移至DoDNet做准备；与此同时，美国陆军在Fort Bragg验证了单兵操控21架小型无人机与4台大型自主车辆的"蜂群作战"能力，而法院则裁定五角大楼将Anthropic列为供应链风险的举措越权。云原生与自主化的交织，正在重塑现代战争形态。

## 主要新闻

### DISA推进作战司令部向DoDNet迁移

DISA于8月28日发布新的来源征集通知，准备将11个作战司令部约231,000名用户、200个站点的遗留通用IT服务迁移至统一的DoDNet环境。该迁移覆盖NIPRNet与SIPRNet，目标在2028财年末完成，强调零信任架构、身份凭据访问管理、基础设施即代码与自动化运行手册。行业提交截止为8月28日下午3点，凸显美军企业级云基础设施整合的迫切性。

**Source:** [DISA issues additional notice to industry for massive migration of combatant commands to DoDNet](https://defensescoop.com/2026/08/28/combatant-command-it-migration-dodnet-disa/)

### 美陆军"蜂群作战"成为新常态

美国陆军在Fort Bragg的Sandhills Project中验证了单兵可同时熟练操控21架小型无人机与4台大型自主车辆的蜂群能力，使用Bumblebee V2无人机与配备12口径霰弹枪炮塔的半自主福特F-250进行反无人机防御。这一由官兵与工业界直接协作推动的力量倍增战略，使小型单位能够执行复杂欺骗行动并显著降低人员风险，标志着机器对机器的战斗时代正式开启。

**Source:** [How Drone Swarm Tactics Are Becoming The New Norm For U.S. Soldiers](https://www.forbes.com/sites/zitaballingerfletcher/2026/08/25/how-drone-swarm-tactics-are-becoming-the-new-norm-for-us-soldiers/)

### 法院阻止五角大楼将Anthropic列为供应链风险

美国加州地方法院法官Rita Lin裁定，国防部长Pete Hegseth将Anthropic指定为国家安全供应链风险的决定"非法且毫无根据"，超越其权限，因为这是对该公司AI安全立场的报复。Anthropic此前拒绝让其Claude模型用于某些形式的美国监视与自主武器。59页判决为AI安全政策与军队采购能力之间的冲突设定了重要法律边界。

**Source:** [US Judge Blocks Pentagon Blacklisting Of Anthropic As A National Security Supply-Chain Risk](https://www.tekedia.com/us-judge-blocks-pentagon-blacklisting-of-anthropic-as-a-national-security-supply-chain-risk/)

### 印度DRDO推进本土多无人机编队技术

印度国防研究与发展组织（DRDO）在技术发展基金下启动"多无人机近距离编队飞行"项目，鼓励本土初创与中小企业在最恶劣战场环境下开发相对导航、机间通信、防碰撞与协同机动等核心技术。该举措被视为印度自主无人机编队/蜂群体系的重要技术基石，推动从"一人一机"向"一人监督多机"的作战模型演进。

**Source:** [DRDO Pushes Indigenous Multi-Drone Formation Technology Through Technology Development Fund](https://dharmakshethra.com/drdo-pushes-indigenous-multi-drone-formation-technology-through-technology-development-fund/)

## 分析

本周军事新闻揭示出两大并行趋势：美军持续推进统一的企业级云计算基础设施整合，同时将AI与自主系统推向战术前沿。DISA的DoDNet迁移意义深远——将过去各作战司令部独立运维的遗留IT整合为统一、零信任、具备统一用户体验的环境，本质上是云原生原则（基础设施即代码、自动化、标准化）在国家级军事网络的落地。这与美军此前的Olympus云、JWCC统一云市场、以及"从总部到战术边缘"的云战略一脉相承。

与此同时，蜂群作战的实战化标志着自主化从概念验证进入作战常态。陆军单兵操控21架无人机加4台大型车辆的能力，将力量倍增器直接交到个体作战人员手中。从Auterion在佛罗里达实现单操作员同时摧毁三个目标，到Fort Bragg的Sandhills验证，再到Pentagon的Swarm Forge与"炼狱"演示，美军明确地将"用廉价自主系统淹没战场"（Replicator哲学）确立为核心战略。印度DRDO的编队技术项目，则显示了其他国家追赶这一浪潮的努力。

边缘计算在这些动态中的角色日益关键。正如美军XVIII空降军所强调的，在D-DIL（被拒止、断开、间歇、受限）环境中，依赖向中央数据中心回传数据的集中式云架构会因通信截断而失效。将AI/ML推理推至自主微数据中心、车辆与无人机机载处理，配合模型压缩与量化，成为维持"决策优势"的关键。DoDNet的零信任架构、边缘节点与AI工作负载的整合，正是这一战略的技术骨架。

Anthropic的黑名单裁决则为军队与AI安全政策划定了新边界。法院裁定不能以国家安全为名报复企业在自主武器与监视问题上的安全立场，这不仅保护了Anthropic，也为其他AI开发商在谈判军方合同时提供了先例。但诚如分析所指，这一裁决并未解决自主武器与监视的根本政策分歧——随着美军加大AI投入并寻求接入最先进模型，开发方保留的限制权利与军队对"随时可用"的诉求之间的张力将持续。

对观察者而言，未来几个季度的关键指标包括：Swarm Forge的季度"炼狱"演示是否产出可部署的蜂群包、DoDNet迁移的执行进度、以及DoD在自主系统上13.4亿美元独立预算的落地效果。E边疆计算机与自主无人系统的深度结合，正在使"云原生战争"从口号演变为可操作的现实。

## 结论

本周军事动态表明，美军的现代化正由两条交织的轨道驱动：统一、零信任、边缘化与AI赋能的云基础设施；以及在战术前沿大规模部署自主蜂群系统。DoDNet迁移、蜂群作战的常态化和边缘计算的重要性，共同指向一个"机器协调、人类监督"的作战新范式。与此同时，法律对AI安全立场的保护提醒我们，自主化的推进必须与伦理、责任与控制权的讨论同步进行。未来战争的胜负手，将在"能否在断连的边缘环境中保持感知与行动"之间见分晓。
