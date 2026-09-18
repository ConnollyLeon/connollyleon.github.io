---
layout: post
title: "云原生动态：微软携手Marvell与Utimaco交付Azure Payment HSM v2、Cilium 1.20落地Gateway API ExternalAuth与TCP/UDP路由、OpenBao以CloudNativePG为后端在K8s上高可用部署"
date: 2026-09-18
author: "云原生观察"
source: "https://investor.marvell.com/news-events/press-releases/detail/1033/microsoft-marvell-and-utimaco-to-deliver-industry-first-secure-cloud-scale-payments-solution"
categories: [cloud-native]
tags: [cloud-native, azure, payment-hsm, marvell, liquidsecurity, utimaco, atalla, hsm, cilium, gateway-api, externalauth, tcproute, udproute, ipam, ipv6, openbao, cloudnativepg, postgres, secrets, kubernetes]
---

9月14日至17日，云原生基础设施的"安全与数据"两个侧面各自向前推进。安全侧，微软联合Marvell与Utimaco于9月17日宣布交付Azure Payment HSM v2——一个由LiquidSecurity与Atalla技术栈驱动的"行业首个云规模支付安全方案"，让支付HSM以云服务形态进入Azure预览；软件定义网络侧，Cilium 1.20于9月14日发布，携带Gateway API ExternalAuth、TCPRoute/UDPRoute与ENI IPAM for IPv6等一批成熟度不一的进展；数据侧，CNCF于9月16日刊发实例教程，演示以CloudNativePG托管的PostgreSQL作为后端，在Kubernetes上构建OpenBao高可用密钥服务。三条消息看似各属战线，实则共同指向同一个主题：敏感能力（支付密钥、网络执行点、根凭据）正被系统性地"云原生化、可编排化"。

## 主要新闻 (Main News)

### Microsoft联合Marvell与Utimaco推出Azure Payment HSM v2：支付级HSM以云服务形态落地

9月17日，微软联合半导体与安全芯片厂商Marvell、支付HSM老牌厂商Utimaco宣布，推出Azure Payment HSM v2——一项被三方称为"行业首个安全云规模支付解决方案"的服务。该服务把支付卡处理行业的硬件安全模块（HSM）能力以托管云服务形式交付到Azure：v2基于Marvell LiquidSecurity（软件定义的可编程HSM，按虚拟设备弹性扩容）与Utimaco Atalla（面向支付场景的HSM软件栈）的组合，将PIN处理、密钥托管、卡个性化等支付域关键操作从"独享物理盒子"迁移为"多云可编程的服务单元"。与上一代的最大区别在于"云规模"与"可编排"：支付服务商以往要么采购物理HSM自建机柜、要么依赖单点供应商，而v2让支付机构可以按交易量弹性伸缩HSM容量，并把它嵌入Azure既有运维与合规链路。据Marvell新闻稿，服务当前以公开预览（public preview）形式在美国西部与西欧区域推出。对支付与FinTech基础设施团队而言，这是"将PCI/DPAS类合规边界上云"的一次实质性让步——硬件信任根仍在，但对硬件形态的僵化依赖正在被服务化结构替代。

**Source:** [Microsoft, Marvell and Utimaco to Deliver Industry-First Secure Cloud-Scale Payments Solution](https://investor.marvell.com/news-events/press-releases/detail/1033/microsoft-marvell-and-utimaco-to-deliver-industry-first-secure-cloud-scale-payments-solution)

### Cilium 1.20发布：Gateway API ExternalAuth、TCP/UDP路由与IPv6 ENI IPAM齐头并进

9月14日，Cilium 发布2026年的第二个大版本1.20（继1.19之后）。新版本的重点落在"南北向L4与身份边界的补齐"：首先是Gateway API的ExternalAuth支持——网关层的外部认证可以交给独立身份服务（如OIDC/OAuth代理）裁决，而被授权与否的判断从数据路径外部化，既减轻eBPF侧的执行负担，也让"认证策略"与"转发策略"解耦管理；其次是TCPRoute/UDPRoute资源，把Gateway API的L4路由能力落地，令Cilium原生网关能够在稳定的HTTP之外，以标准资源处理TCP/UDP流量，向"通用L4/L7政策入口"收敛；IPAM侧，Multi Pool IPAM毕业为稳定（stable），而ENI IPAM for IPv6的到来，则让AWS环境里基于ENI的IPv6地址分配在Cilium中成为一等公民。发布说明同样强调三个核心主题——安全性、可扩展性与对现代基础设施的适配，反映出Cilium在"服务网格可选Networking层"与"平台默认CNI"两条赛道上都在加固。对云原生平台团队，1.20的升级要点是验证ExternalAuth与你既有IdP的策略语义是否一致，以及评估L4 Gateway路由能否替代一部分自建的Ingress/NetworkPolicy胶水。

**Source:** [Cilium 1.20: Gateway API ExternalAuth, TCPRoute/UDPRoute, ENI IPAM for IPv6, and more](https://www.cncf.io/blog/2026/09/14/cilium-1-20-gateway-api-externalauth-tcproute-udproute-eni-ipam-for-ipv6-and-more)

### OpenBao on Kubernetes：以CloudNativePG管理的PostgreSQL为后端搭建高可用密钥服务

9月16日，EnterpriseDB的Gabriele Bartolini与ControlPlane的Rob Kenefeck在CNCF博客发表教程，演示如何用CloudNativePG在Kubernetes上为OpenBao构造生产级高可用存储后端。OpenBao（HashiCorp Vault的开放源代码分支，现为CNCF项目）的可用性瓶颈往往在状态层：其HA模式需要共享存储后端，而教程给出的答案是把这一职责交给CloudNativePG托管的PostgreSQL——一个三节点的PostgreSQL StatefulSet承担Raft式共识与数据持久化，OpenBao以StatefulSet（orderedReady）方式随其后，配合agent注入器实现应用侧凭据注入；值得注意的是，OpenBao的readiness在此绑定于'unseal'状态而非进程存活，因此在Pod就绪判定上清晰地区分了"进程起来了"与"真正可用于签发密钥"。教程还覆盖了schema初始化、pod发生故障时的自愈与failover行为，以及如何在已有Kubernetes集群中零依赖地复现。对平台工程而言，这条"密钥服务=有状态工作负载"的装配线，是把秘钥管理从'运维的黑盒'变成'可由Operator编排的普通资源'的又一实证——也再次说明，HashiCorp诸工具的CRN化正在让'自托管的安全基础设施'变得和跑一个数据库一样普通。

**Source:** [Running OpenBao on Kubernetes with a CloudNativePG PostgreSQL backend](https://www.cncf.io/blog/2026/09/16/running-openbao-on-kubernetes-with-a-cloudnativepg-postgresql-backend/)

## 分析 (Analysis)

把三则消息放在一起看，这一周云原生领域的主线是"信任边界的软件化"。Azure Payment HSM v2的本质不是'把HSM放进云里'那么简单，而是把支付场景最敏感的一类硬件信任根改写成可编程、可编排、可伸缩的服务——它由Marvell提供弹性容量、Utimaco提供支付语义、Azure提供计费与运维，等于把过去"买一台Atalla/Luna亲自上线"的繁重路径，压缩成一次REST调用。它的意义不亚于当年密钥管理从"自建KMS"走向"托管KMS"：一旦支付级HSM成为云原生资源，支付网络的扩容与合规审计都将获得前所未有的弹性，而这正是Payments-as-a-Service在2026年加速的前提。

Cilium 1.20则展示了执行点在数据路径上的又一步'去专业化'。ExternalAuth把认证决策从eBPF侧剥离给外部身份服务，TCPRoute/UDPRoute把L4策略收编进标准Gateway API，本质上都是把'曾经只有专业网络团队能改的点'变成'平台声明式资源'。这对于'平台工程化'的叙事很关键：当网关既处理认证转发、又处理L4路由、又在IPv6双栈的AWS ENI上毫无压力地做IP分配时，网络侧的基础设施就不再是少数网络专家的特权领地，而成为与其他工作负载一致的声明式资产——也会反过来抬高对Gateway API控制器实现一致性的要求。

至于OpenBao×CloudNativePG，则是对'安全基础设施是可以被普通Operator管理的'这一命题的实证。把密钥发行置于PostgreSQL三节点之上，让HA、failover、恢复全部交给数据库Operator消化，OpenBao退化为'无状态逻辑＋有状态后端'的标准形态——这与HSM服务化是同一潮流的两个层次：一端是硬件的信任根浮上云服务，另一端是软件的安全设施沉入通用数据栈。对观察者的启示是：2026年的云原生安全正在从'一个个加固点'走向'可以被生命周期管理、被策略编排、被作为普通资源审计的组件体系'，支付HSM、网络执行点与根凭据都不过是这个体系的不同端口。

## 结论 (Conclusion)

过去四天，'信任'本身正在被云原生化：微软×Marvell×Utimaco把支付HSM做成弹性云服务，Cilium 1.20把网关认证与L4路由收编为可声明资源，OpenBao则以CloudNativePG为后端在Kubernetes上实现高可用密钥服务。它们共同的信号是——安全能力正从'物理盒子＋专家手动操作'走向'可编排服务＋平台声明式管理'。对基础设施团队，下一步值得做的是：评估Azure Payment HSM v2（West US/West Europe公开预览）的合规映射，规划Cilium 1.20的ExternalAuth与L4路由试点，并把OpenBao×CloudNativePG这套后端的故障演练纳入密钥管理路径的服务化验证。