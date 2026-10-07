---
layout: post
title: "云原生动态：Kubernetes v1.35默认拒绝cgroup v1、kubectl cp曝Windows路径穿越RCE、OpenTelemetry K8s属性处理器v1.0转正、NVIDIA AICR v1.0确立GPU集群稳定契约"
date: 2026-10-07
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/10/06/kubernetes-cgroups-v2-shift/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cgroup-v2
  - cve-2026-19444
  - kubectl
  - opentelemetry
  - observability
  - nvidia
  - aicr
  - gpu
  - cloud-native
  - news
---

# 云原生动态：Kubernetes v1.35默认拒绝cgroup v1、kubectl cp曝Windows路径穿越RCE、OpenTelemetry K8s属性处理器v1.0转正、NVIDIA AICR v1.0确立GPU集群稳定契约

2026年10月6日的云原生领域，主线是**"底层契约的硬化"**：Linux 资源隔离层（cgroup）与 GPU 集群配置层（AICR）在同一天迎来硬性基线，可观测性元数据契约（OTel）正式转正，而客户端工具链则再次暴露信任边界问题。上游方面，Kubernetes 官方博客明确 v1.35 起 `failCgroupV1` 默认为 true；NVIDIA 发布 AI Cluster Runtime v1.0，把"锁版本的、经过验证的 GPU 集群配方"做成了带签名证据的稳定接口。安全侧，`kubectl cp` 被披露 Windows 路径穿越漏洞 CVE-2026-19444，可把"从 Pod 拷文件"变成管理员工作站上的任意文件写入乃至代码执行。

## 主要新闻 (Main News)

### Kubernetes 官方定调 cgroup v2：v1.35 起节点默认不再启动

Kubernetes 官方博客（作者 Paco Xu，DaoCloud）10 月 6 日发布《The Shift to cgroup v2 in Kubernetes》，给出了迁移的明确时间线。要点是：**从 Kubernetes v1.35 开始，`failCgroupV1` 默认为 `true`，kubelet 在 cgroup v1 节点上默认不启动**。管理员可临时在 kubelet 配置中设置 `failCgroupV1: false`，但该回退会按弃用政策移除，彻底删除工作由 KEP-5573 跟踪。

文章强调了 cgroup v2 与多项现代资源管理特性的耦合关系：**内存 QoS**（自 v1.22 alpha，v1.36 仍是 alpha，但已把内存节流与内存预留分离并引入分级保护）只能在 cgroup v2 上工作，因为它依赖 `memory.high` 节流以及 `memory.min`/`memory.low` 的硬/软保护；**Pod 级原地垂直扩缩**在 v1.35 GA，v1.36 默认启用 Pod 级资源的原地垂直扩缩，需要 kubelet 在 Pod 级与容器级 cgroup 之间协调——这种精确的聚合执行同样依赖 cgroup v2。此外，**通过 CRI 自动发现运行时 cgroup 驱动**（KEP-4033）已在 v1.34 GA，需要 containerd v2.0+ 或 CRI-O v1.28+。

**Source:** [The Shift to cgroup v2 in Kubernetes: What You Need to Know](https://kubernetes.io/blog/2026/10/06/kubernetes-cgroups-v2-shift/)

### kubectl cp 曝 Windows 路径穿越 RCE（CVE-2026-19444）

安全研究者披露 `kubectl cp` 存在客户端路径穿越漏洞 CVE-2026-19444，CVSS 3.1 评分 6.5，由 Kubernetes CNA 分配。漏洞的根因是：`kubectl cp` 通过 `kubectl exec` 在容器内运行 `tar` 并把归档流回本地，而归档中的**条目名完全由容器控制**；客户端在解包时用于阻止目录穿越的 `isRelative()` 校验只识别 Unix 风格的分隔符，**完全忽略了 Windows 的反斜杠**——Windows 会把 `\` 当作"上一级目录"，于是恶意归档可把文件写到目标目录之外，例如当前用户的启动文件夹，下次登录即执行。

暴露面被评估为"相当广"：ZeroHour 估计野外存在 10 万至 100 万台 Windows 版 `kubectl` 安装。修复版本为 **kubectl 1.34.12、1.35.9、1.36.5 及以上**；Linux 与 macOS 客户端不受影响，服务端版本无关紧要（缺陷在客户端解包侧）。安全媒体指出，受害者通常是持有广泛凭据的集群管理员，自动化 Windows CI/CD 构建节点被攻陷后还可能升级为供应链事件。**唯一修复方式就是升级客户端**，Kubernetes 维护者已做向后移植以简化升级。

**Source:** [CVE-2026-19444: How copying in kubectl breaks trust](https://edera.dev/stories/cve-2026-19444-how-copying-in-kubectl-breaks-trust)

### OpenTelemetry Kubernetes 属性处理器升级至 v1.0

InfoQ（作者 Craig Risi）10 月 6 日报道，OpenTelemetry 将 **Kubernetes Attributes Processor 提升至 v1.0.0**，标志着 Kubernetes 遥测数据在可观测性管道中更可预测、更稳定。该处理器为日志、指标与追踪附加 Kubernetes 元数据（Pod、命名空间、节点、工作负载），是许多 OTel 部署中的关键一环；其转正满足 OTel 在测试、基准、文档与遥测稳定性方面的要求，并为下游发行版提供 API 稳定性保证。

值得注意的是，**这次转正并不完全向后兼容**：稳定版采用了新的 OpenTelemetry Kubernetes 语义约定，导致若干属性名变化——如 `container.image.tag` 变为 `container.image.tags`，Kubernetes 标签与注解从 `k8s.pod.labels`/`k8s.pod.annotations` 变为 `k8s.pod.label`/`k8s.pod.annotation`，node 与 namespace 同理。仪表盘、告警、记录规则、查询与下游集成若引用旧属性名都可能需要更新；OTel 提供了 feature gate，允许迁移期内同时发射新旧约定。文章还提醒该处理器在内存中缓存被监控 Pod 的元数据，在大型环境中内存消耗可能显著，且对 host-networked Pod 与 sidecar 部署存在已知限制。

**Source:** [OpenTelemetry Makes Kubernetes Attributes Processor Stable as Observability Schema Matures](https://www.infoq.com/news/2026/10/opentelemetry-kubernetes-observ/)

### NVIDIA 发布 AICR v1.0：把 GPU 集群配置变成可验证的稳定契约

NVIDIA 开发者博客（Mark Chmarny 与 Nathan Taber）10 月 6 日发布 **NVIDIA AI Cluster Runtime（AICR）v1.0**。AICR 提供**版本锁定、经验证的配方（recipe）**，为 GPU 加速的 Kubernetes 集群固定可协同工作的组件组合；v1.0 在 CLI、REST API、Go SDK、bundle 布局与 artifact schema 上确立了稳定的兼容契约，使运维者与集成者可以放心构建在公共接口之上。

AICR 由四项彼此独立的能力组成：**Snapshot** 记录观测到的集群状态（Kubernetes、操作系统、内核、GPU 与拓扑）；**Recipe** 描述期望的、版本锁定的组件配置及约束与验证阶段；**Bundle** 将配方渲染为 Helm、Argo CD、Flux 或 Helmfile 的部署产物；**Validation** 将配方与观测状态对比，并在声明时执行部署、一致性与性能检查，记录签名证据。AICR 已有超过 100 名贡献者，其中近一半来自 NVIDIA 之外；Pulumi Labs 通过 IaC provider 暴露 AICR，Mirantis 的 k0rdent 将其打包用于多集群管理。v1.0 还引入提交式兼容基线与围绕公共接口的合并阻断检查。

**Source:** [AICR v1.0: Open, stable, and verifiable GPU cluster configuration](https://prismix.dev/news/f9524fd6a641)

## 分析 (Analysis)

**cgroup v2 的"默认拒绝"是 Kubernetes 对内核资源语义的一次清算，其影响远不止一次升级。** 过去十年，cgroup v1 的多层级、独立控制器模型虽然在实践中可用，但造成了资源统计口径不一、控制器之间协调困难等长期问题。cgroup v2 的单层级统一模型是内存 QoS、原地垂直扩缩、高密度容器等现代特性的**前提条件**——换言之，Kubernetes 不是"顺便"支持 cgroup v2，而是其未来路线图已经**在架构上依赖 cgroup v2**。`failCgroupV1` 默认 true 的策略非常聪明：它不是立即删除 v1，而是让新集群在启动阶段就"硬失败"，把迁移成本尽早暴露，同时保留一个会随弃用政策消失的逃生舱。对平台团队而言，真正的工作量在于**操作系统镜像与内核选型**——许多仍在运行的旧发行版默认仍以 cgroup v1 挂载，必须在升级 v1.35 前把每个 Linux 节点迁到 cgroup v2，或明确接受临时覆盖及其到期风险。一个务实的迁移检查清单是：确认运行时 cgroup 驱动（containerd 2.0+ 已可通过 CRI 自动发现）、确认节点 OS 挂载 `cgroup2`、确认现有内存 QoS 与垂直扩缩配置在新语义下行为一致。

**kubectl cp 的故事则再次证明：开发者工作站属于集群的攻击面。** CVE-2026-19444 的 6.5 分可能"低估"了实际风险，正如分析者所言，管理员工作站上的任意文件写入可以现实地转化为代码执行——启动文件夹投毒是最直接的路径。这个漏洞的深层教训不是"Windows 又出问题"，而是 **`kubectl cp` 的整个架构把容器当成了可信端**：它借用 `exec` 与容器内自带的 `tar`，而 `tar` 来自镜像本身，因此在供应链攻击成熟的时代，被投毒的基础镜像可以同时污染 `tar` 与归档内容。缺一个 CRI 层的文件传输协议是长期设计债，KEP 之所以长期难产，是因为它要求所有 CRI 实现达成一致。在标准落地之前，正确的防御姿态是**把任何来自容器的数据都当作攻击者可控**，并优先升级客户端。这也提醒平台团队：CI/CD 的 Windows runner 与管理员跳板机应当和集群节点一样被纳入补丁治理。

**OpenTelemetry 的转正把"可观测性语义"提升为一等公民，代价是迁移工作。** 长期以来，Kubernetes 元数据如何映射到遥测属性，在不同厂商 agent 之间各行其是：Datadog 的 infraattributes processor 从 Node Agent/Cluster Agent 取元数据以减少 API 负载，而 OTel 的方案由 Collector 直接查询 Kubernetes API。属性名从复数变为单数看似琐碎，实则是**语义约定团队与 Collector 团队协同稳定化的产物**——一旦语义被固定，跨后端的可移植性才成为可能。对企业而言，这意味着仪表盘与告警规则需要一次系统性审计；更值得关注的是处理器在内存中缓存元数据带来的资源开销，Collector 本身已成为一个需要被管理的工作负载。**稳定不等于免费，"Stable by Default"运动实际上把可观测性基础设施x推向了生产平台的严格标准。**

**AICR v1.0 则回应了 GPU 集群配置长期缺乏"可复现真相"的痛点。** 在 AI 基础设施中，Kubernetes 版本、操作系统、内核、GPU 驱动、CUDA、网络插件与调度器之间的兼容矩阵极其复杂，而"在我的集群上能跑"往往无法复现到下一套集群。AICR 的配方模型（锁定组合 + 渲染到既有 GitOps 工具 + 用签名证据验证运行态）**没有重新发明部署工具，而是为它们提供了"证词"**——这比再做一个部署器更有价值。其 100+ 贡献者、近半来自 NVIDIA 之外的数字，说明社区对"厂商中立的 GPU 集群配置标准"有真实需求。与 cgroup v2 的"硬基线"、OTel 的"稳定语义"合在一起看，2026 年 10 月的云原生主题非常清晰：**生态正在把过去靠经验和文档维持的隐性契约，逐条变成可验证、可失败、可审计的显式契约。**

## 结论 (Conclusion)

本期的主线是**契约硬化**。Kubernetes 以默认拒止推动 cgroup v2 成为不可回避的基线；OpenTelemetry 把 Kubernetes 遥测语义固定为稳定约定；NVIDIA AICR 用签名证据为 GPU 集群配置建立了可验证契约；而 `kubectl cp` 的漏洞则提醒我们，客户端与开发者工具同样是信任边界的一部分，且常常是补丁覆盖的盲区。

对实践者的四条可执行判断：

1. **把 cgroup v2 迁移当作 v1.35 升级的前置条件纳入计划。** 盘点每个 Linux 节点的挂载与运行时驱动，确认操作系统镜像默认使用 cgroup2；对无法立即迁移的节点，明确记录临时 `failCgroupV1: false` 覆盖及其移除时限，而不是把它当成永久方案。
2. **立即将 Windows 版 kubectl 升级到 1.34.12 / 1.35.9 / 1.36.5 及以上。** 把管理员跳板机与 Windows CI/CD runner 纳入补丁治理；在架构层面，把"从容器拷出的任何内容都视为不可信输入"写成规范。
3. **为 OTel Kubernetes 属性处理器的 v1.0 迁移预留一次可观测性审计。** 在迁移期启用双发 feature gate，更新引用旧属性名的仪表盘、告警与记录规则，并评估元数据缓存在大规模集群中的内存开销。
4. **用 AICR 的配方与签名证据思路治理 GPU 集群漂移。** 把"锁定组件组合 + 渲染到现有 GitOps + 验证运行态"作为可复现基础设施的标准模式，而不是依赖口口相传的兼容性经验。

未来值得跟踪的是：v1.38 是否按计划彻底移除 cgroup v1 回退；CRI 层文件传输协议能否借 containerd-shim 的示范取得突破；OTel 语义约定稳定后各厂商 agent 是否收敛到统一属性名；以及 AICR 的"验证证据"能否被更多硬件与云平台覆盖，从而真正成为 GPU 集群的跨厂商可信基线。
