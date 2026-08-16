---
layout: post
title: "金融科技动态：Coinsbuy遭800万美元跨链攻击、Circle国家信托银行开业并敲定Arc公链验证节点阵容与Wells Fargo加入代币化存款阵营"
date: 2026-08-10
author: "云原生观察"
source: "https://www.coindesk.com/business/2026/08/10/crypto-exchange-coinsbuy-loses-usd8-million-in-coordinated-two-blockchain-attack"
categories:
  - fintech
tags:
  - coinsbuy
  - cross-chain
  - hack
  - tron
  - ethereum
  - circle
  - trust-bank
  - arc
  - stablecoin
  - wells-fargo
  - tokenized-deposits
  - mastercard
  - bvnk
---

# 金融科技动态：Coinsbuy遭800万美元跨链攻击、Circle国家信托银行开业并敲定Arc公链验证节点阵容与Wells Fargo加入代币化存款阵营

加密与银行基础设施在8月10日同时经历"安全事件"与"机构化加速"两条叙事。Coinsbuy交易所在一小时内被跨链洗劫807万美元，链上取证显示攻击者通过Bridgers跨链交换器将TRON与以太坊两条链上的行动串成单起事件；Circle正式运营国家信托银行，并公布Arc公链9月16日主网上线时的Visa、Mastercard、BlackRock等创始验证节点阵容；Wells Fargo宣布今年秋季推出代币化存款服务。

## 主要新闻

### Coinsbuy遭800万美元跨链攻击：Bridgers串联TRON与以太坊

据CoinDesk报道，加密货币交易所Coinsbuy于8月9日在一小时内被攻陷，共损失约807万美元。攻击者先以5 USDT小额测试，随后在约一小时内清空8个TRON钱包中的604万USDT，同时清空以太坊上3个钱包的189万USDT与77 ETH（经1inch兑为ETH，该钱包当日新建）。链上取证显示，两条链通过跨链交换器Bridgers被串成单起操作——其以太坊结算合约直接将资金转入以太坊交换钱包。约79%的被盗资金经即时兑换平台FixedFloat的约50个一次性地址洗出；ChangeNOW在接到Specter Investigations联系后冻结了六位数资金；约282 ETH（约54.2万美元）尚未移动。Coinsbuy在24小时内将受影响钱包余额补回至攻击前的99.95%，暗示团队认为私钥并未泄露，但攻击路径尚未查明。Coinsbuy回应称事件"已受控"，全部损失由公司自有储备覆盖，"客户未承担任何损失"。该事件使行业2026年已披露被盗金额在7月底约9.72亿美元的基础上继续累积。

**Source:** [Crypto exchange Coinsbuy loses $8 million in coordinated two-blockchain attack](https://www.coindesk.com/business/2026/08/10/crypto-exchange-coinsbuy-loses-usd8-million-in-coordinated-two-blockchain-attack)

### Circle信托银行正式运营，Arc公链9月16日主网上线

Circle确认其国家信托银行Circle National Trust已自7月24日起合法运营，为其在GENIUS法案相关规则落地前构建"联邦级基础设施"。Circle此前已获OCC国家信托银行牌照与纽约州有限目的信托牌照。CFO Jeremy Fox-Geen称该牌照为"现行法律与预期监管之前的监管基石"，未来可提供Circle自身及关联方乃至第三方机构的托管产品，并可能影响USDC的发行地与储备管理方式。Circle同时公布其开放稳定币区块链Arc将于9月16日启动公共主网，创始验证节点包括BlackRock、DTCC、Galaxy、Global Payments、ICE、Mastercard、MoneyGram、SBI Group、Standard Chartered、Sumitomo与Visa。BlackRock将把BUIDL代币化货币市场基金部署到Arc，DTCC则将于2027年下半年为托管资产提供代币化。Arc目前处于私有主网阶段，测试网已处理超5亿笔交易、近300万钱包。Circle Q2财报显示总收入与储备收益达7.01亿美元（同比+7%），净收入4800万美元（去年同期为4.82亿美元亏损），USDC流通量季度末达733亿美元（+19%）。

**Source:** [Circle officially opens its national trust bank](https://www.americanbanker.com/payments/news/circle-officially-opens-its-national-trust-bank)

### Wells Fargo加入代币化存款竞赛

Wells Fargo宣布将为部分企业与商业客户提供代币化存款服务，今年秋季以美元对英镑的跨境支付率先试点，计划2027年扩展至更多客户、国家与货币。该系统运行于该行自有区块链平台，可自动将符合条件的支付路由至代币化存款以提升速度与灵活性，客户交互方式不变。Wells Fargo强调代币化存款代表商业银行货币，与现有存款产品享有同等监管保护与存款保险资格；未来能力包括基于智能合约的条件支付、行内托管钱包与跨链连接，并可接入The Clearing House正在开发的共享代币化存款网络。该行加入JPMorgan与Citi之列，共同应对稳定币对存款基础的侵蚀。分析师James Wester提醒，代币化存款面临"需求不明"与"互操作性缺失"的双重挑战——若各行区块链互不相通，代币流动性将碎片化，实际效用有限。

**Source:** [Wells Fargo joins JPMorgan and Citi in the race to tokenize Wall Street's settlement rails](https://www.coindesk.com/business/2026/08/04/wells-fargo-to-offer-tokenized-deposits-for-24-7-corporate-payments)

## 分析

Coinsbuy事件最值得警惕的，不是金额本身，而是攻击手法所代表的"跨链归并"趋势。通过Bridgers这类跨链交换器，攻击者把原本分散在不同链上的行动（TRON侧6百万级、以太坊侧1百万级）串联为单起可审计的操作，同时利用FixedFloat的即时兑换与一次性地址快速洗钱。对交易所而言，这意味着安全监控必须从"单链告警"升级为"跨链资金流关联分析"——仅盯着某一链的异常提现，将无法识别真正的攻击全貌。而Coinsbuy"24小时内自掏腰包全额补足"的应对，虽然守住了客户信任，也再次凸显集中式托管在遭遇未知攻击向量时的被动处境：私钥未泄露恰恰说明攻击面在更深的位置，平台方需要披露技术细节才能重建市场信心。

Circle信托银行正式运营与Arc验证节点阵容的敲定，则是稳定币机构化的"监管基石"落地。OCC牌照让Circle具备联邦级托管与储备管理能力，11家几乎全部来自传统金融的创始验证节点（含BlackRock、Visa、Mastercard、DTCC、ICE）则让Arc在"机构联盟链"的定位上远超同业。这背后是稳定币竞争从"发行"转向"网络与合规基础设施"的升维：在GENIUS法案规则尚在制定时抢先锁定联邦框架，在USDC市场份额从2025年初下滑至27%的压力下，以"合规深度+机构网络"对抗多币种、多链竞争。对机构客户，Arc的可编程结算（gas以USDC计价）与DTCC的资产代币化路径，可能成为2027年RWA市场的重要基础设施变量。

Wells Fargo加入代币化存款，把"银行防御性上链"的名单再拉长一员。JPMorgan（JPM Coin）、Citi与Wells Fargo的先后入场，说明美国大行已把代币化存款视为对抗稳定币存款侵蚀的既定战略，而非实验。但Wester的质疑一针见血：银行自建封闭链若不互通，代币化存款将重蹈"私有支付网络碎片化"的覆辙。The Clearing House的共享代币化存款网络是关键的互操作变量——它能否成为"银行版Arc"，将决定代币化存款是真正的市场变革，还是又一套昂贵的内部账本。

## 结论

Coinsbuy的800万美元跨链攻击提醒行业：安全建设必须跟上资产与业务的跨链化进程，链上取证与跨链资金流关联分析应成为交易所风控的标准配置；Circle信托银行与Arc验证节点阵容、Wells Fargo的代币化存款则确认了稳定币与银行存款的代币化正从"叙事"进入"监管+网络"的机构化执行阶段。对从业者，建议将跨链攻击演练纳入风控清单，跟踪Circle Arc与The Clearing House网络的互操作进展，并以"客户是否真正在用"作为衡量代币化价值的关键指标。金融基础设施的链上迁移，正由"能不能上链"转向"链与链之间能不能对话"。
