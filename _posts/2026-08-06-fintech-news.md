---
layout: post
title: "金融科技动态：Cloudflare为AI Agent推出加密钱包、BIS代币化跨境支付试点与Corpay Agent Card"
date: 2026-08-06
author: "云原生观察"
source: "https://blog.cloudflare.com/wallets/"
categories:
  - fintech
tags:
  - cloudflare
  - ai-agents
  - stablecoins
  - wallets
  - x402
  - bis
  - tokenized-payments
  - corpay
  - agent-payments
---

# 金融科技动态：Cloudflare为AI Agent推出加密钱包、BIS代币化跨境支付试点与Corpay Agent Card

AI Agent经济的基础设施迎来密集布局。Cloudflare推出"Cloudflare Wallets"与cloudflare.pay，让AI Agent获得稳定币钱包与永久网络身份；国际清算银行（BIS）牵头的代币化跨境支付试点由28家银行完成约100万美元结算；Corpay推出面向AI Agent的虚拟卡产品Agent Card。三者从身份、结算与支付工具三个层面，为"机器经济"搭建金融底座。

## 主要新闻

### Cloudflare推出Wallets：AI Agent获得稳定币钱包与永久网络身份

Cloudflare于8月4日发布"Cloudflare Wallets"及配套的cloudflare.pay服务，为AI Agent构建原生支付身份。每位Agent可获得一个稳定币钱包，以及一个以cloudflare.pay注册的永久网络地址ID（wallet handle）——Agent可以在其网页地址与钱包之间建立稳定绑定，实现"账户即身份"。底层采用x402协议（基于HTTP的机器对机器支付协议），将常规HTTP请求转化为可结算的支付通道，使Agent能够自主为API调用、内容订阅与算力等资源付费。安全层面，Cloudflare设计了双层护栏：Agent的支出设有额度上限，同时仅允许向白名单内的商户付款，防止Agent在自主执行中被诱导或恶意利用。Wallet handle注册现已开放，Cloudflare将其定位为"让机器能够在互联网上拥有支付能力"的基础设施——互联网的下一批用户将不是人类，而是Agent。

**Source:** [Cloudflare Wallets: Bank accounts for the machines](https://blog.cloudflare.com/wallets/)

### BIS代币化支付试点：28家银行在约80秒内完成100万美元结算

据The Paypers报道，国际清算银行（BIS）牵头的代币化跨境支付试点取得关键进展：包括摩根大通、花旗、瑞银在内的28家银行，通过代币化方式完成了约100万美元的跨境支付结算，30笔交易在约80秒内全部完成。该试点验证了代币化结算在速度、透明度与互操作性上的潜力——传统跨境支付通常需要数天，而基于共享账本或代币化存款的路径可将结算压缩至秒级。此次试点是BIS延续多年的代币化支付实验的最新一站，参与机构覆盖欧美主要商业银行，其技术验证结果将为各国央行与商业银行在批发层面的代币化结算提供实证依据。

**Source:** [28 banks settle USD 1M in BIS tokenised payments pilot](https://thepaypers.com/fintech/news/banks-settle-usd-1-mln-in-bis-tokenised-payments-pilot)

### Corpay推出Agent Card：面向AI Agent的B2B支付虚拟卡

支付公司Corpay（CPAY）推出面向AI Agent的虚拟卡产品"Agent Card"，专为机器自主发起支付场景设计。适用场景包括供应商付款、广告投放与采购等B2B支付流程——当企业内的AI Agent自主完成采购下单或营销执行时，Agent Card为每一笔机器发起的交易提供独立的支付通道。产品内置支出与风险控制（额度、商户范围与审批流）及完整审计追踪，满足企业财务对可追溯性的要求。Corpay表示，Agent Card的差异化在于将企业级卡控体系直接延伸到"机器雇员"，与Stripe、Adyen、PayPal等相继推出的Agent支付产品展开直接竞争。随着企业将更多运营环节交给Agent，B2B支付的"机器侧"正成为支付机构争夺的新战场。

**Source:** [Corpay launches 'Agent Card' for AI agents](https://finance.yahoo.com/technology/ai/articles/corpay-cpay-launches-agent-card-140641324.html)

## 分析

本周的金融科技新闻围绕同一主题展开：当AI Agent成为互联网与企业流程的新"客户"，支付基础设施必须为机器重建。

Cloudflare Wallets的进路最为底层。与银行系Agent卡或支付机构的商户方案不同，Cloudflare从"网络身份层"切入——Agent的永久网络地址与稳定币钱包绑定，意味着支付能力被内嵌进Agent与Web交互的基础协议之中。x402协议将HTTP请求变成可计价、可结算的资源调用，这与Cloudflare作为Web基础设施商的禀赋高度契合：机器支付不再是独立产品，而是网络协议的延伸。对开发者而言，其意义在于Agent无需申请银行账户即可"拥有"支付能力，但同时"支出上限+商户白名单"的双层护栏也承认了Agent自主支付的风险——机器越界正是支付机构普遍担忧的核心问题。

BIS试点则代表了机构侧的方向：28家银行、约80秒完成百万美元级结算，验证的是"批发结算层"的改造。它与昨日报道的富国银行代币化存款、Mastercard-BVNK收购形成呼应——稳定币与代币化存款的竞赛正在结算基础设施层面同时推进。BIS的背书意味着代币化结算正从单家银行的实验，走向多家机构共享的行业标准尝试，其互操作性与监管可接受性将是落地关键。

Corpay Agent Card代表的是"企业财务合规"视角。机器发起的B2B支付必须满足审计、控额与风控要求，Corpay将卡控体系延伸到机器身份，本质是把Agent当作"持卡的机器雇员"来治理。这也反映出支付行业的判断：Agent支付不会是少数科技巨头的专属，而是所有接入Agent化运营的企业都会产生的普适需求，围绕"机器支出的治理"将衍生出巨大的合规工具市场。

三层架构叠加可见，机器经济的金融底座正在以"身份层（Cloudflare）、结算层（BIS/银行）、工具层（Corpay）"的形态同步成形。真正的瓶颈不在技术，而在互操作性——Agent如何在不同钱包、不同结算网络、不同卡产品之间自由切换并保持合规，将是下一阶段竞争的焦点。

## 结论

Cloudflare的Agent钱包、BIS的28家银行试点与Corpay的Agent Card，分别从身份、结算与工具层面为AI Agent经济搭建金融基础设施。对金融科技从业者而言，2026年下半年应关注x402等机器支付协议的标准化进程、BIS试点向生产级结算的转化，以及Agent支付合规工具的市场机会。

