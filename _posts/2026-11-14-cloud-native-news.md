---
layout: post
title: "云原生技术动态：KubeCon收官聚焦智能体可审计性，KubeVirt毕业与上游协作重塑平台底座"
date: 2026-11-14
author: "云原生观察"
source: "https://virtualizationreview.com/articles/2026/11/13/kubecon-day-3-agentic-ai-kubeflow-graduation-and-suses-open-infrastructure.aspx"
categories:
  - cloud-native
tags:
  - kubecon
  - cncf
  - kubernetes
  - agentic-ai
  - agent-substrate
  - kubevirt
  - llm-d
  - vmware
  - cosi
---

# 云原生技术动态：KubeCon收官聚焦智能体可审计性，KubeVirt毕业与上游协作重塑平台底座

KubeCon + CloudNativeCon North America 2026在盐湖城收官，最后一天的讨论从“能不能把智能体跑在Kubernetes上”转向“如何证明智能体做了什么、如何让平台团队接得住”。微软开源AgentSessions与AgentSuites，把智能体会话变成可回放、可审计的日志；SUSE用Harvester的增长数据说明VMware替代仍在继续；而在会场之外，VMware与Broadcom则把VM API、对象存储接口和工作负载一致性继续推向上游。

## 主要新闻

### 微软开源AgentSessions与AgentSuites，让智能体会话可回放、可审计

在KubeCon最后一天的主题演讲中，微软工程师Babu宣布开源AgentSessions与AgentSuites。AgentSessions把智能体对模型的调用通过宿主机代理写入哈希链接、仅追加的日志，使团队可以确定性地回放、审计或分叉一次会话，而不必重新查询大模型；AgentSuites则是一个可移植的JSON规范，用于打包智能体指令、工具和评估集。

微软在现场用一架由飞行员操控的无人机拍摄观众画面，触发了跨Agent Substrate、Kagent、Argo CD与Keycloak的五智能体工作流。这个演示的重点不是“智能体能协作”，而是每一个动作都留下了可验证的记录：谁发起了请求、调用了哪个工具、模型返回了什么、最终改变了什么。对于需要合规审计的金融、医疗与公共部门，这比再多一个智能体框架更有价值。

**Source:** [KubeCon Day 3: Agentic AI, Kubeflow Graduation and SUSE's Open Infrastructure](https://virtualizationreview.com/articles/2026/11/13/kubecon-day-3-agentic-ai-kubeflow-graduation-and-suses-open-infrastructure.aspx)

### KubeCon 2026“已交付/早期/路线图”清单：llm-d 1.0与Agent Substrate 1.0落地，Kubernetes v1.38定档12月16日

iotdigitaltwinplm在11月13日的复盘把KubeCon 2026的公告分成三档。已交付：llm-d 1.0（10月20日发布，首个带稳定v1配置API的版本）、Agent Substrate 1.0、Solo.io企业版Agent Substrate与kagent正式可用、CKNE网络认证，以及KubeVirt毕业。早期：Google把gVisor与OpenRL捐入CNCF沙箱，NVIDIA把OpenShell带入沙箱。路线图：Kubernetes v1.38计划于2026年12月16日发布，2027年还将推出两项AI相关认证。

这份清单的价值在于把“展会热度”与“生产可用”分开。llm-d 1.0提供会话感知路由与多租户服务质量控制，解决的是推理请求在多个模型服务器之间如何分配、如何复用KV缓存的问题；Agent Substrate 1.0则把智能体的状态与计算拆开，用预热的Worker承载可休眠的Actor。两者都已进入可以被平台团队评估的阶段，而不是停留在主题演讲里。

**Source:** [KubeCon North America 2026 Recap: What Shipped for AI](https://iotdigitaltwinplm.com/kubecon-north-america-2026-recap-ai-inference-agentic-workloads-and-what-actually-shipped-for-platform-teams/)

### Broadcom/VMware把VM API、COSI与工作负载一致性推向上游

VMware在11月9日由Dilpreet Bindra撰文的博客中，梳理了Broadcom参与云原生上游协作的几条主线。VM API项目已被CNCF沙箱正式接收，它构建在已有六年以上生产经验的VM Operator之上，让平台团队可以用Kubernetes原生API管理虚拟机，同时保持vCenter、VCF Operations与既有备份工具的可见性。存储侧，Broadcom工程师正推动Container Object Storage Interface（COSI）走向Beta，并开发开源的vSphere COSI Driver，为对象存储提供统一的Kubernetes消费规范。

治理侧，Broadcom参与共同主持Kubernetes社区新成立的Workload Conformance Working Group，目标是建立可验证的工作负载运行时行为标准，让ISV只验证一次就能在任意符合规范的Kubernetes平台上运行。VMware还展示了Agent Substrate在vSphere Kubernetes Service（VKS）上的运行方式：Actor在gVisor下执行，暂停时把内存与文件系统增量快照写入快速存储并休眠，事件到达后在平均200毫秒内恢复。对仍以虚拟机为主的企业，这提供了把智能体纳入既有私有云治理体系的路径。

**Source:** [Advancing the Cloud-Native Ecosystem Through Open Collaboration](https://blogs.vmware.com/cloud-foundation/2026/11/09/advancing-the-cloud-native-ecosystem-through-open-collaboration/)

## 分析

今年KubeCon最明显的变化，是“智能体”从应用层话题变成了平台层话题。过去一年，厂商展示的重点是智能体能调用多少工具、能完成多复杂的任务；今年最后一天的焦点转向身份、权限、审计与可回放。微软的AgentSessions之所以值得关注，是因为它把一次智能体会话变成了不可篡改的执行记录：模型调用经过宿主机代理，写入哈希链接的仅追加日志，团队可以回放、审计甚至分叉。这与传统可观测性有本质区别——日志告诉你“发生了什么”，而可回放会话让你能“重新走一遍并验证结果”。当智能体开始接触生产数据、执行代码、发起支付时，这种能力会从“加分项”变成“准入条件”。

llm-d 1.0与Agent Substrate 1.0的落地，则说明AI工作负载的云原生化已经跨过“有没有项目”的阶段。llm-d解决的是推理层的效率问题：会话感知路由让同一会话的请求落到缓存了相同上下文的服务器，多租户QoS让不同团队共享GPU池时不至于互相挤占。Agent Substrate解决的是运行时问题：智能体大部分时间在等待模型、工具或人类响应，却持续占用内存与磁盘；把状态与计算拆开、按需恢复，能显著提高单机密度。两者叠加，平台团队才可能像管理微服务一样管理智能体，而不是为每个智能体单独开一台长期运行的机器。

VMware/Broadcom的动作则揭示了另一条战线：企业不会因为AI出现就抛弃虚拟机。VM API进入CNCF沙箱、COSI走向Beta、Workload Conformance Working Group成立，本质上都是在降低“混合负载”的摩擦。对平台团队而言，真正的挑战不是选容器还是选虚拟机，而是如何用同一套声明式API、同一套身份与策略、同一套备份与灾备体系覆盖两者。Agent Substrate在VKS上的演示说明，智能体可以被当作一种新的工作负载类型纳入现有私有云，而不是另起一套孤岛。

值得警惕的是“认证与标准”的膨胀。CKNE、AI Conformance、Workload Conformance，加上2027年计划中的两项AI认证，说明CNCF正在用认证体系回应企业“我该信谁”的问题。但认证只能证明“符合某组检查项”，不能证明“在你的环境里可靠”。平台团队应把认证当作筛选器，而不是验收标准；真正的验收仍然要回到自己的SLO、故障注入与成本基线。接下来值得观察：Kubernetes v1.38能否按时交付、llm-d与Gateway API Inference Extension的边界如何划分、AgentSessions能否成为智能体审计的事实格式，以及Workload Conformance能否避免变成又一套厂商自说自话的测试。

## 结论

KubeCon 2026收官日的主线可以概括为“让智能体可被治理，让平台接得住混合负载”。短期来看，平台团队应优先做三件事：为智能体建立独立的身份、策略与审计链路，而不是复用人类账号；在引入Agent Substrate一类运行时前，先明确沙箱隔离等级、状态快照与恢复的SLO；对llm-d等推理层项目做小规模压测，把会话命中率、KV缓存复用率与每token成本纳入监控。中期应跟踪Kubernetes v1.38、COSI Beta与Workload Conformance的进展，避免在标准未定时过度定制。云原生的下一轮竞争，不会只比谁先支持新模型，而会比谁能让智能体在可验证、可回滚、可审计的前提下真正进入生产。
