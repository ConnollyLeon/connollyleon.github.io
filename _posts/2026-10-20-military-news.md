---
layout: post
title: "军事应用：太空军PLATE云测试床、陆军NGC2集成阵痛与DISA Enclave扩张遭小企业抗议"
date: 2026-10-20
author: "军事科技观察"
source: "https://briefglance.com/articles/space-force-taps-tech7-to-build-cloud-testbed-for-leo-data-deluge"
categories:
  - military
tags:
  - defense-cloud
  - space-force
  - ngc2
  - edge-computing
  - disa
  - jadc2
  - zero-trust
---
# 军事应用：太空军PLATE云测试床、陆军NGC2集成阵痛与DISA Enclave扩张遭小企业抗议

过去24小时内，国防云与指挥控制领域三条新闻值得记录：美国太空军通过SpaceWERX授予Tech7直接第二阶段SBIR合同，建设基于AWS的LEO数据云测试床PLATE；陆军在25th步兵师的NGC2演习中暴露与遗留通信装备的集成难题；DISA扩大Leidos的Defense Enclave Services合同计划遭小企业向GAO提起抗议。三条新闻分别对应国防云的新建、融合与采购三个环节。

## 主要新闻

### 1. 太空军授出PLATE云测试床合同，为"增殖型LEO"数据洪峰预建沙盒

据BriefGlance报道（10月19日），SpaceWERX已向科罗拉多斯普林斯的The Tech7 Company授予Direct-to-Phase-II SBIR合同，开发"Proliferated LEO Agile Testbed Environment"（PLATE）——一个基于Amazon Web Services商业云的非密云测试床，用于在入轨前快速成熟并验证军用下一代空间网络的软件。项目本月启动，跳过第一阶段可行性研究的安排，反映出军方对解决Space Development Agency"增殖型作战人员空间架构"（PWSA）数据瓶颈的紧迫性。Tech7首席工程师Paul Zetocha表示："增殖型LEO的难题不是采集数据，而是处理、融合、信任并及时据此行动。"测试床以非密层级起步，使非传统厂商与学术团队可用合成数据训练模型、测试传感器融合算法，合同并规划了通往多级安全（MLS）与AWS GovCloud IL-6环境的迁移路线，为后续联军数据共享奠基。该能力是国防部JADC2愿景的基础一环。

**Source:** [Space Force Taps Tech7 to Build Cloud Testbed for LEO Data Deluge - BriefGlance](https://briefglance.com/articles/space-force-taps-tech7-to-build-cloud-testbed-for-leo-data-deluge)

### 2. 陆军NGC2在夏威夷演习暴露集成阵痛：Lattice遭遇遗留电台

据Anduril News汇总（源自Breaking Defense，10月19日），陆军第25步兵师于9月在夏威夷"Lightning Surge 5"演习中测试Anduril的Lattice指挥系统，首次将其与既有陆军通信基础设施对接，暴露出集成问题——不同于科罗拉多州第4步兵师使用全新商业软硬件的成功试点，25th师面对的是不同电台波形、新任务类型与复杂丛林地形（且使用更轻的步兵班用车而非Stryker）。集成商Lockheed Martin的Chandra Marshall承认，通过系统的数据"目前尚未达到应有状态"。陆军C2IN组合管理人Shane Taylor准将将其定性为"正常的成长阵痛"。各方正在推进技术优化，包括将边缘计算降级至平板终端、协调电台信道配置，目标是在2027财年内完成I Corps更大范围的列装。NGC2是陆军整合统一数据层与应用的新一代指挥控制计划，Anduril于2026年5月获得最高18亿美元合同将其推广至整个I Corps。

**Source:** [Army's NGC2 integration test reveals technical hurdles as it scales beyond pilot unit - Anduril News (curated from Breaking Defense)](https://www.andurilnews.com/news/2026/10/army-feels-growing-pains-as-it-integrates-anduril-ngc2-tech-with-older/)

### 3. 小企业抗议DISA扩大Leidos Enclave合同，GAO裁决预计明年1月出炉

Washington Technology报道（10月19日），服务残疾退伍军人拥有的小企业Competitive Range Solutions已就DISA扩大Leidos Defense Enclave Services合同的计划向政府问责办公室（GAO）提起抗议（10月8日提交，裁决预计2027年1月19日前作出）。该合同覆盖国防部行政机构间的IT与网络需求，DISA计划将作战司令部向DoDNet的迁移工作并入其中。抗议方主张：DISA早在2023年就承认将NIPRNet、SIPRNet与JWICS用户迁出Enclave范围之外，甚至发出过探索多奖小企业合同的Sources Sought通知，却在2026年先发布单一来源论证、后补市场研究；其"只有Leidos拥有自动化脚本"的论点被抗议书称为"不合理认定"——因为脚本仅覆盖部分迁移工作，且Enclave招标文件明确要求承包商向政府交付全部数据库、脚本与源码，DISA已拥有无限权利。此前，GDIT曾于6月成功抗议DISA的首次类似尝试。

**Source:** [Small business takes aim at DISA's Enclave expansion - Washington Technology](https://www.washingtontechnology.com/contracts/2026/10/small-business-takes-aim-disas-enclave-expansion/416679/)

## 分析

三条新闻从不同侧面反映了国防云与指挥控制现代化的真实进度条：

- **国防云的重心正从"上云"转向"为特定数据形态重建测试与开发环境"。** PLATE的实质是承认：LEO星座的软件问题无法在传统烟囱式开发环境中解决。以非密AWS商业云起步、以合成数据开放给非传统厂商，再规划通往GovCloud IL-6的迁移路径，构成了一套"先开放迭代、后密级收敛"的采集策略——这正是SpaceWERX此类创新机构相对传统采办的速度优势所在。但需清醒看到：非密沙盒中验证的算法，迁移到多级安全环境时的性能与部署成本往往显著上升，PLATE能否兑现价值，取决于其Phase III迁移是否按期获得资金。
- **"新系统+旧装备"是所有C2现代化计划的真正战场。** 第4师的成功被普遍视为"干净环境"的结果，25th师的阵痛才更接近大多数部队的现实——这与企业界Kubernetes迁移中"配置翻译容易、遗留集成难"的规律高度同构。Lockheed作为集成商公开承认数据状态不达预期，说明多厂商协调（Anduril、Lockheed、陆军）的复杂度常被合同金额掩盖。对JADC2而言，这类问题在13个师的推广中若逐个复制，将直接消耗2027财年列装窗口；持续决议（continuing resolution）下的预算节奏则会进一步放大延期风险。
- **采购合规正在成为国防IT现代化的隐形变量。** DISA抗议案的核心不是价格，而是范围界定与小企业参与程序——这延续了OSC Edge案确立的先例（"现任合同方身份不足以证明其为唯一责任来源"）。若GAO再次支持抗议方，DISA乃至各军种将被迫重新审视"把小企业合同范围并入大合同"的惯常操作；对Leidos而言，Enclave扩张的节奏与收入确认都存在不确定性。

展望未来，三个观察点是：PLATE的Phase III资金与多级安全迁移时间表、NGC2在I Corps其他师推广时是否复现25th师的集成问题（以及是否触发追加工程预算）、以及GAO在2027年1月对DISA抗议的裁决方向。同期，DHS/GSA的AI采购条款已于10月19日生效，联邦云采购的合规基线也在同步抬升。

## 结论

今日三条军事云新闻共同说明：国防数字化的瓶颈已从"预算"转移到"集成与制度"。太空军用云测试床为数据洪峰预铺跑道，陆军在遗留系统集成中体验成长阵痛，DISA则在采购程序上遭遇司法化挑战——三者都是大规模现代化必然支付的摩擦成本。决定胜负的不是谁先宣布"上云"，而是谁能在密级、遗留装备与采办规则三重约束下，把能力真正交付到作战人员手中。
