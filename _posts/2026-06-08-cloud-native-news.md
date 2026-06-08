---
layout: post
title: "云原生技术动态：Google开源Agent eXecutor与Agent Substrate、Kubernetes CVE分类纠正、Hearth项目实现LLM零缩放"
date: 2026-06-08
author: "云原生观察"
source: "https://dev.to/om_shree_0709/the-kubernetes-native-layer-for-ai-google-open-sources-agent-executor-ax-148e"
categories:
  - cloud-native
tags:
  - kubernetes
  - AI
  - Google
  - AX
  - Agent-Substrate
  - Hearth
  - CVE
  - security
  - cloud-native
---

# 云原生技术动态：Google开源Agent eXecutor与Agent Substrate、Kubernetes CVE分类纠正、Hearth项目实现LLM零缩放

本周云原生领域迎来多项重要更新。Google开源了Kubernetes原生的Agent eXecutor (AX)运行时和Agent Substrate控制平面，Kubernetes安全响应委员会纠正了多个历史CVE记录的分类元数据，Hearth项目发布了首个支持scale-to-zero的LLM推理Kubernetes Operator。

## 主要新闻 (Main News)

### Google开源Agent eXecutor (AX)：Kubernetes原生AI Agent运行时

Google宣布在Apache 2.0许可下开源Agent eXecutor (AX)，这是一个用Go编写的Kubernetes原生分布式运行时，专为调度、隔离、持久化和扩展长时间运行的agent工作负载而设计。AX与Agent Substrate配对使用，后者是专为超大规模Agent基础设施密度设计的补充控制平面层。关键特性包括：Pod Snapshots可将空闲Agent会话挂起到冷状态释放计算资源（资源占用降至接近零）、支持每秒300个沙箱的快速分配（延迟低于200ms）、以及通过gVisor/Kata Containers实现的严格沙箱隔离。

**Source:** [The Kubernetes Native Layer for AI: Google Open-Sources Agent eXecutor (AX)](https://dev.to/om_shree_0709/the-kubernetes-native-layer-for-ai-google-open-sources-agent-executor-ax-148e)

### Kubernetes安全响应委员会纠正多个历史CVE分类

2026年6月1日，Kubernetes安全响应委员会（SRC）正式纠正了多个历史CVE记录的固定版本元数据。CVE-2021-25740（EndpointSlice写权限跨命名空间转发）、CVE-2020-8561、CVE-2020-8562被重新标记为"架构性设计风险"而非"编码错误"——这意味着所有Kubernetes版本仍未修复，安全扫描器将开始标记此前被不准确元数据隐藏的发现。CVE-2021-25740允许低权限用户通过受信任的ingress或负载均衡路径跨命名空间路由流量，修复方法是RBAC证据、窄委托和重复漂移检测。

**Source:** [EndpointSlice RBAC Hardening After CVE Fix Corrections](https://techbytes.app/posts/endpointslice-rbac-hardening-cve-fix-corrections/)

### Hearth：Kubernetes上scale-to-zero的LLM推理Operator

Hearth项目发布了v0.1.0版本，这是一个Kubernetes Operator，可以声明式地提供开源LLM（Qwen、DeepSeek、GLM等）并在空闲时缩放到零。Hearth通过vLLM作为推理引擎，支持多后端抽象（NVIDIA、Ascend）、模型缓存/预热、Gateway API + KEDA scale-to-zero、冷启动keepalive和优雅排空。Hearth的独特之处在于支持无GPU开发路径——通过CPU vLLM桩模拟启动延迟、流式输出和/metrics，开发者无需加速器即可贡献代码。

**Source:** [Hearth: scale-to-zero LLM serving on Kubernetes](https://dev.to/kubegopher/hearth-scale-to-zero-llm-serving-on-kubernetes-and-you-can-hack-on-it-without-a-gpu-bn2)

### Chainguard报告发现Kubernetes Wiper攻击针对伊朗系统

安全研究人员披露了一起涉及Trivy漏洞扫描器供应链攻击的复杂恶意活动，该攻击已扩展为针对伊朗Kubernetes集群的破坏性擦除器（wiper）。攻击者（疑似TeamPCP）部署了通过SSH和暴露的Docker API传播的Kubernetes Wiper，在植入后门的同时擦除整个集群。安全专家指出这一事件标志着云原生安全威胁从数据窃取向基础设施破坏的根本性转变。

**Source:** [Trivy Hack: Uncovering the Spread of Infostealer via Docker and Kubernetes Wiper](https://ocaktabul.com/article/trivy-hack-uncovering-the-spread-of-infostealer-via-docker-and-kubernetes-wiper)

## 分析 (Analysis)

Google开源Agent eXecutor (AX)是本周最重大的云原生技术发布。AX+Agent Substrate组合直接回应了当前Kubernetes生态中最紧迫的挑战：如何在大规模运行AI Agent工作负载。传统的Kubernetes HPA以分钟/秒级响应，Pod保持暖状态持续消耗资源——这对于需要管理数百万Agent会话的企业级AI部署是不可持续的。AX的Pod Snapshots技术通过将空闲Agent冻结到冷状态，实现了接近零的资源占用和亚秒级恢复，从根本上改变了Agent基础设施的经济模型。这一发布与Microsoft在Build 2026上的OpenClaw/Scout发布形成有趣对比：Google选择完全开源其Agent运行时，而Microsoft选择基于开源OpenClaw构建商业化控制平面。两种战略反映了对Agent基础设施未来货币化路径的不同判断。

Kubernetes SRC的CVE元数据纠正是安全治理领域的重要事件。CVE-2020-8561、CVE-2020-8562和CVE-2021-25740被重新分类为"架构性设计风险"意味着没有一个版本升级可以修复它们——唯一的修复方法是配置管理。对于平台工程团队，这意味着安全扫描器将突然开始标记那些此前被认为"已修复"的环境，需要立即进行RBAC审计。这尤其影响升级后的集群和自定义角色，它们可能保留着已废弃的宽权限配置。

Hearth项目的发布代表了Kubernetes上AI推理的一个新兴模式：面向开发者个人的、私有部署的、成本敏感的推理服务。与CNCF层面的llm-d等面向数据中心的大规模推理框架不同，Hearth专注于"几块GPU、scale-to-zero、私有"的推理需求，填补了从云API到自建集群之间的关键空白。

Trivy/Kubernetes Wiper攻击则是一个严峻的安全警示。从供应链攻击（Trivy凭证泄露）到横向移动（SSH和Docker API）再到Kubernetes级破坏（wiper），攻击链展示了云原生攻击的成熟化。

## 结论 (Conclusion)

本周的多个事件指向同一个趋势：Kubernetes正在从"AI工作负载的容器编排平台"演变为"AI基础设施的操作系统"。Google的AX、Hearth项目、以及Kubernetes的AI Conformance认证体系共同构建了从Agent运行时到LLM推理到安全治理的完整栈。对于平台工程师而言，Agent运行时评估、CVE RBAC审计和私有LLM部署将成为未来几个季度的核心技术投资方向。

*Generated on June 8, 2026*
