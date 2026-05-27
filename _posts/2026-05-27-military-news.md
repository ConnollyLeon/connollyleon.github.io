---
layout: post
title: "军事科技动态：五角大楼295亿美元AI军火库计划与Anduril单兵边缘计算设备"
date: 2026-05-27
author: "云原生观察"
source: "https://defensescoop.com/2026/05/22/dod-wants-nearly-30-billion-to-modernize-its-ai-supercomputing-arsenal-in-fiscal-2027/"
categories:
  - military
tags:
  - dod
  - ai-arsenal
  - anduril
  - edge-computing
  - 5g
  - defense
  - cloud
---

# 军事科技动态：五角大楼295亿美元AI军火库计划与Anduril单兵边缘计算设备

本周美国军事科技领域重大消息密集：五角大楼在2027财年预算中请求295亿美元建设"AI军火库"（AI Arsenal）——涵盖超算中心建设和GPU采购；Anduril发布Voyager Gateway 1单兵可穿戴边缘计算设备；国防论坛聚焦可部署边缘AI与私有5G的实战化进展；同时CDAO官员警告"算力瓶颈"可能制约AI在战场上的规模化应用。

## 主要新闻

### 五角大楼请求295亿美元建设AI军火库

美国国防部在2027财年预算中提出295亿美元资金计划，用于建设"AI军火库"（AI Arsenal Initiative）。该计划包括在多地点建设加固型、SCIF认证的数据中心设施，并采购和安装首批最先进GPU和AI超级计算机。目标是"从分散的GPU集群过渡到集成的、有组织的AI基础设施组合"，覆盖战略和战术AI算力需求。一位国防部官员表示："这是对基础性、政府自有AI基础设施的投资，以最大化联邦购买力并构建所需的战略优势。"

**Source:** [DOD wants nearly $30 billion to modernize its AI supercomputing arsenal](https://defensescoop.com/2026/05/22/dod-wants-nearly-30-billion-to-modernize-its-ai-supercomputing-arsenal-in-fiscal-2027/)

### Anduril发布Voyager Gateway 1：单兵可穿戴边缘计算

Anduril Industries发布Voyager Gateway 1 (G1)——一款可穿戴、防水、超低功耗的单兵边缘计算和通信系统。大小相当于一台电台，集成了计算、网络和通信功能，可直接在战术边缘运行任务应用和AI工作负载，无需依赖后方的服务器。G1可将每名单兵转化为Lattice Mesh网络上的一个节点，支持数据共享、语音通信和实时视频，即使在断连、降级环境（DDIL）下也能保持作战单元间的连接。该设备已在一系列INDOPACOM演习中完成实战化测试。

**Source:** [Anduril Introduces Voyager Gateway 1: Rugged Edge Compute for the Dismounted Operator](https://soldiersystems.net/2026/05/20/anduril-introduces-voyager-gateway-1-rugged-edge-compute-for-the-dismounted-operator/)

### 国防通信论坛：边缘AI与私有5G的实战化进展

在国防通信论坛上，美海军陆战队中校Benjamin Pimentel介绍了Project Dynamis中边缘+私有5G的实战验证：高吞吐量网络结合多接入边缘计算（MEC），让前沿单元能在本地摄入传感器和后勤数据、运行AI/ML决策辅助，无需回传后方云资源。当超视距连接可用时，小规模前沿单元可通过高速last-tactical-mile网络访问远程专家支持。会议提出"网络不再是使能器——它就是战场空间本身"。

**Source:** [Defense panel sketches what deployable edge AI and private 5G actually look like](https://www.rcrwireless.com/20260519/defense-communications/defense-panel-edge-ai)

### CDAO算力警告："算力是瓶颈，必须解决"

国防部首席数字与AI官（CDAO）Cameron Stanley在AI+Expo上警告，计算能力正成为制约AI在战场上规模化应用的"瓶颈"。他指出，在"伊朗战争"的Operation Epic Fury中，Palantir Maven Smart System在38天内打击了13,000个目标，网络利用率提升了4倍，每天处理8.94亿token的Agent工作流。"我们把法拉利交到了战士手中，唯一让我失眠的是确保我们永远不会耗尽高性能燃料——那就是算力。"国防部正在多管齐下扩展各领域和各密级的算力容量。

**Source:** [DOD planning to address compute 'bottleneck' that could hinder AI proliferation](https://defensescoop.com/2026/05/07/dod-planning-to-address-compute-bottleneck-ai-proliferation/)

### 陆军C2NOW项目部署ATMOS2战术边缘计算机

Core Systems获得美国陆军C2NOW（下一代指挥控制）合同，提供ATMOS2战术边缘计算机。ATMOS2以15-35磅的单一机箱整合了此前超过250磅的服务器堆栈的全部功能——高核数CPU、板载SSD、最新GPU和集成UPS电池。系统采用MOSA开放架构，可随NGC2软件和AI决策工具的成熟而持续升级，标志着陆军在连级以下单位部署AI使能指挥控制的重要一步。

**Source:** [Core Systems Awarded Contract to Deliver ATMOS2 for Army C2NOW](https://core-systems.com/news/core-systems-awarded-contract-to-deliver-atmos2-tactical-edge-computers-for-the-u-s-army-c2now-program/)

## 分析

本周军事科技新闻围绕一个核心主题：AI从"实验室能力"向"战场基础设施"的全面转型。

295亿美元的AI军火库计划是这一转型的标志性投资。其核心洞察是：AI在军事上的成功不取决于模型本身，而取决于支撑模型的"计算基础设施"。五角大楼的"从分散GPU集群到集成AI基础设施组合"的表述，本质上是对云原生基础设施理念在军事领域的照应——正如企业级AI依赖Kubernetes和GPU编排，军事AI依赖的是安全、弹性、可扩展的国家级超算架构。

Anduril Voyager G1和Core Systems ATMOS2从"最后一公里"层面展示了边缘计算在军事场景中的形态演变。G1将"每名单兵变为网络节点"的理念与云原生的边缘节点概念高度一致——计算从数据中心向战术边缘的持续下沉，是军事IT架构的长期趋势。

CDAO的"算力瓶颈"警告则揭示了供需矛盾的尖锐性：当AI Agent在战场上每天处理近9亿token时，算力不再是后台资源问题，而是直接影响战斗力生成的前线问题。这与AWS/Google Cloud企业级场景下GPU短缺的困境如出一辙，只是在军事领域的后果更为严峻。

国防论坛中关于边缘AI+5G的讨论提供了一个前瞻性的架构参考：边缘计算+高吞吐量私有5G+AI决策辅助——这一"三位一体"架构可能成为未来战场C4ISR的标准范式。

## 结论

美国军事AI化正在从"单点试验"进入"系统化建设"阶段。AI军火库计划、边缘计算设备部署和指挥控制系统的AI整合，构成了从战略算力到单兵边缘的完整技术栈。CDAO强调的算力瓶颈和供应商多元化战略，表明国防部已从关注"是否有AI"转向"如何规模化运行AI"。对于国防科技企业，获得IL5/IL6认证和NIST API保护标准合规将成为参与2026年下半年国防AI项目的准入门槛。
