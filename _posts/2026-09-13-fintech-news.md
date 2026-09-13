---
layout: post
title: "金融科技动态：Coinbase联手Moov把稳定币接入千家社区银行、U.S. Bank USBDC在Stellar完成跨境试点、Ripple进军万亿美元企业财资市场"
date: 2026-09-13
author: "云原生观察"
source: "https://genfinity.io/2026/09/10/us-bank-usbdc-stablecoin-stellar-live-pilot/"
categories:
  - fintech
tags:
  - fintech
  - stablecoin
  - coinbase
  - moov
  - us-bank
  - stellar
  - ripple
  - rlusd
  - treasury
---

# 金融科技动态：Coinbase联手Moov把稳定币接入千家社区银行、U.S. Bank USBDC在Stellar完成跨境试点、Ripple进军万亿美元企业财资市场

稳定币的"银行通道"本周迎来三个高密度信号：Coinbase与支付基础设施公司Moov达成合作，把稳定币受理、结算与实时到账能力打包进中小银行已使用的平台，覆盖1,000余家美国社区银行与信用合作社；资产管理规模约6,830亿美元的U.S. Bank在公开Stellar网络上完成其自有稳定币USBDC的跨大西洋试点，实测了铸造、兑付、冻结与回拨四类受监管控制；Ripple则凭借GTreasury整合后的财资平台，把RLUSD推向年处理量13万亿美元的企业司库管道。稳定币正在从"加密场景的支付工具"演变为"银行司库与清算基础设施的可选组件"。

## 主要新闻 (Main News)

### Coinbase×Moov：稳定币走进1,000+家社区银行，开关一开即用

Coinbase于9月10日与支付基础设施公司Moov达成合作，通过Moov的现有平台向1,000余家美国社区银行与信用合作社提供稳定币受理（acceptance）、链上结算（settlement）与实时到账（real-time funding）能力。技术上，Moov把Coinbase Developer Platform的托管钱包账户与Payments API集成进银行已经在用的系统——社区银行无需自建区块链团队，翻个开关就能让企业客户像收卡付款一样收稳定币，结算从ACH的一到三个工作日压缩到链上分钟级。这笔交易的张力在于CLARITY Act：社区银行一面拥抱稳定币通道，一面担心收益型稳定币会分流其活期存款这一放贷资金池，"稳定币奖励与存款竞争"的立法条款将决定这条通道是便利工具还是存款战争。

**Source:** [Coinbase is putting stablecoins inside 1,000 banks - DailyCoinBrief](https://dailycoinbrief.com/coinbase-is-putting-stablecoins-inside-1000-banks/)

### U.S. Bank在Stellar上完成USBDC跨境试点：冰封/回拨等受监管控制在公链上全生命周期验证

U.S. Bank（按美联储数据资产约6,830亿美元，服务约1,500万客户）于9月9日宣称完成自有美元稳定币USBDC的首笔实时跨境转账：资金在Stellar公开网络上于北美与欧洲实体之间移动，并借此测试了发行的四个核心控制——铸造（mint）、付兑换（redeem）、冻结（freeze）与回拨（clawback）。关键设计在于控制内建在协议层：Stellar Protocol 17（2021年6月）提供的授权可撤销（authorization-revocable）标记允许发行方冻结持币者的trustline，clawback标记允许发行方销毁账户余额，使制裁、欺诈追回与法院命令可在公链上执行，而无须离开开放账本。整条链路通过U.S. Bank自研的Digital Asset Platform（数字资产平台）与其既有财务、风险、合规与运营系统对接，演示了7×24结算能力。银行点名了三个近期应用方向：全球实体的流动性管理、代币化证券的对抵押品移动（collateral mobility）以及企业客户跨境财资运营。对比参照：高盛、花旗、美国银行等21家机构9月1日宣布组建共享稳定币公司、目标2027上半年发行美元稳定币；U.S. Bank选择自建发行方与平台，率先把"公链银行钱"跑通。

**Source:** [U.S. Bank Moves USBDC Stablecoin Live on Stellar in Cross-Border Pilot - Genfinity](https://genfinity.io/2026/09/10/us-bank-usbdc-stablecoin-stellar-live-pilot/)

### Ripple：RLUSD接入13万亿美元企业财资管道，数字资产"到达CFO办公桌"

Ripple财资平台SVP Renaat Ver Eecke表示，基于2025年10月以10亿美元收购GTreasury构建的财资平台，去年已处理13万亿美元的支付量（纯法币口径）；2026年4月1日平台上线原生数字资产账户与Unified Treasury功能后，CFO可在单一仪表盘内以实时估值同时管理RLUSD、XRP与法币。平台连接13,000+家银行、服务1,000+家企业客户（含财富500强）。截至9月10日RLUSD市值约24.2亿美元，分布在Ethereum与XRP Ledger，持有纽约州金融服务局（NYDFS）与迪拜金融服务管理局（DFSA）牌照，储备由纽约梅隆（BNY Mellon）托管。公司调研称72%的财务领导者认为整合数字资产工具对维持竞争优势不可或缺。Ripple的策略是把稳定币"嵌入"而非"替换"企业报名已久的财资工作流，让司库在既有系统中获得新的结算选项。

**Source:** [Ripple stablecoin chief sees $13T opportunity for RLUSD in corporate treasury - CryptoBriefing](https://cryptobriefing.com/ripple-rlusd-13t-corporate-treasury/)

## 分析 (Analysis)

把Coinbase-Moov、U.S. Bank与Ripple放在同一张图里，能清晰看到稳定币渗透的两条路径。第一条是"go-to-market"路径：Coinbase与其他机构做接入层，让银行以最低改造成本拥抱稳定币结算，价值主张是速度（分钟级对账）与增量业务。第二条是"control"路径：U.S. Bank选择自建发行体与公链、并用协议层标志位保留下发方的冻结与回拨能力——它证明受监管的银行货币与开放账本并不冲突，前提是控制内建在发行设计里而非事后补救。两条路径的汇合点在于：记账与结算载体从核心账本转向可编程账本，但货币层级没有改变（USBDC仍是商业银行货币），这让监管者在热衷与警惕之间有一条可操作的中间地带。

U.S. Bank试点对行业的示范意义在于"在公链上做受监管钱"的可行性与边界。测试只在自己的实体之间进行、未涉及客户资金、未披露金额与储备明细，传达的是"先证明能力、再谈产品"的银行级谨慎。而把冻结/回拨写进协议层，正是为了回应监管者最核心的疑问——一旦上了公链，银行如何履行制裁与司法令状义务。这同时说明Stellar这类"为受监管发行者预留控制面"的公链，正在从加密边缘基础设施边际转向机构结算轨道的主流选项。对行业观察者，USBDC是否会从内部工具向外部客户开放、是否披露储备证明与商用时间表，是下一步最重要的指标。

Coinbase-Moov的千家银行通道与CLARITY Act的立法拉锯则把"稳定币奖励"问题摆上台面：银行既想拿到实时结算的效率，又警惕收益型稳定币抽走活期存款。第三方代为运营奖励（而非发行方付息）是否构成GENIUS Act所禁止的"变相付息"，将是监管解释的悬而未决区。Katana等协议同时也在论证：一旦合规稳定币离开发行方托管、被持有人投入独立质押协议，铸金收益便不受发行方行为约束——这意味着"稳定币收益"的合规边界会从发行端扩展到二级市场与DeFi聚合层，监管范围将从"谁发行"延伸到"谁撮合"。

立体来看，本周的稳定币新闻叠加花旗代币化存款、21行联盟等更早动作，指向一个明确的行业节奏：银行稳定币正从"试点叙事的观察期"进入"商用窗口的倒计时"。GENIUS Act生效日期（2027年1月18日或监管规则final后的120天）就在眼前，谁先拥有可运营的发行、风控与公链控制面，谁就在规则落地时拥有先发身位。未来一个季度的四个观测点：Moov通道实际"翻开关"的银行数量、U.S. Bank是否扩展USBDC外部用例、21行联盟的条款细节，以及CLARITY Act对稳定币奖励的最终措辞。

## 结论 (Conclusion)

本周金融科技的图景，是稳定币"接入千家银行、跑通公链全生命周期、抵达CFO桌面"三条线同时加速。Coinbase-Moov做规模化接入，U.S. Bank以协议层控制证明受监管公链货币的可行性，Ripple则把稳定币嵌入企业级财资主流程。它们共同说明：稳定币赛道的下一阶段竞争不是"发行更多币"，而是"谁能把合规控制、结算速度与银行/企业工作流无缝缝合"。对银行与CFO，现在正是把稳定币纳入结算与流动性方案评估、同时盯紧CLARITY/GENIUS细则的最佳时点。