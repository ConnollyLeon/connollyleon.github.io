---
layout: post
title: "云原生动态：Kepler重构提升能效精度，etcd-operator入驻Cozystack，CNCF新成员加入"
date: 2026-07-01
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/06/30/kepler-re-architected-improved-power-accuracy-and-a-community-call-to-action/"
categories:
  - cloud-native
tags:
  - kepler
  - cncf
  - etcd
  - cozystack
  - kubernetes
  - kubecon
  - cloud-native
  - power-monitoring
  - sustainability
  - open-source
  - operator
  - kubecon-india
---

# 云原生动态：Kepler重构提升能效精度，etcd-operator入驻Cozystack，CNCF新成员加入

7月首日，云原生社区迎来多项技术更新：CNCF项目Kepler完成重大架构重构以提升能效监控精度，etcd-operator正式入驻Cozystack并发布全新API，CNCF在KubeCon India期间迎来新一批银牌成员加入。

## 主要新闻

### Kepler项目完成重大架构重构

CNCF沙箱项目Kepler（Kubernetes Energy Pod Exporter）宣布完成重大重构。维护团队决定放弃基于eBPF的实现，转而采用基于`/proc`和`/sys`的只读访问方案。新架构显著降低了部署复杂度——仅需一个Helm Chart即可开箱即用，不再需要复杂的内核依赖和权限配置。这一改变将能效监控的准确性提升作为首要目标，任何拥有标准Linux内核的Kubernetes集群均可轻松部署。项目同时发出社区行动呼吁：需要用户测试GPU功耗监控（实验性功能）、训练VM功耗模型、验证裸金属CPU功耗归因准确性，以及改进空闲功耗归因算法。

**Source:** [Kepler, re-architected: Improved power accuracy and a community call to action!](https://www.cncf.io/blog/2026/06/30/kepler-re-architected-improved-power-accuracy-and-a-community-call-to-action/)

### etcd-operator捐赠至Cozystack，v1alpha2 API发布

etcd-operator项目正式捐赠给Cozystack平台，并同步发布从零实现的全新v1alpha2 API版本。新实现不再通过StatefulSet管理etcd成员，而是直接驱动etcd原生的Membership API（MemberAdd、MemberPromote、MemberRemove操作），使Operator拥有对集群成员关系的完全控制。新API组从`etcd.aenix.io`变更为`etcd-operator.cozystack.io`，引入独立的EtcdMember资源。新增功能包括：零停机缩容（暂停/恢复保留集群和成员身份）、基于tmpfs的内存存储、无Webhook的CEL验证、自动PodDisruptionBudget、通过/scale子资源支持kubectl scale和VPA等。

**Source:** [etcd-operator joins Cozystack with a new v1alpha2 API](https://www.cncf.io/blog/2026/06/29/etcd-operator-joins-cozystack-with-a-new-v1alpha2-api/)

### CNCF在KubeCon India迎来新银牌成员

在KubeCon + CloudNativeCon India 2026大会上，CNCF宣布新增14位银牌成员、银牌终端用户及一名非营利成员。CNCF执行董事Jonathan Bryce表示："98%的组织已采用云原生技术，这证明该生态系统已成为企业基础设施的全球标准。"新成员涵盖平台工程、AI基础设施、托管Kubernetes服务、金融科技和企业软件等多个领域，反映了云原生生态的持续扩张和多元化。

**Source:** [CNCF Welcomes New Silver Members as Global Demand for Cloud Native Infrastructure Grows](https://www.cncf.io/announcements/2026/06/17/cncf-welcomes-new-silver-members-as-global-demand-for-cloud-native-infrastructure-grows/)

### Kubernetes v1.37功能冻结，KubeCon India聚焦AI与平台工程

Kubernetes v1.37增强功能已于6月16日完成冻结，计划于8月26日正式发布GA版本。下一个里程碑是7月22日的代码冻结。同时，KubeCon + CloudNativeCon India在孟买Jio世界会议中心举行，重点讨论AI/ML集成、安全性和平台工程。行业讨论显示，组织正越来越多地从手动YAML管理转向内部开发者平台（IDP）和托管无服务器容器模型。

**Source:** [Kubernetes v1.37 Enhancements Freeze & KubeCon India](https://aytac.dev/en/news/kubernetes-updates-v1-37-kubecon-2026/)

## 分析

本周的云原生新闻呈现出三个清晰的技术趋势。首先，Kepler的重构反映了CNCF项目从"功能优先"向"可操作性优先"的演进。放弃eBPF虽然看似倒退，但实际上是对现实世界部署痛点的务实响应——运维团队不需要一个功能强大但难以配置的工具，而是需要一个在五分钟内可用的能效监控方案。这一决策可能为其他依赖eBPF的CNCF项目提供参考。

其次，etcd-operator的捐赠和重写代表了Kubernetes Operator模式的最新演进。直接驱动etcd Membership API而非依赖StatefulSet的架构选择，体现了对Kubernetes有状态工作负载管理理念的深化理解。CEL验证替代Webhook的做法也值得关注——它消除了证书管理的运维负担，使Operator在多租户环境中更易于部署。

第三，KubeCon India的持续举办和98%的云原生采用率表明，市场焦点正在从"是否采用Kubernetes"转向"如何高效运行Kubernetes"。平台工程作为屏蔽复杂性层的兴起，以及无服务器容器模型的回归（Cloud Run、AWS Fargate），反映了行业对Kubernetes运维复杂性的清醒认识。

对于从业者而言，建议：评估Kepler在集群能效监控中的应用潜力；关注etcd-operator v1alpha2的迁移路径，特别是如果你正在使用旧版本；如果团队较小且工作负载简单，慎重考虑是否真的需要自管Kubernetes，而非使用托管服务。

## 结论

7月首日的云原生新闻表明，生态正在经历从"创新驱动"到"运维优化"的成熟化转型。Kepler重构关注可操作性，etcd-operator重写关注运维健壮性，而平台工程运动的兴起则是对Kubernetes复杂性的系统回应。这些趋势共同指向一个方向：让云原生技术真正为更多团队所用。
