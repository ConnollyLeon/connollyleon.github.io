---
layout: post
title: "金融科技动态：OCC落地GENIUS法案最终规则引爆稳定币收益之争、Starling 17秒反金融犯罪代理与Tether领投Mural 1500万美元"
date: 2026-10-22
author: "金融科技观察"
source: "https://www.coindesk.com/policy/2026/10/21/occ-s-final-rule-to-start-fresh-in-weighing-stablecoin-rewards-against-genius-act-ban"
categories:
  - fintech
tags:
  - stablecoin
  - genius-act
  - occ
  - agentic-finance
  - tether
  - payments
  - aml
  - fintech
---
# 金融科技动态：OCC落地GENIUS法案最终规则引爆稳定币收益之争、Starling 17秒反金融犯罪代理与Tether领投Mural 1500万美元

过去24小时，金融科技圈有四条消息同时落地。美国货币监理署（OCC）发布实施GENIUS法案的首个最终规则，最终规则与法案本身将于2027年1月18日同时生效，一场围绕"稳定币能否给收益"的拉锯战随即引爆银行业与加密行业的公开对立；英国数字银行Starling在Sibos 2026上宣布部署原生的智能体"金融犯罪调查员"，端到端完成一次调查仅需17秒；稳定币发行方Tether领投了AI支付基础设施初创公司Mural的1500万美元A轮，以切入"代理代付"这条新赛道。三条消息分别代表合规框架的确立、监管内AI的落地，以及支付执行层正在被智能体重构。

## 主要新闻

### 1. OCC发布GENIUS法案首个最终规则，放弃"可反驳推定"

CoinDesk（10月21日，作者Jesse Hamilton）报道，OCC——美国首家联邦银行监管机构——正式发布实施GENIUS法案的最终规则，为首个联邦层面的支付稳定币监管框架。规则覆盖OCC管辖下的"获准支付稳定币发行人"与"外国支付稳定币发行人"要求，以及OCC监管实体的部分托管活动，并涵盖OCC需要制定的全部GENIUS条例，唯独BSA、反洗钱与OFAC制裁部分被推迟至与财政部协调的后续规则制定中。OCC表示收到了来自加密企业、社区银行、行业协会与学术界的数百条意见。争议焦点在于收益：GENIUS法案禁止支付稳定币**发行人**以"仅因持有、使用或保留稳定币"为由支付利息或奖励，最终规则则删除了提案阶段关于第三方安排是否违法的"可反驳推定"（rebuttable presumption），改由OCC逐案评估，并强调"solely"一词具有决定性分量。已存在的奖励计划**没有**获得安全港，行业需逐一取得机构认可或接受逐案评估。美国银行家协会CEO Rob Nichols指责OCC"以某种方式削弱了国会（的立法意图）"，称相关条款威胁到银行用于放贷的资金；Blockchain Association则表示删除该推定使最终规则"更贴近法条文本"，为储备、赎回与风险管理提供了清晰标准。

**Source:** [OCC's final rule to start fresh in weighing stablecoin rewards against GENIUS Act ban - CoinDesk](https://www.coindesk.com/policy/2026/10/21/occ-s-final-rule-to-start-fresh-in-weighing-stablecoin-rewards-against-genius-act-ban)

### 2. 美国银行业协会公开指控OCC"架空国会"

The Block（10月21日，作者Sarah Wynn）报道，在OCC最终规则发布后，美国银行家协会（ABA）CEO Rob Nichols公开指责该机构未能贯彻国会意图。ABA称最终规则实际上保留了加密平台提供收益的能力，"尽管国会保护本地放贷的意图非常明确"；这些缺口"有可能侵蚀国会所划定的支付稳定币与传统银行存款之间的界线，威胁到银行用于发放、进而驱动美国经济的资金"。作为对照，Blockchain Association首席政策官Lindsay Fraser表示："OCC接过国会搭建的框架，给出了清晰的、可操作的标准。"TD Cowen华盛顿研究组董事总经理Jaret Seiberg则指出不确定性本身即是负面因素——"在法院作出裁决之前，什么被允许、什么被禁止都将存在模糊，这对银行是负面信号"，并警告若未来更换 Comptroller 采取不同解读，2028年将面临政治风险。争议的源头是GENIUS法案禁止**发行人**直接付息，但 Coinbase、PayPal、Kraken等**第三方平台**是否可向用户支付奖励，在上个月未能推进的CLARITY法案谈判中即成为核心分歧。The Hill同日报道，PayPal对PYUSD的实时收益率约4%、Coinbase One对USDC为3.75%、Kraken+对USDG最高4.5%；AP则对比指出Coinbase对USDC最高给到3.5%，而FDIC口径下的平均储蓄利率仅0.38%。

**Source:** [American Bankers Association accuses OCC of undermining Congress with final stablecoin rewards rule - The Block](https://www.theblock.co/news/regulation/2026-10-21-american-bankers-association-accuses-occ-undermining-congress-stablecoin-rewards-rule-421629)

### 3. Starling部署原生智能体"金融犯罪调查员"，17秒完成端到端调查

Finextra（10月21日，Sibos 2026现场报道）报道，英国数字银行Starling已部署智能体化的"金融犯罪调查员"。该代理从Starling的交易监控系统接收告警，随后自主开展调查、生成完整审计轨迹并给出处置决定——结案、升级，或向英国国家犯罪局（NCA）提交可疑活动报告（SAR），整个流程仅需17秒。其关键差异在于**原生性**：代理直接构建在Starling的核心银行引擎内部，而非通过外部集成接入；正如Starling首席客户与银行业务官Bernadette Smith所解释的那样，"因为它就在核心内部，Starling同时拥有数据与模型，可以获取实时遥测、历史行为模式与交易上下文——没有外部集成的延迟，也没有反复变更需求、外部成本与开发约束带来的持续困扰。"Smith进一步断言："金融犯罪合规的未来不是更大的分析师团队或更快的规则引擎——而是原生的AI智能体在毫秒级工作。"在反洗钱运营中，调查与文档记录占用了大部分成本，当告警量增长超过人员扩充速度时积压必然形成，智能体的一次性全流程处理正是针对这一点。Starling同时在与Nvidia（及Civo）合作训练交易型基础模型，使用150亿笔以上匿名化的Starling交易数据、在英国主权云中训练，计划2027年初投产，首个场景为欺诈检测，其后是覆盖约500万客户的Starling Assistant，最终目标是统一的"Starling Intelligence"层。

**Source:** [Starling build agentic fincrime investigator that takes 17 seconds - Finextra](https://www.finextra.com/newsarticle/48623/starling-build-agentic-fincrime-investigator-that-takes-17-seconds)

### 4. Tether领投Mural 1500万美元A轮，押注"代理代付"的执行层

CoinDesk（10月21日，作者Jamie Crawley）报道，稳定币发行方Tether领投了AI支付基础设施初创公司Mural的1500万美元A轮，North Island Ventures与既有投资方跟投，使这家纽约公司的累计融资达到2800万美元。Mural由前Palantir工程师创立，为金融科技公司提供横跨传统银行网络与区块链的账户、支付、身份核验与合规基础设施，已公开的客户包括薪资平台Deel与浏览器厂商Opera。这笔融资发生在金融科技公司探索"代理金融"（agentic finance）之际——即由AI系统代人发起并执行交易。Mural的基础设施允许企业设置交易限额、限定交易对手方，并为更大额支付要求额外审批，这正是应对自主软件动钱时的授权与问责问题。Tether首席执行官Paolo Ardoino表示："当智能体开始动钱时，与银行、支付网络和全世界仍在运行的合规系统之间的连接就变得至关重要。"

**Source:** [Tether leads $15 million funding round for AI-focused payment startup Mural - CoinDesk](https://www.coindesk.com/business/2026/10/21/tether-leads-usd15-million-series-a-for-ai-focused-payment-startup-mural)

## 分析

这四条消息拼合出的图景是：稳定币的**合规底座**刚刚落地，而**使用场景**正在被智能体重写，产业的重心正从"发行与储备"移向"支付执行与风控"：

- **GENIUS法案的第一次执法姿态选择了"留白"而非"划线"。** OCC最终规则最有意思的细节是它**删除**了提案阶段的"可反驳推定"——这套推定原本是为不愿逐案游说的发行方提供的一条确定性通道，如今被换成逐案评估。监管者选择这样做，通常意味着一是法律解释权暂时必须让渡给法院（正如TD Cowen所言，"在法院作出裁决之前"），二是存在不愿过早封死的产品形态。两种解释的共同后果是：**收益之争短期内不会收敛**。ABA指控OCC架空国会，Blockchain Association称规则更贴近法条，CLARITY法案上个月已经停滞——三股力量同时作用，结果是发行方在2027年1月18日之前都拿不到一张"我的奖励计划合规"的确定答案。对创业公司而言，这意味着产品路线仍需为"零收益"与"有收益"两种世界各准备一套方案；而对存续银行而言，存款利率与稳定币奖励之间的利差战并未被规则终止，只是被推迟。
- **智能体正在成为金融机构的"合规内嵌件"，而非外挂工具。** Starling的案例与通常的"金融科技接入大模型"叙事不同：代理被刻意做进核心银行引擎，让它天然拥有实时遥测与交易上下文。17秒这个数字之所以有冲击力，是因为反洗钱运营的真实瓶颈从来不是"查询速度"，而是**告警积压下的调查产能**——调查与文档记录占据了大部分人力成本。当告警量的增速超过团队规模的增速时，唯一的出路只有自动化或放行风险。这就是为什么"原生"成为卖点：外部集成带来的延迟与变更摩擦，恰恰是积压的放大器。需要留意的空白同样重要——Finextra报道明确列出尚未披露的项：模型提供方（第三方LLM还是自研）、人工复核的边界、告警量规模、误报率，以及调查耗时的前后对比数据。在监管机构眼里，尚未披露这些数据的"17秒"更像是营销材料而非合规证据。
- **支付执行层正在成为新的价值焦点，而发行方在向下游延伸。** Tether领投Mural，逻辑清晰：稳定币发行方过去五年的叙事集中在储备透明度、赎回机制与合规牌照——这些都是"上游"能力。但当智能体开始动钱，真正的稀缺品变成了**授权与问责**：交易限额、交易对手白名单、大额支付二次审批，以及这些动作在事后可被审计的证据链。Mural把这套东西同时架在银行网络与区块链上，等于承认未来两年最常见的支付形态是"智能体从混合账户网络中发起一笔链上或链下转账"。Tether作为投资方同时也是供应商，正在把"稳定币网络"推向"合规执行中枢"。这也是本轮周期与上一轮最大的差别：上一轮争夺的是入口（谁能接入卡网络），这一轮争夺的是"谁替智能体签字"。
- **三条线共同指向同一个结构性判断：金融科技的护城河正在从资产端迁移到编排端。** 从JPM Coin上以太坊、Mastercard的Stablecoin Security，到今天的OCC最终规则、Starling的内嵌智能体与Mural的授权层，可以看到一个共同结构：**价值正在从"谁的资产更合规"转移到"谁能把一次受监管的资金动作编排好"**。资产层的合规是一次性工程（牌照、储备、赎回），编排层的能力是持续性工程（身份、权限、限额、审计、跨网桥接）。Starling选择在核心内部构建而非外挂，Mural选择在两种网络之间做桥接而非只做一侧，两者都押注了同一件事：受监管的资金流动将越来越多地由软件发起，因而"授权与留痕"这件事必须由基础设施承担，而不能由发起方临时拼凑。

展望未来，值得跟踪的三个信号是：OCC何时开始接受发行人申请与豁免请求（这决定了合规稳定币的供给节奏）；CLARITY法案是否重启（它才是"第三方能否付奖励"的真正答案）；以及Starling披露误报率与人工复核边界后，监管者的反应——那将决定"17秒"是可以被复制的行业标准，还是一家银行特例。产业侧则值得留意Tether的连续出手：一家发行方把资本投向支付编排层，往往预示着下一轮竞争不会是"谁发币"，而是"谁替智能体管钱"。

## 结论

今日金融科技新闻标志着稳定币产业从"立法年"正式跨入"执法与落地年"。OCC的首个最终规则把框架立起来，却在最关键的收益问题上选择留白，把金融科技行业的最大分歧继续留在法庭与国会之间；Starling用17秒证明了监管内智能体的产能价值，也用未披露的误报率与复核边界提醒了市场的分量；而Tether对Mural的出手则说明，价值的重心正在从资产端滑向编排端。对从业者而言，值得记住的判断只有一条：未来两年决定胜负的不是谁的链更快、谁的储备更透明，而是谁能让一个AI代理在受监管的资金网络上，安全地、可审计地、且不越权地完成一次支付。
