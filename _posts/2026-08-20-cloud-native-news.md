---
layout: post
title: "云原生技术动态：Kubeflow正式毕业与Kyverno平台原语定位"
date: 2026-08-20
author: "云原生观察"
source: "https://www.cncf.io/announcements/2026/08/17/cncf-announces-kubeflows-graduation-solidifying-the-standard-for-cloud-native-ai-operations/"
categories:
  - cloud-native
tags:
  - kubeflow
  - kyverno
  - cncf
  - kubernetes
  - ai-operations
---

# 云原生技术动态：Kubeflow正式毕业与Kyverno平台原语定位

本周云原生生态迎来标志性时刻——CNCF宣布Kubeflow正式毕业，成为首批达到毕业状态的AI原生项目之一，累计下载量已接近2.6亿次。与此同时，CNCF博客先后发布关于Kyverno作为平台原语的深度思考和多平面架构实现平台主权的架构模式，Red Hat则在Advanced Cluster Management中推出Krkn Operator开发者预览，将混沌工程带入多集群管理时代。

## 主要新闻

### CNCF宣布Kubeflow毕业，确立云原生AI运维标准

CNCF于8月17日正式宣布Kubeflow毕业，标志着该项目已成为在Kubernetes上运行AI与机器学习工作负载的成熟、生产就绪平台。Kubeflow由Google于2017年创建，2023年以孵化项目身份加入CNCF，如今已发展出超过6600名贡献者、覆盖1000多个组织，GitHub星标超过33000个，Python包下载量接近2.6亿次，Nvidia、LinkedIn、Spotify等企业均为其用户。为达到毕业标准，项目完成了第三方安全审计、建立了正式的指导委员会并采纳了CNCF行为准则。其后续路线图聚焦LLM编排扩展、后训练微调能力增强以及面向Data & AI生命周期的Agentic工作负载。

**Source:** [CNCF Announces Kubeflow's Graduation](https://www.cncf.io/announcements/2026/08/17/cncf-announces-kubeflows-graduation-solidifying-the-standard-for-cloud-native-ai-operations/)

### Kyverno是平台原语，而非安全工具

CNCF博客8月19日发表文章提出一个重要观点转变：Kyverno不应被简单归类为Kubernetes安全工具，而应被视为与Pod和Service同等级别的"平台构建块"。作者回顾了自己从2023年KCD Munich上以"用Kyverno保护工作负载"为主题的演讲，到三年生产实践后将议题转向治理、CEL表达式和平台自助服务的演变历程。文章的核心论点是：以代码形式表达策略、通过Git版本化、由GitOps工具交付并由Kyverno强制执行，能让平台的理念从文档变为基础设施本身。作者建议开发者将Kyverno文档当作"平台SDK"而非"安全手册"来阅读。

**Source:** [Kyverno is a platform primitive, not a security tool](https://www.cncf.io/blog/2026/08/19/kyverno-is-a-platform-primitive-not-a-security-tool/)

### 多平面架构实现云原生平台主权

CNCF博客8月18日刊文探讨了在EU Data Act、NIS-2、DORA等法规约束下，如何通过多平面（multi-plane）架构将主权属性内建于平台拓扑。文章以CNCF沙箱项目OpenChoreo为例，将平台划分为控制平面、数据平面、可观测性平面、工作流平面和体验平面，各平面拥有独立的生命周期、扩缩行为和安全边界。关键设计在于连接模型：数据、可观测性和工作流平面向控制平面网关发起单向出站mTLS连接，控制平面从不反向拨入——这使受监管工作负载的API服务器无需暴露于公网，且数据平面在与控制平面失联时仍可持续服务流量。"一司法辖区一数据平面"的模式让审计中"数据在哪里"的问题可以直接从架构上回答。

**Source:** [Cloud Native platform sovereignty through multi-plane architecture](https://www.cncf.io/blog/2026/08/18/cloud-native-platform-sovereignty-through-multi-plane-architecture/)

### Krkn Operator登陆Red Hat ACM，混沌工程走向多集群

Red Hat于8月17日宣布Krkn Operator开发者预览版登陆Advanced Cluster Management for Kubernetes。平台团队现在可以直接从管理中心枢纽运行Kubernetes原生混沌工程，该Operator集成了CNCF开源项目Krkn，将多集群混沌测试和韧性验证带入混合环境。基于Open Cluster Management（OCM）的集成可自动发现托管集群并将其加入目标池，帮助团队在故障进入生产环境之前捕获失效模式、验证恢复时间。

**Source:** [Krkn Operator Developer Preview in Red Hat ACM](https://developers.redhat.com/articles/2026/08/17/krkn-operator-developer-preview-red-hat-acm)

## 分析

Kubeflow的毕业是CNCF发展史上的分水岭事件。作为最早一批达到毕业状态的AI原生项目，它确认了一个行业判断：云原生生态已经超越纯基础设施阶段，开始为完整的Data & AI生命周期提供生产级、供应商中立的基础底座。从2017年"在Kubernetes上跑TensorFlow"的工具集合，到今天统一的数据处理、训练、微调与推理平台，Kubeflow的九年演进路径恰好映射了AI基础设施需求的重心迁移——从实验到生产，从单模型到LLM编排与Agentic工作负载。对于正在构建AI平台的企业而言，Kubeflow与KServe、Kueue、Feast、Istio等项目的组合提供了避开厂商锁定的参考架构。

Kyverno的重新定位则反映了平台工程运动的深层变化。当"策略即代码"从安全团队的合规清单演变为平台行为的定义机制时，准入控制器的角色就从"守门人"变成了"结缔组织"——平台团队的自助服务、默认配置、命名规范都可以通过同一套声明式机制落地。这一视角对平台工程团队的实际意义在于：评估Kyverno时不应只看它的安全规则库，而应把它当作构建内部开发者平台的API面来审视。

多平面架构文章的价值在于把"数字主权"从采购承诺转化为可操作、可审计的架构属性。出站式mTLS连接模型解决了两个长期难题：受监管集群不暴露API服务器，以及控制平面故障不影响数据平面服务。随着欧盟CADA等法规推进，这类模式将成为跨国企业平台设计的必选项而非可选项。Krkn Operator的多集群混沌工程能力则补上了韧性验证的最后一块拼图——在多平面、多集群架构日益复杂的背景下，主动注入故障的能力与架构设计同等重要。

## 结论

本周动态共同指向云原生技术的三个方向：AI工作负载的平台化（Kubeflow毕业）、平台能力的原语化（Kyverno重定位）以及合规要求的架构化（多平面主权模式）。企业应尽快评估Kubeflow作为统一AI平台底座的适用性，重新审视策略引擎在平台工程中的角色定位，并在下一轮平台架构设计中纳入主权边界与混沌工程验证能力。
