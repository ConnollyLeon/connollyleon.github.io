---
layout: post
title: "金融科技：新加坡MAS推出了解你的智能体协议，代币化票据与跨境代币存款同步落地"
date: 2026-11-20
author: "云原生观察"
source: "https://www.businesstimes.com.sg/companies-markets/mas-lays-groundwork-ai-agents-make-payments-manage-funds-proposed-safeguards"
categories:
  - fintech
tags:
  - fintech
  - singapore
  - mas
  - tokenization
  - cbdc
  - ai-agents
---

# 金融科技：新加坡MAS推出了解你的智能体协议，代币化票据与跨境代币存款同步落地

11月19日的新加坡金融科技节成为全球代币化金融的焦点：MAS提出"Know Your Agent"（KYA）协议，为AI智能体进入金融服务建立身份与授权框架；1亿新元代币化国库券以批发CBDC完成结算；蚂蚁国际在MAS BLOOM倡议下推出代币化存款与货币市场基金的实时结算协议；渣打则把代币化存款扩展到新加坡与香港之间的近实时转账。智能体金融与可编程货币的基础设施在同一天成形。

## 主要新闻

### MAS拟推Know Your Agent协议，为智能体支付设定身份与权限边界

《商业时报》11月19日报道，新加坡金融管理局（MAS）总经理Chia Der Jiun在Singapore FinTech Festival上宣布，将推动"Know Your Agent"协议，帮助金融机构在智能体代表客户发起交易前判定其身份、权限与委托范围。Chia明确表示不建议用户把金融账户登录凭据交给个人智能体，因为安全性不足；协议将促成客户智能体与金融机构之间的可信信息交换，让机构决定允许智能体开展哪些交易、在什么条款下进行。该协议承接MAS今年早些时候发布的《Safeguards for Agentic Finance at Runtime》白皮书：在企业财资场景中，银行可允许智能体监控流动性状况与到期应付款并决定资金调拨方向，企业设定委托边界，银行设定控制措施与接受单条指令的条件。MAS同日发布Guardian代币化抵押品框架，并更新资本市场产品代币化指引。

**Source:** [MAS lays groundwork for AI agents to make payments, manage funds with proposed safeguards](https://www.businesstimes.com.sg/companies-markets/mas-lays-groundwork-ai-agents-make-payments-manage-funds-proposed-safeguards)

### MAS以批发CBDC完成1亿新元代币化国库券发行

MAS官方11月19日公告，已于11月6日在新加坡元测试网络上原生发行1亿新元、四周期限的代币化MAS Bills，并以批发央行数字货币（CBDC）结算，12月4日到期。五家一级交易商参与拍卖——DBS、汇丰新加坡分行、OCBC、渣打新加坡分行与UOB，认购金额超过发行规模两倍；原生发行免去了代币与单独所有权记录的核对。MAS将把新加坡元测试网络更名为SG Digital Ledger，2027年邀请更多金融机构参与实盘试验，并把代币化票据的用途扩展到抵押品管理。Chia在同日主题演讲中表示，下一步将把外国政府证券与货币市场基金等常用抵押品纳入代币化范围。

**Source:** [MAS Announces Successful Issuance of Tokenised MAS Bills on the Singapore Dollar Test Network Using Wholesale CBDC](https://www.mas.gov.sg/news/media-releases/2026/mas-announces-successful-issuance-of-tokenised-mas-bills-on-the-singapore-dollar-test-network)

### 蚂蚁国际在BLOOM框架下推出Whale Orchestration Protocol

The Block 11月19日报道，蚂蚁国际发布Whale Orchestration Protocol，作为其区块链批发结算平台WhaleRTP的升级，在新加坡MAS的BLOOM倡议下实现代币化存款与代币化货币市场基金之间的券款对付（DvP）结算。公司称该协议可释放即时流动性，让闲置资金实时投入收益资产；目前已与DBS的Treasury Tokens及Franklin Templeton的代币化货币市场基金完成试点交易，双方方案已接入WhaleRTP。MAS于2025年10月启动BLOOM倡议，研究使用代币化银行存款与稳定币进行结算的可行路径。

**Source:** [Ant International launches protocol for real-time settlement between tokenized deposits and money market funds](https://www.theblock.co/news/business/2026-11-19-ant-international-protocol-tokenized-assets-443586)

### 渣打把代币化存款扩展到新加坡—香港近实时转账

渣打银行11月19日宣布扩展其自建区块链基础设施上的代币化存款方案，实现新加坡与香港之间的近实时交易，支持SGD、HKD、USD、EUR、CNH与GBP等多币种，面向企业财资、银行、投资平台与数字资产机构的集团内流动性管理，并计划逐步扩展至更多市场。同日，StraitsX、OCBC与渣打在MAS的BLOOM倡议下完成跨银行代币化存款互操作概念验证：使用StraitsX的共享结算基础设施协调支付发起、合规筛查、流动性检查与结算，在常规银行营业时间之外完成美元支付，结算时间以分钟计，并展示了降低双边预存资金需求的潜力。

**Source:** [Standard Chartered expands tokenised deposits in Singapore](https://www.sc.com/en/press-release/301703/)

## 分析

KYA协议的意义，在于它把"智能体支付"从产品问题变成了身份与授权问题。此前的行业实践要么让用户交出账户凭据（风险极高），要么让智能体以完全独立的身份运行（机构无法判断它的委托来源）。KYA试图在两者之间建立一条可验证的信息通道：智能体是谁、代表谁、被授权做什么。这与云时代的服务身份与授权范围设计逻辑类似，但金融场景把"委托链"写进了监管要求。对银行而言，真正的挑战不是识别智能体，而是把每个智能体指令映射到现有账户、限额与责任体系；对智能体平台而言，则需要把身份与授权作为运行时的一等公民，而不是事后追加的日志字段。

代币化侧的三条消息构成了一条完整的抵押品管线：原生发行代币化票据、用批发CBDC做券款对付结算、再用代币化存款完成跨行与跨境支付。它与传统证券结算的最大差别不是"更快"，而是消除对账与中介环节——MAS明确强调原生发行避免了代币与所有权记录的核对。当票据可以作为隔夜借贷抵押品在同一网络上流转时，货币市场与银行间市场之间的边界开始被可编程资产重新划分。DBS的评论也点出关键：基础设施稳健后，二级市场流动性与交易活跃度才可能真正形成。

对金融机构和 fintech 厂商来说，需要看清两道门槛。第一是互操作性：不同银行各自发行的代币化存款若不能互通，规模效应就无法出现，StraitsX的PoC正是在验证共享结算层能否连接孤立网络。第二是法律确定性：代币化资产的可执行性、抵押品处置、跨境监管协同，都不是技术问题，而SG Digital Ledger和Guardian框架试图解决的正是这些操作标准。新加坡把央行、商业银行、资管机构与支付基础设施放在同一试验网络里，本质上是在用监管沙盒换取标准制定的先发位置。

从全球视角看，这套组合与美欧的AI监管路径形成对照：美国更关注AI融资的市场风险与芯片出口管制（见同期政策动态），欧洲强调数据主权与模型安全，新加坡则选择从金融交易场景切入，用"运行时防护＋可编程结算"建立事实标准。对中国金融科技出海团队而言，KYA协议与BLOOM互操作规范值得跟踪，因为它们很可能成为跨境智能体收款与机构代币化结算的准入条件。

## 结论

11月19日的新加坡给出了一套可复制的智能体金融配方：先定义身份与委托边界，再建立原生代币化资产与CBDC结算底座，最后用跨行互操作把孤岛连成网络。短期看，KYA协议的具体字段与银行接入方式、2027年SG Digital Ledger实盘试验的参与名单，是判断进展的两个观测点；中长期看，"人类经济＋智能体经济"并存的格局，将迫使支付、财资与合规系统同时支持两种速度的指令。
