---
layout: post
title: "军事科技动态：五角大楼JWCC后续计划创建云市场、Defense Unicorns发布UDS Fleet战术边缘方案与DoD CIO推动基础网络安全变革"
date: 2026-06-03
author: "云原生观察"
source: "https://defensescoop.com/2026/06/01/pentagon-jwcc-ucm-draft-performance-of-work-statement/"
categories:
  - military
tags:
  - dod
  - jwcc
  - cloud-marketplace
  - edge-computing
  - defense-unicorns
  - uds-fleet
  - cybersecurity
  - jpl
  - openshift
---

# 军事科技动态：五角大楼JWCC后续计划创建云市场、Defense Unicorns发布UDS Fleet战术边缘方案与DoD CIO推动基础网络安全变革

本周军事科技领域聚焦云原生向战术边缘的深度扩展：五角大楼发布JWCC统一云市场草案，建立三层次云市场体系并强化AI与边缘计算能力；Defense Unicorns发布UDS Fleet产品，为前线分布式系统提供集中式舰队管理；DoD CIO在TechNet Cyber会议上呼吁超越合规、聚焦基础网络安全；NASA JPL将关键任务系统迁移至Red Hat OpenShift平台。

## 主要新闻

### 五角大楼JWCC后续计划：统一云市场草案发布

美国国防信息系统局（DISA）发布了JWCC统一云市场（UCM）合同的绩效工作声明草案，规划了继JWCC之后的新一代军事云采购框架。UCM将构建三层市场结构：第一层由超大规模云服务商提供核心基础设施和平台服务；第二层涵盖"一切即服务"（XaaS）能力，包括SaaS、PaaS和IaaS；第三层面向满足安全要求的商业创新企业和中小企业。草案特别强调在拒绝、降级、间歇性和有限带宽（DDIL）环境中的云能力部署，要求支持从便携式到车载系统的边缘设备。AI集成是另一核心焦点——要求云服务商在所有安全分类和影响级别提供AI/ML能力，包括数据标注、模型训练和在作战环境中部署AI模型。跨域数据移动能力也被列为关键需求，以支持不同密级网络间的安全数据共享。

**Source:** [Pentagon's JWCC follow-on would create cloud marketplace, expand AI and edge computing - DefenseScoop](https://defensescoop.com/2026/06/01/pentagon-jwcc-ucm-draft-performance-of-work-statement/)

### Defense Unicorns发布UDS Fleet：为战术前沿提供集中化舰队管理

Defense Unicorns宣布推出UDS Fleet，这是其Unified Defense Stack平台中专为分布式前线系统设计的产品。UDS Fleet包含两大核心能力：UDS Fleet Connect——直观的接口，允许任务操作员通过Android应用或浏览器桌面应用连接和管理单个系统；UDS Fleet Command——提供跨所有系统的统一可观测性和管理视图。Defense Unicorns的客户涵盖美国空军、海军、陆军和太空军，软件部署在超过80个任务系统和组织中。该公司持有3亿美元的国防部wide合同和1500万美元的太空军合同，并与BAE Systems和SAIC等主要国防承包商合作。

**Source:** [Defense Unicorns Launches UDS Fleet to Put Mission Operators in Command at the Tactical Edge - The AI Journal](https://aijourn.com/defense-unicorns-launches-uds-fleet-to-put-mission-operators-in-command-at-the-tactical-edge/)

### DoD CIO：基础网络安全超越合规，聚焦作战韧性

美国国防部首席信息官Kirsten Davie在巴尔的摩TechNet Cyber会议上呼吁行业将更大关注放在"基础网络安全"上。Davie强调："合规不等于安全。我们必须追求对作战韧性的不懈关注——这是一个动态的、适合目的的网络安全态势。"她指出，国防工业基础的安全就是作战人员的安全——小型供应商的入侵可能危及前线作战人员的实时决策。Davie宣布未来几个月将对CIO办公室进行重组，以"统一、整体和风险驱动"的方式转型网络安全计划，并强调将采取更积极的行动导向。

**Source:** [DoD CIO implores industry to put a greater focus on 'foundational cybersecurity' - Breaking Defense](https://breakingdefense.com/2026/06/dod-cio-implores-industry-to-put-a-greater-focus-on-foundational-cybersecurity/)

### NASA JPL将关键任务系统迁移至Red Hat OpenShift

NASA喷气推进实验室（JPL）将关键任务IT基础设施迁移至Red Hat OpenShift Virtualization平台，这是航天机构在深空操作中采用云原生技术的重要里程碑。OpenShift平台使JPL能够在统一的基础设施上运行传统虚拟机和容器化应用，支持任务规划、航天器数据处理、遥测处理等关键工作负载。这对Europa Clipper（2024年发射，2030年到达木星）、Psyche、火星车和地球观测等长期任务尤为重要。安全控制方面，OpenShift提供RBAC、网络策略和SELinux安全上下文，这对处理敏感任务系统和航天器通信的机构至关重要。

**Source:** [JPL shifts mission systems to OpenShift platform - Arabian Post](https://thearabianpost.com/jpl-shifts-mission-systems-to-openshift-platform/)

## 分析

五角大楼JWCC统一云市场草案揭示了美国军事云战略的核心演进方向——从"采购云服务"转向"构建云生态"。三层市场结构的设计体现了对不同规模供应商的包容性：超大规模厂商提供基础能力，XaaS层覆盖更广泛的服务形态，创新层为中小企业和商业技术提供入口。特别值得注意的是DDIL环境要求——这不仅是技术规格，更反映了美军对"大国竞争"场景下网络环境恶化的战略假设。在印太战区的潜在冲突中，通信将是电子战的首批打击目标，边缘节点的自主运行能力直接决定战斗力。

Defense Unicorns的UDS Fleet和UDS Enterprise产品组合展示了军事软件交付从"集中式"向"边缘-核心协同"的范式转变。UDS Fleet在边缘端的Android应用中提供任务操作界面，而UDS Enterprise在数据中心和云环境中为平台工程师提供管理工具——这种"端到端"架构设计正是JADC2（联合全域指挥控制）理念在软件层面的实现。Defense Unicorns作为2019年成立的初创公司获得3亿美元国防合同，也反映了五角大楼对"商业技术快速引入"模式的持续投资。

DoD CIO的"合规不等于安全"表态具有深刻意义。CMMC（网络安全成熟度模型认证）框架虽然为国防供应链设定了安全基线，但Davie指出仅满足合规要求远不足以应对当前威胁。在AI加速了"漏洞发现到利用"时间窗口（从数月缩短到数分钟）的背景下，静态合规正在让位于动态韧性。

## 结论

五角大楼JWCC UCM标志着军事云从多供应商试点迈向统一市场的系统性升级，DDIL边缘能力成为核心关注点；Defense Unicorns的UDS Fleet为战术边缘设备管理提供了急需的标准化解决方案；DoD CIO对"超越合规"的呼吁反映了军事网络安全从静态合规向动态韧性的重大转型；NASA JPL的OpenShift迁移证明云原生技术正在渗透到最深空、最苛刻的任务环境中。国防IT采购和工程团队应重点关注JWCC UCM的供应商准入准备、边缘云原生平台的评估部署，以及CMMC 2.0向动态安全态势的演进路径。
