---
layout: post
title: "军事应用：美国海军COSMOS云平台加速作战能力交付，Viasat推出战术任务结构"
date: 2026-04-28
author: "云原生观察"
source: "https://www.doncio.navy.mil/(k3pdil3u5j2c0ui1hw1s3e55)/CHIPS/ArticleDetails.aspx?ID=20470"
categories:
  - military
tags:
  - military
  - defense
  - cloud-native
  - kubernetes
  - edge-computing
---

# 军事应用：美国海军COSMOS云平台加速作战能力交付，Viasat推出战术任务结构

2026年4月，美国国防部在云原生军事应用方面取得重要进展。海军信息战中心太平洋（NIWC Pacific）开发的COSMOS零信任云平台的作战能力交付时间，为正在进行的Modern Day Marine 2026展会（4月28-30日，华盛顿特区）提供了有力支撑。Viasat公司推出了战术任务结构（TMF），这是一个综合的边缘到云网络覆盖层，能够在最具争议的环境中实现有保障的多路径连接和网状网络。这些发展显示了云原生技术在现代军事行动中的关键作用，特别是在边缘计算、零信任安全和实时决策支持方面。

## 主要新闻

### COSMOS平台将作战能力交付时间从数月缩短至数小时

海军信息战中心太平洋（NIWC Pacific）开发的COSMOS云平台正在改变新数字能力到达作战人员的速度，通过取代数月的官僚延迟，实现数小时内的安全部署。这是一个零信任云环境，可自动化关键安全、监控和管理工作流程，使任务所有者能够快速上线、满足严格的合规标准，并在无传统官僚延迟的情况下部署新工具。COSMOS目前设计用于研发工作负载，托管在AWS GovCloud上，达到影响级别4和5，已获得处理受控非机密信息（CUI）的批准。该平台服务于超过4,000个国防部任务所有者，托管近200个独特的任务产品，预计到2027财年将在全面生产环境中运行。

**Source:** [CHIPS Articles: COSMOS Platform Slashes Bureaucracy, Delivers Secure Tech to Warfighters in Hours](https://www.doncio.navy.mil/(k3pdil3u5j2c0ui1hw1s3e55)/CHIPS/ArticleDetails.aspx?ID=20470)

### Viasat推出战术任务结构（TMF），实现有保障的边缘到云连接

Viasat公司宣布推出Viasat战术任务结构（TMF），这是一个综合的边缘到云网络覆盖层，可无缝增强和扩展现有的军事战术网络。TMF旨在提供有保障的多路径连接和网状网络，结合分布式云计算，使作战人员即使在最具争议的环境中也能更快地将数据转化为决策。TMF将标准战术网关和边缘计算转换为经过认证的战区内云节点，通过强大的现场计算能力消除传统上限制实时人工智能和机器学习分析的严重延迟。TMF还建立了高速、网状保护的骨干网，安全地将边缘连接回企业网络、安全影响级别5（IL5）云（如AWS GovCloud）和机密（IL6）云环境。

**Source:** [Viasat Transforms Tactical Defense Networks through New Assured Edge-to-Cloud Connectivity Service](https://www.viasat.com/news/latest-news/government/2026/viasat-tactical-mission-fabric-edge-to-cloud-connectivity/)

### Rancher Government Solutions发布IC Cloud支持，用于机密Kubernetes操作

Rancher Government Solutions（RGS）宣布其IC Cloud Support的通用可用性（GA），这是一种专为在政府机密云环境中运行的政府和军事团队构建的新能力。RGS还宣布Adam Toy晋升为首席技术官（CTO），他是RGS技术领导团队的创始成员，在推动安全、可互操作的云原生基础设施方面发挥了关键作用。RGS的IC Cloud Support与DPG Solutions建立了战略合作伙伴关系，使政府机构能够在中断、降级、间歇性和低带宽（DDIL）环境中运行虚拟机和使用容器化工作负载，而不会引入专有复杂性或损害安全性。

**Source:** [Rancher Government Solutions Announces General Availability of IC Cloud Support](https://ranchergovernment.com/news/introducing-rke-government-security-driven-kubernetes-engine)

### Kubernetes在国防部安全策略中的部署规划

根据AlphaBravo的深入分析，在国防部（DoD）组织中部署Kubernetes需要遵循CNCF多集群Kubernetes参考设计。该设计提供了一个安全应用平台的蓝图，正如官方文档所述："该平台将允许这些组织互连和共享基础设施服务，同时保持其独特任务的独立性和灵活性"。部署必须考虑影响级别特定的安全措施、CMMC要求、NIST SP 800-53控制、CIS Kubernetes基准合规性以及DISA STIG要求（仅Kubernetes就有91条规则）。完整的合规文档和ATO（操作授权）流程通常需要6个月以上的时间。

**Source:** [Planning a Kubernetes Deployment: Aligning with DoD Security Policies (Part 2)](https://blog.alphabravo.io/k8s-gov-deep-dive-part2/)

## 分析

2026年4月的军事云原生应用新闻揭示了现代国防技术转型的几个关键维度。首先，COSMOS平台的成功展示了云原生技术如何解决军事领域最核心的痛点之一：从创新到部署的漫长周期。传统上，新的数字能力可能需要数月甚至数年才能到达作战人员手中，这在这种威胁环境快速演变的时代是不可接受的。COSMOS通过零信任架构、自动化合规和云原生敏捷性，将这一周期压缩到数小时。这种模式对于其他军事部门和盟国具有强烈的示范效应。

Viasat的战术任务结构（TMF）则解决了另一个关键问题：战术边缘的连通性和计算能力。在现代战争中，数据到决策的延迟可能决定任务成败。TMF的创新在于将标准战术网关和边缘计算转换为"战区内云节点"，这实际上是把云原生架构的优势（弹性、可扩展性、服务发现）带到了最严苛的边缘环境。特别值得注意的是，TMF支持双层加密和持续监控，并与24/7/365网络安全运营中心支持相结合，满足了国防部对机密环境（IL5/IL6）的严格要求。在Modern Day Marine 2026的演示中，TMF展示了在模拟网络攻击中保持AI瞄准会话不中断的能力，这直接回应了" contested environment"中的生存能力需求。

Rancher Government Solutions的IC Cloud Support发布则填补了另一个重要空白：机密环境中的Kubernetes管理。在DDIL（中断、降级、间歇性和低带宽）环境中运行容器化工作负载一直是一个技术挑战，而RGS与DPG Solutions的合作提供了一种务实的解决方案——不引入专有复杂性，而是基于开源Kubernetes生态系统构建。

国防部Kubernetes部署规划的复杂性也值得关注。91条DISA STIG规则、NIST SP 800-53控制、CMMC要求——这些合规要求构成了云原生技术在军事领域应用的主要障碍。然而，正如AlphaBravo的分析所示，采用参考架构、实施策略即代码（Policy-as-Code）、设计网络分段从一开始就成为成功部署的关键。这些经验对于其他政府和军事组织具有重要的参考价值。

从更宏观的视角看，这些发展共同指向一个趋势：云原生技术正在从商业领域"渗透"到国防领域，不是通过妥协，而是通过适应。零信任、容器化、微服务、声明式API——这些在商业云中成熟的技术，正在被重新设计以满足军事需求的极端要求（安全性、可靠性、低延迟）。

## 结论

2026年4月的军事云原生应用动态显示，国防部门正在快速采纳云原生技术，但路径与商业领域截然不同。COSMOS和TMF的成功案例表明，关键在于将云原生的敏捷性与军事环境的特殊要求（零信任、合规、边缘计算）相结合。对于国防技术企业而言，现在应该关注：1）如何在产品中内置零信任和自动化合规能力；2）如何优化边缘计算架构以适应DDIL环境；3）如何设计既能满足IL6要求又保持开源灵活性的解决方案。随着COSMOS计划在2027财年进入全面生产环境，以及TMF在Modern Day Marine 2026的演示，我们可以预见军事云原生应用将在未来两年内迎来爆发式增长。那些能够将军用级安全要求与云原生敏捷性完美结合的技术提供商，将在这一市场中占据主导地位。
