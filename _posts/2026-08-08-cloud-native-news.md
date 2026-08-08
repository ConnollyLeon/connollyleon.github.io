---
layout: post
title: "云原生动态：Gateway API v1.6发布TCP/UDP路由晋级标准、OpenCost 1.121.0推出Kubernetes推理成本追踪与DRA与HAMi的GPU共享之争"
date: 2026-08-08
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/08/03/gateway-api-v1-6-release/"
categories:
  - cloud-native
tags:
  - gateway-api
  - tcproute
  - udproute
  - opencost
  - llm-d
  - inference-cost
  - kubernetes
  - dra
  - hami
  - gpu-sharing
---

# 云原生动态：Gateway API v1.6发布TCP/UDP路由晋级标准、OpenCost 1.121.0推出Kubernetes推理成本追踪与DRA与HAMi的GPU共享之争

本周云原生生态的焦点同时落在"网络标准收敛"与"AI基础设施成本/资源精细化"两条主线上。Gateway API v1.6发布，TCPRoute与UDPRoute正式晋级Standard，四层流量治理进入标准轨道；OpenCost 1.121.0推出Kubernetes推理（inference）成本追踪，首次将"每token成本"纳入成本核算视野；CNCF社区则围绕"Kubernetes DRA是否会取代HAMi"展开一场关于GPU共享实现路线的公开辩论。

## 主要新闻

### Gateway API v1.6发布：TCPRoute与UDPRoute晋级Standard

Kubernetes Gateway API发布v1.6版本，其中TCPRoute与UDPRoute正式从Experimental晋级Standard，标志着Gateway API在四层（L4）流量治理上的成熟——此前Standard轨道仅覆盖HTTP层面的路由能力，本次升级使基于TCP/UDP的非HTTP工作负载（数据库、游戏、VPN、IoT设备流量等）也能通过标准化的Gateway API模型进行声明式路由、监听与跨实现治理，并正式成为长期稳定API的一部分。与此同时，新版本引入XBackend等实验性机制，为HTTPRoute等资源提供后端选择与扩展能力的新方向。v1.6继续遵循"API版本发布频率与Kubernetes解耦、每个版本独立声明发布说明与迁移指引"的既定节奏，实现细节由网关实现（如Envoy Gateway、Nginx、Istio等）跟进落地。对运维团队而言，这意味着L4负载均衡的"供应商锁定"问题首次获得与L7同等的标准化解法。

**Source:** [Gateway API v1.6 Release](https://kubernetes.io/blog/2026/08/03/gateway-api-v1-6-release/)

### OpenCost 1.121.0：首款Kubernetes原生推理成本追踪能力

CNCF成本管理项目OpenCost发布1.121.0，推出"同类首个"的Kubernetes推理成本追踪能力。核心背景是：GPU账单持续上涨、模型每天服务数十亿token，但平台团队长期无法回答"每个token到底花了多少钱"。OpenCost通过与开源推理引擎llm-d的集成，把KV-cache命中率等推理特征纳入成本模型，从而将Token生成过程中的计算、显存与吞吐差异转化为可核算的单位成本。这一能力把成本归因从"按Pod/节点"的粗粒度，推进到"按推理请求/按token"的细粒度，使平台团队能够区分缓存命中与未命中请求的实际开销、识别高成本推理路径，并据此做SLO与容量决策。该版本由IBM Research的Sima Nadler与OpenCost维护者Alex Meijer联合发布，凸显出"FinOps + AI工作负载"正在成为云原生成本管理的下一个主战场。

**Source:** [OpenCost 1.121.0: First-of-a-kind Kubernetes inference cost tracking](https://www.cncf.io/blog/2026/08/05/opencost-1-121-0-first-of-a-kind-kubernetes-inference-cost-tracking/)

### Does Kubernetes DRA Replace HAMi?：GPU共享路线的公开辩论

CNCF发布HAMi项目维护者Mesut Oezdil的技术文章《Does Kubernetes DRA Replace HAMi?》，直面GPU共享在Kubernetes上的根本矛盾：希望共享GPU的项目必须"绕开API工作，而不是顺着API工作"。文章指出，传统设备插件（device plugin）接口的词汇量极其有限——`nvidia.com/gpu: 1`只能计数设备，无法表达显存切片、计算单元划分、QoS隔离等更细粒度的共享语义，导致社区只能靠HAMi、MIG等各自为政的方案做"workaround"。文章以此切入DRA（Dynamic Resource Allocation，已在v1.37将Device Taints and Tolerations晋级GA）能否提供一等公民的、面向GPU切片的统一抽象，以及DRA与HAMi之间是替代还是互补的关系。该话题恰逢AI集群成为Kubernetes最大工作负载来源的当下，被视为GPU资源抽象标准化的关键讨论。

**Source:** [Does Kubernetes DRA Replace HAMi?](https://www.cncf.io/blog/2026/08/07/does-kubernetes-dra-replace-hami/)

## 分析

本周三条新闻共同指向同一判断：Kubernetes正在从"通用容器平台"演进为"AI基础设施的事实操作系统"，网络、成本与资源三层抽象都在为此重构。

Gateway API v1.6把TCP/UDP路由抬进Standard轨道，是网络抽象的一次"补课"。过去四年L7（HTTP）先行、L4滞后的格局，实际上反映了云原生应用迁移的优先级——先是Web服务，然后才是数据库、Cache、流媒体与内部RPC这类非HTTP流量。如今L4标准化，等于把"南北向与东西向入口统一由Gateway API治理"变成了可实现的目标，也让多云/混合云环境下的流量策略真正获得一次声明式、可移植的收敛。对正在做网络现代化的团队，v1.6是一个低风险的升级节点：Standard资源意味着长期API稳定性承诺，可以在今年内的迁移窗口优先落地。

OpenCost的推理成本追踪则回答了FinOps在AI时代最尖锐的问题——成本对象从"资源"变成"能力"。当推理引擎（llm-d）与成本引擎共享KV-cache命中率这类语义信息，成本核算才能真正反映"缓存命中≈零边际成本、未命中≈全额计算"的物理现实。这也暗示一个趋势：成本可观测性正从"事后账单"走向"请求级实时决策输入"，推理路由、缓存策略与弹性伸缩将越来越多地由单位成本驱动。

DRA与HAMi的争论则是资源抽象层的方向之辩。设备插件"只计数、不切分"的先天不足，使得GPU共享长期依赖外部方案；DRA通过ResourceClaim模型让集群对设备的使用方式（显存、算力、拓扑亲和性）获得标准化的表达能力，理论上提供了根治性路径。但生产现实是：HAMi等方案已在大量AI集群稳定运行，DRA的成熟度、生态接入与性能开销仍在演进。短期大概率是"DRA定义标准语义、HAMi等实现先行适配"的共存格局，长期则取决于DRA是否能把设备切分、故障隔离与调度策略做进核心API——而这正是本场辩论的价值所在。

## 结论

Gateway API v1.6的L4标准化、OpenCost的推理成本追踪与DRA/HAMi的GPU抽象之争，分别对应AI基础设施的"网络、成本、资源"三个核心层。建议平台团队：借v1.6发布窗口规划L4流量的标准网关迁移；评估OpenCost推理成本能力以建立请求级成本基线；同时持续跟踪DRA在GPU共享场景的演进，避免在生态未定局时过度投入私有workaround方案。

