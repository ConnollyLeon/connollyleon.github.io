---
layout: post
title: "云原生动态：一个Kubernetes YAML即可接管GCP组织（ConfigConfusion公开）、Kubernetes 1.37解码Scale to Zero/Checkpoint Restore与Watch Cache韧性、Google开源AX打造Agent的Kubernetes"
date: 2026-09-25
author: "云原生观察"
source: "https://www.bleepingcomputer.com/news/security/how-one-kubernetes-yaml-can-hand-over-a-gcp-organization/"
categories: [cloud-native]
tags: [cloud-native, kubernetes, config-connector, gcp, iam, privilege-escalation, confused-deputy, gitops, kubernetes-1-37, scale-to-zero, checkpoint-restore, apiserver, google-ax, ai-agents, orchestrator]
---

9月22日至24日，云原生领域的三条消息恰好拼成"安全—平台—AI基建"的完整光谱。安全侧，BleepingComputer与Varonis于9月23日公开了攻击者如何只凭一个Kubernetes YAML文件、不持有任何GCP凭据，就能经由Google Kubernetes Config Connector（KCC）的"Confused Deputy"缺陷拿到整个Google Cloud组织的Owner权限——研究者Justin O'Leary把这条攻击链命名为ConfigConfusion；平台侧，CNCF于9月24日刊发TFiR对Kubernetes v1.37发布负责人Dipesh Rawat的专访，逐条拆解HPA Scale to Zero、Pod级Checkpoint & Restore、Resilient Watch Cache等增强及其背后的"工作负载感知"方向；AI基建侧，Google于9月22日开源AX——一个把Agent当作有状态Actor、以声明式原语在Kubernetes上编排自治AI工作负载的运行时。三条线指向同一个信号：编排的对象正在从"容器"向"有状态、突发、长时运行的自治Agent"迁移，而身份与授权边界正成为新一轮提权攻防的主战场。

## 主要新闻 (Main News)

### 只用一个Kubernetes YAML即可接管整个GCP组织：Config Connector的"Confused Deputy"提权链被公开

9月23日，BleepingComputer与Varonis安全研究团队先后公开了ConfigConfusion攻击技术——一条"无需任何Google Cloud凭据、仅凭Kubernetes命名空间内操作权限即可获得整个GCP组织Owner角色"的提权路径，由安全研究者Justin O'Leary发现。攻击机理源于KCC的架构设计：KCC运行在GKE集群内，通过自己的服务账户执行所有Google Cloud调用，统一代理开发者的声明式资源（GitOps模式有意把云凭据从开发者手中移除）。问题在于，KCC对一个K8s命名空间内出现的新CR（如`IAMPolicyMember`）照单全收：它先授权该资源、再用自己那具有组织级权限的服务账户向Google Cloud请求IAM变更。攻击者只要拥有"命名空间访问权＋在命名空间内创建IAMPolicyMember的能力"，就能伪造一条YAML把自己钉成`roles/owner`，而"认证只发生在两侧系统各自检查的一端"——Kubernetes只看到集群内资源的创建，GCP只看到KCC服务账户发起的合规请求，整条授权链没有任何一方做整体校验（经典的confused deputy）。Varonis给出的缓解建议集中在"收紧两端"：把KCC服务账户的IAM角色压缩到最小必要（避免组织级Owner/Editor），限制"哪些命名空间允许创建IAM类CR"，并对Owner授予类变更做审计与告警。对平台团队而言，这是GitOps声明式基础设施引入的第一类"规模化提权"范例——权限代理人越好用，越需要在云侧与集群侧同时建立最小权限约束。

**Source:** [How One Kubernetes YAML Can Hand Over a GCP Organization](https://www.bleepingcomputer.com/news/security/how-one-kubernetes-yaml-can-hand-over-a-gcp-organization/)

### Kubernetes 1.37按图索骥：HPA Scale to Zero、Pod级Checkpoint Restore与Resilient Watch Cache

9月24日，CNCF转发TFiR对Kubernetes v1.37发布负责人、CNCF的Dipesh Rawat的深度专访，系统复盘了9月16日发布的Kubernetes 1.37的关键增强（InfoQ同期以《Kubernetes 1.37 Released：Stable Metrics API and Rootless Kubelet in Beta》为题做了发布盘点评述）。访谈逐条覆盖三块"重头戏"：其一，HPA的Scale to Zero——允许工作负载在低峰期把副本缩到零，同时保留Pod历史与指标历史以便随后自动"回到"业务所需规模，从而把"静止状态"正式纳入弹性语义；其二，Pod级Checkpoint & Restore——利用容器运行时层的checkpoint能力，把正在运行的Pod状态固化下来并允许日后恢复或迁移，为抢占式调度、实例迁移与长时任务容错提供了新工具；其三，Resilient Watch Cache——针对kube-apiserver在高并发Watch场景下的内存与性能压力，改进了Watch缓存的实现与韧性，降低对etcd的读放大。除特性本身外，访谈还点出1.37的架构走向：该版本的一批关键KEP（如scale-to-zero、checkpoint/restore）都在为"AI工作负载与长时批量作业"铺路，Kubernetes正在从"无状态服务的调度器"转向"能承载有状态、突发型、长时间运行任务的通用平台"。

**Source:** [TFiR: "Kubernetes 1.37: Scale to Zero, Checkpoint Restore, and API Server Resilience | Dipesh Rawat"](https://www.cncf.io/news/2026/09/24/tfir-kubernetes-1-37-scale-to-zero-checkpoint-restore-and-api-server-resilience-dipesh-rawat/)

### Google开源AX：面向自治AI Agent的Kubernetes式声明式编排运行时

9月22日，InfoQ报道Google开源了AX（agentexecutor.io，GitHub仓库google/ax），一个Apache 2.0许可的"Agent编排器与声明式运行时"，用于执行和规模化自治AI Agent工作负载。AX运行在Google与DeepMind团队联合打造的Agent Substrate执行层之上，核心设计判断是：Agent既不是短命的无状态微服务、也不是确定性的批量作业，而是"有状态、突发、长时运行"的Actor——推理、工具调用与本地代码求值时密集消耗算力，等待模型响应或人工介入时又长时间闲置。AX据此把每个Agent会话放进带严格CPU/内存边界的actor沙箱，进入空闲态即"checkpoint并挂起"，并能在亚秒级恢复（无冷启动延迟），把几十个任务多路复用在一组共享宿主上，从而解决"Kubernetes容器编排里为闲置Agent常驻沙箱造成算力空转、冷启动又拖慢交互循环"的经典矛盾。控制面在`ax.io/v1alpha1`下暴露四个声明式原语：Task（执行生命周期与沙箱资源约束）、Workspace（预先装配运行环境，可声明式挂载Git仓库、配置MCP服务器、安装skill包）、Gateway（出站网络安全策略与凭据注入）、Model（LLM提供方参数与K8s内密钥的统一控制点）。交互通过Go编写的`ax`命令行（ax apply/watch/ssh/suspend/resume）完成，控制面以ko构建并连同Redis部署进Kubernetes的ax-system命名空间，沙箱由gVisor隔离。InfoQ同时记录了社区的两极反应：基础设施工程师认可它解决了"Agent在等待模型API或人工输入时空转云成本"这一痛点，而部分开发者质疑其"把Kubernetes集群、镜像仓库、CRD全搬进Agent运维"的负担。

**Source:** [Google Open-Sources AX a Kubernetes Style Orchestrator for Autonomous AI Agents](https://www.infoq.com/news/2026/09/google-ax-orchestrator/)

## 分析 (Analysis)

把这三条消息并置，最先浮出的主线是"被编排对象的语义改变"。Google AX把Agent的生命周期、环境装配、出站网络与模型参数全部声明式化，本质上是在说：Agent该以"资源"的面貌被平台管理，而非以"进程"的面貌被调度。这与Kubernetes 1.37同频——HPA Scale to Zero、Pod级Checkpoint/Resume、Resilient Watch Cache等一系列特性，都在服务"有状态、突发、长时"这类非微服务语义的工作负载。换言之，Kubernetes向"工作负载感知"演进的同时，Agent平台反过来在"借用Kubernetes的玩法"。二者在架构叙事上正在合流：容器时代的"镜像＋ReplicaSet"被置换为Agent时代的"沙箱＋声明式生命周期"，而控制平面的基调（声明式、自愈、弹性、多路复用）完全一致。

第二条主线是ConfigConfusion代表的"授权边界的再定价"。KCC为了GitOps体验砍掉了开发者云凭据，却把"谁能替我行使特权"的问题转移成了"谁能诱导我的特权代理人"——当KCC服务账户带着组织级角色执行任何命名空间里的`IAMPolicyMember`，Kubernetes的namespace RBAC事实上成了GCP IAM的"前言"。这条链的教训不是"别用KCC"，而是：在声明式、代理式的基础设施里，云侧最小权限与集群侧RBAC必须作为同一个安全模型来设计，任何"代理人带特权＋接受低权限用户指令"的组合都需要专门的授权校验层。可以预见，2026年余下的时间里，云厂商会在Controller/IAM层面加装"请求者意图验证"或"双重授权"机制，而审计规则也会把"谁通过CR发起过IAM变更"纳入默认告警。

第三条线索落在"信任边界的软件化"上。Agent的数量一旦规模化，闲置算力、安全围栏与周期化管理就不再是应用层问题，而是平台层问题——AX用亚秒级checkpoint/resume回应算力成本，用Gateway原语回应网络围栏，用gVisor沙箱回应爆炸半径；Kubernetes则用Checkpoint/Restore与Scale to Zero回应长时任务的编排。对平台工程团队的启示是：AgentOps与ContainerOps正在共享同一套声明式底座，能同时编排"容器"与"Agent"的抽象（如CRD、Operator、策略引擎）将比单一体系获得更长的生命周期——而围绕它们的安全审计，会成为下一轮考卷的第一题。

## 结论 (Conclusion)

过去三天，云原生世界的主题是"编排对象的迁移与信任边界的重绘"：Google开源AX，把自治Agent纳入Kubernetes式的声明式生命周期管理；Kubernetes 1.37通过Scale to Zero、Checkpoint/Restore与Resilient Watch Cache，把编排语义向"有状态、突发、长时"的工作负载扩展；而ConfigConfusion的公开则提醒所有人，GitOps代理式授权在新的声明式世界里放大了"Confused Deputy"风险。对基础设施团队，建议的下一步是：对照Varonis建议审计KCC服务账户与命名空间IAM CR管控（尤其是Owner类授权），评估Kubernetes 1.37的Scale to Zero与Checkpoint/Restore是否适配自身AI/批处理负载，并以治理眼光评估AX等Agent编排运行时对现有平台与安全模型的冲击。