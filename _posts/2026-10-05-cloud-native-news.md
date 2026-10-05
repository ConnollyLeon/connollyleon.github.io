---
layout: post
title: "云原生动态：Istio 1.31引入Agentgateway Waypoint与GitLab高危漏洞在野利用"
date: 2026-10-05
author: "云原生观察"
source: "https://www.infoq.com/news/2026/10/istio-1-31-agentgateway/"
categories:
  - cloud-native
tags:
  - istio
  - service-mesh
  - agentgateway
  - ambient-mesh
  - kubernetes
  - supply-chain-security
  - gitlab
  - news
---

# 云原生动态：Istio 1.31引入Agentgateway Waypoint与GitLab高危漏洞在野利用

2026年10月3日至4日，云原生领域同时迎来基础设施演进与安全警报。Istio 1.31 将 Rust 语言实现的 agentgateway 引入 ambient 网格作为 L7 waypoint，并宣布将发布制品迁出 Google Cloud，折射出服务网格与软件供应链的双重调整；与此同时，GitLab 曝出正被在野利用的严重漏洞，官方呼吁组织立即排查暴露面。云原生社区正在同时处理"更快更稳的流量治理"与"更严格的供应链信任"这两条主线。

## 主要新闻 (Main News)

### Istio 1.31 将 agentgateway 作为 L7 Waypoint 引入 Ambient 网格

InfoQ 报道，Istio 1.31 在 8 月 31 日发布后新增了 `istio-agentgateway-waypoint` 这一 GatewayClass，使 ambient 模式下的 waypoint 代理可以由 agentgateway 承担。agentgateway 是由 Solo.io 主导、用 Rust 编写的 L7 数据平面，该项目已捐赠给 Linux 基金会，并支持在处理 HTTP 流量之外同时处理 MCP（Model Context Protocol）协议流量。这使得 agentgateway 不仅能承担传统 API 网关职责，还能直接面向 AI 智能体与工具调用的新兴流量形态。

版本同时引入了 canary waypoint 能力：通过 `use-waypoint-canary` 与 `use-waypoint-canary-weight` 标签，运维团队可以在不改动客户端的前提下，按比例将部分流量逐步切流到新版 waypoint；已有连接不会被强制迁移，从而为升级提供了可控的灰度路径。

**Source:** [Istio 1.31 Adds Agentgateway Waypoints and Moves Release Artifacts off Google Cloud](https://www.infoq.com/news/2026/10/istio-1-31-agentgateway/)

### Istio 引入 Zone-Aware 负载均衡并将制品迁出 Google Cloud

同一次发布中，Istio 在 DestinationRule 与 MeshConfig 上新增 `zoneAwareLbSetting`，允许下游代理优先将请求路由到自身所在可用区的后端实例，在本地容量饱和时再向其他可用区溢出，从而降低跨区流量成本与延迟。网络方面新增了 `ALLOW_ANY_DNS` 行为，用于支持更动态的 DNS 解析场景。

供应链层面的变化更具标志性：Istio 计划在 10 月 13 日的演练性停机之前，停止向 Google Cloud（`gcr.io/istio-release`、`registry.istio.io` 以及 Google 的 Helm 仓库）发布镜像与 Charts，并已在 12 月彻底退役这些路径。同时签名公钥将从 1.31.1 起轮换为 `istio-key-v2.pub`，官方明确提示用户需要同步更新镜像拉取凭据。该版本支持 Kubernetes 1.32 至 1.36。

**Source:** [Istio 1.31 Adds Agentgateway Waypoints and Moves Release Artifacts off Google Cloud](https://www.infoq.com/news/2026/10/istio-1-31-agentgateway/)

### GitLab 严重漏洞遭在野利用，可导致未授权数据外泄

InfoQ 报道，GitLab 披露了一个正被主动利用的严重漏洞，攻击者可借此实现未授权的数据外泄。该漏洞的严重性在于它绕过了认证环节，意味着仅依赖边界访问控制的防御难以奏效。InfoQ 记者 Sergio De Simone 提醒，暴露在公网的 GitLab 实例需要优先排查相关组件版本与访问日志。

在软件供应链的语境下，这类事件与 Istio 制品迁移形成了鲜明对照：前者是"漏洞导致信任崩塌"，后者是"主动重建信任基础"。两者共同说明，代码托管与发布制品本身已不再是可信假设，而必须被视为需要持续验证的攻击面。

**Source:** [GitLab Vulnerability under Active Exploitation Enables Unauthenticated Data Exfiltration](https://www.infoq.com/news/2026/10/gitlab-critical-vulnerabilities/)

## 分析 (Analysis)

**服务网格的抽象层正在被重新定义。** agentgateway 以 Rust 重写并捐赠给 Linux 基金会，意味着 L7 数据平面正在从"网格的附属组件"上升为独立可演进的基金会级基础设施。这一步与 MCP 支持相结合尤其值得注意：MCP 是 AI 智能体调用工具的标准协议，其流量特征（高频、短生命周期、语义化调用）与传统南北向 API 存在显著差异。在网格层原生支持 MCP，意味着 AI 智能体的流量可以与业务流量一样享受 mTLS、授权策略、遥测与限流，而不必另建旁路网关。这可能是 2026 年服务网格最有想象空间的方向之一。

**灰度与拓扑感知成为升级的默认姿势。** canary waypoint 与 `zoneAwareLbSetting` 的加入，反映出 Istio 正从"提供能力"转向"降低变更风险"。canary waypoint 让 waypoint 升级本身成为可灰度的常规运维操作；zone-aware 负载均衡则是云成本治理的自然延伸——在多可用区架构下，跨区调用带来的时延与出口流量费用本应由网格层自动感知和优化，而不是由每个业务方手工配置。这些特性的共同点是：把复杂度吸收进控制面，而不是推给应用开发者。

**制品分发渠道的"去单点化"值得长期关注。** 停止向 Google Cloud 发布 Istio 制品，时间点选在 10 月 13 日演练停机前，并伴随签名密钥轮换与 12 月彻底退役。这类变更对国内团队尤其重要：它意味着 Istio 的稳定获取路径不再依赖单一公有云仓库。运维团队需要提前准备镜像同步或内部镜像仓库的镜像拉取策略，并注意在密钥轮换后更新凭据，否则升级链路会在某个时间点静默断裂。这类"渠道迁移"风险往往被忽视，直到 CI 流水线突然失败才被发现。

**在野利用漏洞提示了组件清单治理的必要性。** GitLab 漏洞表明 CI/CD 与代码托管层依然是攻击者高频瞄准的目标。对于云原生组织而言，防御重点应当包括：收敛对外暴露的 GitLab 实例、启用双因素认证与审计日志、定期核对组件版本与 CVE 通告、以及在制品仓库侧落实签名验证（而非仅信任来源地址）。需要强调的是，供应链风险的实质不是"某个组件有漏洞"，而是"我们是否能快速、准确地知道自己用了哪些组件、它们的版本、以及是否受影响"——这本质上是一个可观测性问题。

## 结论 (Conclusion)

本期动态勾勒出云原生生态的一体两面：一面是 Istio 通过 agentgateway、canary waypoint 与 zone-aware 负载均衡持续降低网格的使用与运维门槛，并将数据平面推向基金会治理；另一面是 GitLab 在野利用漏洞提醒我们，供应链信任需要被主动管理而非默认授予。

对实践者而言，近期有三件事值得关注：一是评估 MCP 流量纳入网格治理的必要性与成本；二是为 Istio 制品渠道迁移与密钥轮换制定时间表，避免升级链路被切断；三是建立可查询的组件与版本清单，让"我们是否受影响"成为可以在分钟级回答的问题。

从更长远的视角看，软件供应链正在从"下载即信任"走向"可验证即信任"。签名验证、来源透明、渠道可替换将成为基础设施的默认属性，而这些能力的成熟度，将直接决定云原生技术在受监管行业中的可采纳程度。