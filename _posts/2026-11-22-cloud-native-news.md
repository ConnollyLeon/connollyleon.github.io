---
layout: post
title: "云原生技术动态：AI智能体基础设施进入CNCF，隔离与调度成为新焦点"
date: 2026-11-22
author: "云原生观察"
source: "https://www.infoq.com/news/2026/11/google-substrate-gvisor-cncf/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cncf
  - ai-agents
  - gvisor
  - cloud-native
---

# 云原生技术动态：AI智能体基础设施进入CNCF，隔离与调度成为新焦点

过去24小时的报道与相关官方披露显示，云原生生态的叙事正从“容器编排”转向“智能体基础设施”。Google将Agent Substrate与gVisor交由CNCF治理，CNCF项目组合已扩展至231个，Kubernetes AI一致性认证覆盖40个平台；与此同时，Kyverno对准入控制路径的性能剖析表明，策略引擎的成本结构仍有大量可压缩空间。

## 主要新闻

### Google捐赠Agent Substrate与gVisor，智能体运行时进入中立治理

InfoQ报道，Google宣布把Agent Substrate与gVisor捐赠给CNCF，并同步纳入强化学习编排项目OpenRL。Agent Substrate将智能体会话状态（actor）与执行资源（worker）分离，使空闲智能体释放计算、恢复时可在500毫秒内重建上下文；gVisor则在用户态拦截系统调用，为智能体生成和执行不可信代码提供隔离边界。

**Source:** [Google Donates Agent Substrate and gVisor to the CNCF to Secure AI Agents at Scale](https://www.infoq.com/news/2026/11/google-substrate-gvisor-cncf/)

### CNCF项目组合扩展至231个，毕业与孵化项目密集涌现

Linux基金会11月简报显示，CNCF过去一年新增32个项目，总数达到231个；KubeVirt与NATS先后毕业，CloudNativePG和Open Cluster Management进入孵化阶段，基金会还推出面向生产网络技能的CKNE认证。社区规模与项目数量的同步扩张，说明Kubernetes生态正把虚拟化、消息与AI工作负载纳入同一治理框架。

**Source:** [Linux Foundation Newsletter: November 2026](https://www.linuxfoundation.org/blog/linux-foundation-newsletter-november-2026)

### KubeCon观察：AI从实验走向生产，一致性标准向栈上层移动

VMware Cloud Foundation博客总结KubeCon北美2026的关键信号：企业的瓶颈已不在工具数量，而在GPU调度、隔离、推理路由与可观测性的集成；Kubernetes AI Conformance Program认证平台增至40个，新成立的工作负载一致性工作组则试图保证安全、网络、存储行为在不同集群间保持一致。

**Source:** [From AI Experimentation to Production: Key Takeaways from KubeCon North America 2026](https://blogs.vmware.com/cloud-foundation/2026/11/20/from-ai-experimentation-to-production-key-takeaways-from-kubecon-north-america-2026/)

### Kyverno优化CEL准入路径，策略成本从O(policies)降至接近O(1)

CNCF博客披露，Kyverno团队发现CEL准入引擎约86.8%的内存分配来自对象转换而非策略求值；将转换移出按策略循环后，64条策略匹配场景下的引擎耗时从20.01毫秒降至0.36毫秒，修复随1.19.2版本发布。这一结果提示平台团队：策略数量增长带来的隐性成本往往来自框架本身，而非用户写的规则。

**Source:** [Optimizing Kubernetes admission control: Where Kyverno's CEL admission cost actually goes](https://www.cncf.io/blog/2026/11/18/optimizing-kubernetes-admission-control-where-kyvernos-cel-admission-cost-actually-goes/)

## 分析

这批动态共同指向一个判断：Kubernetes正在成为“多类计算单元”的统一控制平面。KubeVirt把虚拟机带入一等公民位置，Agent Substrate把长生命周期、频繁挂起的智能体会话抽象为可调度状态，而NATS与CloudNativePG则补齐消息与数据层。对企业而言，平台选型的重点不再是“是否上云原生”，而是同一控制面能否同时承载容器、虚拟机、模型推理与智能体，并保持一致的身份、网络与策略模型。

安全性也从外围功能变成运行时设计的前提。gVisor与OpenShell一类项目把隔离边界放在基础设施层，而不是依赖模型自身的判断；智能体生成shell命令、安装依赖、调用外部工具的行为，被视为与不可信代码同等对待。Google给出的“90%至95%时间空闲”估算尤其值得关注：它意味着传统按Pod常驻的资源模型在智能体场景下会系统性浪费，调度器需要理解状态恢复、预热池与挂起语义，而不仅是CPU和内存请求。

性能与一致性开始成为落地阶段的硬约束。Kyverno的剖析说明，平台组件的抽象如果设计不当，会让策略数量线性放大基础成本；这对大规模多租户集群尤为关键。另一方面，AI一致性认证与工作负载一致性工作组的推进，反映出企业担心“通过了Kubernetes一致性测试，却在迁移后因安全、网络或存储行为差异而故障”。可移植性正从API层向行为层延伸。

对从业者来说，接下来几个季度应重点观察三件事：Agent Substrate与OpenShell能否形成可互操作的治理栈；一致性认证能否覆盖GPU共享、推理路由与状态恢复等AI特有行为；以及策略引擎、准入链路等“基础设施内的基础设施”是否持续出现类似Kyverno的性能重写。谁先把这些能力做成默认配置，谁就更可能拿到下一代平台工程的门票。

## 结论

云原生正在进入以智能体为核心工作负载的新阶段。CNCF的治理扩容、隔离运行时的捐赠和一致性标准的升级，说明行业已经从“让模型跑起来”转向“让智能体安全、高效、可移植地跑起来”。企业应尽早评估自身的运行时隔离、状态管理与策略成本模型，而不是等智能体进入生产后才回头补架构债。
