---
layout: post
title: "金融科技动态：Plaid接入Claude、B2B支付向智能体开放与银行智能体化提速"
date: 2026-11-10
author: "云原生观察"
source: "https://plaid.com/blog/plaid-anthropic-financial-insights-in-claude/"
categories:
  - fintech
tags:
  - plaid
  - anthropic
  - agentic-ai
  - b2b-payments
  - digital-banking
---

# 金融科技动态：Plaid接入Claude、B2B支付向智能体开放与银行智能体化提速

金融科技与AI智能体的融合在本周进入消费者侧落地阶段：Plaid正式为Claude的Personal Finance功能提供账户连接能力，美国用户可以在对话中获得基于真实财务数据的洞察；Pliant完成8000万美元C轮融资，专门面向AI智能体开放B2B支付基础设施；BMO则将智能体AI引入信用卡客服流程。个人金融的“智能体化”与B2B支付的“智能体开放”正在同时提速。

## 主要新闻

### Plaid为Claude的Personal Finance功能提供账户连接

Plaid CTO Will Robinson于11月5日宣布，Plaid与Anthropic合作，美国消费者可以在Claude全新的Personal Finance功能中安全连接金融账户，获得更贴合自身情况的对话式财务建议。用户打开Personal Finance标签后，Claude会提示通过Plaid完成账户认证，Plaid负责整理原始交易数据并按需刷新；Claude的访问是只读的，不能移动资金。Plaid调研显示69%的美国消费者在看到明确收益时愿意与AI分享金融信息，半数消费者认为不借助AI管理财务很快会显得过时；通过Plaid连接AI助手的用户中，近三分之二此前从未使用过Plaid支持的理财应用。Anthropic加入了超过800家基于Plaid构建的AI公司行列。

**Source:** [Plaid powers financial insights in Claude](https://plaid.com/blog/plaid-anthropic-financial-insights-in-claude/)

### Pliant完成8000万美元C轮融资，向AI智能体开放B2B支付基础设施

德国B2B支付公司Pliant宣布完成8000万美元C轮融资，目标是把企业支付基础设施开放给AI智能体。随着企业内部越来越多的采购、报销与对账流程由智能体驱动，支付API的权限模型、审批链路与审计日志必须为非人类操作者重新设计。Pliant的融资标志着投资人开始为“智能体经济”的支付底座定价。

**Source:** [Fintech Rundown: A Rapid Review of Weekly News](https://finovate.com/fintech-rundown-a-rapid-review-of-weekly-news-139)

### BMO用智能体AI加速信用卡客户问题解决

加拿大蒙特利尔银行（BMO）于11月6日宣布在其信用卡业务中引入智能体AI，帮助客户更快获得问题解答。BMO将智能体用于客服流程的自动化处理，是大型北美银行把智能体AI从试点推向面向客户生产环境的代表性案例。与此同时，嵌入式金融与BaaS服务商Synctera完成2450万美元融资，显示银行即服务需求在监管洗牌后开始回升。

**Source:** [Fintech Rundown: A Rapid Review of Weekly News](https://finovate.com/fintech-rundown-a-rapid-review-of-weekly-news-139)

### KCB坦桑尼亚将PayPal整合进手机银行应用

肯尼亚商业银行坦桑尼亚子公司（KCB Tanzania）与PayPal合作，将PayPal服务整合进KCB Mobile App，使东非用户可以直接在手机银行内完成跨境收付款。这一合作反映了两个趋势的交汇：非洲移动货币生态与国际支付网络的互联互通加速，以及传统银行把第三方金融科技能力作为模块嵌入自身渠道的平台化策略。

**Source:** [Fintech Rundown: A Rapid Review of Weekly News](https://finovate.com/fintech-rundown-a-rapid-review-of-weekly-news-139)

## 分析

Plaid与Anthropic的合作是“智能体金融”叙事的分水岭：它首次把开放银行的数据管道接到了前沿实验室的消费者级AI产品上。此前AI理财的建议质量受限于用户手动输入的粗糙上下文，而Plaid连接后的Claude看到的是真实的、持续刷新的交易数据——预算规划、债务偿还策略、APR成本分析全部基于实数。值得注意的是Plaid披露的获客结构：近三分之二通过AI助手连接账户的用户从未用过Plaid支持的理财应用。这意味着AI助手正在成为金融数据聚合的新入口，Mint时代的“用户主动找应用”正在被“Claude里顺手连接”取代，数据管道的所有权价值随之上升。

Pliant的C轮融资则指向企业侧的同一趋势的另一面：当智能体开始执行采购与付款，B2B支付的基础设施必须重新设计。现有的企业卡与支付API以人类审批者为假设——发起人有员工身份、审批链有邮件通知、争议处理有人工客服。智能体作为操作者时，每一层都需要改造：机器身份认证、基于策略而非个人判断的实时审批、以及面向审计的完整行为日志。这恰好与本周KubeCon上讨论的智能体身份问题形成呼应：金融科技场景下的智能体身份与权限管理，直接对应资金安全，其标准化的紧迫性比通用云计算场景更高。

从监管视角看，这波智能体金融落地恰逢政策窗口收紧。美国中期选举后，民主党掌控国会，数据隐私与AI监管立法预期升温；Plaid自身调研中69%的消费者数据分享意愿，建立在“看到明确收益”的条件上——这既是开放银行的机会，也是AI金融产品的脆弱性所在。一旦出现智能体误操作的标志性事件，监管反弹可能迅速压缩这一空间。产品设计的当务之急是把只读原则（如Claude的账户访问）、 granular授权与实时撤销能力做扎实。

对从业者而言，本周消息的启示是：金融科技的竞争单位正在从“应用”转向“智能体运行时”。银行要么自己构建智能体渠道（BMO模式），要么开放管道让Claude这样的通用智能体成为前端（Plaid模式），要么重构支付底座服务智能体客户（Pliant模式）。三种路径的共同前提是数据接口、身份与审计三大基础设施的现代化，落后者将发现自己在智能体时代连“被集成”的资格都不具备。

## 结论

Plaid接入Claude、Pliant服务智能体支付、BMO智能体客服共同勾勒出金融服务的下一层抽象：智能体成为金融操作的前端与中台，而账户连接、支付授权与审计合规成为新的基础设施层。未来12个月的关键观察点是消费者信任的持续性——数据分享意愿与实际使用之间的落差，将决定智能体金融是温和演进还是爆发式增长。无论哪种路径，数据管道、智能体身份与可审计的操作日志，都是任何参与者都无法跳过的必修课。
