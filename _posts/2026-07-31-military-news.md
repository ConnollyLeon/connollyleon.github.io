---
layout: post
title: "CoreWeave与Leidos建设高度机密的AI云，AWS和Anduril将云端算力推至战术边缘"
date: 2026-07-31
author: "云原生观察"
source: "https://www.prnewswire.com/news-releases/leidos-and-coreweave-collaborate-to-accelerate-delivery-of-ai-capabilities-for-defense-national-security-and-intelligence-missions-302838710.html"
categories:
  - military
tags:
  - coreweave
  - leidos
  - classified-cloud
  - anduril
  - AWS
  - edge-computing
  - military
  - AI
---

# CoreWeave与Leidos建设高度机密的AI云，AWS和Anduril将云端算力推至战术边缘

本周军事科技领域迎来两项重大合作：CoreWeave与Leidos宣布联合建设面向美国情报界（IC）和战争部（DoW）的机密级AI云基础设施；同时AWS与Anduril的Menace-I战术边缘数据中心正加速部署至实战环境。军用AI的算力基础设施正从企业级商业云向主权级、可部署于最前线的战术云演进。

## 主要新闻

### CoreWeave与Leidos合作：为美国情报界和战争部建设主权AI云

CoreWeave（Nasdaq: CRWV）与Leidos（NYSE: LDOS）于7月30日宣布合作，为美国情报界和战争部提供安全的"主权AI云服务"。CoreWeave将将其AI原生云平台部署在SCIF（敏感隔离信息设施）认证的数据中心内，提供专用基础设施、高速网络、AI优化存储和云原生编排能力。Leidos将负责任务集成、安全架构认证、网络运营、数据工程和最终交付。计划涵盖五大能力领域：机密级AI云服务（模型训练、微调、评估、部署和监控）、情报分析师增强（多源情报融合、图像分析和决策支持）、网络AI靶场、合成数据与数字孪生、以及边缘到云AI编排。合作依赖于签署最终协议和联邦拨款优先级。

**Source:** [Leidos and CoreWeave collaborate to accelerate delivery of AI capabilities](https://www.prnewswire.com/news-releases/leidos-and-coreweave-collaborate-to-accelerate-delivery-of-ai-capabilities-for-defense-national-security-and-intelligence-missions-302838710.html)

### AWS与Anduril将Menace-I战术数据中心部署至作战区域

AWS与Anduril的Menace-I与AWS Outposts集成方案已通过JWCC（联合作战机云能力）市场向国防部用户提供。Menace-I是一种可部署的战术级数据中心，将AWS Outposts计算设备安装在加固集装箱中，可由两名非专业人员10分钟内完成部署，支持卡车、铁路、空运或直升机吊运。该方案已在全球部署累计超过50000小时的战场使用经验，被认证处理SCI和SAPF级数据。核心应用场景包括舰载AI运算、近实时飞行数据收集分析和带宽受限环境下的军事任务。该方案已在中东Operation Epic Fury等行动中实战应用。

**Source:** [AWS, Anduril debut new tactical data center offering listed on DOD's cloud marketplace](https://defensescoop.com/2026/07/01/aws-anduril-debut-new-tactical-data-center-cloud-offering/)

### 美国海军陆战队探索"无云网络"：确保AI在断网时继续运行

美国海军陆战队的Project Dynamis正在评估Ditto公司的技术，使部队在失去云连接时仍能运行AI工具。Ditto的技术不依赖客户端-服务器模型，而是利用无线电、手机甚至无人机建立本地对等网络mesh，使边缘节点之间可以直接通信而无需连接到中央服务器。前陆军军官、Ditto公共部门高级副总裁Eric Hanft指出，在冲突中依赖云连接"将成为问题"。该技术对大型语言模型在战斗环境中的应用至关重要——当数据缺失时，Transformers模型可能产生幻觉，这在战场上是高风险而非低风险问题。OpenAI也已明确表示其军事合同"不允许为完全自主武器提供动力，因为这需要在边缘部署"。

**Source:** [Marines eye cloudless networks to keep AI tools running when the cloud goes down](https://www.defenseone.com/defense-systems/2026/07/marines-cloudless-networks-ai-cloud/414716/)

### 美国陆军从企业云转向边缘AI架构

美国陆军在2026年正式发布的信息中明确，新国防战略要求从依赖中心化云计算的模式转向分布式Edge AI架构。核心挑战是在"拒绝、断连、间歇、有限"（D-DIL）环境中维持决策优势。解决方案包括：部署强化型高性能计算硬件到战术边缘、通过模型压缩（剪枝和量化）将AI模型缩小75%的存储占用以适应战术设备，以及通过Project Linchpin建立标准化的AI/ML生态系统。陆军正在部署的自主微数据中心可直接安装在车辆和无人机上，使传感器到射手的时间从数小时缩短到数分钟。

**Source:** [Operationalizing AI at the Tactical Edge - Army.mil](https://www.lineofdeparture.army.mil/Journals/Warrant-Officer-Journal/Archive/March-2026/Operationalizing-AI-at-the-Tactical/)

## 分析

本周军事AI界的两项合作揭示了军用云计算的二元化发展方向。CoreWeave与Leidos的合作代表了"向上集中"的路径：在最高安全等级的设施中建设主权AI算力。这种模式的核心挑战不是芯片而是认证——商用AI云追求的是大规模共享区域和弹性容量，而机密级AI需要硬件放置在通过安全认证的设施中、由通过背景审查的人员运营、与公共互联网物理隔离。Leidos的加入正是为了弥补商用云提供商与政府安全要求之间的鸿沟。

AWS与Anduril的Menace-I则代表了"向下分散"的路径。将云算力推至战术边缘——放在前线车辆上、无人机的机架上、乃至由直升吊运至前沿阵地。这反映了美国军事思想从依赖集中式巨形基地向高度分散、灵活机动的编队模式的战略转变。Anduril的Menace-I已在实战中运行超过50000小时，证明这种模式已从概念验证进入实战部署。

海军的"无云网络"探索进一步深化了这一趋势的本质矛盾：云计算的集中化为AI提供了强大的算力，但在战场上这种集中性本身就是脆弱点。如果AI模型必须依赖云端才能运行，那对手只需要切断通信链路就能使AI失效。Ditto的对等数据网格技术提供了一个有前景的方向，但它也暴露了军用AI面临的一个根本性挑战：如何在断开连接的环境中保持AI能力的可信和可靠。

从产业结构视角看，CoreWeave进入联邦市场是军事-商业融合趋势的重要信号。CoreWeave此前主要服务于Meta、Anthropic等商用AI客户，联邦业务为其提供了客户多元化渠道。同时，Nvidia等芯片厂商正在将Blackwell Ultra超级计算机直接部署到海军等军用平台，这表明整个AI供应链都在向军事应用倾斜。

## 结论

军用AI架构正在经历从"中心化云"到"双层架构"（高度机密的主权AI云+高度韧性的战术边缘AI）的结构性转型。对于关注该领域的从业者而言，CoreWeave与Leidos的合作模式（商用AI平台+政府集成商）可能成为联邦AI采购的参考范式；而AWS+Anduril的Menace-I案例证明，云原生技术（AWS Outposts、S3、JWCC等）正在成为新一代军事基础设施的软件底座。国防部门应同时推进集中式主权AI和分散式边缘AI两条路线，而非在两者之间做选择。
