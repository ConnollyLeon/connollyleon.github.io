---
layout: post
title: "军事应用新闻：AWS与Anduril战术数据中心上线与美军Project Convergence测试"
date: 2026-07-27
author: "云原生观察"
source: "https://defensescoop.com/2026/07/01/aws-anduril-debut-new-tactical-data-center-cloud-offering/"
categories:
  - military
tags:
  - tactical-edge
  - anduril
  - aws
  - project-convergence
  - ai-military
  - edge-computing
---

# 军事应用新闻：AWS与Anduril战术数据中心上线与美军Project Convergence测试

本周军事云原生与边缘计算领域迎来多项重要进展。AWS与Anduril联合推出的Menace-I战术数据中心正式在DOD的JWCC Marketplace上架，为偏远地区和连接严重降级的环境提供云级计算能力。美国陆军在Fort Irwin进行有史以来最大规模的Project Convergence Capstone 6实验，测试下一代指挥控制架构NGC2。美国海军陆战队开始测试无云网络以确保AI工具在连接中断时继续运行。

## 主要新闻

### AWS与Anduril战术数据中心上线DOD JWCC Marketplace

AWS与Anduril联合推出Menace-I with AWS Outposts产品，正式在国防部联合作战云能力(JWCC) Marketplace上架。该产品将AWS Outposts（可使用与云相同的工具在本地运行应用和存储数据）与Anduril的Menace-I加固型移动数据中心相结合，专为需要在偏远地区或连接严重降级/被拒环境中获得云级计算、存储和AI能力的军事指挥官和应急响应人员设计。Menace-I已在过去三年中运行超过50,000小时的实战化野外部署，覆盖各军种，包括在Epic Fury行动中使用。产品提供Core、Command和Enhanced三种变体，Enhanced版本可支持最多4个Outpost机架（约168台服务器）。近端用例包括舰载AI作战、近实时飞行数据收集和分析，以及各类带宽受限的军事任务。

**Source:** [AWS, Anduril debut new tactical data center offering listed on DOD's cloud marketplace](https://defensescoop.com/2026/07/01/aws-anduril-debut-new-tactical-data-center-cloud-offering/)

### 美军Project Convergence Capstone 6测试NGC2架构

美国陆军在Fort Irwin启动有史以来最大规模的Project Convergence实验——Project Convergence-Capstone 6 (PC-C6)，约9,700名士兵参与（通常是CTC轮换的两倍多）。实验评估第4步兵师重建的下一代指挥控制(NGC2)架构在逼真作战训练条件下的表现。NGC2架构整合了商业软件、AI赋能的决策工具、先进数据管理系统、软件定义网络、边缘计算能力和弹性通信网络，旨在将信息快速传递给指挥官以加速决策。实验评估超过90项发展中的能力，包括自动PACE（主用、备用、应急和紧急通信）、软件定义网络和边缘计算。陆军计划在2027年开始向I Corps部队装备相关设备。

**Source:** [U.S. Army tests next-generation command network at Project Convergence](https://defence-industry.eu/u-s-army-tests-next-generation-command-network-at-project-convergence-to-shape-future-battlefield-decisions-and-modernization/)

### 海军陆战队测试无云网络确保AI工具持续运行

美国海军陆战队战争实验室开始测试Ditto公司的无云网络软件平台，使设备无需中央云服务器或持续互联网连接即可直接形成临时网络。这是对当前云依赖AI系统在对抗环境中脆弱性的直接回应。该技术创建网格网络，如果一个链路断开，数据可在设备间找到替代路径。即时应用是AI驱动的规划工具（如物流和指挥决策工具），这些工具通常依赖大语言模型的云连接。无云网络使单位即使与远程数据中心的连接被切断，也能本地共享AI生成的计划和数据。这反映了军方在战术边缘部署AI的范式转变——将间歇性云访问视为常态而非例外。

**Source:** [Marines eye cloudless networks to keep AI tools running](https://pivotnews.ai/five/marines-eye-cloudless-networks-to-keep-ai-tools-running-when)

### 国防领导人重新定义"边缘"运营

在GDIT Battlespace of the Future峰会上，美国空军和海军的国防领导人重新定义了"边缘"的概念。空军商业企业管理总监Julianne Lefebvre表示："边缘不再仅仅意味着战场的字面前线，而是飞行员和守卫者进行日常业务运营的地方。"海军副首席技术官Michael Frank补充："边缘不是一个位置……它更多是一种任务实际发生时的思维模式。"这一战略转变要求重新设计软件框架，企业业务平台不能再被视为次要行政骨干，而必须被重新设计为在现场本地功能化，在降级或断连通信环境中处理数据，并在连接恢复时无缝同步。美国陆军的"Operation Jailbreak"数据管理倡议被视为这一架构转型的蓝图。

**Source:** [Defense leaders are redefining what it means to operate at the edge](https://defensescoop.com/2026/07/07/data-at-the-tactical-edge/)

## 分析

AWS与Anduril Menace-I在JWCC Marketplace的上架标志着军事边缘计算从"概念验证"进入"规模化采购"阶段。当战术数据中心可以通过现有合同机制（JWCC）直接购买时，意味着边缘云能力已从实验性项目转变为标准军事采购目录中的产品。Menace-I已经在Epic Fury行动中使用的事实进一步证明了其运营成熟度。对于云原生社区而言，这一案例展示了Kubernetes和容器化工作负载如何从数据中心延伸到最极端的战场环境——AWS Outposts在军事场景中的部署是混合云架构在最苛刻条件下的验证。

PC-C6实验的规模（9,700人）和范围（90+能力评估）反映了美军对NGC2架构的重视程度。NGC2的"全栈方法"——整合传输、集成、数据和应用——本质上是将云原生架构原则应用于军事指挥控制。软件定义网络、边缘计算和AI决策工具的组合，与商业领域的平台工程实践有显著的技术重叠。陆军选择"商业优先"采购策略来加速规模化装备，表明军方正在向商业技术标准靠拢。

海军陆战队测试无云网络则揭示了军事AI部署中的一个根本性技术矛盾：大语言模型通常需要云端计算能力，但战场环境中的连接不可靠。Ditto的网格网络方案不是简单的备份计划，而是对"间歇性连接是常态"这一现实的架构响应。这一思路对商业领域的边缘计算和离线优先应用开发同样具有借鉴意义——在物流、现场服务、航运和远程运营等行业，AI工具的离线可靠性正成为关键的业务风险。

## 结论

本周军事新闻呈现三条清晰主线：战术边缘计算正从实验走向规模化采购和实战部署；军事指挥控制架构正在按照云原生原则进行根本性重构；AI在军事应用中的核心挑战从"计算能力"转向"连接可靠性"。从业者应关注Menace-I在更多军事场景中的部署进展、NGC2架构对商业平台工程技术的借鉴价值，以及无云网络技术在商业边缘计算场景中的应用潜力。军事领域正在成为云原生和边缘计算技术最前沿的试验场。
