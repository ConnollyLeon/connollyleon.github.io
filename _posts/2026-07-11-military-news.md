---
layout: post
title: "军事应用：AWS与Anduril联合推出战术边缘数据中心，Project MAVERICK验证语音控制无人机蜂群，陆军NGC2建立通用数据层基线"
date: 2026-07-11
author: "军事科技观察"
source: "https://www.airandspaceforces.com/amazon-anduril-partner-to-take-cloud-to-the-tactical-edge/"
categories:
  - military
tags:
  - aws
  - anduril
  - edge-computing
  - tactical-cloud
  - outpost
  - menace
  - drone-swarm
  - project-maverick
  - autonomous-systems
  - army
  - ngc2
  - command-and-control
  - ai-military
  - defense-technology
---

# 军事应用：AWS与Anduril联合推出战术边缘数据中心，Project MAVERICK验证语音控制无人机蜂群，陆军NGC2建立通用数据层基线

过去一周军事云原生技术领域多项重要进展：Amazon Web Services与Anduril Industries联合推出Menace-I战术边缘数据中心，已列入国防部云市场；AWS Project MAVERICK通过实 field测试验证了自然语言控制无人机蜂群的能力；美国陆军宣布下一代指挥与控制（NGC2）系统完成通用数据层基线建立，从原型验证阶段进入交付阶段。

## 主要新闻

### AWS与Anduril联合推出Menace-I战术边缘数据中心

Amazon Web Services宣布选择Anduril作为国家安全和国防领域的"首选边缘提供商"，双方联合推出Menace-I战术边缘数据中心，使用AWS Outpost技术，将大规模本地数据中心的能力带到战术边缘。Menace-I提供三个变体——Core（基本边缘部署云）、Command（可生成作战数据）和Enhanced（支持AI工厂、传感器融合和目标定位）。Core和Command变体各可容纳1个Outpost机架（40-42台服务器），Enhanced版本支持4个机架（最多168台服务器），使用Ultra Low Latency Rack提供比标准机架更快的速度。Menace硬件在过去三年中已运行超过50,000小时的加固环境使用，已在所有军种中使用，包括在Epic Fury行动（对伊朗行动）中使用。AWS全球国防总监Liz Martin表示，如果Menace/Outpost组合在Epic Fury中可用，用户将获得更广泛的作战区域能力扩散。

**Source:** [Amazon, Anduril Partner to Push AI and the Cloud to the Tactical Edge](https://www.airandspaceforces.com/amazon-anduril-partner-to-take-cloud-to-the-tactical-edge/)

### Project MAVERICK field测试验证语音控制无人机蜂群

AWS通过Project MAVERICK（Mission Autonomy Versatile Rapid Innovation and Capabilities Kit）项目，在一次为期两天的实field测试中展示了自然语言控制无人机蜂群的能力。该测试由AWS、Anduril和Gambit三家联合进行。架构核心是：操作人员通过AWS WickrGov使用自然语言描述任务目标（如"在北部区域执行搜救任务"），WickrGov上的Bot由Amazon Bedrock驱动，将自然语言请求转化为API调用，发送给Gambit的ALIEN指挥平台，最终协调多架自主平台执行任务。测试中成功通过该会话界面启动了四个自主平台。Anduril提供Menace-T加固便携式指挥控制平台运行Lattice软件，Gambit贡献ALIEN自主协调系统和多无人机专业知识。该演示在DDIL（断连、中断、间歇、有限）环境中验证，与AWS云环境中运行相同的AMI，建立了从云到边缘的可重复开发模式。

**Source:** [Accelerating autonomous system innovation with Project MAVERICK field testing](https://aws.amazon.com/blogs/publicsector/accelerating-autonomous-system-innovation-with-project-maverick-field-testing/)

### 美国陆军NGC2完成通用数据层基线建立

美国陆军宣布已完成下一代指挥与控制（NGC2）系统通用数据层基线的建立，这是在第4步兵师Ivy Sting-Ivy Mass系列演习和第25步兵师Lightning Surge演习中进行操作验证后做出的决定。Anduril Industries负责领导通用数据基线计划，继续与Palantir合作通过Anduril的Lattice和Palantir的Foundry提供边缘到云的数据网格，与Raft合作提供NGC2数据和服务注册表。第4步兵师的Ivy Mass演习在科罗拉多州Fort Carson和Pinon Canyon进行了师级规模的全要素NGC2压力测试，包括应对基于真实威胁的网络和电磁攻击。第25步兵师的Lightning Surge 3则从夏威夷、美国本土和菲律宾同时演示了通过统一数据平台集成传感器、火力系统和空域管理。下一步，Project Convergence-Capstone 6（PC-C6）将在7月于国家训练中心进行师级规模对抗性NGC2验证。

**Source:** [Army and industry align on common data baseline as NGC2 moves to delivery](https://www.army.mil/article/293409/army_and_industry_align_on_common_data_baseline_as_next_generation_command_and_control_moves_from_prototyping_to_delivery)

## 分析

AWS与Anduril的Menace-I合作标志着军事云原生基础设施从"数据中心延伸"到"战术边缘"的关键跃迁。传统AWS Outpost部署假设"有屋顶、有空调、有稳定电力"的标准机房环境，而Menace-I的核心创新在于将Outpost硬件适配到战场极端条件——电力不稳、无空调、通信不稳定、通过直升机或C-17运输。Menace已运行超过50,000小时的实战经验（包括Epic Fury行动）证明了这种适配在真实作战环境中的可行性。从架构角度看，"Enhanced版本支持4个机架（168台服务器）+ AI工厂"的规格意味着战术边缘不仅具备基本的云计算能力，还具备运行本地AI推理（传感器融合、目标识别、自主决策）的算力——这是从"回传数据到后方处理"到"在边缘实时处理"范式转变的硬件基础。

Project MAVERICK的语音控制无人机蜂群演示则展示了三个技术突破：（1）自然语言到任务规划的自动转化——操作员不需要学习专门的命令语言或操作界面；（2）DDIL环境下的可靠运行——同一AMI在AWS云环境和边缘Outpost上行为一致，消除了边缘部署中常见的"在我的机器上能跑"问题；（3）多组织技术栈的互操作性——AWS Wickr、Anduril Lattice、Gambit ALIEN三个独立系统在同一架构中无缝集成。特别是（2）对于军事AI应用至关重要：代码在云环境开发和测试后，可以直接部署到断连的战术边缘运行，无需重新集成或验证。

陆军NGC2通用数据层基线的建立则代表了美军在"数据驱动指挥"转型中的制度性进展。选择Anduril（而非传统国防承包商）领导数据基线计划，反映了陆军对"软件定义军事"理念的认可——Anduril的Lattice平台本质上是一个军用级的数据编排和自主系统管理平台，其架构理念与商业云原生的数据网格模式高度一致。Ivy Mass和Lightning Surge演习中进行的师级规模压力测试（包括网络和电磁攻击场景）验证了这套架构在对抗环境中的韧性。

## 结论

本周军事云原生新闻的核心主题是"从战略后方到战术边缘的全链路云原生能力正在实战化"。AWS/Anduril Menace-I解决了边缘算力的硬件问题，Project MAVERICK验证了自然语言控制自主系统的软件问题，陆军NGC2建立了数据驱动指挥的制度框架。三者共同指向一个趋势：未来的军事作战将越来越多地依赖在战术边缘运行的AI和自主系统，而这些系统的核心技术栈与商业云原生生态（Kubernetes、容器化、微服务、声明式配置）高度同构。建议国防技术从业者关注Menace-I的配置选项和Menace-T在不同作战场景中的部署模式；军事AI研究者跟踪Project MAVERICK的后续field test结果和DDIL环境下的可靠性数据；关注NGC2在PC-C6演习中的师级验证结果，这将决定美军数据驱动指挥转型的下一步时间表。
