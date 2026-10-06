---
layout: post
title: "金融科技动态：Stripe稳定币卡年底扩展至超100国、Solana推出机构DvP结算标准、LG CNS发布区块链平台Giteul、Eurøpe联盟推进欧元稳定币EURØP"
date: 2026-10-06
author: "云原生观察"
source: "https://www.coindesk.com/business/2026/10/01/stripe-to-expand-stablecoin-cards-to-over-100-countries-by-the-end-of-the-year"
categories:
  - fintech
tags:
  - stablecoin
  - stripe
  - solana
  - dvp
  - jp-morgan
  - canton-network
  - blockchain-infrastructure
  - lg-cns
  - giteul
  - mica
  - euro-stablecoin
  - euro
  - open-usd
  - payments
  - news
---

# 金融科技动态：Stripe稳定币卡年底扩展至超100国、Solana推出机构DvP结算标准、LG CNS发布区块链平台Giteul、Eurøpe联盟推进欧元稳定币EURØP

2026年10月5日至6日的金融科技领域，呈现出**"分发层"与"结算层"同时取得突破**的格局。分发侧，Stripe 宣布其稳定币卡项目将在年底前扩展至超过 100 个国家，上月卡消费额约 12 亿美元、同比三倍；结算侧，Solana 基金会在摩根大通参与设计下发布开源 DvP 托管程序，把原本需要数日的清算交收压缩为单笔原子交易。与此同时，基础设施供给侧也在补位：LG CNS 发布面向金融机构数字资产业务的区块链平台 Giteul，Eurøpe 联盟则围绕已有 MiCA 欧元稳定币 EURØP 组织分发协作。

## 主要新闻 (Main News)

### Stripe 计划年底前将稳定币卡扩展至超过 100 个国家，Privy CEO 出任稳定币业务负责人

CoinDesk 记者 Krisztian Sandor 报道，Stripe 正计划将其稳定币卡项目扩展至超过 100 个国家。Stripe 于 2025 年收购的数字资产钱包基础设施公司 Privy 的 CEO 兼联合创始人 Henri Stern 已新增一项职责，横跨 Stripe 全公司的稳定币与加密业务。

现有客户包括加密交易所 Kraken、金融科技公司 Ramp 与支付应用 Morse。根据 PaymentScan 的数据，上月通过卡支出的稳定币约 12 亿美元，是一年前的三倍——在全球卡支付市场中仍是极小比例，但指向稳定币正从加密交易与跨境转账向日常消费渗透。

Stern 表示 Stripe 打算保持"完全稳定币中立、完全区块链中立"，许多现有项目使用 Circle 的 USDC。公司自 2018 年以来已发行超过 4 亿张卡、处理数千亿美元卡交易量，其稳定币业务结合了发卡体系与 2024 年以 11 亿美元收购的稳定币基础设施公司 Bridge。Stripe 还在与加密投资机构 Paradigm 合作开发面向支付的区块链 Tempo，是开发 Open USD 的 Open Standard 公司的创始投资方——Bridge 联合创始人 Zach Abrams 已全职转任 Open Standard 负责人。Stern 表示 Stripe 同时在探索代币化存款、DeFi 用例与接受更多数字资产作为支付，"但迄今为止，我们绝大部分工作仍发生在稳定币上"。

**Source:** [Stripe to expand stablecoin cards to over 100 countries as crypto payments strategy grows](https://www.coindesk.com/business/2026/10/01/stripe-to-expand-stablecoin-cards-to-over-100-countries-by-the-end-of-the-year)

### Solana 基金会发布开源 DvP 交收程序，摩根大通参与设计

Decrypt 报道，Solana 基金会发布开源托管程序 Solana DvP，为金融机构提供标准化的交割对付（delivery-versus-payment）结算 API，采用 MIT 许可证发布。基金会表示 J.P. Morgan 就机构结算实践为该设计提供了输入。

传统市场中，DvP 通过清算所、存管机构与托管人的多日链条运行，可能占用一至两天资本。Solana DvP 将其压缩为单笔原子交易——两条腿要么同时结算，要么都不结算。基金会数字资产产品负责人 Catherine Gu 表示："原子化结算消除了传统金融中固有的交易对手风险。"J.P. Morgan 数字资产市场负责人 Rhodel D'souza 表示，原子交收的共享开放标准"正是机构市场参与者所需要的基础设施类型"。

该程序支持 SPL Token 与 Token-2022，包括受监管发行方依赖的扩展项（永久委托、可暂停代币与转账钩子），并已完成外部安全审计。基金会计划添加隐私特性，使结算可保持机密。这一发布建立在 Solana 机构采用的增长之上：贝莱德于 8 月推出代币化货币市场基金用于稳定币储备，在 Solana 与以太坊上同时记录所有权，以符合 GENIUS Act 下的储备资产资格；Kraken 则通过 xStocks 产品在 Solana 上向海外客户提供代币化美股。

**Source:** [Solana Debuts Institutional Settlement Standard With J.P. Morgan Input](https://decrypt.co/380126/solana-institutional-settlement-standard-jp-morgan)

### LG CNS 发布区块链基础设施平台 Giteul，适配公共区块链与韩国监管环境

据 MoneyToday 报道，LG CNS 于 10 月 6 日宣布推出区块链基础设施平台 Giteul，为银行、证券公司、卡公司与支付服务商构建稳定币、代币化证券、RWA 等数字资产业务提供基础设施。

Giteul 提供四项核心功能：**数字钱包**、**交易处理**、**费用结算**与**交易记录收集**。LG CNS 指出问题的结构性来源：金融机构历来在自有系统上记录并直接管理客户交易记录，而数字资产交易发生在任何人可参与的公共区块链上——这造成客户资产在一个金融机构难以控制的区域内移动。

Giteul 的数字钱包技术源自韩国央行数字货币试点项目"汉江项目"，当时已完成 7 家银行、约 8 万名客户在便利店与商场等场所进行真实支付的环境验证；LG CNS 将其扩展到公共区块链而不仅是私有链。交易处理功能跟踪机构系统请求的交易状态直至在区块链上成功处理并回传结果；费用结算功能处理 Gas 费用，按约定结构由银行与卡公司等服务商分担；交易记录收集功能从全球公共区块链的记录中仅检索与特定金融机构相关的记录——例如稳定币发行方可用此交叉核对总发行量与美元/韩元存款。

合作伙伴阵容值得关注：USDC 发行方 Circle、代币化证券发行与管理平台 Securitize、全球金融交易区块链基金会 Canton Foundation、区块链智能平台 Chainalysis，以及提供外部数据并连接不同区块链的 Chainlink。LG CNS 与 Chainalysis 的合作将把符合韩国监管要求的交易监控功能集成进 Giteul，使金融机构能够发现并阻断犯罪资金流入钱包。LG CNS 数字业务部门高级副总裁 Kim Hong-geun 表示："通过 Giteul 将数字资产业务所需的基础设施与全球合作伙伴同时提供，我们将支持金融机构在法规实施的同时启动服务。"

**Source:** [Stablecoins and tokenized securities infrastructure in one go… LG CNS launches 'Giteul'](https://www.mt.co.kr/en/tech/2026/10/06/2026100607412111735)

### Eurøpe 联盟成立，围绕 MiCA 合规欧元稳定币 EURØP 组织分发协作

据 Stablecoin Insider 报道，10 家欧洲数字金融企业于 10 月 5 日在巴黎宣布成立 Eurøpe 联盟，包括纳斯达克上市的 eToro。创始成员为 Schuman Financial、Assetera、BLOX、Coinhouse、Coinmerce、DFNS、eToro、LCX、RockawayX、SwissBorg 与 XRPL Commons（共 11 家）。

联盟首个项目是 EURØP——由 Schuman Financial 发行、MiCA 框架下的欧元电子货币代币（EMT）。Schuman Financial 是法国 ACPR 授权的电子货币机构，储备由法国兴业银行及其他具名信用机构持有。EURØP 已在六条网络上上线：以太坊、Polygon、Avalanche、Solana、XRP Ledger 与 Plasma。DFNS 补充说明 EURØP 带有 KPMG 的季度储备鉴证，已在 Kraken、Bitvavo、Bit2Me、SwissBorg 与 Bitpanda 上可用，在 Curve、Orca 与 Pharaoh 上交易，过去 30 天转账额为 1.168 亿欧元。

成员分工为：Schuman Financial 担任发行方；eToro、SwissBorg、Coinhouse、Coinmerce、LCX、BLOX 负责交易与分发；DFNS 提供钱包与托管基础设施；Assetera 负责代币化市场；XRPL Commons 对接区块链生态；RockawayX 为 Schuman Financial 的投资方。eToro 加密业务负责人 Ouriel Ohayon 表示："通过加入 Eurøpe 联盟，eToro 正在帮助建设欧元成为链上第一-class 货币所需的流动性、分发与效用。"

报道同时指出一处限定：联盟官网声明参与"本身并不隐含任何特定的上币、集成或流动性承诺"——今天的公告是协同采纳努力，而非 eToro 或任何成员已确认的新上币。报道的分析认为，欧洲目前存在两种截然不同的欧元稳定币联盟模式：**Qivalis 是银行主导的团体在构建新代币，而 Eurøpe 联盟主要是交易所与基础设施公司在把已有代币推向更多平台**。

**Source:** [Eurøpe Consortium Launches to Scale the EURØP Euro Stablecoin](https://stablecoininsider.org/europe-consortium-europ-euro-stablecoin/)

## 分析 (Analysis)

**Stripe 的"完全稳定币中立、完全区块链中立"是一份值得逐字阅读的架构承诺。** 12 亿美元的月度卡消费额同比增长三倍，说明稳定币正在从链上资产变成支付工具；而 100 国的扩张目标则意味着稳定币卡正在成为**下一个十年跨境小额支付的默认管道**。真正值得注意的是 Stern 的中立性表述所隐含的策略：Stripe 不押注某条链或某个稳定币，而是把自己定位为"发卡层 + 编排层"，通过 Bridge 的 API 在 OUSD、USDC 与法币之间做程序化转换。这意味着 Stripe 的护城河不在链上，而在**商户关系、发卡网络许可与编排 API**——这些恰恰是银行花了数十年建成、加密原生公司最难复制的资产。这也解释了它为何能在收购 Bridge（11 亿美元）与 Privy 之后仍宣称"链中立"：**它买的是能力，不是立场**。对从业者而言，这提示了一个务实的判断：在稳定币基础设施中，避免押注单一稳定币与单一链，比选择"最优"的链更重要，因为监管与流动性在不同司法辖区的迁移速度远快于工程演化的速度。

**DvP 标准化比发行新稳定币更具结构意义。** 过去两年行业注意力集中在"发行方"——OUSD、EURØP、各种新币种。但机构真正卡住的地方是**结算**：他们需要交割与支付原子化，需要消除交易对手风险，需要可审计的最终性。Solana DvP 以 MIT 许可证开源、且有 J.P. Morgan 提供实践输入，意味着这类基础设施正从"每家机构自己写一份智能合约"转向"共享标准"。摩根大通市场数字资产负责人那番"正是机构市场参与者所需要的基础设施类型"的评论，其分量远超一次产品发布——**它说明最大的清算行开始把公链基础设施当作可采用的方案而非需要绕开的风险**。这也解释了为何以太坊、Solana、Canton 等多个网络正在被并行纳入试验：机构要的是"可切换的结算层"而非"唯一的结算层"，因此**协议兼容性会成为机构选型时的首要指标**。D'souza 与 Gu 都提到交易对手风险与最终性，这才是机构资金的真实约束。

**Giteul 揭示了公共区块链基础设施在受监管市场落地的真实形态：不是替代，是包裹。** LG CNS 的表述最能说明问题——金融机构历来在自有系统上管理客户交易记录，而公共区块链上"任何人可参与"，因此客户资产进入了一个机构难以控制的区域。Giteul 的四项功能本质上是一层**受监管的封装层**：数字钱包（源自央行数字货币试点）、交易状态跟踪、Gas 费按约定结构分担、以及从全球公共区块链中**仅检索本机构相关记录**。第四项功能尤其关键——它是"选择披露"，在不可删减的公共账本上为机构提供了合规所需的有限可见性。这一设计思路与欧盟 CADA（Cloud and AI Development Act）的云主权框架、以及 G7 语境下的"可审计但不完全透明"要求高度一致。值得注意的是 LG CNS 的伙伴选择：Circle（储备）、Securitize（代币化证券）、Canton Foundation（机构链）、Chainalysis（合规监控）、Chainlink（预言机与跨链）——**这几乎是把一家受监管数字资产业务所需的所有信任锚点一次性配齐**。这也预示了下一阶段的竞争焦点：不只是"哪条链"，而是"谁能提供完整可信栈的封装层"。

**EURØP 与 Eurøpe 联盟则说明欧洲稳定币问题的本质是分发，不是许可。** 报道的分析一针见血：MiCA 解决了牌照问题，但没有创造分发、流动性与日常使用。因此联盟成员以交易所与券商为主，而非银行。1.168 亿欧元的 30 天转账额相对而言仍是个小数字，而"参与本身不隐含上币承诺"的声明暴露了联盟的实际执行力尚未验证。这里值得与 Giteul 对照阅读：**亚洲（韩国）的路径是"由大型 IT 厂商提供受监管封装层"，欧洲的路径是"由交易所联盟围绕已有合规代币组织分发"**。两条路径的共同前提是 MiCA 级别的许可已就位；分歧在于谁来承担封装工作。Qivalis（银行主导）与 Eurøpe（交易所主导）并存，说明这个问题在欧洲远未收敛。

**四条新闻合起来，勾勒出稳定币从"资产"到"基础设施"的完整转换链条。** 底层是发行与储备锚定（OUSD 由 BlackRock、Lead Bank、BNY 持有储备并按月发布鉴证；EURØP 由法国兴业银行持有储备并由 KPMG 季度鉴证）；中层是结算标准（Solana DvP、Visa 的稳定币结算、Canton 机构链）；上层是分发（Stripe 的 100 国卡网络、eToro 与 Kraken 等交易场所）；而合规与监控则贯穿全层（Chainalysis 集成、MiCA 登记、GENIUS Act 资格）。**这个链条越完整，稳定币就越像"钱"而越不像"币"**——而这正是整个行业争论了十年的核心问题，现在看起来答案正在从技术层面转向分发层面。

## 结论 (Conclusion)

本期动态的主线是**稳定币基础设施的完整性正在被快速补齐**：发行有储备锚定与鉴证、结算有 DvP 原子化标准、分发有卡网络与交易所网络、合规有链上监控集成。判断一家稳定币方案是否可用的标准，已经从"技术上能否转账"转变为"能否在受监管辖区内合规地完成全链条"。

对实践者而言，本期有四条可执行判断：

1. **架构上保持链与稳定币的中立。** 采纳 Stripe 的思路：把编排层（多稳定币转换、多链路由）与应用层解耦，避免在核心系统中硬编码某条链或某个代币；把链切换能力做成配置项而非重构。
2. **把 DvP 与原子结算纳入银行客户的架构评估。** 机构客户的核心痛点已从"能否收款"转向"能否原子交收、能否消除交易对手风险"。评估方案时应重点考察最终性保证、交割原子性、协议兼容性（Canton / 公链 / 私链）与审计可追溯性。
3. **在受监管市场中按"封装层"思路建设。** 参考 Giteul 的四项功能：受控的钱包入口、交易状态跟踪、按约定分担的 Gas 结算、以及从公共账本中选择性提取本机构记录。公共区块链的合规难点不在存储，而在于**可见性与披露边界的设计**。
4. **不要把联盟公告当作分发落地。** Eurøpe 联盟明确声明参与不隐含上币承诺。对欧元或英镑稳定币的实际采用，应以各成员具体上币/集成的可验证进度为准，而非联盟成立本身。

未来值得跟踪的是：Stripe 100 国扩张的实际获批节奏与单卡经济性；Solana DvP 是否有传统清算所与托管机构正式采用（这是从"技术可行"到"机构认可能"的分水岭）；以及 CADA 落地后欧洲对"关联第三国"云主权的认定是否会为非美元稳定币打开新的司法辖区通道。**稳定币的下一场竞争不在链上，而在辖区之间。**