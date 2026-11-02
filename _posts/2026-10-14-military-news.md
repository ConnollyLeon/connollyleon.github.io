---
layout: post
title: "军事应用动态：Rownd推出自主无人机获千万美元国防合同、海军推进Flank Speed零信任云、陆军扩展AI Agent网络防御"
date: 2026-10-14
author: "云原生观察"
source: "https://rownd.ai/blog/rownd-launches-autonomous-drones"
categories:
  - military
tags:
  - military
  - defense
  - drones
  - edge-computing
  - zero-trust
  - kubernetes
  - ai-agents
  - cybersecurity
---
# 军事应用动态：Rownd推出自主无人机获千万美元国防合同、海军推进Flank Speed零信任云、陆军扩展AI Agent网络防御

过去24小时，军事技术领域在自主无人系统、云原生作战平台与AI网络防御三条线上同步推进。Rownd走出隐身模式，推出低成本、可消耗的自主无人机并宣布获得1000万美元国防部（Department of War）合同；美国海军通过DISA将Flank Speed云环境的工程任务授予Innovatus，强化零信任、容器加固与IL5环境下的AI/ML集成；陆军网络司令部（ARCYBER）宣布扩展AI Agent"劳动力"，并将在10月16日公布Project Griffin首批合同。这些动态显示，云原生与AI正从企业IT加速向作战与网络防御前沿渗透。

## 主要新闻

### Rownd推出自主无人机，获1000万美元国防部合同

Y Combinator支持的国防自主公司Rownd走出隐身模式，宣布推出其经济、可消耗（attritable）的自主无人机系统，并已获得1000万美元的国防部合同及其他合同，目标是"比对手迭代得更快"。其核心是一个将实战经验快速转化为软件、AI模型与硬件性能改进的运营框架：架构优先本地（onboard）处理与决策，使单机在通信中断、连续云连接不可用时仍能响应本地条件，并支持跨平台协作——即使群体被切断，Rownd的AI软件也能接管，让无人机之间在无集中地面控制的情况下相互通信。

2026年10月，Rownd在阿拉巴马州与空军人员进行了为期三天的演习，四旋翼完成41次飞行，包括4次移动飞行与4次AI机载的编队测试，并首次试飞无人机群体（同时升空最多3架）。团队每晚利用当日飞行数据重新训练计算机视觉模型，次日起飞前加载更新，显著提升了精度。Rownd由一名战斗老兵与前IBM员工创立，总部位于北卡罗来纳州罗利，飞行测试运营在威斯康星州Richfield。

**Source:** [Rownd Launches Economical, Autonomous Drones To Keep America Safe](https://rownd.ai/blog/rownd-launches-autonomous-drones)

### 海军将Flank Speed云工程任务授予Innovatus

美国国防信息系统局（DISA）将一项单一来源任务订单授予Innovatus，支持海军PAE Mission Systems的试点集成团队（PIT）。该工作被命名为"Accelerating to Flank Speed"，旨在将试点成功的软件能力过渡为在海军Flank Speed Azure云环境中的永久、安全运行。工作范围包括：软件集成与部署、零信任架构、身份与访问管理（ICAM）、容器加固、基础设施即代码（IaC），以及支持持续授权运营（cATO）流程；同时涉及在海军定制的Impact Level 5（IL5）环境中集成AI/ML能力。

海军认定Innovatus是唯一具备现有Flank Speed Azure架构专门知识、可在不造成不可接受延迟的情况下完成该工作的承包商，其理由是该承包商此前开发了该环境的基础组件，包括安全控制、身份管理框架与支撑基础设施。任务要求Innovatus交付技术文档、架构图与IaC仓库，以建立政府拥有的技术基线。Flank Speed是海军的IL5 Microsoft 365/Azure云环境，服务超过68万用户，已达成全部91项目标零信任活动，并支持企业到战术边缘的"Flank Speed Edge"（含Kubernetes at the edge、AI/ML实时决策、GitOps等）。

**Source:** [Navy awards Flank Speed pilot integration team (PIT) and cloud engineering task to Innovatus](https://orangeslices.ai/navy-awards-flank-speed-pilot-integration-team-pit-and-cloud-engineering-task-to-innovatus/)

### 陆军扩展AI Agent网络防御，Project Griffin首批合同将公布

在AUSA 2026大会上，陆军网络司令部（ARCYBER）指挥官Lt. Gen. Christopher Eubank表示，司令部正在打造一支可与人类"人机协同"每日工作的AI Agent"劳动力"，并已开始绘制整个AI Agent版图，将其应用于"运营与保护网络、防御网络、甚至攻击网络"的任务。陆军首席网络顾问Brandon Pugh透露，陆军准备在10月16日（周五）公布Project Griffin的首批合同，授予两家公司。Project Griffin旨在开发能自主检测网络恶意活动并响应的AI Agent，其核心系统为"智能响应与编排节点"（Intelligent Response and Orchestration Node），将作为网络防御自动化的中央决策组件。

Pugh表示，首批合同聚焦"采取行动"要素——即不仅自主检测潜在对手，还要在人类操作员设定的参数范围内自主响应。陆军8月发布商业解决方案征集（CSO），收到108份提交，先筛选至10家，最终选定2家。尽管合同即将授予，官员强调Agent不会立即在政府网络上工作，"人类是否准备好让Agent实际采取行动"仍需谨慎推进。

**Source:** [Army to take a (cautious) step toward employing AI agents to defend networks: Official](https://breakingdefense.com/2026/10/army-to-take-a-cautious-step-toward-employing-ai-agents-to-defend-networks-official/)

## 分析

本轮军事技术动态呈现出"自主化、云原生化、AI化"三线合流的清晰趋势。

首先，**边缘自主正成为无人机生存能力的决定性因素**。Rownd的架构选择极具代表性：优先本地处理与决策，在连续云连接不可用时由机载AI接管，让无人机群体在失去集中地面控制的情况下仍能协作。这与本周商业领域Palladyne AI的DECA（去中心化具身协作AI）、Mobilicom的SwarmiX群体Mesh一脉相承。其作战含义是：在强电子战与拒止环境中，依赖后方指挥链路或云端"大脑"的无人机群极易被切断；而"每架无人机都能感知、推理、行动，并通过Mesh共享信息"的去中心化模式，即使节点损失三分之一也能通过拓扑自愈维持协同。Rownd每晚用当日飞行数据重训模型、次日部署的迭代节奏，也反映了"数据驱动的持续改进"正被 militarized。

其次，**云原生平台正从企业IT延伸到作战与网络防御主干**。海军Flank Speed的工程任务明确包含容器加固、IaC、cATO、零信任与IL5环境下的AI集成——这些几乎就是企业级云原生平台工程的"军事版本"。值得关注的是Flank Speed Edge，它被描述为首个获批在战场部署的零信任混合云方案，提供"Kubernetes at the edge、AI/ML实时决策、GitOps从企业到边缘持续部署"等能力。这标志着Kubernetes已从"数据中心编排器"演变为"企业到战术边缘的统一底座"，在断连、受限带宽环境下承载云原生应用。DISA以单一来源授予Innovatus，理由是"唯一具备既有架构专门知识"，也暴露出国防云平台深度绑定带来的人才与供应商依赖风险。

第三，**"AI Agent防御"从概念走向采购，但节奏受制于信任**。陆军Project Griffin的定位非常明确：从"自主检测"（现有Panoptic Junction据称对网络恶意活动识别率近90%）迈向"自主响应"——在人类设定的参数内自主采取行动。这是从"辅助分析"到"授权行动"的质变，也是风险最高的跨越。官员坦承，人类数十年来一直是"打补丁、修问题的人"，要让Agent承担这项工作，必须解决"如何检查Agent的工作"这一新问题。这种谨慎是合理的：一旦AI Agent拥有网络响应权限，其误判、越权或自身被攻击的后果，可能比人类慢半拍更严重。Project Griffin采用108→10→2的筛选路径，也体现了"广泛征集、严格收敛"的采购思路。

第四，**"AI-first"国防转型正在多路径并进**。从战争部5月宣布与SpaceX、OpenAI、Google、NVIDIA、Microsoft、AWS、Oracle等八家前沿AI公司合作，在IL6/IL7网络上部署能力，到GenAI.mil平台已有超130万用户、部署数十万Agent，再到Laarmee的Agent网络防御，国防AI化正覆盖"企业办公、情报、作战、网络"多个层面。但同时也带来新的脆弱性：每个Agent都是潜在攻击面，每个云环境都是高价值目标。Rownd强调"即使群体失联、云连接不可用仍能自主"、海军强调"零信任与容器加固"，本质上都是对"高度互联但高度脆弱"的防御性回应。

## 结论

短期来看，**关注Project Griffin首批合同（10月16日）与Rownd合同的具体范围**。前者将揭示陆军"自主响应"参数的边界与人类审批机制；后者将检验"可消耗自主无人机"能否从演示走向列装。

中期来看，**"边缘Kubernetes + 零信任 + 机载AI"将成为战术云的默认架构**。海军Flank Speed Edge路线图（K8s at edge、GitOps、FinOps、AI/ML决策支持）为企业与国防技术团队提供了可参照的范式：把云原生平台一致地延伸到断连、受限环境。

长期来看，**自主系统的"信任与治理"将决定其部署速度**。无论无人机的"机载决策"，还是AI Agent的"自主网络响应"，核心瓶颈都不再是技术能否实现，而是人类是否有足够机制去信任、约束与审计自主系统。对于国防技术从业者与政策观察者，建议重点关注：1）Project Griffin的人类监督与责任机制设计；2）Flank Speed Edge在真实战术环境中的断连恢复与安全表现；3）机载AI在强受限算力平台上的推理效能与功耗平衡；4）自主系统在电子战与网络攻击下的生存能力评估标准。
