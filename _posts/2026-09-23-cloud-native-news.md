---
layout: post
title: "云原生动态：Google开源AX以Kubernetes风格编排自治AI Agent、CRI-O与containerd连续曝出checkpoint恢复类安全漏洞、Karmada转正CNCF毕业项目"
date: 2026-09-23
author: "云原生观察"
source: "https://www.infoq.com/news/2026/09/google-ax-orchestrator/"
categories: [cloud-native]
tags: [cloud-native, google, ax, agent-orchestrator, kubernetes, cri-o, containerd, cve, checkpoint-restore, security, karmada, cncf, multi-cluster]
---

9月22日，云原生在"Agent即工作负载"与"运行时安全"两侧同时迎来重量级动态。平台侧，Google正式开源AX（Apache 2.0），一个以Kubernetes风格声明式原语编排自治AI Agent的执行运行时——把Agent当作"有状态actor"而非微服务或批任务，支持亚秒级挂起/恢复与零冷启动复用宿主算力；安全侧，CRI-O被曝出checkpoint恢复漏洞CVE-2026-92574（CVSS 8.8），恶意checkpoint镜像可越过目标Pod的安全上下文保留凭据、capabilities与seccomp状态，同一周内containerd的本地镜像缓存投毒问题（CVE-2026-50195）也再次被安全机构重点提示；此外，多集群编排项目Karmada在上海KubeCon上获CNCF毕业认证，成为AI负载跨集群调度的事实标准候选。

## 主要新闻 (Main News)

### Google开源AX：以Kubernetes风格原语编排自治AI Agent

Google于9月22日发布AX（托管于agentexecutor.io，GitHub仓库google/ax），一个Apache 2.0许可的开源编排与声明式运行时，用于执行与扩展自治AI Agent工作负载。AX运行在Agent Substrate之上，将Agent视为有状态actor而非微服务或批任务，提供亚秒级任务挂起与恢复：当Agent进入等待推理供应商或工具调用的空闲态时，平台对其执行状态做checkpoint并挂起，以零冷启动延迟在共享宿主上复用算力。控制面暴露ax.io/v1alpha1 API组的四项声明式原语——Task（执行生命周期与沙箱资源约束）、Workspace（预执行环境装配：挂载Git仓库、配置MCP服务器、安装技能包）、Gateway（出站网络安全策略：主机名/端口白名单与凭据注入）、Model（LLM参数与密钥的统一控制点）。ax CLI以Go编写，控制面经ko部署进Kubernetes，用ax apply/ax watch/ax suspend等命令管理。社区讨论分歧明显：基础设施工程师认可其解决"空闲Agent等待模型API时的云端闲置成本"，而开发者批评其维护Kubernetes、容器仓库与自研CRD的运维负担。业界普遍定位AX为底层执行原语，而非LangGraph/CrewAI这类高层应用编排器。

**Source:** [Google Open-Sources AX a Kubernetes Style Orchestrator for Autonomous AI Agents | InfoQ](https://www.infoq.com/news/2026/09/google-ax-orchestrator/)

### CRI-O checkpoint恢复漏洞CVE-2026-92574：可绕过Kubernetes安全上下文

LinuxSecurity于9月22日报道，CRI-O的checkpoint恢复功能存在高危漏洞CVE-2026-92574（CVSS 8.8，CWE-250）。受影响的CRI-O 1.34及之后版本在从checkpoint文件恢复容器时，会把checkpoint中保存的账户身份、Linux capabilities、no_new_privs与seccomp状态"原样带回"，取代目标Pod所请求的安全上下文——即Kubernetes声明了受限配置，恢复出的进程却保留了更宽泛的权限集，形成策略与实际运行态彼此脱节的"策略缺口"。受影响范围覆盖OpenShift Container Platform 4.17及以后版本；利用前提是攻击者持有通过checkpoint镜像创建Pod的权限且checkpoint restore功能已启用。OpenCVE的缓解建议包括：关闭非必需的checkpoint（crio.conf中设enable_criu_support=false）、收紧Pod创建RBAC、强制Pod Security Standards与镜像仓库白名单；修复版本1.36.6/1.35.9/1.34.14已进入各分支但尚未发布。同一时间线内，containerd此前披露的checkpoint导入路径镜像缓存投毒漏洞CVE-2026-50195也再度被安全机构提示：恶意tar归档中的符号链接/路径穿越可定向覆盖/var/lib/containerd中的内容寻址blob，让同节点后续Pod静默拉取被投毒的镜像层。

**Source:** [CRI-O Checkpoint Issue Bypasses Kubernetes Security Controls CVE-2026-92574 | LinuxSecurity](https://linuxsecurity.com/news/security-vulnerabilities/cri-o-restore-kubernetes-privilege-boundaries)

### Karmada获CNCF毕业认证，多集群编排进入生产主流

CNCF于9月（KubeCon + CloudNativeCon + OpenInfra Summit + PyTorch Conference China 2026上海站）宣布Karmada——面向多集群、多云的Kubernetes编排项目——正式毕业。毕业恰逢其v1.19发布：该版本增强AI训练作业的多组件调度能力，并把基于优先级的调度（priority-based scheduling）由alpha推进至Beta并默认开启；同期本地化抢占式调度的InPlacePodVerticalScalingSchedulerPreemption特性也在Kubernetes 1.37中以alpha身份进入社区视野。Karmada自2021年9月进入Sandbox、2023年12月晋升Incubating至今已有1,214名贡献者与超5,600颗星，生产用户覆盖Bloomberg、华为云、阿里云、Trip.com、B站、科大讯飞、快手等多个知名企业，用于混合云容量、跨区域容灾与GPU/算力调度等场景，成为继已归档KubeFed之后多集群编排标准的头号候选人。

**Source:** [Kubernetes Multi-Cluster Project Karmada Reaches CNCF Graduation | InfoQ](https://www.infoq.com/news/2026/09/karmada-kubernetes-cncf/)

## 分析 (Analysis)

AX的意义在于它把"Agent编排"从应用层框架下沉为基础设施原语。Google把Agent定义为"有状态、突发、长运行"的工作负载，并直接复用Kubernetes资产（CRD、ko部署、kubectx上下文、GitOps式ax apply）——这等于官方承认：Agent需要的是像容器调度那样统一的声明式控制面，而不是各家Agent框架各自为政的编排层。对平台团队而言，AX与DigitalOcean Managed Agents等在同日出现的"Agent执行基础设施"共同宣告了一个判断：2026年的算力竞争正从"训练/推理芯片"延伸到"Agent运行时调度密度"。谁能在空闲等待期把挂起恢复压到亚秒级、把宿主复用率提上台阶，谁就掌握了Agent规模化经济性的钥匙。对Kubernetes从业者，AX也是一次"K8s模式向AI负载泛化"的范本——熟悉的手感仍在，工作负载模型却已换新。

安全侧，CVE-2026-92574与CVE-2026-50195的组合更有警示价值：两条漏洞都指向checkpoint/恢复（checkpoint/restore）这一被寄予厚望的调试、迁移与灾难恢复能力。CRI-O的问题是恢复出的进程"带回了"宿主的旧安全态；containerd的问题则是checkpoint导入路径成了镜像仓库投毒的入口。二者共同说明，checkpoint数据必须被当作与镜像同等（甚至更高）的可信物来治理：白名单来源、限制创建权限、admission层拦截非受管checkpoint注解。Kubernetes 1.37刚把Pod checkpoint/restore作为alpha能力引入，安全通告紧随其后——新原语与旧治理体系之间出现的时间窗，正是攻击者最喜欢的位置。

Karmada毕业与AX开源放在一起看，勾勒出云原生2026年的两条主线：多集群与多云已成为AI负载的默认部署形态（Karmada v1.19专门强化AI训练组件调度并默认启用优先级抢占），而Agent则正在成为全新的第四种工作负载类型（继无状态微服务、批任务、有状态服务之后）。两条主线都需要更强的"调度自治"能力——无论是跨集群搬作业，还是节点内为高优先级Agent抢占低优先级负载来做原地扩容。可以说，调度器正在从"分配静态资源"进化为"管理动态、突发、长运行的自治单元"。

## 结论 (Conclusion)

过去24小时的云原生动态，把产业视线聚焦在三件事上：Google AX把"Agent编排"做成Kubernetes风格的平台原语，宣称零冷启动与亚秒级挂起恢复的运行时密度经济；CRI-O与containerd的连续checkpoint类漏洞提醒我们，恢复能力越强，对checkpoint镜像的可信治理就必须越严——修复未发布前，应优先关闭非必需checkpoint、收紧Pod创建权限并重启后实测seccomp/capabilities生效状态；Karmada的毕业则验证了多集群编排已跨过实验门槛，成为AI工作负载规模化的默认底座。对实践者的建议：在测试集群评估AX对现有Agent落地模式的替代空间，把checkpoint纳入镜像供应链白名单式治理，并在多集群改造中优先验证Karmada对GPU/CPU混合调度的支持——调度密度、运行时可信与多集群自治，将是本季度云原生基础设施竞争的三条主线。