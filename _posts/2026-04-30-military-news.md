---
layout: post
title: "军事应用：美军云边协同作战体系加速落地，NGC2与DOGMA重塑战术边缘决策优势"
date: 2026-04-30
author: "云原生观察"
source: "https://breakingdefense.com/2026/02/disa-unveils-new-cloud-environment-to-speed-delivery-of-services-to-forces/"
categories:
  - military
tags:
  - military
  - defense
  - cloud
  - edge-computing
  - ngc2
  - dogma
  - disa
  - pentagon
---

# 军事应用：美军云边协同作战体系加速落地，NGC2与DOGMA重塑战术边缘决策优势

尽管近期军事云应用的重大公告相对较少，但从2026年初至今累积的技术进展显示，美军正加速构建"云-边-端"协同的联合作战体系。DISA的新云环境、陆军的NGC2（下一代指挥控制）原型、以及AWS与GDIT合作的DOGMA平台，共同描绘了一个清晰的战术愿景：将企业级云计算能力下沉至战术边缘，实现秒级决策优势和预测性后勤保障。

## 主要新闻

### DISA发布新云环境，加速向作战部队交付服务能力

在2026年2月的WEST会议上，国防信息系统局（DISA）技术总监Nolan Brown宣布了"DISA云环境"计划，旨在现代化向作战人员交付能力的方式。Brown表示："为了应对这种变化，我们的领导层开发了所谓的DISA云环境。这是一个通过一系列工具和产品来加速新能力部署的尝试——在需要的时候、需要的地方，提供 exactly 需要的东西。"该环境不是单一产品，而是一套伞形服务，包括三个主要接入路径：经典托管（DISA的传统优势）、私有云（通过Stratus等服务扩展）和商业云（通过联合战争云能力JWCC合同）。DISA云环境的目标是实现"智能云旅程"，为每个应用、任务和地点提供最合适的解决方案，而不是"一刀切"。

**Source:** [DISA unveils new cloud environment to speed delivery of services to forces](https://breakingdefense.com/2026/02/disa-unveils-new-cloud-environment-to-speed-delivery-of-services-to-forces/)

### 洛克希德·马丁加速NGC2能力交付，实现从云到边缘的实时决策

1月23日，洛克希德·马丁与第25步兵师、CPE C3N、多个美国陆军利益相关者以及Raft、Accelint等工业合作伙伴，在夏威夷斯科菲尔德兵营成功演示了NGC2原型的首个迭代。NGC2原型运行在第25步兵师的现有传输和计算环境上，将跨越从师级到排级、从云到边缘的各个梯队。该系统的核心是一个通用数据层，由人工智能工具增强（包括支持语音和聊天自然语言处理的现场报告工具）。一旦信息在数据层中更新，它就会实时更新到所有地方，消除了"转椅式"手动流程。在分秒必争的时刻，这种时间差异至关重要。Lightning Surge 2定于2026年2月举行，将聚焦于支持第25步兵师任务的火力任务线程。

**Source:** [Lockheed Martin Accelerates Next-Generation Command-and-Control Capabilities](https://news.lockheedmartin.com/2026-01-23-Lockheed-Martin-Accelerates-Next-Generation-Command-and-Control-NGC2-Capabilities-and-Real-Time-Decision-Making-at-Lightning-Surge-1)

### AWS与GDIT推出DOGMA平台，将决策时间从30分钟压缩至3秒

AWS与政府技术公司GDIT合作开发了国防作战网格-网格加速器（DOGMA），该平台在 contested 环境中展现出改进军事作战管理的潜力。DOGMA将GDIT的LunaAI预测分析与AWS服务（如Amazon Kinesis、Amazon SageMaker、AWS Wickr和AWS Lambda）集成，构建了一个强大、可扩展、安全的环境。在2025年3月由国防部研究与工程副部长主办的T-REX技术准备实验中，DOGMA跟踪了350多架无人和商业飞机，预测未来位置，并将决策时间从30分钟加速到3秒。该平台还能利用AI和机器学习能力增强传入数据，并在指挥中心将其显示为通用作战图（COP）。Cyber Fortress 2025（2025年8月由弗吉尼亚陆军国民警卫队主办）也展示了DOGMA的成功。

**Source:** [Defense Operations Grid Mesh Accelerator (DOGMA)](https://www.govexec.com/sponsors/2026/01/defense-operations-grid-mesh-accelerator-dogma/410594/)

## 分析

美军云边协同作战体系的建设，实际上是在将企业级云原生架构（微服务、容器化、服务网格、声明式API）移植到极端苛刻的战术环境中。DISA云环境的"三轨接入"策略（经典、私有、商业）反映了军方对"混合云"的独特理解：不是简单地在公有云和私有云之间做选择，而是根据任务的敏感性、延迟要求和生存能力，动态地将工作负载分配到最合适的计算环境。这种架构的复杂性远超企业云，因为它必须在通信中断、电磁干扰、物理摧毁等极端条件下仍然保持基本功能。

NGC2的通用数据层设计则体现了"数据-centric"作战理念的深化。传统的指挥控制系统通常是"应用-centric"的：每个功能（情报、火力、机动、后勤）都有独立的系统和数据库，指挥官需要在多个系统之间手动切换（"转椅式"操作）。NGC2通过构建一个统一的、实时的数据层，让所有应用都基于同一套数据源运行，从而消除了数据延迟和不一致性。这种模式正是企业云原生架构中"数据网格"（Data Mesh）理念在军事领域的应用。值得关注的是，NGC2正在第25步兵师进行实战化测试，这意味着"云原生军事化"已经从概念验证进入原型验证阶段。

DOGMA平台的3秒决策时间（相比传统30分钟）揭示了AI/ML在战术边缘的巨大价值。在contested环境中，无人系统和商业飞机的数量可能达到数百甚至数千，人工跟踪和预测其轨迹是不可能的。DOGMA通过将预测分析（LunaAI）与流式数据处理（Kinesis）、机器学习模型（SageMaker）和边缘通信（Wickr）集成到一个统一的平台上，实现了"机器速度"的决策循环。这种模式的可扩展性极强：一旦软件栈成熟，可以快速部署到不同的作战场景和地理区域。然而，DOGMA目前仍在初级阶段，其实战可靠性和抗干扰能力还需要更多真实环境的验证。

从更宏观的视角来看，这些项目共同指向一个核心趋势：美军正在从"网络-centric warfare"（网络中心战）向"cloud-edge-centric warfare"（云边中心战）演进。在这个新范式下，云计算不再仅仅是后方指挥所的支撑系统，而是直接嵌入到战术边缘的每一个决策节点。这种架构的优势在于极高的敏捷性和可扩展性，但挑战也同样巨大：如何确保在通信中断时边缘节点仍能自主运行？如何防止复杂的云原生架构被对手利用或攻击？如何在快速迭代的软件交付节奏与军事系统的高可靠性要求之间找到平衡？

## 结论

美军云边协同作战体系的建设正处于从原型验证向规模化部署过渡的关键阶段。尽管近期缺乏重大公告，但从DISA、陆军和AWS的合作动向来看，技术路线已经清晰：通过云原生架构将企业级计算能力下沉至战术边缘，实现秒级决策优势和预测性作战保障。建议国防工业伙伴密切关注NGC2在Project Convergence Capstone 6中的表现，以及DOGMA在更多实战演习中的验证结果。未来6-12个月，值得关注DISA云环境的首批生产合同授予、陆军第4步兵师的NGC2部署进展，以及更多云服务商的战术边缘解决方案进入军用市场。
