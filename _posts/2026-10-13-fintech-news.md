---
layout: post
title: "金融科技动态：Aptos隐私功能上线、俄罗斯Sberbank获准提供加密货币交易服务"
date: 2026-10-13
author: "云原生观察"
source: "https://www.tradingview.com/news/coinmarketcal:40075967b094b:0-aptos-keyless-accounts-confidential-apt-and-encrypted-mempool-go-live-13-oct-2026/"
categories:
  - fintech
tags:
  - fintech
  - blockchain
  - cryptocurrency
  - aptos
  - sberbank
  - russia
  - privacy
  - regulation
---
# 金融科技动态：Aptos隐私功能上线、俄罗斯Sberbank获准提供加密货币交易服务

过去24小时，金融科技领域在区块链隐私技术和加密货币监管方面均取得重要进展。Aptos主网上线Keyless Accounts（无密钥账户）、Confidential APT（隐私APT转账）和Encrypted Mempool（加密内存池）三项可选隐私功能；俄罗斯央行正式将Sberbank纳入加密货币交易服务许可机构名单，Sberbank计划于12月1日推出首批加密产品。这些动态反映出公链正持续探索合规可控的隐私增强方案，同时部分国家在监管框架下逐步开放传统金融机构参与加密生态。

## 主要新闻

### Aptos主网上线三层隐私功能

Aptos于10月13日正式在主网上线三项隐私相关功能，全部为可选（opt-in）能力：

- **Keyless Accounts（无密钥账户）**：解决身份可追溯问题，允许用户通过现代身份验证方式（如Passkeys）访问账户，而非依赖传统私钥管理。
- **Confidential APT（保密APT）**：为APT原生代币提供金额隐私保护，在链上隐藏转账金额信息。
- **Encrypted Mempool（加密内存池）**：对待处理交易的意图（transaction intent）进行加密，防止交易在待确认状态下被MEV机器人等前置识别和抢跑。

这三项功能分别从"身份"（who）、"金额"（how much）、"意图"（what）三个维度增强链上隐私。用户可通过Petra Wallet和Confidential Assets Web等界面使用Confidential APT。Aptos方面强调这些功能是模块化、可选的设计，旨在满足机构用户对隐私的需求。

**Source:** [Aptos: Keyless Accounts, Confidential APT and Encrypted Mempool go live - 13 Oct 2026](https://www.tradingview.com/news/coinmarketcal:40075967b094b:0-aptos-keyless-accounts-confidential-apt-and-encrypted-mempool-go-live-13-oct-2026/)

### 俄罗斯央行批准Sberbank提供加密货币交易服务

据Interfax报道，俄罗斯央行已将Sberbank纳入授权组织注册名单，准许其提供数字货币兑换服务。Sberbank早前已于10月初进入数字存托注册机构名单。该行计划于12月1日通过现有客户平台（SberBank Online、SberInvestments、SberBusiness等）推出首批加密产品，初期预计支持比特币（BTC）、以太坊（ETH）、USDT等资产。

根据俄罗斯新监管框架，自9月1日起生效的加密交易规则允许注册交易所自有资金买卖数字货币，并对投资者准入做出区分：非合格投资者年度购额上限30万卢布，合格投资者无此限制。同时框架保留"禁止日常商品和服务用加密支付"的原则，但允许出口商和进口商在跨境结算中使用加密货币，无金额限制。莫斯科交易所（MOEX）也计划于12月1日启动加密交易。

值得注意的是，Sberbank自2022年4月起已被美国财政部OFAC列入全面制裁清单（EO 14024）。OFAC明确表示制裁义务同样适用于数字货币交易，U.S.人员及受管辖主体不得与被制裁主体进行未经授权的交易，境外主体若促使U.S.人员违反制裁或规避制裁亦可能触犯相关规定。

**Source:** [Sberbank wins Russia’s approval for crypto exchange services](https://cryptovista.info/sberbank-wins-russias-approval-for-crypto-exchange-services/)

## 分析

本周金融科技新闻呈现出两条并行但方向迥异的趋势：一方面是公链技术向"隐私增强"演进，另一方面是主权国家在受地缘政治影响下探索受监管的加密货币准入路径。

首先，**Aptos的"三层隐私"设计体现了公链隐私技术的务实转向**。过去几年，完全匿名的隐私币（如Monero）在合规审查下日益承压。Aptos选择"可选"、"模块化"的隐私增强方案：Keyless Accounts降低私钥丢失和钓鱼风险的同时也改变了身份模型（从"自我托管密钥"向"可验证凭证"过渡）；Confidential Transfers隐藏金额但仍保留可审计性潜力（取决于具体实现和密钥管理）；Encrypted Mempool则直击MEV最显著的信息泄露环节。这种"选择性隐私"（selective privacy）更有可能获得机构和合规团队的接受度，也为未来与监管需求（如可疑交易报告、合规取证）之间寻找平衡点留出了空间。

其次，**无密钥账户反映了Web3身份向Passkeys等主流身份标准靠拢**。将账户访问绑定到生物识别/设备凭证，不仅改善用户体验（UX），也与传统金融的身份认证思路趋同。但也带来新的权衡：密钥丢失风险降低的同时，依赖设备厂商、平台提供方或认证服务的集中性风险上升。如何在去中心化与实用性间平衡，将是关键设计考量。

第三，**俄罗斯通过"受监管准入"将国有大行引入加密生态**。Sberbank获批交易服务，是俄罗斯在2022年后持续构建加密监管框架的延续。与完全禁止不同，俄罗斯选择限定参与主体（持牌交易所/存托）、限定投资者范围、保留法币支付禁令但开放跨境结算的"有限开放"模式。这种路径既试图将加密活动纳入可监管轨道、减少地下交易，也为受制裁背景下的跨境资金流动探索替代方案。

第四，**地缘政治深刻影响加密政策走向**。Sberbank被美国OFAC制裁的现实意味着，即使俄罗斯国内监管框架允许，该行开展的加密交易服务也将面临极高的合规复杂度。任何涉及U.S.人员、U.S.基础设施（交易所托管、支付通道、云服务等）的交互都可能触发制裁风险。国际加密服务商、托管方、跨链桥等基础设施提供方在决定是否与俄国有机构合作时，必须谨慎评估二级制裁风险。这种"监管分裂"（regulatory fragmentation）正日益成为加密全球化的现实障碍。

第五，**隐私技术与合规需求持续博弈**。Aptos上线隐私功能的同时，全球范围内反洗钱（AML）和交易透明度要求持续收紧（如FATF Travel Rule在多国落地）。"加密内存池"等技术确实能减少前置交易信息暴露，但交易最终仍要上链。合规框架是否会要求交易所、托管方等中介在使用这类隐私功能时采取额外尽职调查，仍有待观察。技术创新与合规演进之间的动态平衡将长期存在。

## 结论

短期来看，**Aptos的隐私功能上线值得关注采用率**。关键指标包括：Confidential APT日活转账量、Keyless账户创建数以及钱包集成深度。若机构用户开始试用，将验证"选择性隐私"路线的市场接受度。

中期来看，**俄罗斯模式或在部分受制裁/监管审慎国家被效仿**。但能否真正落地规模化交易，取决于基础设施可用性（国际托管、流动性）、制裁规避风险预期以及国内投资者需求。美欧监管机构对该模式的回应也值得密切跟踪。

长期来看，**隐私与可追溯性将持续演化**。公链隐私技术正从"全匿名"转向"可控隐私"（privacy with guardrails），试图兼顾用户隐私权与合规义务。未来是否会出现"可审计加密"（如零知识证明配合受控密钥托管）的行业共识，将对DeFi和机构入场产生深远影响。

对于从业者而言，建议关注：1）Aptos隐私功能的技术实现细节及其对链上分析的影响；2）各国对"加密交易所持牌"模式的差异及跨境合规风险；3）OFAC等制裁机构针对加密基础设施的最新执法动向。