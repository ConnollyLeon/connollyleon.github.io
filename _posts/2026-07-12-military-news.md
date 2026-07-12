---
layout: post
title: "军事应用：Pentagon JWCC UCM云市场重构，AWS与Anduril推出战术数据中心，陆军NGC2进入交付阶段"
date: 2026-07-12
author: "云原生观察"
source: "https://defensescoop.com/2026/07/01/aws-anduril-debut-new-tactical-data-center-cloud-offering/"
categories:
  - military
tags:
  - Pentagon
  - JWCC
  - cloud-marketplace
  - AWS
  - Anduril
  - edge-computing
  - AI
  - Army
  - NGC2
  - tactical-edge
---

# 军事应用：Pentagon JWCC UCM云市场重构，AWS与Anduril推出战术数据中心，陆军NGC2进入交付阶段

本周美国军事云和边缘计算领域三大进展：五角大楼发布JWCC后续合同（Unified Cloud Marketplace）草案，建立三级云生态系统并首次为小型企业设立专用通道；AWS与Anduril合作推出Menace-I战术数据中心，将云端AI能力带入战术边缘环境；陆军宣布Next Generation Command and Control（NGC2）进入持续交付阶段。

## 主要新闻

### Pentagon JWCC UCM草案：三级云市场与AI/边缘计算新要求

DISA于5月20日发布JWCC Unified Cloud Marketplace（UCM）草案性能工作声明，作为$90亿JWCC合同的后续项目。UCM将建立三级架构：

- **Tier 1（超大规模）**：核心基础设施和平台服务（当前JWCC四家供应商：AWS、Microsoft、Google、Oracle）
- **Tier 2（一切即服务）**：SaaS、PaaS和非超大规模IaaS
- **Tier 3（商业创新者和小型企业）**：新兴供应商和小企业的创新云服务——这是五角大楼云合同史上首次为小型和非传统云企业设立直接获得主要合同地位的通道

草案首次在如此规模的DoD云合同中要求AI/ML能力覆盖所有分类和影响级别（从非机密到Secret和Top Secret），且必须在DDIL（拒绝、降级、间歇、有限带宽）环境中运行。边缘计算要求涵盖可穿戴系统、车辆安装设备和模块化可部署数据中心——所有设施须在DDIL条件下自主运行、在连接恢复时同步、在对抗环境中承受战场处理。基础设施须在灾难性故障和主动网络攻击中持续运行，供应商将面临NSC认证红队对抗性安全测试。

DISA计划在2026年底前发布最终RFP，2027年开始授标。当前JWCC合同在过渡期内继续执行。

**Source:** [Pentagon's JWCC follow-on would create cloud marketplace](https://defensescoop.com/2026/06/01/pentagon-jwcc-ucm-draft-performance-of-work-statement/)

### AWS与Anduril推出Menace-I战术数据中心

AWS于6月30日宣布选择Anduril作为国家安全和国防领域的"首选边缘提供商"，双方合作推出Menace-I战术数据中心——使用AWS Outpost适应Amazon云计算的移动数据中心，为作战环境提供高容量计算和AI能力。

Menace-I有三个变体：Core（边缘部署云）、Command（可为飞行任务生成数据）、Enhanced（作为AI工厂支持传感器融合和目标定位）。Core/Command变体每个可容纳1个AWS Outpost机架（40-42台服务器），Enhanced版可支持4个机架（最多168台服务器）。硬件采用Ultra Low Latency Rack，提供比标准机架更快的速度。

Menace在过去三年中已运行超过50,000小时的坚固野外使用时间，已在各军种中使用并参与了包括"Operation Epic Fury"（对伊朗行动）在内的实际作战。Anduril工程高级副总裁Tom Keane指出，边缘环境与数据中心的关键区别在于："电源不够好、没有空调、通信有点不可靠。你可能是坐直升机或C-17到达的。"AWS全球防御管理总监Liz Martin表示，如果Menace/Outpost组合在Epic Fury行动中可用，用户将获得更广泛的前沿能力分布。

**Source:** [AWS, Anduril debut new tactical data center offering](https://defensescoop.com/2026/07/01/aws-anduril-debut-new-tactical-data-center-cloud-offering/)

### 陆军NGC2建立公共数据层基线，进入持续交付阶段

美国陆军于6月22日宣布已完成Next Generation Command and Control（NGC2）公共数据层基线的建立，以Anduril Industries为主导，与Palantir合作通过Anduril的Lattice和Palantir的Foundry提供边缘到云的数据网格。这一决定基于第4步兵师和第25步兵师在Ivy Sting-Ivy Mass和Lightning Surge演习系列中十个月的运营验证。

NGC2是陆军顶级现代化优先事项之一，更新部队在战场上共享和传递数据的方式。Anduril将在$200亿、10年期的企业许可协议下提供NGC2"全栈"中四个层之一的数据层（另有传输层、集成层和应用层）。陆军部长Dan Driscoll在参议院军事委员会作证时表示："我认为最大的风险不是走得足够快。Next Gen C2，我们预计五年内部署到所有师……我认为这不够。我认为我们需要在两三年内完成。"

洛克希德·马丁将继续在第25步兵师中主导全栈运营实施。两个架构（Anduril从零构建 vs 洛马的C2 Fix现代化基线）将帮助陆军确定整个军种所需的能力组合。Project Convergence-Capstone 6（2026年7月）将作为师级NGC2验证的最终事件。

**Source:** [Army and industry align on common data baseline](https://www.army.mil/article/293409/army_and_industry_align_on_common_data_baseline_as_next_generation_command_and_control_moves_from_prototyping_to_delivery)

## 分析

JWCC UCM草案代表了五角大楼云采购策略的重大演进。三级架构中Tier 3为小型企业设立直接通道是前所未有的——这打破了传统国防云合同被少数超大规模供应商垄断的格局。AI/ML能力要求覆盖所有分类级别且必须在DDIL环境中运行，反映了军方将AI视为所有作战层级的基础设施能力而非可选附加功能。对抗性安全测试要求（NSC认证红队）则确保安全声明将被实际验证而非仅停留在合规文档层面。

AWS与Anduril的Menace-I合作是"战术边缘云"从概念到作战装备的转折点。Menace已经历50,000小时野外使用和包括Epic Fury在内的实战检验，这不是实验室原型。三个变体的分层设计（Core/Command/Enhanced）允许指挥官根据任务需求选择适当的计算密度。更深层的影响是，当AWS Outpost被"加固"为可以空运、可以承受战场环境时，云端AI能力的部署边界从数据中心扩展到了前线——这可能从根本上改变军事决策的时间线。

NGC2进入交付阶段标志着陆军在数据驱动作战方面迈出了关键一步。Anduril（$200亿、10年期协议）和洛克希德·马丁在两个师中竞争不同数据层架构的设计，体现了陆军"双轨竞争"的采购策略。Driscoll部长希望在2-3年内完成全军部署——这一激进时间表反映了对太平洋战区数据优势紧迫性的认知。

## 结论

本周军事云和边缘计算领域的三大进展共同描绘了美国军事数字基础设施的演进方向：采购模式从单一超大规模垄断走向分级市场（JWCC UCM）、云端AI能力向战术边缘延伸（Menace-I）、数据驱动作战从原型走向交付（NGC2）。建议关注JWCC UCM最终RFP中Tier 3的具体资质要求，跟踪Menace-I在更多作战环境中的部署进展，以及NGC2在Project Convergence-Capstone 6中的验证结果。
