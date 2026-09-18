---
layout: post
title: "金融科技动态：Column将Solana设为稳定币银行服务默认结算网络、BitGo启动Arc集成且Robinhood扩大USDC支持、Arc链上活跃度初现"
date: 2026-09-18
author: "云原生观察"
source: "https://solanafloor.com/news/column-makes-solana-the-default-network-for-stablecoin-banking"
categories: [fintech]
tags: [fintech, stablecoin, solana, column, default-network, usdc, arc, circle, bitgo, robinhood, custody, settlement, banking-rails, onchain-finance]
---

9月16日至17日，机构稳定币的两条主线并行推进。一层是"结算网络的默认化"：API优先的银行基础设施公司Column于9月中旬宣布把Solana设为稳定币银行服务的默认网络——对一家以"法币与稳定币之间的银行直连"为卖点的公司而言，这是Solana继成为USDC原生结算层后，再一次进入银行级工作流的转折点；另一层是"机构链生态的扩容"：BitGo于9月17日在Circle的Arc主网上启动集成，Robinhood亦同步宣布扩大对Arc上USDC的支持，把托管熊的机构流动性接进这条以合规结算自居的区块链。与此同时，Arc主网首周的数据指标——接近650万枚USDC在链、约7290万美元的DEX单日成交量与57万笔日交易量——开始为"机构链"叙事提供真实读数。

## 主要新闻 (Main News)

### Column把Solana设为稳定币银行服务的默认网络：银行级工作流向高性能链靠拢

据SolanaFloor报道，API优先的银行基础设施公司Column把Solana设为稳定币银行服务的默认结算网络。Column的定位是为银行与金融科技公司提供"法币—稳定币"之间的银行通道：客户用其API开立银行账户、执行ACH/电汇与跨货币的结算，而稳定币组件则让资金在链上流动。选择Solana作默认网络，意味着使用Column稳定币服务的银行/企业工作流（B2B付款、工资发放、财资管理乃至DeFi接入）将默认路由到Solana结算——这与Solana作为USDC最大链上结算层的地位一脉相承：高吞吐、低费用与成熟的SPL资产标准，使它成为"批量、高频、低成本"的美元稳定币转账场景的自然选择。对行业的意义在于，继Circle把USDC的"官方结算语境"与Solana绑定之后，一家直接面向持牌机构的银行基础设施公司将"默认网络"绑定Solana，进一步把"稳定币=连锁抽象、需要桥接"的旧心智，替换为"稳定币在该网络上原生可结算"的新默认。

**Source:** [Column makes Solana the default network for stablecoin banking](https://solanafloor.com/news/column-makes-solana-the-default-network-for-stablecoin-banking)

### BitGo启动Arc集成、Robinhood扩大USDC支持：机构托管与零售通道同步进场

9月17日，BitGo宣布在Circle的Arc主网上线集成，同时Robinhood宣布扩大其对Arc上USDC的支持。BitGo作为老牌机构级托管与结算服务商，其Arc上线意味着机构客户可以在Arc账本上获得托管级的USDC结算能力；Robinhood扩大USDC支持，则把面向零售用户的加密进出金通道与Arc的合规稳定币连接起来。两条动作叠加在Arc主网上线仅数日的时点上，强化了Circle"机构验证者账本"叙事的运营底座：BlackRock、DTCC、Visa、Mastercard等机构验证者之外，托管商（BitGo）与零售经纪（Robinhood）的接入，让USDC在Arc上的'发行—托管—交易—结算'闭环从纸面变为可运行。对于正在评估是否把稳定币资产迁移到Arc网络的企业，BitGo托管与美国头部经纪商流通性的双重背书，降低了'机构链流动性不足'的最大顾虑。

**Source:** [BitGo and Robinhood Expand USDC Support on Arc](https://www.gate.com/news/detail/bitgo-and-robinhood-expand-usdc-support-on-arc-24340012)

### Arc首周链上数据初步成型：DEX日成交约7290万美元、链上USDC约649万枚

随着Arc主网上线进入首周，链上活跃数据开始提供"机构链"叙事的第一份实测读数：据网络观察数据，Arc链上现托管约649万枚USDC与约700万枚欧元稳定币EURC，DEX单日成交额约7290万美元，日交易量约57.4万笔。客观看待，这些数字与Solana/Ethereum生态相比仍属早期——尤其存量资产（650万枚USDC）说明该网络的'口袋里资金'尚在起步阶段；但DEX日成交与数十万级日交易笔数，对于一个上线即主打机构结算、慢新闻多于空投炒作的联盟式网络而言，已经证明存在真实的链上需求。关键观察点在于增长斜率：如果未来数周BitGo托管与Robinhood的零售通道能把USDC流入转化为持续的撮合流动性，Arc的数据曲线将与"只有叙事没有活跃"的其他机构链形成区分。

**Source:** [Column makes Solana the default network for stablecoin banking](https://solanafloor.com/news/column-makes-solana-the-default-network-for-stablecoin-banking)

## 分析 (Analysis)

Column把Solana设为默认网络，是稳定币叙事从"可以用"走向"默认即如此"的又一信号。作为一家以银行为服务对象的API基础设施公司，Column的选择具有路径塑造意义：当银行集成Column时，它们不会去问"该选哪条链"，而是直接获得Solana上的稳定币结算能力——默认值再次战胜了选择。这与昨天观察到的Nasdaq Verafin×Stablecore（链上合规与银行核心系统打通）共同指向同一方向：稳定币正在被"去抽象化"，由基础设施公司替终端用户与银行做掉"链的选择与桥接"，让其成为一个如ACH一般透明、但更快更开放的资金通道。Solana在此获得的是'卡位'收益：默认结算层的身份一旦确立，卷土重来的竞争将很难撼动其存量工作流。

Arc生态的BitGo与Robinhood扩容则为另一条路线提供样本——'合规优先的机构链'。Arc主网上线仅数日便集齐托管商与零售经纪，说明Circle的验证者阵容（BlackRock、DTCC、Visa、Mastercard、ICE）之外，市场把'谁在链上结算'看得比'谁能挖空投'更重。首周数据里，649万枚USDC的存量规模提示我们：Arc的挑战不在于技术叙事，而在于'口袋里资产'的积累速度——机构资产迁移是缓慢的合规过程，日后的USDC净流入与DEX深度，将比首日流量更说明问题。

把两条主线并置，可以勾勒出2026年稳定币的'双轨结构'：一遍是Solana式的'高性能、低成本、面向批量美元转账的结算轨道'，由Column这类银行基础设施把默认值定下；另一边是Arc式的'机构验证者、合规叙事、托管级结算轨道'，由BitGo/Robinhood补足流动性毛细血管。对金融科技从业者，选型的注脚已经清晰：高频大体量的资金移动流向Solana默认层，而需要监管透明与机构对手方信任的结算场景则押注Arc——两轨并行，而不是二选一。

## 结论 (Conclusion)

过去48小时的稳定币动态浓缩为两个词：默认化与差异化。Column将Solana设为稳定币银行服务的默认网络，延续了Solana作为USDC原生结算层的地位，把"选链"从银行决策变成基础设施默认；BitGo接入Arc、Robinhood扩大USDC支持，加上Arc首周约7290万美元DEX日成交与约649万枚USDC存量，为"机构验证者链"提供了首批实测数据。对跟踪者而言，下一个关键节点是把BitGo托管与Robinhood通道纳入观察坐标——看它们能否在数周内把Arc的链上USDC从数百万枚推向更可观的存量，从而验证'机构链＋合规结算'路线在真实资金迁移中的成色。