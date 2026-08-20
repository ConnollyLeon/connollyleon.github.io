---
layout: post
title: "金融科技动态：Swift区块链账本完成首笔实时交易与代理支付联盟成立"
date: 2026-08-20
author: "云原生观察"
source: "https://www.coindesk.com/business/2026/08/19/hsbc-standard-chartered-execute-first-live-banking-transaction-on-swift-s-24-7-ledger"
categories:
  - fintech
tags:
  - tokenized-deposits
  - swift
  - stablecoin
  - agentic-commerce
  - blockchain
---

# 金融科技动态：Swift区块链账本完成首笔实时交易与代理支付联盟成立

全球银行间金融通信网络迎来历史性时刻——HSBC与渣打银行8月19日通过Swift新区块链账本完成首笔实时跨行交易，使用代币化存款实现跨境实时结算。同日，Rain发起的代理支付联盟（Agentic Payments Alliance）宣告成立，Visa、Mastercard、Fiserv、Circle等超过25家公司加入，为AI智能体驱动的商业交易制定规则。Visa则在Mastercard收购BVNK后寻找新的稳定币结算合作伙伴。

## 主要新闻

### HSBC与渣打完成Swift区块链账本首笔实时跨行交易

HSBC和渣打银行于8月19日宣布，在Swift基于区块链的新账本试点中完成了首笔实时跨行交易。两家银行通过Swift账本交换支付报文，由此产生的债务义务分别记录在HSBC的代币化存款服务（TDS）和渣打的代币化存款基础设施上，Swift账本作为安全编排层对义务进行匹配和净额结算，最终通过现有系统完成清算。该试点源于Swift今年7月的公告，当时17家横跨六大洲的银行——包括Citi、BNP Paribas、BNY、Wells Fargo、UBS、MUFG、DBS和ANZ——签约参与代币化存款24/7支付的实盘测试。HSBC数字货币主管Lewis Sun称这是"代币化存款承诺的里程碑时刻"，展示了银行发行的数字货币如何在保持现有金融生态监管完整性的同时实现跨机构互操作。

**Source:** [HSBC, Standard Chartered execute first live banking transaction on Swift's 24/7 ledger](https://www.coindesk.com/business/2026/08/19/hsbc-standard-chartered-execute-first-live-banking-transaction-on-swift-s-24-7-ledger)

### Rain发起代理支付联盟，Visa、Mastercard等25家企业加入

稳定币支付公司Rain于8月19日宣布成立代理支付联盟（Agentic Payments Alliance），创始成员包括Visa、Mastercard、Fiserv、Circle、Solana、Remitly以及Avalanche、Chainalysis、Fireblocks、Shift4和Uniswap Labs等超过25家支付、金融服务和数字资产公司。联盟将由创始成员共同治理，聚焦三大议题：智能体身份认证与授权标准、欺诈检测机制、以及忠诚度奖励与智能体活动的关联方式。McKinsey预测全球代理商务规模到2030年可达3万亿至5万亿美元，这一前景促使各巨头抢在市场实践碎片化之前建立共同标准。Rain此前已推出Agent Control Layer和Scoped Cards产品，为智能体提供受限、可监控的支付凭证。

**Source:** [Rain launches payments alliance for agentic commerce](https://e-commerce.news/story/rain-launches-payments-alliance-for-agentic-commerce)

### Visa寻找跨四国市场的稳定币结算伙伴

据8月18日披露的机密文件，Visa正在寻找新的稳定币结算和场外交易合作伙伴，要求候选方在美国、加拿大、英国和新加坡四个市场均持有加密货币交易所牌照，并具备多币种兑换、结算服务及Open USD交易处理能力。此举的直接背景是Mastercard于8月3日完成对BVNK的收购（交易价值最高18亿美元）——BVNK原是Visa的稳定币结算伙伴，被竞争对手收入囊中后留下空缺。Visa 8月5日与ZeroHash达成的合作仅覆盖部分市场，无法满足全部牌照需求。Visa同时推出了自有Visa Stablecoin Platform，初始支持资产为由Visa、Mastercard和Coinbase等140多家公司联合支持的Open USD。

**Source:** [Visa seeks stablecoin partner across 4 markets](https://crypto.news/visa-seeks-stablecoin-partner-across-4-markets/)

### Citi年内推出比特币托管服务并整合传统证券平台

据8月18日报道，花旗银行（Citi）计划年内在其投资者服务部门的Custody+平台内向机构客户推出比特币托管服务，使客户能在同一平台查看和管理传统证券持仓与比特币。该服务于统一框架下运行代币与传统证券，已具备实时资产服务、即时结算、流动性工具和"AI驱动市场情报"功能。监管环境的松动是关键推手：OCC已于2025年5月确认银行可提供加密托管服务，GENIUS Act放宽了银行处理稳定币的条件，SEC也以SAB 122取代了加重资本负担的SAB 121。Citi同时在推进代币化存款基础设施，参与了Swift的24小时跨境结算试点和美国清算所计划2027年上半年上线的代币化存款网络。

**Source:** [Citi to launch bitcoin custody service, integrate with stock and bond platform](https://www.digitaltoday.co.kr/en/view/94346/citi-to-launch-bitcoin-custody-service-integrate-with-stock-and-bond-platform)

## 分析

Swift区块链账本的首笔实时交易标志着传统金融基础设施对区块链的态度发生根本转变——从防御性观望转向主动改造自身。传统跨境支付链条中每家银行都需占用流动性，推高成本并拖慢结算；共享账本使借贷同时完成，同时削减两者。值得注意的是Swift的架构选择：它没有用区块链取代现有清算体系，而是让账本充当"编排层"负责匹配和净额计算，最终结算仍走既有系统。这种渐进式路径既保留了监管 oversight 和合规控制，又获得了24/7运营能力，是对"Swift不上链就没有未来"批评的正面回应。渣打高管的判断颇具前瞻性：五年后代币化存款将占据机构批发结算价值的大头，而稳定币则定位于零售汇款和消费支付走廊——两种数字货币形态将长期共存而非零和竞争。

代理支付联盟的成立则揭示了Agentic Commerce的标准化竞赛已经打响。当AI智能体可以代表用户自主完成购买时，现有的授权、风控、争议处理体系全部面临重构：谁来为智能体的错误决策担责？如何防止凭证滥用？Visa和Mastercard同时加入一个由创业公司牵头的联盟而非各自另起炉灶，说明卡网络也意识到在品类定型期建立共识比争夺主导权更紧迫。3-5万亿美元的市场预测固然诱人，但真正的信号是成员构成——从卡网络到公链再到合规基础设施厂商的全产业链参与，意味着代理支付将被视为独立的基础设施层来建设。

Visa被迫寻找新稳定币伙伴一事则暴露了支付巨头的战略软肋：关键基础设施依赖第三方伙伴，而伙伴可能随时被竞争对手收购。Mastercard收购BVNK后，Visa在四国牌照市场的搜索空间已相当有限，这解释了其为何同时推进自营Stablecoin Platform和Open USD联盟——将命运掌握在自己手中。

## 结论

本周动态共同描绘了金融基础设施的三条演进主线：存量网络区块链化（Swift）、新兴交易的标准化（Agentic Payments Alliance）以及巨头间基础设施卡位战（Visa/Mastercard）。对金融机构而言，代币化存款互操作性的验证意味着数字资产战略可以从试点走向生产规划；对支付行业从业者，代理商务标准的窗口期就在未来12-18个月；对所有市场参与者，需要警惕的是基础设施层的并购整合正在改变竞争格局——今天的合作伙伴可能就是明天的对手资产。
