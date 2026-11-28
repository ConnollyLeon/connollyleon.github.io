---
layout: post
title: "云原生技术动态：AI代理沙箱、私有云控制面与代理搜索接口汇聚"
date: 2026-11-28
author: "云原生观察"
source: "https://thenewstack.io/aws-nitro-sandboxes-agents"
categories:
  - cloud-native
tags:
  - ai-agents
  - aws
  - kubernetes
  - private-cloud
  - platform-engineering
---

# 云原生技术动态：AI代理沙箱、私有云控制面与代理搜索接口汇聚

2026年11月27日前后的云原生新闻显示，基础设施竞争正在从容器编排本身转向围绕AI代理的可信运行时、私有云统一控制面以及面向代理的公开网络接口。AWS、Broadcom与Cloudflare分别从不同层级回应同一问题：当软件开始代表用户执行任务，云原生平台需要同时提供隔离、治理和可发现性。

## 主要新闻

### AWS Nitro Sandboxes为AI代理提供硬件级隔离运行时

The New Stack 11月27日报道，AWS Nitro Sandboxes把Nitro Hypervisor的硬件隔离范围扩展到单个EC2实例中的多个沙箱。开发者可通过EKS Auto Mode或ECS Managed Instances的运行时配置启用，而不必重写容器镜像。文章提到标准与机密两种模式：机密模式阻止父实例检查沙箱内存，零网络沙箱则可阻断沙箱直接联网，并可通过Envoy网关只允许受控的模型调用。AWS还展示了与CAMEL Agent Sandbox、Astrix Agent Substrate等代理栈的集成，强调安全与身份仍是代理规模化落地的障碍。

**Source:** [AWS Nitro Sandboxes give AI agents a place to run](https://thenewstack.io/aws-nitro-sandboxes-agents)

### Broadcom描绘VMware私有云承载虚拟机、容器与AI的统一路径

The New Stack 11月27日发布对Broadcom的VMware Cloud Foundation策略解读。文章以KubeCon + CloudNativeCon 2026为背景，提出开发者、平台工程团队和传统虚拟机团队可在同一私有云基础设施层获得自助服务体验。VMware vSphere Kubernetes Service、VM Service、Container Service被放在统一控制面中讨论，Prometheus、Argo CD、Harbor等组件则被作为内置能力呈现。文中还提到用Kubernetes管理多集群、用直接容器能力覆盖轻量级边缘测试，并预告约一年后可能提供AI驱动诊断。需要注意的是，该文由Broadcom赞助，叙事应放在厂商战略语境中阅读。

**Source:** [A year from now, VMware wants AI troubleshooting your private cloud](https://thenewstack.io/vmware-private-cloud-kubernetes/)

### Cloudflare推出Search for Agents，把网站变成可搜索的代理接口

The New Stack 11月26日报道，Cloudflare推出Search for Agents，允许网站通过AI Search索引内容，并在`/.well-known/search`路径暴露可被代理查询的接口。该接口支持GET与HTTP QUERY请求，返回的是Markdown风格上下文或引用内容，而不是由平台生成的最终答案；计费由站点所有者承担查询费用。Cloudflare官方更新说明该功能面向所有套餐开放，目标是让代理在访问网站时获得结构化、可引用的上下文，而不是依赖不可控爬取。

**Source:** [Cloudflare launches Search for Agents endpoint](https://thenewstack.io/cloudflare-agent-search-endpoint/)

## 分析

第一条新闻说明AI代理正在改变云原生隔离边界。传统容器隔离假设工作负载可信度相对可控，而代理会携带外部提示、调用工具、持有凭证并可能触发网络访问，运行时需要更强的内存隔离、机密计算和受控出口。Nitro Sandboxes把硬件隔离下移到实例内多个沙箱，实际上是在云原生平台上补出一层面向不可信代理逻辑的信任边界。

第二条新闻反映私有云控制面的再整合。过去几年平台团队在虚拟机、Kubernetes、GitOps、可观测性和服务目录之间自行拼装体验；Broadcom的表述则把这些能力收拢为单一私有云产品逻辑。对平台工程实践者而言，价值不在某个新API，而在自助服务、配额、策略、补丁和审计是否可以跨VM与容器统一执行。厂商赞助内容也提醒读者区分产品愿景与可验证的生产指标。

第三条新闻把代理交互从网页抓取推进到接口化发现。Search for Agents不是传统搜索排名产品，而是站点主动声明可被代理检索的内容和调用方式。这可能改变SEO、内容授权和边缘缓存策略：网站要决定哪些内容对代理可见、如何计量查询、如何保留出处。若这类接口普及，代理应用架构中的检索层会更像API网关治理问题，而不只是向量数据库问题。

接下来值得观察的是三项能力能否形成标准组合：代理运行时的机密隔离与身份绑定、跨VM与容器的统一策略执行、以及面向代理的内容接口和计费模型。它们共同决定AI代理能否从演示走向受监管、可审计的生产系统。

## 结论

这组新闻的共同主题是云原生基础设施正在为代理时代重写边界：运行时要更可信，控制面要更统一，外部内容要更可发现。企业不应只关注新增功能名称，而应围绕隔离、身份、出口控制、审计和成本计量建立落地评估框架。
