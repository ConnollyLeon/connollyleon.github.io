---
layout: post
title: "军事AI与云基础设施：陆军加速软件认证、德军测试巡飞弹与国防技术主权之问"
date: 2026-11-23
author: "云原生观察"
source: "https://defensescoop.com/2026/11/20/army-project-gatekeeper-openai-gabe-chiulli/"
categories:
  - military
tags:
  - military
  - defense
  - ai
  - cloud
  - edge-computing
---

# 军事AI与云基础设施：陆军加速软件认证、德军测试巡飞弹与国防技术主权之问

过去一天的国防科技新闻围绕三条线索展开：美国陆军计划把OpenAI模型引入Project Gatekeeper，以压缩商业软件的认证周期；德国陆军在立陶宛首次战术测试巡飞弹与AI目标处理工具；北约与业界围绕战场云、数据分类和私营技术依赖展开"信任"辩论。与此同时，DISA价值216亿美元的JWCC UCM核心云采购于11月23日截标，把云原生能力的军事采购推到台前。

## 主要新闻

### 美国陆军拟与OpenAI合作加速软件认证

美国陆军代理首席信息官Gabe Chiulli在11月20日的AFCEA年度数据论坛上表示，陆军计划在Project Gatekeeper中分阶段引入商业AI模型，第一阶段与OpenAI合作，预计在下一季度落地。Gatekeeper旨在自动化传统的"运行授权"（ATO）流程——该流程往往耗时数月——让商业厂商把代码提交到陆军DevSecOps平台进行快速验证，获得"初始筛查通过"后进入IL5环境，从而向安全的陆军飞地分发产品。Chiulli正在与其他军种CIO推动认证互认，并计划通过Login.gov向更广泛的企业开放访问。他强调会要求厂商自带API密钥，使漏洞日志等敏感数据只由厂商自己可见，同时避免"为了用token而用token"的低效检查。

**Source:** [Army plans to work with OpenAI on Project Gatekeeper](https://defensescoop.com/2026/11/20/army-project-gatekeeper-openai-gabe-chiulli/)

### 德国陆军首次战术测试巡飞弹与AI目标工具

德国陆军11月22日在立陶宛Rudninkai训练场开始首次巡飞弹战术测试，这是德国在立陶宛最大规模军演"Freedom Shield"的一部分。军方观看了Helsing与Stark生产的巡飞弹携带惰性战斗部俯冲攻击主战坦克。数天前，德军还首次测试了Helsing的Clarity AI目标处理软件，该工具可快速处理卫星、无人机和其他传感器数据并推荐行动方案。德国陆军参谋长Christian Freuding称这类系统对现代战争不可或缺。到第2027年底，第45装甲旅将在当地满编，约5000名官兵和2000辆车辆，其中1800人已部署到位。

**Source:** [German army starts testing kamikaze drones and AI targeting tool](https://www.independent.co.uk/news/world/europe/lithuania-germany-russia-kamikaze-drones-b3089424.html)

### 国防AI的“技术主权”困境：信任比技术更稀缺

法新社在11月23日的报道中指出，军队与私营科技企业之间的关系正在成为国防数字化的核心矛盾：企业受资本与利润驱动，军队则受政治权威、等级与保密要求约束。以Starlink及其军用版本Starshield为例，乌克兰对相关服务的依赖暴露出商业平台可能带来的战略风险。在北约Izmir会议期间，多位官员强调问题不在技术本身，而在数据分类、访问边界与信任。北约网络与数字化转型主管Jean-Charles Ellermann-Kingombe直言："瓶颈往往不是技术，而是许可：分类边界、国家规则和信任决定。"一位美国企业代表则概括了务实立场："你不需要百分之百主权，但需要足够主权。"

**Source:** [Defence, AI, high tech: a delicate balance between armies and industry](https://www.thehindu.com/sci-tech/technology/defence-ai-high-tech-a-delicate-balance-between-armies-and-industry/article71733258.ece)

### JWCC UCM核心云采购今日截标，上限216亿美元

美国国防信息系统局（DISA）的联合战争云能力（JWCC）统一云市场核心采购于11月23日10时（中部时间）截标。该IDIQ合同上限为216亿美元，覆盖非密、秘密和绝密级别的基础设施、平台与软件即服务，并要求支持零信任架构、跨地域弹性，以及能在拒止、降级、间歇和受限带宽（DDIL）环境中运行的战术边缘设备。相关任务订单还要求把容器化应用迁移到Kubernetes管理的飞地，并在长达96小时的断连后实现无冲突数据库同步。

**Source:** [JWCC UCM Core Solicitation](https://www.sam.gov/opp/8f19b19a55c049068b34d48501221b65/view)

## 分析

软件认证正在成为国防AI落地的实际瓶颈。陆军以Gatekeeper把ATO从"数月人工审查"变成"平台化自动验证"，并引入OpenAI模型做代码扫描，逻辑与企业DevSecOps平台中的自动化合规检查一脉相承。值得注意的是Chiulli对成本与数据主意的克制：要求厂商自带API密钥、避免重复检查、强调跨军种互认。这说明军方已经意识到，AI引入流程本身也需要治理；如果扫描结果和漏洞日志被平台方留存，反而会形成新的信任障碍。对希望进入国防市场的软件厂商而言，未来的门槛不只是FedRAMP或IL5授权，还包括能否快速通过这种自动化的"绿色对勾"机制。

德国的测试显示，边缘AI正在从演示走向实战化训练。巡飞弹本身就是低成本、可消耗的平台，叠加AI目标识别与推荐能力后，对传感器到射手链路的时延提出更高要求。Helsing的Clarity处理卫星、无人机与地面传感器数据，本质上是一个在多源数据上运行的推理管道；它必须由人验证输出，再进入火力流程。这与云原生领域的"human-on-the-loop"模式高度相似：机器负责规模和速度，人保留最终决策权。第45装甲旅2027年在立陶宛满编，意味着这类能力将嵌入常设部队，而非临时试验。

法新社的报道则把技术议题提升到制度层面。军方需要企业创新速度，却不能把机密数据和作战连续性交到不受政治控制的商业实体手中；企业需要进入国防市场，却不愿被保密要求完全重塑产品。所谓"足够主权"是一个折中：通过合同、数据分类、专属密钥和可审计接口，在关键环节保持控制权，而不是追求全栈自研。对于云厂商和AI供应商，这意味着竞争焦点会从"性能最优"转向"能否证明自己可被信任"——包括第三方审计、退出计划和多区域连续性。

JWCC UCM的规模则说明，云原生技术栈已经成为军事采购的标准语言。Kubernetes管理的飞地、零信任、IL4至绝密级别的多域覆盖、DDIL下的自动同步，这些要求与大型企业的混合云架构并无本质不同，只是把可用性和安全门槛推到极端。能够获得这类合同的厂商，往往需要把FedRAMP、FIPS 140-3、硬件加固和边缘算力整合成一个可交付平台。可以预见，云原生工程技能在国防领域的需求将持续上升，同时供应商集中度也会提高。

## 结论

国防数字化的关键词正在从"平台"转向"信任链"。美国陆军用自动化认证缩短软件进入战场的路径，德国把AI目标处理纳入常态化演训，北约各国则在主权与商业创新之间寻找可验证的平衡点，而216亿美元的云采购把这些需求转化为具体的合同要求。对云原生从业者而言，这一领域提供的启示很直接：在高端场景中，可审计、可退出、可在断连环境下工作，比单纯的功能丰富更有价值。未来值得关注的，包括Gatekeeper的首批AI扫描结果、JWCC UCM的授标情况，以及欧洲巡飞弹与AI目标系统的后续列装节奏。
