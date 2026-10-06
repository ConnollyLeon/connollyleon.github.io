---
layout: post
title: "云原生动态：Kubernetes 1.38进入特性冻结、Dell 18个严重漏洞直指Kubernetes存储、节点交换GA带来最高3倍密度、EKS上线1.37"
date: 2026-10-06
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/10/05/scaling-kubernetes-workloads-with-node-swap/"
categories:
  - cloud-native
tags:
  - kubernetes
  - node-swap
  - nvme
  - pod-density
  - burstable-qos
  - agent-sandbox
  - security
  - cve
  - dell
  - container-storage-modules
  - ecs
  - rbac
  - eks
  - kubernetes-1-37
  - kubernetes-1-38
  - dra
  - news
---

# 云原生动态：Kubernetes 1.38进入特性冻结、Dell 18个严重漏洞直指Kubernetes存储、节点交换GA带来最高3倍密度、EKS上线1.37

2026年10月5日至6日的云原生领域呈现出"节奏"与"安全"的双重主题。上游方面，Kubernetes v1.38 正式进入特性冻结（Enhancements Freeze），89 项增强从最初的 100 项中保留，两个中危 CVE 在 9 月补丁列车中修复；同时 Google 与社区共同发布基准数据，确认自 v1.34 GA 起的节点交换（node swap）配合本地 NVMe SSD 可将节点密度提升最高 3 倍。受管侧，AWS EKS 上线 Kubernetes 1.37。安全侧则出现本季度最严重的告警：Dell 一次修补 18 个 CVE，其中两个 CVSS 10 分漏洞直接影响 Kubernetes 与存储之间的信任链。

## 主要新闻 (Main News)

### Kubernetes v1.38 进入特性冻结，9 月补丁列车修复两个中危 CVE

Kubernetes 项目官方周报显示，v1.38 发布周期已于 2026 年 9 月 29 日（AoE）进入 Enhancements Freeze 阶段。在 KEP Readiness 截止日之后，11 项增强被移出里程碑，最终保留 89 项（原始 100 项）。此后任何新增内容都需通过 `#sig-release` 频道的例外审批。

9 月补丁版本（v1.34.12、v1.35.9、v1.36.5、v1.37.1）修复了两个中危漏洞：**CVE-2026-2270**（CVSS 5.9）属于 StatefulSet 控制器中的 confused deputy 问题，拥有命名空间级写权限的用户可能跨命名空间创建 Pod；**CVE-2026-76654**（CVSS 5.8）影响 Windows 节点，当 Pod 的 `subPath` 是指向攻击者可控 UNC 网络共享的符号链接时，可能泄露 NetNTLMv2 哈希。此外，SIG Cluster Lifecycle 主席由 Vince Prignano 移交 Fabrizio Pandini（同时保留技术负责人职务），目前处于一周的 lazy consensus 期。

**Source:** [Kubernetes Patches Security Vulnerabilities and Enters v1.38 Enhancements Freeze](https://www.thenextgentechinsider.com/pulse/kubernetes-patches-security-vulnerabilities-and-enters-v138-enhancements-freeze)

### 节点交换 GA：本地 NVMe SSD 支撑下密度最高提升 3 倍

Kubernetes 官方博客发布的基准测试给出了节点交换（node swap）在 v1.34 GA 后的实际收益。作者 Ocean Xie 与 Yuan Wang 指出，内存通常是 Kubernetes 集群遇到的第一道硬限制——节点耗尽内存远早于耗尽 CPU，而新一代 agentic AI 工作负载放大了这一矛盾：它们为启动和运行不可信代码需要大量内存，随后闲置等待下一个提示词，这部分"常驻但闲置"的内存既昂贵又限制了单节点 Pod 数。

三组基准的结果如下：

| 工作负载 | 无交换基线 | 本地 SSD 交换 | 密度提升 |
| --- | --- | --- | --- |
| Linux CI/CD 内核构建 | 600 MB 内存上限 | 300 MB 内存上限 | RAM 占用 -50% |
| Headless Chrome（Kata） | 40 并发 Pod | 50 并发 Pod | +25% |
| Headless Chrome（gVisor） | 80 并发 Pod | 160 并发 Pod | +100% |
| Python 沙箱（gVisor） | 80 并发 Pod | 240 并发 Pod | +200% |

关键细节在于：**沙箱隔离的内存开销被交换吸收了**。gVisor 环境无交换时在 80 Pod 触顶，开启后翻倍至 160；Kata 微虚机无交换时 40 个 Pod 即耗尽物理内存，本地 SSD 交换将其扩展到 CPU 饱和前的 50 个稳定实例。启用方式是在 kubelet 中配置 `memorySwap.swapBehavior: LimitedSwap`，并搭配 Burstable QoS（内存 limit 高于 request）。该能力已在 GKE 上以 Local SSD 配置的 Node Memory Swap 原生支持。测试方也诚实指出：峰值密度下的延迟上升主要来自沙箱之间争抢 CPU，而非交换本身。

**Source:** [Scaling Kubernetes Workloads with Node Swap](https://kubernetes.io/blog/2026/10/05/scaling-kubernetes-workloads-with-node-swap/)

### Dell 一次修补 18 个 CVE，两个 10 分漏洞直指 Kubernetes 存储控制面

CSO Online 记者 Taryn Plumb 报道，Dell 通过两份安全公告修补了影响 Dell Container Storage Modules（CSM）与 Dell System Update（DSU）的 18 个 CVE，其中两个 CVSS 评分为 10，另有五个为 9 分及以上。Beauceron Security CEO David Shipley 评论称，"这份公告读起来像是地球上每个勒索软件组织的愿望清单"。

关键条目包括：**CVE-2026-63688**（CSM，10 分）记录了 `csm-authorization-storage` gRPC 服务对关键功能缺乏认证，攻击者可获取五个 Dell 存储产品系列的后端存储管理员凭据；**CVE-2026-63692**（CSM，10 分）同样是授权代理与租户服务缺乏认证控制；**CVE-2026-67269**（9.9 分）允许低权限远程攻击者获得 root 权限并"完全攻陷集群所有节点"；**CVE-2026-54472**（9.8 分）可伪造密码学有效的管理员令牌；**CVE-2026-86360**（DSU，9.6 分）为路径穿越，可导致以 root 权限执行任意代码。

无缓解措施，必须升级：Dell DSU 2.3.0.0 之前版本受影响，Dell CSM 1.17.0 之前版本受影响。CSM 是连接 Kubernetes 的开源软件扩展，DSU 是 PowerEdge 服务器的通用部署工具。官方建议同时轮换后端管理员凭据与 CSM 授权凭据/令牌、确保受影响系统处于分段网络、并检查包括 Azure Stack HCI 与 ESXi 在内的所有使用 DSU 的环境。

**Source:** [Dell patches 18 critical flaws that could hand attackers the keys to storage and Kubernetes](https://www.csoonline.com/article/4230923/dell-patches-18-critical-flaws-that-could-hand-attackers-the-keys-to-storage-and-kubernetes.html)

### AWS EKS 上线 Kubernetes 1.37：Metrics API GA、DRA 设备污点 GA、HPA 缩容到零进入 Beta

AWS 已将 Kubernetes 1.37 上线至 Amazon EKS 与 Amazon EKS Distro，自 10 月 2 日起支持新建集群，并通过 EKS 控制台、eksctl 或 IaC 工具执行升级。本次上线包含三项值得注意的上游变更：**Metrics API 转为 GA**；**Dynamic Resource Allocation 的设备污点与容忍度转为 GA**，允许 DRA 驱动与管理员为 GPU 等设备打污点，调度器仅在显式容忍时分配，这对跨团队共享加速器的场景提供了更清晰的调度控制；**HPA scale-to-zero 进入 Beta 并默认开启**，使用 `minReplicas: 0` 且依赖 object 或 external metrics 的自动伸缩器可在空闲时缩容至零。

生命周期方面，EKS 小版本提供 14 个月标准支持加 12 个月扩展支持，Kubernetes 1.37 于 2026 年 10 月 1 日进入 EKS，标准支持至 2027 年 12 月 1 日，扩展支持至 2028 年 12 月 1 日。AWS 强调控制平面不会自动升级节点，托管节点组与自管节点仍是升级计划的一部分。

**Source:** [AWS EKS Adds Kubernetes 1.37 With New Autoscaling and GPU Scheduling Controls](https://codegangsta.io/tech-business/aws-eks-kubernetes-1-37-autoscaling-gpu-scheduling/)

### 6.5 万集群 RBAC 研究：内置主体仍被授予危险权限

一项覆盖近 1 万家组织、超过 6.5 万个 Kubernetes 集群的研究发现，`system:anonymous`、`system:unauthenticated` 与 `system:authenticated` 等内置主体仍被授予有风险的 RBAC 权限。原始统计出超过 32 万条指向这些主体的绑定，剔除 Kubernetes 默认绑定与废弃的 podsecuritypolicy 相关条目后，约 4.4 万条留存待分析，其中超过 3,500 条授予了危险权限。AKS 默认禁用匿名访问，EKS 与 GKE 限制匿名用户可达范围，GKE 默认允许 `system:authenticated` 访问有效 Google 账号。研究指出部分风险绑定是命名空间作用域的，意味着命名空间级管理员可通过错误配置暴露更大的集群资源面。

**Source:** [Guarding The Gates: Assessing Dangerous Permissions Granted To Kubernetes Built-in Principals](https://www.hendryadrian.com/guarding-the-gates-assessing-dangerous-permissions-granted-to-kubernetes-built-in-principals/)

## 分析 (Analysis)

**节点交换是一次被长期污名化的实践的"翻身"，其条件极为苛刻但信号意义明确。** Kubernetes 社区从 1.0 时代就明确不鼓励 swap，理由是 swap 会让内存 limit 失去意义（因为被换出的页面无法被 OOM killer 感知）。v1.34 把节点交换推入 GA，实际上是在守护者（LIMIT 的可预测性）与工程师（密度的现实压力）之间做了一次精妙的重新划界：**用 `LimitedSwap` 把"能否换出"与"换出多少"解耦**，从而让内存 limit 重新变得有意义。这一划界的技术细节比 GA 本身更值得学习——它示范了如何在一个被长期禁止的能力上重建安全保证，而不是简单地放开。真正的看点在于官方基准给出的数字组合：沙箱隔离运行时（gVisor、Kata）的内存开销通常会降低密度，而交换恰好吸收这类开销，这意味着 **agentic 工作负载的安全隔离第一次不再必然以密度为代价**。这对运行不可信代码的平台团队是决定性的：过去"沙箱 vs 密度"是零和博弈，现在可以在同一节点上同时获得两者。但也要清醒：官方数据是 Google 自己在自家 GKE Local SSD 上跑的，峰值密度下的 CPU 争抢才是真实瓶颈，交换只是把瓶颈从内存挪到了 CPU——**你的工作负载是否 CPU-bound，决定了这条路径是否真的省钱**。

**Dell 这批漏洞揭示了"存储-集群连接层"的信任盲区。** 这 18 个 CVE 的分布很说明问题：CVE-2026-63688 与 CVE-2026-63692 都是 gRPC 服务"关键功能缺乏认证"，CVE-2026-67269 直接导致"完全攻陷集群所有节点"。CSM 的角色是 Kubernetes 与戴尔存储阵列之间的桥梁，它天然处在**双重敏感的位置**——一侧是 RBAC 保护的集群，一侧是存储管理员凭据。当这个桥梁自身出现认证缺失时，RBAC 的所有努力都被绕过。这引出一个常被忽略的架构原则：**任何位于身份系统边界上的组件，都必须被当作独立的信任域来加固，而不是继承所在集群的信任等级**。同时，官方建议中"轮换后端管理员凭据与 CSM 授权令牌"这一条，比打补丁本身更重要——打补丁阻止未来入侵，轮换凭据清理已经可能存在的历史访问。

**上游节奏与安全节奏正在脱节，这是本周最值得警惕的信号。** v1.38 进入特性冻结、89 项增强锁定，1.37 刚刚在 EKS 上线——同时 6.5 万集群研究显示内置主体仍在被过度授权，StatefulSet 控制器存在跨命名空间 confused deputy，Windows 节点的 `subPath` 符号链接可泄露 NTLM 哈希。这三者并置说明：**功能创新的速度正在超过安全基线落地的速度**。CVE-2026-2270 的性质尤其值得注意——拥有命名空间级写权限的用户即可跨命名空间创建 Pod，这不是配置错误，而是控制器的设计缺陷；多租户集群中"租户 A 的命名空间管理员能影响租户 B"是硬性隔离承诺的破防。特征冻结意味着 v1.38 的新功能不会再增加，**这恰恰是把资源投向"审计既有边界"的窗口**，而非继续叠加功能。

**RBAC 研究的结论对平台团队的操作优先级有直接指示。** 6.5 万集群中留存 3,500 余条危险绑定，多数是历史遗留而非有意设计。这个数字的真正含义不是"有 3,500 个漏洞"，而是**"绝大多数组织的 RBAC 配置已经漂移到无人理解的状态"**。研究者特别指出命名空间作用域绑定的隐蔽性——一个本意只想授权某命名空间的角色，如果 subject 写成 `system:authenticated`，实际效果会远超预期。有效的应对不是逐条清理，而是把 RBAC 从"一次性配置"变为"持续验证的策略"，用策略引擎（OPA/Kyverno/CEL）在准入侧持续检测内置主体绑定与越权路径。

## 结论 (Conclusion)

本期动态贯穿两条主线：**上游在提高密度与功能（节点交换 GA、DRA 设备污点 GA、HPA 缩容到零、1.38 冻结），产业界在修补信任链（Dell 18 个 CVE、RBAC 权限漂移、内置主体过度授权）**。二者并不矛盾——密度提升与信任加固同时成为主题，恰恰说明云原生已从"能不能跑起来"进入"能不能规模化地、可被信任地跑起来"的阶段。

对实践者而言，本期有四条可执行的判断：

1. **重新评估交换策略。** 如果你的集群运行 gVisor/Kata 沙箱、浏览器测试农场或 JVM 应用，节点交换配合本地 NVMe SSD 值得做一次受控基准测试；务必使用 `LimitedSwap` 并配合 Burstable QoS，先测量自己的 `Scheduled → Running` p50 与 CPU 利用率，确认瓶颈确实在内存而非 CPU。
2. **把 CSM/DSU 类"集群-基础设施桥接组件"纳入独立审计范围。** 立即升级至 Dell DSU 2.3.0.0 与 CSM 1.18.0，轮换后端管理员凭据与 CSM 授权令牌，并确认这些组件所在网络分段符合最小暴露原则。
3. **升级到包含 9 月补丁的版本。** v1.34.12 / v1.35.9 / v1.36.5 / v1.37.1 修复了 StatefulSet 的跨命名空间 confused deputy 与 Windows 节点 NTLM 泄露，多租户与 Windows 节点环境尤其不应延迟。
4. **把 RBAC 漂移纳入持续检测。** 用策略引擎持续扫描内置主体绑定，特别是命名空间作用域的 `system:authenticated` 授权，并建立"授权项-责任人-复核日期"的可追溯记录。

未来值得跟踪的是：v1.38 是否如期在冻结后收敛为可发布状态；EKS 上线 1.37 后 HPA 缩容到零对冷启动路径的实际影响；以及 Dell 之外，其他"存储-集群桥接层"厂商是否会暴露同类认证缺失问题——**因为这一类漏洞的结构性问题不会出现在 CVE 数据库里，而会出现在所有采用同样设计模式的组件中**。