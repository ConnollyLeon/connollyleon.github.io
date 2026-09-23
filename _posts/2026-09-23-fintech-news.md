---
layout: post
title: "金融科技动态：SoFi成为首家在Mastercard全球网络落地稳定币结算的全国性银行（年化超250亿美元）、ECB正式上线Pontes代币化资产央行结算桥、ESCB拟把MiCA稳定币收益禁令扩展至借贷与质押并重构准备金规则"
date: 2026-09-23
author: "云原生观察"
source: "https://www.theblock.co/news/business/2026-09-22-sofi-begins-stablecoin-settlement-on-mastercard-network-for-program-expected-to-exceed-25-billion-in-annualized-volume-416035"
categories: [fintech]
tags: [fintech, stablecoin, sofi, mastercard, sofiusd, settlement, blockchain, ecb, pontes, target, tokenization, mica, escb, regulation, digital-euro]
---

9月21日至22日，稳定币与代币化资产在"央行货币结算层"与"商用支付网络"两端同时取得里程碑级进展。商用侧，SoFi银行宣布完成全量借记/贷记卡程序向稳定币结算的迁移，成为美国首家在Mastercard全球支付网络上用稳定币（SoFiUSD）落地的全国性银行，预期年化处理量超250亿美元，商家无需持有稳定币即可实现随时零成本提现；央行侧，欧洲央行9月21日正式上线Pontes——连接市场运营的DLT平台与TARGET服务的代币化批发结算桥，德银、桑坦德、Clearstream为首批完成接入机构；监管侧，ESCB在MiCA审查回复中提议把稳定币收益禁令扩展至借贷、质押等间接收益安排，并以"一至五个工作日到期的流动性准备金"替代现行30%/60%的银行存款比例下限。

## 主要新闻 (Main News)

### SoFi成首家在Mastercard网络落地稳定币结算的全国性银行

SoFi Technologies与Mastercard于9月22日宣布，稳定币结算已正式在其SoFi Bank借记/贷记卡程序中上线：SoFi将该行整个约250亿美元年化规模的卡程序迁移至使用SoFiUSD的区块链结算。SoFiUSD由受OCC监管的全国性银行SoFi Bank发行，1:1可兑换美元、以现金类资产为主要储备，是首家由联邦注册银行发行的稳定币。商家端无需持有稳定币或改造系统——通过SoFi的Big Business Banking平台可按需即时入账、全天候零成本提现。此举是Mastercard扩展稳定币结算生态（覆盖Arbitrum、Base、Canton、Ethereum、Polygon、Solana、Tempo与XRP Ledger等链，并在6月起纳入USDC、PYUSD、RLUSD等受监管稳定币）的关键一步。双方还计划探索SoFiUSD在跨境支付与汇款场景的应用。

**Source:** [SoFi begins stablecoin settlement on Mastercard network for program expected to exceed $25 billion in annualized volume | The Block](https://www.theblock.co/news/business/2026-09-22-sofi-begins-stablecoin-settlement-on-mastercard-network-for-program-expected-to-exceed-25-billion-in-annualized-volume-416035)

### ECB启动Pontes：代币化资产的央行货币结算桥

欧洲央行于9月21日确认其代币化结算服务Pontes正式上线。Pontes把市场运营的分布式账本（DLT）平台与欧元体系既有的TARGET服务（大额支付T2与证券结算系统）打通，为合格金融机构记录在自有账本上的代币化债券等资产提供通往央行货币结算的"现金腿"通路。结算采用双重模式：参与者既可使用Eurosystem DLT平台上的现金代币，也可经T2完成结算——一旦T2转账完成，现金腿即具法律终局性。央行货币作为央行直接负债结算，消除了现金腿上的商业银行信用风险与稳定币发行方储备风险。Pontes面向具备T2资格的银行及受监管市场运营者，首批完成接入的机构包括德银、桑坦德与Clearstream；初期运营时间为工作日08:00–16:00 CET。Pontes的定位是底层连通既有体系，而Appia则用于评估欧洲是否应建设更一体化的代币化资产发行、交易、持有与结算框架。该服务源自2024年5–11月间测试德央行Trigger Solution、法央行DL3S与意央行TIPS Hash-Link的系列实验。

**Source:** [ECB Launches Blockchain Bridge For Tokenized Bank Settlement | CryptoNews24](https://cryptonews24.eu/2026/09/blockchain-news-today/ecb-launches-blockchain-bridge-for-tokenized-bank-settlement.html)

### ESCB提议扩展MiCA稳定币收益禁令并重构准备金规则

欧洲央行与欧盟各国央行（ESCB）在针对欧盟委员会MiCA审查的57页回复中提出两项重磅建议。其一，把现行"稳定币不得直接支付利息"的禁令扩展至通过借贷、借款、质押及其他分层结构带来的间接收益安排——ESCB明确指出"电子货币的用途是支付而非储蓄"，间接收益会模糊电子货币与银行存款的监管界限，并造成加密平台与受严格资本与存款规则约束的银行之间的不平等竞争。其二，废除现行要求发行方将30%（重大代币为60%）准备金以银行存单形式持有的固定比例规定，改为按资产到期期限一至五个工作日分层的流动性式准备金框架——其逻辑是固定存款下限反而让大型稳定币发行方成为承接银行潜在不稳定的资金源，挤兑叠加提款会同时在两端放大压力。这一争论与美国的镜像冲突相映成趣：美国银行界与花旗CEO Jane Fraser担忧"带收益的稳定币"虹吸银行存款（CLARITY法案9月15日以50:49的程序性投票告负），而ESCB担忧的是发行方把巨额存款停泊在银行内部后快速抽离的风险——大西洋两岸看到的是同一条断层线：稳定币正坐在银行体系边缘，移动大额资金的速度足以压垮承接其储备的机构。

**Source:** [ECB Stablecoin Regulation Expands Yield Ban and Reserve Rules | Cryptonomist](https://en.cryptonomist.ch/2026/09/22/ecb-stablecoin-regulation-ban-reserve/)

## 分析 (Analysis)

SoFi把全量卡程序迁移到SoFiUSD结算，是稳定币从"交易所间货物运输"走向"支付轨道本身"的标志性事件。商家不持有稳定币、不改造系统，就能获得近乎即时且零成本的资金可用性——这意味着稳定币的收益第一次不再是"换链省手续费"的套利故事，而是"资金效率即产品"：卡清算的结算时滞、资金占用与周末/假日停摆，被区块链的即时确认与全天候运营直接消除。而SoFiUSD由受OCC监管的全国性银行发行，正好回应了"谁担保这枚代币"的终极追问——它把监管场域（受保存款与资本的范式）搬进了区块链结算层。对卡组织、收单行与发卡行而言，一旦"央行货币或银行货币在链上结算"被证明在生产环境可用，传统清算网络的技术租金将面临实质性的重新定价。

ECB的Pontes是另一端的"官方"回答：不是商家资金效率，而是主权信用是否进入代币化结算。Eurosystem的判断是——无论市场账本如何多样，最终结算的"钱"要可信，就必须是央行货币。Pontes用"桥"的方式把既有T2终局性接进DLT平台，避免了再造一条公链或统一账本的宏大工程，让代币化债券等批发资产以最短路径获得央行现金腿。首批接入者是德银、桑坦德与Clearstream这样的头部队列，说明欧央行想让批发代币化先在自己的监管半径内闭环。对做市商与资管机构，Pontes开放时长、交易重复度与二级市场深度（而非集成数量）才是评估其真正价值的三项先行指标。

ESCB的规则提案把监管火力对准了稳定币的"经济实质"。收益禁令延伸至借贷与质押，本质上是要堵住"协议表面不付息、实际通过DeFi机制返还收益"的结构性套利——若获立法通过，任何在欧盟面向持币者间接产生收益的产品都需要重新设计。而准备金规则的"存储备→流动备"改写，则把监管逻辑从"有多少钱在银行账上"转向"资产能否在一到五个工作日变现"，这更贴近挤兑压力测试的真实场景，但也把资产负债表的信用风险从"单点银行"分散到"多期限工具"上。对在欧盟运营的支付与DeFi平台，这两条建议若落地，将迫使整条产品线围绕监管边界重新布线——它们与CLARITY法案在美国的震荡遥相呼应，稳定币的"监管套利空间"正在被同时压缩。

## 结论 (Conclusion)

过去24小时的金融科技焦点，是稳定币与代币化资产在"商业可用"与"货币可信"两个方向上的双向奔袭：SoFi在Mastercard网络上以250亿美元年化规模的卡程序证明稳定币结算的生产级可用与商家零改造成本；ECB用Pontes桥把央行货币终局性接入DLT市场，为批发代币化资产提供真正的"无结算风险"现金腿；ESCB则以收益禁令扩展与流动性准备金重构，预告了稳定币作为"准银行存款"将进入更细密的监管网格。对实践者的启示：卡侧与B2B支付团队应开始评估银行稳定币结算对清算时滞与资金占用的量化改善（以SoFiUSD为参照系）；批发证券从业者可关注Pontes的开放时长与交易重复度指标以判断代币化债券流动性拐点；而任何在欧盟提供稳定币相关产品的主体，都应把"间接收益禁令"与"五日流动性准备金"当作下一轮产品合规设计的输入变量——商用网络与央行货币的接轨，正在重新定义稳定币的行业边界。