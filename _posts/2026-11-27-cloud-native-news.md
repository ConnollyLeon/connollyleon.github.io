---
layout: post
title: "云原生技术动态：KubeCon复盘显示AI网关、MCP治理与加固镜像成为焦点"
date: 2026-11-27
author: "云原生观察"
source: "https://blog.nginx.org/blog/kubecon-cloudnativecon-north-america-2026-what-we-heard-in-salt-lake-city"
categories:
  - cloud-native
tags:
  - cloud-native
  - kubernetes
  - ai-gateway
  - mcp
  - supply-chain-security
---

# 云原生技术动态：KubeCon复盘显示AI网关、MCP治理与加固镜像成为焦点

近期云原生讨论的重心明显转向AI工作负载的治理与运行时安全。KubeCon + CloudNativeCon North America 2026复盘显示，AI推理流量、MCP工具调用和代理运行时正在进入网关与策略引擎的管辖范围；CNCF“Drone 2”主题演讲则用无人机现场演示展示了代理栈的沙箱、出口控制与可观测性组合。与此同时，内部MCP服务器的容器镜像加固也从小众实践变成现实需求。

## 主要新闻

### KubeCon复盘：AI流量进入网关，Ingress迁移仍在持续

NGINX对盐湖城KubeCon的复盘指出，AI on Kubernetes贯穿整场大会：推理路由、AI网关、代理运行时、Model Context Protocol（MCP）和代理沙箱成为高频话题。团队仍在大量使用已退休的Ingress-NGINX；该项目于2026年3月停止发布、修复和安全补丁。迁移路径主要集中在保留Ingress资源并转向NGINX Ingress Controller，或采用Gateway API与NGINX Gateway Fabric。

更值得关注的是AI流量控制开始落在网关层：按模型路由请求、跟踪token与推理成本、认证代理并审计其行为，以及用policy-as-code管理GPU与模型访问。NGINX演示显示，MCP工具调用在HTTP层面都像JSON-RPC POST，工具失败甚至可能仍返回HTTP 200，因此需要工具级身份、速率限制、指标和异常识别。F5与SlashData对445家企业的调研还显示，61%的企业称Kubernetes治理标准不低于其他IT资产，但仅38%达到“企业级”；在自托管AI模型的企业中，77%运行在自建Kubernetes上，只有43%检查代理工具与MCP流量。

**Source:** [KubeCon + CloudNativeCon North America 2026: What we heard in Salt Lake City](https://blog.nginx.org/blog/kubecon-cloudnativecon-north-america-2026-what-we-heard-in-salt-lake-city)

### CNCF“Drone 2”演示揭示代理运行时的云原生底座

CNCF发布的KubeCon闭幕主题演讲幕后文章披露，“Drone 2”现场无人机演示并非单纯炫技，而是对实时代理执行、防护栏、沙箱与可观测性的综合验证。演示技术栈由CNCF Sandbox项目agent-substrate和kagent承载代理运行，agentgateway同时充当LLM网关、出口网关和MCP网关，并通过身份提供商处理工具调用的认证与授权。OpenTelemetry与Jaeger则用于追踪代理执行路径、工具调用耗时、限流错误和时间消耗。

为保证室内飞行安全与合规，团队安排了FAA Part 107认证遥控飞行员，并在家庭环境中进行螺旋桨护罩和飞行路径测试。这个案例说明，代理系统一旦连接物理设备或内部系统，治理重点就从“模型能否回答”转向“行动是否被授权、网络访问是否受控、链路是否可追踪”。

**Source:** [The story behind “Drone 2”: My KubeCon + CloudNativeCon North America 2026 keynote](https://www.cncf.io/blog/2026/11/25/%f0%9f%9a%80-the-story-behind-drone-2-my-kubecon-cloudnativecon-north-america-2026-keynote/)

### 加固MCP服务器镜像：最小基础镜像成为内部AI服务防线

Cloud Native Now刊文比较了Google distroless、Chainguard Images和Docker Hardened Images三类加固镜像，并以真实内部MCP服务器为例进行迁移和扫描。作者指出，差异不仅来自CVE数量，也来自被移除的冗余工具链：标准Node.js镜像中随附的npm依赖解析与发布工具，在运行时服务器并不会调用，却构成了额外攻击面。

三类方案各有取舍。distroless成熟且免费，但补丁节奏依赖上游；Chainguard通过Wolfi和Chainguard OS从源码构建并每日重建镜像，但版本标签和SLA需要订阅；Docker Hardened Images基于Debian或Alpine，迁移摩擦更低。共同代价是生产镜像通常没有shell和包管理器，团队必须采用多阶段构建、专用调试镜像或开发变体来维持可运维性。

**Source:** [What Changed When I Hardened an Internal MCP Server Image](https://cloudnativenow.com/contributed-content/what-changed-when-i-hardened-an-internal-mcp-server-image/)

## 分析

云原生平台正在把AI流量纳入传统流量治理体系。过去网关主要处理HTTP路由、TLS、认证和限流，现在还要理解模型、token、工具调用和推理成本。Gateway API Inference Extension与policy-as-code的组合，使平台团队可以把租户隔离、模型访问控制、故障转移和GPU成本路由写成可审计策略。这不是简单增加一个AI代理组件，而是把AI请求纳入既有控制平面与责任边界。

代理运行时的实践信号同样清晰。Drone 2演示中的agent-substrate、kagent、agentgateway、OpenTelemetry和Jaeger组合，几乎覆盖了代理生产化的关键问题：执行隔离、出口策略、工具身份、端到端追踪和失败定位。对平台工程团队而言，AI代理的“运行时”正在成为新的基础设施对象，需要与容器、函数、虚拟机一样被调度、观测和约束。

镜像加固则从另一个方向补上安全边界。MCP服务器、内部代理桥接服务往往持有真实凭据和内部API访问权，却未必像公网服务一样接受严格扫描。最小基础镜像通过移除shell、包管理器和无用工具链降低被攻陷后的横向移动空间，但它并不能替代补丁流程、供应链来源验证和运行时策略。企业需要把镜像选择、重建频率、调试流程和合规SLAs作为一个整体来设计。

接下来值得观察四点：Gateway API Inference Extension是否形成跨实现的一致能力；MCP工具级审计与失败检测是否进入主流网关；CNCF代理项目能否从演示级验证走向生产级互操作标准； hardened images 的补丁节奏与可观测调试能力能否满足金融、医疗等 regulated 场景的要求。

## 结论

云原生领域正从“承载AI”转向“治理AI”。网关负责模型与工具流量，代理运行时负责隔离与授权，加固镜像负责缩小内部AI服务的攻击面。平台团队下一步的核心任务，是把这些能力纳入统一的身份、策略、遥测和供应链治理体系。
