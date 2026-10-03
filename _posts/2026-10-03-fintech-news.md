---
layout: post
title: "金融科技动态：OUSD（Open USD）随Open Standard联盟通过Stripe、Visa与Mastercard的BVNK层正式上线商用并把大部分储备收益回吐给200多家伙伴、BNY与Kraken母公司Payward就托管、交易、支付、财富管理与基础设施展开谈判、Fiserv在Solana上上线以Roughrider Coin为首个用例的数字资产平台并开放给90多家北达科他州银行与信用社、SMBC Nikko与Uniswap Labs、Base、Nyx Foundation签署备忘录要把AML与CFT直接写进Uniswap v4的hooks、以及美国社区银行在D.C.联邦地区法院起诉OCC"
date: 2026-10-03
author: "云原生观察"
source: "https://www.reuters.com/world/community-banks-sue-us-regulator-over-crypto-firm-charters-2026-10-02/"
categories: [fintech]
tags: [fintech, crypto, stablecoin, OUSD, open-usd, open-standard, bridge, stripe, visa, mastercard, BVNK, solana, ethereum, base, tempo, blackrock, bny-mellon, reserve-yield, consortium, MiCA, e-money-token, Luxembourg, payward, kraken, kraken-prime, sofI, custody, tokenized-deposits, fiserv, commercial-center, roughrider-coin, bank-of-north-dakota, versabank, fireblocks, permissioned-stablecoin, token-2022, finxact, SMBC-Nikko, uniswap, uniswap-v4, hooks, AML, CFT, FSA-Japan, nethermind, nyx-foundation, DeFi-gateway, community-banks, ICBA, OCC, national-trust-charter, regulatory-authority, banking-dive, FDIC, GENIUS-Act, tokenized-treasury, tokenized-money-market, institutional-adoption]
---

10月2日的金融科技新闻呈现出一种不太常见的形态：**这一天几乎没有"新的交易"，几乎全是"通道的落成"。** Open USD（OUSD）——由Bridge发行、Open Standard联盟治理、背后站着Coinbase、Mastercard、Shopify、Stripe与Visa五家具名创始伙伴且已有200多家机构参与的美元稳定币——正式上线商用，并同时接入Stripe的Treasury/Issuing/Global Payouts、Visa稳定币平台与Mastercard通过其8月以最高18亿美元收购的BVNK所提供的结算层；BNY正在与Kraken母公司Payward谈判覆盖托管、交易、支付、财富管理与基础设施的广泛合作；Fiserv在Solana上上线数字资产平台，首个落地用例是北达科他州银行的Roughrider Coin，开放给90多家银行与信用社；日本SMBC Nikko则与Uniswap Labs、Base、Nyx Foundation签署备忘录，要**把AML与CFT直接写进Uniswap v4的流动性池hooks里**。而在同一天，美国独立社区银行家协会（ICBA）向哥伦比亚特区联邦地区法院起诉OCC，认为其向加密企业发放有限银行牌照的做法超出了监管权限。**核心判断是：稳定币正在从"资产类别"演变为"分发渠道"，而分发渠道的所有权归属，已经开始变成监管争议的焦点。**

## 主要新闻 (Main News)

### OUSD正式上线商用：把储备收益的大部分回吐给200多家伙伴，但欧盟MiCA路径仍是缺口

Open USD（OUSD）于**9月30日**正式上线商业支付，Coinbase侧渠道于10月初开放。发行方是Stripe旗下稳定币基础设施子公司**Bridge**，治理方是独立的**Open Standard**联盟。该代币由**200多家金融机构与科技公司**背书，储备由BlackRock、Lead Bank与Bank of New York Mellon持有的美元资产支持，Bridge按月发布证明。

在Stripe侧的产品面被描述为功能最完整的首发形态：**Stripe Treasury**支持企业持有OUSD余额并用于运营资金；**Stripe Issuing**允许企业构建直接消费OUSD余额的卡；**Global Payouts**让企业向**100多个国家**的加密钱包直接发送OUSD；Crypto Onramp在购买环节处理法币到OUSD的转换；Bridge的编排API允许在OUSD、其他稳定币与法币之间做程序化转换。Stripe技术与业务总裁Will Gaybrick表示该项目旨在成为Stripe商业客户的默认稳定币；公司确认OUSD将成为使用其金融基础设施的企业的默认稳定币，同时说明**不要求现有Stripe用户转换当前余额**。Ramp等早期采用方已提供OUSD稳定币账户。

在卡组织侧，OUSD的分发经由**BVNK**提供——Mastercard于**8月3日**以15亿美元基础价加最高3亿美元或有对价、最高18亿美元收购的稳定币支付公司。BVNK在**130多个市场**运营、持有**25项以上监管牌照**（含MiCA牌照）、每年处理约**300亿美元**稳定币支付量，其25个以上牌照与130个市场为OUSD提供了现成的分发通道与监管基础。五家具名创始伙伴（Coinbase、Mastercard、Shopify、Stripe、Visa）在Open Standard持有**均等初始股权**，并共同承诺在发布时注入**超过10亿美元**的流动性种子。联盟自6月30日宣布以来已扩展至200多家合作公司，横跨支付、银行、科技与加密：American Express、Discover、Google、IBM、BlackRock、BNY、Standard Chartered、OKX、Bybit、MetaMask、Ripple、Galaxy等均在列。

OUSD同时在**四条链上**首发：Ethereum、Solana、Base与Tempo。

**结构性差异在商业模式而非技术上**：Tether与Circle各自保留储备产生的利息收益（2024年Tether以此方式获得约130亿美元），而Open Standard将大部分储备收益**按伙伴贡献的供应量与交易量比例回吐给200多家伙伴**。业务可按1:1无费用铸造与赎回。

需要指出的限制是**欧盟路径**：发行主体Bridge Building S.A.持有卢森堡电子货币机构牌照，但截至**2026年10月1日**，OUSD本身**尚未在欧盟MiCA注册册中登记为电子货币代币（EMT）**。按MiCA第48条，针对该特定代币的加密资产白皮书必须先通知监管机构，欧盟受监管交易场所才能合法向欧洲客户提供——而MiCA要求公开要约前至少**40个工作日**的通知期。Bridge未公布欧盟通知的时间表。

### BNY与Kraken母公司Payward洽谈覆盖托管、交易、支付与基础设施的全面数字资产合作

据CoinDesk援引知情人士报道，**BNY正在与Kraken母公司Payward**就一项广泛的数字资产与传统金融市场基础设施合作进行谈判。潜在协议可能覆盖**加密产品、托管、财富管理、交易、支付**，以及通过Payward Services——公司面向银行、交易所与资产管理公司的B2B平台——提供的**基础设施**。讨论仍在进行，可能不会达成协议。

双方各自的布局解释了这项合作的合理性。BNY作为全球最大的托管银行之一，一直在扩展自身数字资产业务，包括围绕**代币化存款与链上结算**为机构客户开展工作。Payward则已远超出Kraken原有的现货业务，版图涵盖衍生品、代币化股票、托管、质押、支付与传统证券。此前Payward已与**SoFi**达成覆盖银行、支付、流动性与数字资产的协议，并接入Kraken Prime与SoFi的实时结算网络。

### Fiserv在Solana上上线数字资产平台：Roughrider Coin成为首个落地用例，开放给90多家北达科他州银行与信用社

Fiserv于**10月1日**宣布其数字资产平台上线，首个实际用例是**Roughrider Coin**——与Bank of North Dakota关联的美元支持型资产，平台向该州**90多家银行与信用社**开放。参与机构可通过其已在使用、用于商业银行与银行间资金流动的**Commercial Center**系统访问该资产。Fiserv称平台现支持该资产的**发行、储备管理、托管与结算**。

角色分工是这条新闻的关键：**VersaBank USA**作为发行方，负责铸造、销毁、托管与储备资产管理，并确认Roughrider Coin是其数字资产平台上的首个生产部署；**Solana**处理交易验证，Banco de North Dakota称该资产使用Solana的**Token-2022**控制，包括冻结与回拨等权限化功能；**Fireblocks**提供多方计算钱包与数字资产基础设施，参与机构使用Fireblocks加固的钱包，并配合自动化合规规则与面向金融机构的运营保障。

该项目自2025年10月首次宣布时即规划于2026年落地。Bank of North Dakota提供治理与监督，但**不是法律发行方**；该行明确说明Roughrider Coin是专为北达科他州社区银行与信用社之间银行间交易设计的**许可型（permissioned）美元支持型代币**，**公众不能购买、持有或投资**。术语上各伙伴略有差异：Fiserv与VersaBank称其为"美元支持型稳定币"，该州银行目前称其为"面向金融机构的代币存款"。Fiserv表示平台还可支持稳定币卡发行、跨境支付、可编程商务与资金自动化，并可处理代币化存款与全球货币账户（包括面向境外金融机构的美元账户）。Bank of North Dakota将在**10月5日至7日**于Medora的B3 Forum上举行Roughrider Coin发布会（10月5日16:30）与专题小组（10月7日）以披露更多细节。

需注意**公共数据的空白**：Fiserv未披露发行量、已完成交易的机构数或结算金额；该州银行亦未公布总供应量、储备规模或上线以来的交易价值。

### SMBC Nikko与Uniswap Labs、Base、Nyx Foundation签署备忘录：把AML与CFT直接嵌入Uniswap v4的流动性池hooks，目标2027年年中

日本SMBC Nikko Securities与**Nethermind**于**10月2日**与Uniswap Labs、Base、Nyx Foundation签署谅解备忘录，目标是建设一个面向日本的**DeFi Gateway**，预计**2027年年中**完成。需明确：谅解备忘录是意向声明而非已上线产品。

项目的核心机制是**在Uniswap v4的hooks中嵌入合规**。Hooks是附着在流动性池上、在交易周围运行自定义逻辑的可插拔代码片段；在此处，这些hooks的作用是把**反洗钱（AML）与反恐怖融资（CFT）措施直接写入合规流动性池**，使投资者保护内建于系统本身，而不是事后附加。同时，协议使用**自定义流动性池**以满足监管合规要求，目标用户是**日本的合格投资者**，使其能在监管机构能够认可的框架内接触去中心化金融产品。

分工方面：SMBC Nikko主导监管沟通并提供合规专长；Nethermind负责技术侧，包括AI开发与智能合约安全；Uniswap Labs提供协议及其v4 hook架构；Base是Coinbase Technologies运营的区块链。该项目出自SMBC Nikko于**2026年2月**成立的DeFi技术部——从建部到签署多方协议约八个月。双方承诺在网关成形过程中向日本金融厅（FSA）定期通报。

### 美国社区银行起诉OCC：认为向加密企业发放国家信托银行牌照超出监管权限

据路透社报道，代表社区银行的贸易组织**Independent Community Bankers of America（ICBA）**于10月2日在**美国哥伦比亚特区联邦地区法院**起诉美国货币监理署（OCC）。该组织称OCC必须撤销近期发布的规则及相关指引，即**为以加密产品为主要业务的公司开通有限银行牌照铺平道路的那套规则**。

该组织的论点分两层：其一，向以加密业务为主的公司发放这类牌照**超出了OCC的监管权限**；其二，此类牌照**授予了合法性却缺乏充分的安全保障**。

背景是这已成为OCC信托牌照路线上反复出现的对抗模式。同一个月内，银行业与银行业组织已在多处提起同类挑战——此前已有OCC以"缺陷"为由拒绝一家英国机构的信托牌照申请，也有消费者权益组织在数月前就一家日本财团（计划2027年发行稳定币的Connectia Trust）获得OCC有条件批准一事提出反对。**同一个监管机构在同一个月里，同时面临来自传统银行业、加密企业与消费者团体三个方向的拉扯。**

## 分析 (Analysis)

把这五件事放在一起看，最清晰的一条主线是：**稳定币的角色已经完成了一次根本性的位移——它不再是"资产类别"，而是"分发渠道"，而分发渠道的所有权问题随即变成了监管的靶心。** OUSD的设计最能说明这一点：它的技术栈（Ethereum、Solana、Base、Tempo四链首发、1:1无费用铸造赎回）毫无新意，真正的新意在于**分发路径**——Stripe的账户与卡体系、Visa的稳定币平台、Mastercard经BVNK的130多个市场网络，以及五家创始伙伴各持均等的股权。这不是发行方赢得市场的故事，是**支付网络赢得收单位置**的故事。而OUSD把大部分储备收益按供应量与交易量回吐给200多家伙伴这一设计，本质上是**用经济激励换取渠道忠诚**——它承认了在稳定币市场里，最稀缺的资源不是抵押品质量而是接入点。

这直接解释了ICBA为什么要起诉OCC。**当加密公司的牌照问题变成"谁掌握分发渠道"的竞争时，传统社区银行的诉求就不再是"要不要让加密公司进银行体系"，而是"为什么分发渠道的规则由支付巨头主导"**。OCC在9月底放行加密企业国家信托牌照的指引、以及过去几个月Circle、Sony、Dakota等多家机构申请同类牌照的密集节奏，意味着美国正在快速把稳定币发行权从"州级货币金融机构牌照路径"重新分配到"联邦信托牌照路径"上，而这条新路径的设计依据，很大程度上来自支付网络而非储蓄机构。ICBA的诉讼把这一权力分配问题送上了联邦法院——**这类诉讼的真正意义往往不在判决结果，而在于它把一场关于牌照的技术性争论，升级为一场关于"谁的资产负债表能承载链上流动性"的宪法性问题。**

第二层洞察来自日本那条新闻，因为它在技术路径上是本日唯一真正新颖的一件事。**把AML与CFT写进Uniswap v4的hooks，是"合规下沉到协议层"这一思路的第一次严肃的大型机构实现。** 与此前"链下合规、链上执行"（如中心化交易所的KYC + 可冻结的代币权限）相比，hooks方案的结构性优势在于合规逻辑随池子一起走，天然覆盖所有交互方；而它的未解难题同样明显——hook本身是可插拔代码，**合规逻辑的完整性取决于部署方是否忠实实现规范**，而Nethermind同时承担AI开发与智能合约安全这两个角色，意味着技术实施方与安全审计方是同一家公司。更长远的问题是hooks的治理：一旦AML规则需要在链上强制执行，谁来修改hook、修改需要什么治理流程、监管要求变化时如何快速响应？**Uniswap v4的hooks原本是为扩展池功能设计的，现在被承载了监管义务，这个错配会在2027年之前成为这个行业最尖锐的技术治理争议。**

第三点是Fiserv这条新闻的权重被普遍低估了。**关键不在Roughrider Coin这个代币，而在建造者是Fiserv。** Fiserv是美国银行业务与核心处理链条的基础设施提供商，其系统被数千家金融机构所依赖。当这样一家厂商把一个州立银行的结算代币放到**公开的Solana链**上时，它做的是一件与"再上一次交易所上币"完全不同性质的事——**它降低了每一个已经使用Fiserv系统的机构的链上接入成本**。历史上金融科技的采纳扩散从来不是通过某个明星产品，而是通过"几千家机构已经依赖的那个供应商"；这解释了为什么一笔发布量未披露、连总供应量都没公布的代币，会被视为结构性事件。这里也埋着真正的风险：选择公开链意味着Fiserv把自己置于一个自己不控制的基础设施之上，而Fiserv的监管身份恰恰要求对这条链的可用性与中立性作出承诺——**这个张力在接下来的运营中会不断被检验。**

第四点必须提**数据的缺失**，因为这是本日最容易被忽略的信息质量问题。Fiserv未披露发行量与结算额，北达科他州银行未公布总供应量与储备规模；OUSD的10亿美元流动性承诺被宣布但未见部署进度；BVNK每年300亿美元的处理量中"有多少转向OUSD"是一个明确被列为待观察指标、而非已知数字的量。**在一个所有参与方都在讲基础设施叙事的领域里，缺乏可审计的量的指标，才是真正需要注意的风险。** 同时OUSD的MiCA缺口提醒我们：**一条在技术上四链同步、在商业上三网贯通的稳定币，仍然可能因为缺少一个监管登记而在最大的单一市场里无法合规触达客户**——这恰恰说明监管进度而非技术进度，才是当前稳定币扩张的真实约束条件。

## 结论 (Conclusion)

10月2日的金融科技格局可以用一句话概括：**基础设施已经就位，监管分配正在争夺，而数量仍在缺席。** 通道层面OUSD完成从协议到分发网络的部署、Fiserv完成从核心银行系统到公开链结算的跳转、Payward与BNY的谈判则指向托管与结算的进一步融合；监管层面ICBA的诉讼把"谁能获得银行牌照"变成了"谁能制定稳定币分发规则"的争夺；技术层面日本SMBC Nikko的hooks方案给出了"合规写进协议"的第一份大型机构答案。**三条线在同一天推进，说明这个行业的瓶颈已经清晰地从技术能力转移到了牌照分配与制度设计。**

值得后续跟踪的五条线索：**其一，ICBA诉OCC案的管辖权与初步裁定**，这决定了加密信托牌照路径是加速还是被冻结；**其二，OUSD向MiCA登记的通知提交与那40个工作日窗口的实际起点**；**其三，Open Standard承诺的10亿美元初始流动性的实际部署比例**，这是联盟模式能否跑通的唯一硬指标；**其四，Fiserv在10月5日B3 Forum上披露的Roughrider Coin供应量与结算规模**，以及Permit型代币在许可链上的实际流动性表现；**其五，Payward与BNY的谈判是否落地，以及落地范围是否包含BNY已在推进的代币化存款与链上结算**。对从业者而言，本日最实用的一条判断标准是：**在这个行业里，宣布一条新的结算通道与证明这条通道上有多少真实资金流之间的差距，正在成为区分实质进展与叙事进展的主要指标。**