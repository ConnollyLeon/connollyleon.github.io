---
layout: post
title: "云原生技术动态：KubeCon盐湖城开幕、智能体身份危机与虚拟机的回归"
date: 2026-11-10
author: "云原生观察"
source: "https://www.techtimes.com/articles/330289/20261109/cncfs-kubecon-north-america-2026-opens-salt-lake-city-why-kubernetes-cannot-tell-which-ai-agent.htm"
categories:
  - cloud-native
tags:
  - kubecon
  - ai-agents
  - kubernetes
  - spiffe
  - virtual-machines
---

# 云原生技术动态：KubeCon盐湖城开幕、智能体身份危机与虚拟机的回归

KubeCon + CloudNativeCon North America 2026于11月9日在盐湖城Salt Palace会展中心开幕，今年大会的核心张力不再是GPU调度之争，而是一个基础设施尚未回答的问题：当集群内的AI智能体采取了一个后果重大的行动，你能否证明是哪一个智能体做的？同期，Linux Foundation Research发布了CNCF与Broadcom联合赞助的工作负载调研，指出虚拟机在生产环境中仍占53%的份额，而智能体AI工作负载正在推动隔离需求快速上升。

## 主要新闻

### KubeCon NA 2026开幕：AI智能体的身份危机成为主线

大会于11月9日至12日举行，周一为co-located日，首次设立Cloud Native AI + Inference Day，议题覆盖LLM服务、智能体编排、推理管道可观测性以及MCP等协议互操作，llm-d、KServe、OpenTelemetry等项目悉数登场。本届真正的组织性张力是智能体身份问题：现有的SPIFFE/SPIRE工作负载身份标准为service account签发加密凭证，适合实例间可互换的传统微服务，但一个运行了六小时、积累了工具调用历史与上下文状态的智能体，与同一镜像下刚启动的另一个实例并不等价。NHI Management Group的调研显示72%的组织中非人类身份已超过人类身份，Teleport发现70%的组织授予AI系统超过同等角色人类的权限。会议期间讨论的方案包括智能体启动时铸造per-instance SPIFFE身份、会话级补充令牌以及智能体编排框架与SPIFFE感知服务网格的更紧密集成。技术侧，llm-d 1.0（10月20日发布）、GA的Gateway API Inference Extension v1.5.0以及Kueue、Volcano与NVIDIA KAI Scheduler三方竞争的GPU调度格局也将是本周焦点。

**Source:** [CNCF's KubeCon North America 2026 Opens in Salt Lake City: Why Kubernetes Cannot Tell Which AI Agent Took Action](https://www.techtimes.com/articles/330289/20261109/cncfs-kubecon-north-america-2026-opens-salt-lake-city-why-kubernetes-cannot-tell-which-ai-agent.htm)

### CNCF与Broadcom发布调研：AI负载演进下虚拟机仍是云原生基础设施核心

11月9日发布的《Virtual Machines, Agentic AI and the Mix of Workloads》报告基于2026年9月对492名云原生从业者的调研。核心发现：虚拟机平均占生产应用的53%，51%的受访者至少一半生产应用以VM形式运行；71%预计未来12个月VM份额将保持在同一区间；万人以上大组织的VM平均份额达64%。61%的受访者称其VM团队与容器团队已协作或完全整合，8%使用KubeVirt在Kubernetes上管理虚拟机。在扩展VM足迹的受访者中，34%引用AI与智能体工作负载为驱动因素，47%引用安全与隔离需求；microVM沙箱使用率预计从20%升至30%，机密计算从12%升至26%。

**Source:** [New research: Virtual machines remain central to cloud native infrastructure as AI workloads evolve](https://www.cncf.io/blog/2026/11/09/new-research-virtual-machines-remain-central-to-cloud-native-infrastructure-as-ai-workloads-evolve/)

### Google将Agent Substrate与gVisor捐给CNCF，应对不可信智能体隔离

Google在KubeCon期间宣布以Sandbox状态将Agent Substrate与gVisor捐赠给CNCF。Agent Substrate是面向智能体的有状态actor运行时，配合分层存储，试图解决过去两年各工程团队普遍遭遇的智能体规模化难题；捐赠进入中立基金会后，云原生社区将获得厂商无关的智能体沙箱基础设施。Google在KubeCon周一的Agent Substrate Day（ATECon）上安排了包括“Proof of Agent identity”在内的一系列议程，直接呼应本周的智能体身份主题。

**Source:** [Sandboxing Untrusted AI Agents at Scale: Google Donates Agent Substrate and gVisor to the CNCF](https://opensource.googleblog.com/2026/11/sandboxing-untrusted-ai-agents-at-scale.html)

### Hyperlight：在hypervisor隔离的microVM中运行Linux应用

微软工程师Danilo Chiarlone在CNCF博客撰文介绍Hyperlight：越来越多的云原生系统在运行“团队里没人写过的代码”——AI智能体一秒钟前生成的Python，或客户刚上传的插件——每一种都需要一个边界。Hyperlight通过hypervisor隔离的microVM为这类不可信代码提供轻量级隔离边界，与Agent Substrate、gVisor共同构成本周密集出现的“智能体隔离”技术路线。

**Source:** [Run Linux applications in hypervisor-isolated micro-VMs with Hyperlight](https://www.cncf.io/blog/2026/11/09/run-linux-applications-in-hypervisor-isolated-micro-vms-with-hyperlight/)

## 分析

智能体身份问题之所以成为本届KubeCon的组织性张力，是因为它暴露了云原生安全模型的一个结构性缺口。SPIFFE的设计前提是“身份属于拓扑中的槽位而非运行中的推理过程”：数据库Pod、API网关的实例天然可互换，凭证绑定service account是合理抽象。但智能体是有状态的——上下文、工具调用历史、中间推理都在演化，同一个service account下的两个智能体实例在责任归属上完全不同。当非人类身份已占多数且普遍过度授权时，审计归因就从合规细节变成了安全事故响应的前提。本周工作组若能就per-instance身份或会话级补充令牌达成共识草案，其影响将类似当年SPIFFE对零信任的推动。

VM调研的数据则给“容器取代虚拟机”的叙事泼了一盆冷水，并且解释了为什么是现在：不是企业拒绝容器化，而是智能体AI的隔离需求正在把虚拟化重新拉回舞台中央。34%扩展VM的受访者明确引用AI与智能体工作负载，microVM沙箱与机密计算的规划采用率显著高于现状，说明平台团队正在为“不可预测的代码执行”重建边界。这与Google捐赠Agent Substrate和gVisor、微软推广Hyperlight形成互证：隔离原语正在从“容器+namespace”回摆到“hypervisor+microVM”，云原生的技术栈实际上在向上重新分层。

对从业者而言，三条工作线值得立即启动：其一，盘点集群内智能体的身份与授权现状，确认是否存在共享service account的智能体工作负载；其二，评估KubeVirt、Kata Containers、microVM等隔离方案在成本与运维复杂度之间的平衡点；其三，跟踪Gateway API Inference Extension的conformance列表和Kueue/KAI Scheduler的选型对比，推理路由与GPU调度将在未来两个季度内成为平台标准的组成部分。

需要警惕的是，隔离与身份的加码必然带来资源开销。Netflix上周披露的单租户Titus模式已经表明，硬件资源共享的物理约束（末级缓存、内存带宽、全局锁）会迫使高敏感负载付出更高成本换取可预测性。平台工程的下一阶段难题不是“要不要隔离”，而是“按敏感度分层隔离”——普通服务共享节点、敏感负载独占、不可信智能体进microVM，并用成本归因工具让每一层的价格透明。

## 结论

本届KubeCon标志着云原生社区的工作重心从“为AI负载提供算力”转向“为智能体行为建立可问责的边界”。身份标准、隔离原语与运行时规范的同步推进——SPIFFE-for-agents工作组、Agent Substrate/gVisor捐赠、VM与容器混合策略——共同指向一个更成熟的判断：云原生的未来不是单一工作负载模型的胜利，而是多种隔离等级在统一编排平面上的共存。谁能率先建立可测试的智能体身份基线与分层隔离策略，谁就能在智能体平台竞争中减少审计风险与隐性成本。
