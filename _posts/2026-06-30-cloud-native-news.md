---
layout: post
title: "云原生动态：Kube-Wasm获CNCF毕业，SPO v1.0稳定版，Envoy AI Gateway里程碑"
date: 2026-06-30
author: "云原生观察"
source: "https://byteiota.com/kube-wasm-cncf-graduation-kubernetes-webassembly/"
categories:
  - cloud-native
tags:
  - kube-wasm
  - webassembly
  - cncf
  - security-profiles-operator
  - envoy
  - ai-gateway
  - kubernetes
  - docker
  - supply-chain
  - container-security
  - containerd
  - cve
  - spdx
  - sbom
  - headlamp
  - cluster-api
---

# 云原生动态：Kube-Wasm获CNCF毕业，SPO v1.0稳定版，Envoy AI Gateway里程碑

过去一周云原生生态迎来多项里程碑事件：WebAssembly在Kubernetes中作为一等计算资源获得CNCF最高成熟度认可，安全配置管理迈入生产稳定时代，以及Envoy AI Gateway正式发布v1.0。

## 主要新闻

### Kube-Wasm获得CNCF毕业状态

CNCF技术监督委员会（TOC）已初步批准Kube-Wasm的毕业状态——这是CNCF的最高成熟度级别，待Q2 2026完成安全审计后正式生效。Kube-Wasm使WebAssembly模块能够作为一等计算资源直接在Kubernetes集群中调度，平均冷启动时间仅2.3毫秒（对比runc容器的620毫秒），内存占用约3MB（对比Docker容器的64MB）。WebAssembly 3.0已于2026年6月正式发布，WASI 0.3.0提供原生异步支持，Component Model达到稳定状态。Kube-Wasm毕业后将与Kubernetes、Prometheus、Envoy处于同一梯队，v1.0版本目标在KubeCon NA 2026发布。

**Source:** [Kube-Wasm Hits CNCF Graduation: Wasm on Kubernetes](https://byteiota.com/kube-wasm-cncf-graduation-kubernetes-webassembly/)

### Security Profiles Operator v1.0.0正式发布

CNCF项目Security Profiles Operator发布v1.0.0，所有八个CRD API毕业至v1稳定版。这是该项目的首个稳定版本，经过第三方安全审计（零关键漏洞发现）和完整加固周期。SPO支持以Kubernetes自定义资源方式管理seccomp、SELinux和AppArmor配置文件，可从实时工作负载记录配置文件。值得关注的是KEP 6061（基于OCI制品的安全配置文件分发）提案——它将SPO率先实现的OCI分发能力引入kubelet原生支持，添加`PullSecurityProfileArtifact` CRI API调用，使容器运行时可按需从OCI注册表获取配置文件。

**Source:** [Security Profiles Operator v1: Stable APIs, Security Hardened, and Shaping Upstream Kubernetes](https://www.cncf.io/blog/2026/06/26/security-profiles-operator-v1-stable-apis-security-hardened-and-shaping-upstream-kubernetes/)

### Envoy AI Gateway v1.0发布

Tetrate宣布Envoy AI Gateway v1.0正式发布——这是首个基于CNCF Envoy Gateway构建的开源AI网关。该项目由Bloomberg在Envoy Gateway社区提出，经过16个月的协作开发，来自Bloomberg、Nutanix、Tetrate和更广泛Envoy社区的维护者共同贡献。v1.0标志着生产成熟度，为生成式AI流量提供路由、故障转移、可观测性和合规功能。Nutanix正在将其投入生产，并纳入Nutanix Agent Gateway和Enterprise AI解决方案。

**Source:** [Envoy AI Gateway Reaches v1.0, Establishing the Open Source Standard for Enterprise AI Traffic](https://www.prnewswire.com/news-releases/envoy-ai-gateway-reaches-v1-0--establishing-the-open-source-standard-for-enterprise-ai-traffic-302808088.html)

### Docker Engine v29.6.1发布，修复多项安全漏洞

Docker Engine v29.6.1发布，修复了多个安全漏洞，包括恶意镜像通过`/etc/passwd`或`/etc/group`文件导致OOM的问题（GHSA-mjcv-p78q-p5fw等），以及自定义前端发送构建请求禁用Seccomp和AppArmor保护的问题（GHSA-7236-3392-c5c6）。同时将containerd更新至v2.2.5，BuildKit更新至v0.31.1。此前的v29.6.0版本新增了`GET /images/{name}/attestations`端点用于检索SLSA和SPDX SBOM证明。

**Source:** [Docker Engine v29.6.1 Release](https://github.com/moby/moby/releases/tag/docker-v29.6.1)

### Headlamp新增Cluster API和Knative插件

Kubernetes官方博客连续发布两篇公告：Cluster API插件和Knative插件正式登陆Headlamp——开源的Kubernetes SIG UI项目。Cluster API插件为平台团队提供CAPI资源的可视化管理和调试，支持MachineDeployments扩展、控制平面监控、拓扑关系映射和Prometheus指标集成。Knative插件则让操作员可在Headlamp中直接检查和管理Serverless工作负载。两个插件均通过CNCF LFX导师计划开发。

**Source:** [Introducing the Cluster API plugin for Headlamp](https://kubernetes.io/blog/2026/06/25/headlamp-cluster-api-plugin/)

**Source:** [See your serverless: introducing the Headlamp plugin for Knative](https://kubernetes.io/blog/2026/06/25/headlamp-knative-plugin/)

## 分析

本周的新闻集中体现了云原生生态系统的成熟化趋势。Kube-Wasm获得CNCF毕业是最具标志性的事件——它意味着WebAssembly不再只是实验性的边缘技术，而是被CNCF最高治理机构认可的、适合生产环境的一等公民。2.3ms的冷启动与3MB的内存占用相比传统容器带来了数量级的效率提升，这对函数计算、事件驱动处理、轻量级API端点等场景具有革命性意义。

SPO v1.0和KEP 6061的组合标志着Kubernetes安全正在经历从手动运维到声明式自动化再到平台原生的三级演进。OCI制品分发配置文件的能力一旦被kubelet原生支持，将消除团队在多个集群间手动同步安全配置文件的痛点。

Envoy AI Gateway v1.0的发布则将Envoy的服务网格能力延伸到AI领域。在AI工作负载爆炸式增长的背景下，企业需要一个标准化的、与现有基础设施一致的AI流量管理方案。Bloomberg、Nutanix等机构的参与赋予了该项目生产级的可信度。

对于从业者而言，建议关注以下行动项：评估Kube-Wasm在冷启动敏感工作负载中的应用潜力；规划SPO v1.0的迁移路径；将Envoy AI Gateway纳入AI基础设施的评估范围；及时更新Docker Engine以修复已披露的安全漏洞。

## 结论

6月最后一周的云原生新闻呈现出一个清晰的信号：生态正在从"能不能用"走向"怎么用好"。WebAssembly、安全配置管理和AI网关的成熟标志着云原生技术栈的三个关键维度——计算效率、安全基础和AI基础设施——同时取得了实质性进展。对于平台团队而言，现在是时候将这些技术从评估阶段推进到试点部署阶段了。
