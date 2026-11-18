---
layout: post
title: "云原生技术动态：Week 47 发布潮、Kubernetes 1.38 代码冻结与 AKS 智能体运行时"
date: 2026-11-18
author: "云原生观察"
source: "https://lwcn.dev/newsletter/2026-week-47/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cncf
  - podman
  - agent-runtime
  - cloud-native
---

# 云原生技术动态：Week 47 发布潮、Kubernetes 1.38 代码冻结与 AKS 智能体运行时

过去 24 小时云原生生态进入密集发布期。Last Week in Cloud Native 第 47 周盘点显示，容器运行时、镜像仓库与调度器正集中修补漏洞并针对 AI 工作负载优化；Kubernetes 1.38 完成代码冻结，进入发布前的最后验证阶段；微软则在 Ignite 2026 上把智能体运行时、可观测性与 AKS 更紧密地捆绑在一起。

## 主要新闻

### Last Week in Cloud Native 第 47 周：199 项发布与 124 条社区动态

最新一期周报统计了 199 项项目发布与 124 条新闻，重点包括 Podman 6.2.0 修复不可信镜像标签自动更新与摘要/签名校验绕过漏洞，Harbor 2.16.0 用 Valkey 替换 Redis 作为缓存后端并全面支持多架构，以及 KAI-Scheduler 0.19.0 增加 GPU 显存与分数限额、细化 NUMA 组建模。社区还出现了 Litek8s 这类用单个 Rust 二进制实现 Kubernetes API 的实验项目，kagent v1.0.0 被列为本周值得关注的发布之一。

**Source:** [Week 47, Nov 16-22, 2026: Higress, Gardenlinux & Podman-Desktop Updates](https://lwcn.dev/newsletter/2026-week-47/)

### Kubernetes v1.38 进入代码冻结与测试冻结

Kubernetes 官方发布日程显示，v1.38 的代码冻结与测试冻结分别落在 11 月 16 日（AoE）和 11 月 17 日 12:00 UTC，这一节点紧随 KubeCon 北美大会之后。按照计划，v1.38.0 将于 12 月 16 日正式发布。代码冻结意味着新增特性基本收口，后续工作重心转向回归测试、缺陷修复与发布文档准备。

**Source:** [Kubernetes v1.38 Release Information](https://www.kubernetes.dev/resources/release)

### Ignite 2026 将智能体运行时带入 AKS

微软在 Ignite 2026 的 Book of News 中披露，Foundry 模型与智能体将以预览形式进入 Azure Kubernetes Service，同时推出 Azure SRE Agent、扩展机密计算与 AKS Flex 节点——后者可把同一 AKS 集群延伸到客户自有服务器。微软强调其对 vLLM、Ray 与 Kubernetes 等开源项目的投入，并称过去三年是 CNCF 项目最大的公有云贡献者。

**Source:** [Microsoft Ignite 2026 | Book of News](https://news.microsoft.com/events/ignite/2026/book-of-news/)

## 分析

本周发布潮的主题不是"更多功能"，而是"更明确的运行时边界"。Podman 与 Harbor 的更新都指向供应链与镜像分发环节的信任问题：摘要与签名校验不能被绕过，缓存后端与多架构支持也必须跟上来。对平台团队而言，这类基础组件的补丁窗口正在缩短，升级策略需要从季度节奏转向持续跟踪。

AI 工作负载正在重塑调度器的设计目标。KAI-Scheduler 对 GPU 显存分数限额与 NUMA 拓扑的细化，说明"能不能调度 GPU"已经不是问题，"如何让多个智能体共享 GPU 而不互相干扰"才是。随着智能体会话呈现突发、长时间空闲的特征，传统常驻 Deployment 的资源模型显得过于昂贵，这也是 kagent 与 Agent Substrate 一类项目试图解决的问题。

Kubernetes 1.38 的冻结节点与云厂商的智能体运行时布局形成呼应。上游负责提供稳定的调度与 API 抽象，云厂商则在集群之上叠加会话管理、快照恢复、策略与可观测性。这种分层有利于避免每个团队重复造轮子，但也带来新的锁定风险：智能体运行时的状态与快照格式是否可移植，将直接决定未来跨云迁移的成本。

接下来值得关注的是 v1.38 正式版中 DRA（动态资源分配）与拓扑调度的成熟度，以及 AKS Flex 节点这类"集群延伸"能力在真实混合环境中的表现。如果智能体运行时能够像普通工作负载一样被 GitOps 管理、被策略引擎约束，云原生平台才算真正完成了从容器到智能体的扩展。

## 结论

本周信号表明，云原生平台正在同时处理两条主线：一是把容器供应链与运行时的安全水位继续抬高，二是为智能体这类新型工作负载建立独立的执行与治理层。对从业者而言，短期内应优先完成Podman、Harbor 等组件的漏洞修补，并密切跟踪 v1.38 的发布说明；中长期则需要评估智能体运行时的状态可移植性与集群边界设计，避免今天的效率工具变成明天的迁移障碍。
