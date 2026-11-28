---
layout: post
title: "金融科技：代理支付、银行主导稳定币与A2A结算信任层"
date: 2026-11-28
author: "云原生观察"
source: "https://truelayer.com/newsroom/announcements/papa-johns-truelayer-agentic-pay-by-bank/"
categories:
  - fintech
tags:
  - agentic-commerce
  - open-banking
  - stablecoins
  - payments
  - regulation
---

# 金融科技：代理支付、银行主导稳定币与A2A结算信任层

11月27日前后的金融科技新闻集中在支付信任基础设施：英国出现由银行应用授权、带有硬性限额的代理式Pay by Bank案例；韩国监管方案要求银行在韩元稳定币发行体系中占主导；行业会议则把代理到代理支付的结算和身份验证推到前台。支付体系正在为机器代理重构授权边界。

## 主要新闻

### TrueLayer与Papa Johns完成英国代理式Pay by Bank支付案例

TrueLayer 11月27日宣布，与Papa Johns及英国银行合作展示代理式Pay by Bank支付流程。该案例允许消费者把银行账户连接到AI代理完成订餐和付款，同时由用户先在银行侧设定支出上限，任何代理都不能突破该限制；最终授权仍在银行应用中完成，代理不接触用户银行凭证。TrueLayer称这是面向英国大型零售商的代理式Pay by Bank支付案例，并首次使用Lloyds和NatWest的可变重复支付API支持代理支付。项目在英国FCA Supercharged Sandbox中进行，相关发现已于11月26日的监管展示活动向FCA和行业分享。

**Source:** [Papa Johns and TrueLayer partner with UK banks to demonstrate checkout agent Pay by Bank](https://truelayer.com/newsroom/announcements/papa-johns-truelayer-agentic-pay-by-bank/)

### 韩国FSC正式提出银行控股过半的韩元稳定币方案

The Paypers 11月27日报道，韩国金融服务委员会提出数字资产基本法框架下的韩元稳定币方案。核心要求是银行财团合计持有发行人超过50%股权，数字资产平台运营商原则上持股上限为20%，经监管批准可提高至34%。发行人最低资本为50亿韩元，储备资产需覆盖流通代币100%，用户可随时赎回，并接受月度储备审计，持有人不得获得利息。未经批准的境外发行人不能通过本地分支进入韩国市场，相关措施仍需立法程序。韩国央行关注外汇与资本管制风险，FSC则强调金融创新与投资者保护之间的平衡。

**Source:** [South Korea's FSC formally proposes bank-majority won stablecoins](https://thepaypers.com/crypto-web3-and-cbdc/news/south-koreas-fsc-formally-proposes-bank-majority-won-stablecoins)

### Ant International提出四party支付需演进到A2A与KYA信任层

Fintech Singapore在新加坡金融节2026期间报道，Ant International的Peng Yang表示，随着代理到代理支付与代币化资产增长，传统四方支付模型需要演进。现有卡组织、收单、发卡与商户之间的信任模型主要围绕人和机构设计，而代理支付要求系统知道是谁的代理、被授权做什么、可动用多少资金以及违规如何追责。文章把Know Your Agent视为关键控制点，并介绍Ant International区块链财资平台已连接23家银行，12个月结算规模达到1.1万亿美元。其观点是，区块链只是结算管道，真正的难点在合规机制、业务规则和资产真实性。

**Source:** [Ant International charts four-party payments evolution toward agentic commerce](https://fintechnews.sg/142091/payments/agentic-commerce-trust-layer-ant-international-peng-yang)

## 分析

TrueLayer案例说明代理支付的信任边界正在回到银行。代理可以发起购物与付款，但资金授权仍由银行应用确认，支出上限成为机器无法绕过的硬约束。这比让代理持有卡片凭证更安全，也更容易接入现有消费者保护机制。银行与开放银行API提供商可能因此成为代理商务的关键守门人。

韩国稳定币方案体现了另一种主权逻辑：代币化支付不能被少数平台或非银机构主导。要求银行控股过半、储备审计和随时赎回，本质是把稳定币纳入既有金融审慎框架。对跨境支付机构和加密平台而言，进入韩国市场不再只是技术问题，而是股权结构、牌照与储备透明度问题。

Ant International提出的KYA把身份治理扩展到非人主体。A2A支付要规模化，必须解决代理身份、授权范围、委托链、撤销和责任归属；否则即使结算速度很快，欺诈与争议处理也会吞掉效率收益。区块链财资网络的高结算规模说明后台基础设施已具备一定能力，但前台的授权语义仍需标准化。

接下来应观察FCA是否把代理支付纳入更明确的消费者保护规则、韩国立法是否保留银行主导要求，以及银行卡网络、开放银行和稳定币发行方是否会共同形成代理支付标准。谁掌握授权与责任链，谁就可能在下一阶段支付基础设施中占据核心位置。

## 结论

代理商务不是简单让AI点击结账按钮，而是把支付授权、限额、身份验证和结算责任重写为机器可读规则。当天案例显示，银行、开放银行网络与受监管稳定币体系正在成为代理支付的可信底座。
