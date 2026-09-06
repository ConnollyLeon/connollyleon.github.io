---
layout: post
title: "金融科技动态：Circle Arc主网定档9月16日、21家银行组美元稳定币联盟、cirBTC上线与OpenReserve获首批加密银行牌照"
date: 2026-09-06
author: "云原生观察"
source: "https://cryptonews.net/news/blockchain/33396925/"
categories:
  - fintech
tags:
  - stablecoin
  - circle
  - arc
  - cirbtc
  - banks
  - occ
  - clarity-act
  - institutional
---

# 金融科技动态：Circle Arc主网定档9月16日、21家银行组美元稳定币联盟、cirBTC上线与OpenReserve获首批加密银行牌照

本周稳定币与机构加密金融迎来密集的"基础设施化"信号。Circle宣布其机构结算链Arc主网将于9月16日上线，BlackRock、DTCC、Visa等11家金融机构担任创始验证者，同周上线了带链上储备审计的包装比特币cirBTC；另一边，21家全球顶级银行（含高盛、美银、花旗、富国、德意志、UBS）正式组建美元稳定币发行公司；OpenReserve则成为首家获得OCC全国性银行牌照的加密原生企业。稳定币竞争正从"币种发行"升级为"链、牌照与结算网络"的三维战争。

## 主要新闻

### Circle Arc主网9月16日上线：华尔街机构集体当验证者

Circle宣布其机构结算Layer 1区块链Arc将于9月16日启动主网，11家创始验证者均为传统金融基础设施巨头——BlackRock、DTCC、Galaxy、Global Payments、ICE（NYSE母公司）、Mastercard、MoneyGram、SBI集团、渣打、住友商事与Visa。Arc以USDC为原生gas代币，采用源于Tendermint的Malachite共识，主打机构级美元结算：DTCC计划自2027年下半年起将DTC托管资产的代币化（覆盖代币化回购、担保品流动性与公司行动）落于Arc；BlackRock则将BUIDL（代币化国债基金，规模已超28.7亿美元）部署其上，实现无桥接、无包装的链上申赎。测试网Q2已处理超5亿笔交易；$ARC治理代币预售价0.30美元、3亿美元完全稀释估值。值得注意的是，主网上线恰在参议院CLARITY法案9月15日程序性表决次日，监管时点卡位明显。

**Source:** [Circle is building its own chain, and Wall Street is running the nodes](https://cryptonews.net/news/blockchain/33396925/)

### cirBTC上线：链上可验证的"机构级包装比特币"

Circle发布包装比特币cirBTC：每枚由原生比特币1:1支持，底层资产托管于联邦监管机构Circle National Trust的隔离账户，并借助Chainlink Proof of Reserve实现链上储备验证；目前部署于以太坊，Arc主网后将同步扩展。产品定位直指WBTC与tBTC的痛点——准备金透明度与对手方风险：隔离托管、与公司资产法律与运营隔离、公开钱包地址供独立核查。Aave社区已在7月讨论将其接入V3/V4核心池，若落地将与USDC组成"质押BTC借USDC"等DeFi组合。Circle凭借USDC（流通量约733亿美元）+ Arc + cirBTC，正在搭建从稳定币结算到比特币CeFi/DeFi贯通的全栈产品线。

**Source:** [Circle Launches cirBTC With Onchain Bitcoin Reserves](https://www.cointrust.com/market-news/circle-launches-cirbtc-with-onchain-bitcoin-reserves)

### 21家银行正式动工美元稳定币：高盛、美银、花旗、UBS联袂出战

由21家全球大型银行与资管机构（含Goldman Sachs、Bank of America、Citi、Wells Fargo、Deutsche Bank、UBS、Fidelity等）组建的公司将于年内成形，计划2027年上半年发行美元稳定币，随后跟进欧元及其他G7货币。项目源于2025年10月10家银行的探索小组，一年内成员翻倍并转入实质运营。细节仍待敲定：公司名、币名、底层链与储备托管人均未披露。该币将以GENIUS Act框架为合规基准（1:1流动资产储备、禁止向持币人付息、OCC终稿规则预计2026年11月落地）。市场观察者注意到，先例并不乐观——法兴银行去年推出的美元稳定币流通量仅约1250万美元，"银行式的信任"能否转化为"网络效应的使用"仍需验证。

**Source:** [Usd Stablecoin Consortium Forms with 21 Major Banks](https://en.cryptonomist.ch/2026/09/02/usd-stablecoin-consortium-launch/)
**Source:** [When 21 Banks Issue the Dollar Stablecoin, Who Keeps the Interest?](https://www.ainvest.com/news/21-banks-issue-dollar-stablecoin-interest-2609/)

### OpenReserve获OCC初步批准：首个加密原生全国性银行牌照

美国货币监理署（OCC）对加密原生企业OpenReserve颁发全国性银行章程的初步批准，使之可开展存款、放贷与稳定币发行——这是信任类银行牌照长期未能触及的能力组合。OpenReserve定位"Fedwire空窗期"的24/7原子结算：美联储支付轨道每天约22小时离线，而2025年稳定币轨道结算量约33万亿美元。获批门槛不低：首批实缴资本2.1亿美元，头三年一级杠杆率须达12%（传统银行5%的两倍多），须在2027年9月前完成融资、2028年3月开业；子公司ReserveUSD的稳定币还需另行取得OCC批准。作为背景，OCC局长Gould称40份待批银行申请中有23份涉及数字资产。

**Source:** [OpenReserve Wins OCC Charter: Crypto Bank's Bold Leap](https://cvj.ai/briefing/crypto-news/openreserve-wins-occ-charter-crypto-banks-bold-leap/)

## 分析

把过去48小时的信息放在一起，稳定币行业正经历一次深刻的分层重构。Circle推出Arc主网的意义并不在于"又一条链"，而在于把结算基础设施本身资产化：让DTCC、ICE、Visa这些"传统金融的管委会"成为验证节点，等于向合规部门发了一张"免审通行证"。它与cirBTC、USDC组合后，形成了"美元稳定币+比特币资产+机构结算链"的闭环，针对的正是代币化国债、回购担保品与企业财资这些高价值场景。而21家银行的联盟则是"体量换时间"的对冲：他们押注GENIUS Act（2027年1月生效）创造合规通路，用既有客户关系抢回被Tether/Circle攥住的结算浮息收益。风险在于银行发行未必自带网络效应——法兴的先例表明"信任"不等于"使用"。

从监管看，本周的双轨时点意味深长：CLARITY法案9月15日程序性表决、Arc主网9月16日上线；GENIUS终局规则11月落地、2027年1月全面生效；OCC则用OpenReserve牌照表明态度——"链上结算属于银行业务"。这意味着对加密原生与银行发行方，监管闸门正在同时打开："合规即护城河"将从口号变成可计算的市场份额。对DeFi协议与企业财资团队而言，可选的链上美元/欧元结算轨道正在变多且更可信，跨链与互操作层（Ethereum、Solana）将演化为"围墙花园"之间的结算枢纽。

值得提示的风险同样清晰。Arc采用许可化验证者、$ARC代币兼代治理与质押收益，Circle同时从USDC浮息、网络费与代币收入三条线获利——这种"既当结算层又当发行商又当验证者股权方"的结构，在监管透明度尚在演进的当下值得独立第三方审视。此外，银行联盟与OpenReserve都还未跑通到发行的最后一公里，资本金、跨机构治理与赎回合规依然是2026至2027年的主要变量。下一步可重点跟踪：CLARITY表决结果、Arc上线后USDC迁移量与DTCC代币化时间表、以及银行联盟是否在11月OCC终稿前公开更多技术细节。

## 结论

本周稳定币战场清晰呈现出"结算链+牌照+银行联盟"三线并进的格局：Circle以Arc锁定机构结算基础设施并顺带完成比特币资产布局，21家银行用体量与合规资源追赶发行端，OpenReserve则为"纯加密银行"撕开第一道制度窗口。对从业者，建议把9月15日CLARITY程序性表决与9月16日Arc上线视为联动观察点——无论法案结果如何，机构级稳定币基础设施的破晓时刻已经到来。