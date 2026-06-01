---
layout: post
title: "军事科技动态：五角大楼290亿美金AI超算军备计划、陆军'越狱行动'实战化与战术边缘AI架构成型"
date: 2026-06-01
author: "云原生观察"
source: "https://defensescoop.com/2026/05/22/dod-wants-nearly-30-billion-to-modernize-its-ai-supercomputing-arsenal-in-fiscal-2027/"
categories:
  - military
tags:
  - dod
  - ai-arsenal
  - operation-jailbreak
  - edge-computing
  - ngc2
  - project-linchpin
  - c2now
  - knox
  - military
---

# 军事科技动态：五角大楼290亿美金AI超算军备计划、陆军"越狱行动"实战化与战术边缘AI架构成型

本周国防科技领域呈现从数据中心到战术边缘的全方位AI化趋势：五角大楼2027财年申请295亿美元建设AI超算军火库、陆军"越狱行动"（Operation Jailbreak）30天冲刺结果已实战部署至中东、Ultra I&C Knox处理器和Core Systems ATMOS2推动战术边缘计算架构升级。

## 主要新闻

### 五角大楼2027财年申请295亿美元建设"AI军火库"超算中心

根据最新公布的预算文件，美国国防部在2027财年申请约295亿美元用于"AI军火库计划"（AI Arsenal Initiative）。该计划旨在将分散的GPU集群整合为统一的AI基础设施组合，涵盖战略和战术级AI计算需求。预算包括在全美多个地点建设经SCIF认证的数据中心设施、采购最新一代GPU和AI超级计算机、并建立"国家安全投资基金"以解决制造业、能源系统、通信网络和物流基础设施的长期投资不足问题。

**Source:** [DOD Wants Nearly $30 Billion to Modernize Its AI Supercomputing Arsenal - DefenseScoop](https://defensescoop.com/2026/05/22/dod-wants-nearly-30-billion-to-modernize-its-ai-supercomputing-arsenal-in-fiscal-2027/)

### 陆军"越狱行动"：30天破解自家武器系统实现跨平台互通并已部署中东

陆军启动"越狱行动"（Operation Jailbreak）——一项为期30天的黑客马拉松，旨在破解（jailbreak）已有武器系统的接口限制使其能够互操作。来自约50家国防公司的数百名工程师参与，聚焦于反无人机和防空系统集成。陆军CTO Alex Miller确认，首批"越狱"系统的补丁已推送至中央司令部（CENTCOM），C2平台现已集成反无人机雷达、摄像头和效应器。该行动直接受乌克兰战场自建集成架构的启发，并由与伊朗的冲突催化。陆军同时创建了国防部首个API市场，用于记录和共享接口以实现互操作性。

**Source:** [Army Sent Jailbroken Tech to Middle East as Part of Ongoing Hackathon - Breaking Defense](https://breakingdefense.com/2026/05/army-sent-jailbroken-tech-to-middle-east-as-part-of-ongoing-hackathon/)

### Ultra I&C Knox处理器：以模块化架构打破军事边缘计算供应商锁定

Ultra I&C发布了Knox系列边缘处理器，采用灵活的背板设计和商用现货（COTS）MOSA/SOSA对齐卡片架构，使平台无需更换机箱或重新布线即可升级处理、通信和任务应用。美国海军陆战队已为其MQ-9B Reaper无人机订购Knox-5处理器。Knox-10处理器将MLS处理与100GbE交换集成到单个单元——此前需要三个独立系统。该设计支持在战区现场升级，无需将系统运回后方工厂。

**Source:** [Edge Computing Fails When the Mission Hardware Can't Evolve - Breaking Defense](https://breakingdefense.com/2026/05/edge-computing-fails-when-the-mission-hardware-cant-evolve/)

### Core Systems获陆军合同为C2NOW项目交付ATMOS2战术边缘计算机

Core Systems获得陆军合同，为其C2NOW（指挥控制-现在）项目供应ATMOS2战术边缘计算机。ATMOS2在单个MIL-STD-810H认证机箱中整合了高核CPU、机载SSD存储、最新一代GPU和集成UPS电池，取代了此前超过250磅的服务器堆叠。该平台支撑陆军NGC2（下一代指挥控制）现代化项目的集成数据层、AI决策工具和通用作战图，提供移动、便携和固定站点配置。陆军CIO表示，统一网络将在2027年底前完成部署，持续ATO审批正大幅加速软件交付。

**Source:** [Core Systems Awarded Contract to Deliver ATMOS2 Tactical Edge Computers - Core Systems](https://core-systems.com/news/core-systems-awarded-contract-to-deliver-atmos2-tactical-edge-computers-for-the-u-s-army-c2now-program/)

### 美国陆军加速统一网络与持续ATO：CIO详解数字转型

即将卸任的陆军CIO Leo Garciga在DoD Modernization Exchange 2026上详解了陆军统一网络和持续授权运营（CATO）的进展。陆军已将企业网络从超过19个减少到约5个，目标2026年底减至3个、2027年底实现完全统一。持续ATO已从传统80页文档流程简化为自动化DevSecOps管道——一个CATO平台已从同时进行2个开发工作扩展到23个并行开发线，交付时间从30-45天缩短至约一周。

**Source:** [DoD Modernization Exchange 2026: Army's Leo Garciga on Unified Network - Federal News Network](https://federalnewsnetwork.com/defense-main/2026/04/dod-modernization-exchange-2026-armys-leo-garciga-on-unified-network-continuous-ato-speeding-tools-to-warfighters/)

### Project Linchpin与战术边缘AI：在断网环境下实现决策优势

陆军发布的Warrant Officer Journal文章详细阐述了在Denied、Disconnected、Intermittent、Limited（D-DIL）环境下部署边缘AI的架构。通过Project Linchpin的TORC（可追溯性、可观察性、可替换性、消费）框架，陆军正在建立标准化的AI/ML生态系统。关键技术包括：模型压缩（量化将32位浮点转为8位整数，内存占用降低75%）、在RCV（机器人战车）等平台上实现本地传感器处理、以及将传感器到射手的时间从数小时压缩到数分钟。

**Source:** [Operationalizing AI at the Tactical Edge - Army Warrant Officer Journal](https://www.lineofdeparture.army.mil/Journals/Warrant-Officer-Journal/Archive/March-2026/Operationalizing-AI-at-the-Tactical/)

## 分析

五角大楼295亿美元的AI超算投资标志着美国国防部从"实验性AI"向"工业化AI基础设施"的战略转型。过去十年，军方AI能力分散在数百个独立项目中，形成了与商业云计算增长类似的碎片化困境。"AI军火库计划"的核心价值在于将分散的GPU集群整合为统一的、经SCIF认证的超级计算组合，这与企业级AI基础设施的整合趋势高度一致。最具看点的是"国家安全投资基金"——它试图解决传统采购周期无法响应的制造业和能源基础设施投资缺口。

"越狱行动"可能是2026年美军最具变革意义的采办创新。它直接借鉴了乌克兰军队自建系统集成接口的实战经验，以30天冲刺形式迫使国防承包商开放接口。陆军"不开放接口就不能加入生态"的强硬立场是对数十年"精巧但封闭"采办传统的根本性颠覆。当50家国防承包商同意在同一空间共同破解自身系统的接口限制，这对国防工业的文化冲击不亚于技术成果本身。

从Knox处理器到ATMOS2再到Project Linchpin，战术边缘AI的"三件套"正在成型：模块化硬件（无需整机替换即可升级）、模型压缩算法（在受限设备上运行AI）、以及可信AI治理（TORC框架确保模型可追溯和可验证）。在D-DIL环境下，这一组合使部队在失去与云端连接时仍能保持AI辅助决策能力——这是大国竞争背景下非对称优势的关键来源。

## 结论

本周军事科技发展呈现出"端到端AI化"的清晰轨迹：从五角大楼的数据中心和超算军火库、到陆军统一网络和持续ATO的软件部署管道、再到Knox/ATMOS2等战术边缘硬件和Project Linchpin的AI治理框架。每一层都在解决特定的"最后一公里"问题——超级计算提供训练基础、持续ATO加速软件交付、边缘硬件确保AI在断网环境中仍能运行。这一三明治架构可能成为未来十年军事数字化转型的参考模型。
