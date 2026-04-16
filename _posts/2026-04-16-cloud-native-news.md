---
layout: post
title: "云原生技术动态：Kubernetes 1.36即将发布与Docker安全漏洞修复"
date: 2026-04-16
author: "云原生观察"
source: "https://securityboulevard.com/2026/04/kubernetes-is-eating-production-why-usage-keeps-climbing-into-2026/"
categories:
  - cloud-native
tags:
  - kubernetes
  - docker
  - security
  - cloud-native
  - cncf
---

# 云原生技术动态：Kubernetes 1.36即将发布与Docker安全漏洞修复

本周云原生领域迎来多项重要更新。Kubernetes 1.36版本计划于4月22日正式发布，带来多项生产环境就绪的功能更新，包括HPA零扩展默认启用和用户命名空间GA等关键改进。与此同时，Docker修复了一个高危安全漏洞(CVE-2026-34040)，CNCF也在KubeCon Europe 2026期间宣布了多项重要项目更新。

## 主要新闻 (Main News)

### Kubernetes 1.36即将发布：多项GA功能就绪

Kubernetes v1.36计划于2026年4月22日发布，将包含18项GA（稳定）功能和20项进入Alpha阶段的新特性。该版本的重点更新包括：HPA scale-to-zero现在默认启用，可节省高达73%的空闲计算成本；用户命名空间（Pod级别内核隔离）现已稳定并可用于生产部署；Mutating Admission Policies达到GA，允许使用CEL定义变更逻辑而无需Webhook服务器。

**Source:** [Kubernetes v1.36 Sneak Peek](http://k8s.io/blog/2026/03/30/kubernetes-v1-36-sneak-peek/)

### Docker安全漏洞CVE-2026-34040修复

Cyera Research发现了Docker Engine中的一个高危授权绕过漏洞（CVE-2026-34040，CVSS 8.8）。该漏洞允许攻击者通过特制的超大HTTP请求绕过所有Docker授权插件，获得主机级别的根访问权限。Docker已发布Engine 29.3.1和Docker Desktop 4.66.1版本修复该漏洞，建议所有用户立即更新。

**Source:** [Cyera Research Discovers Docker Authorization Bypass](https://www.cyera.com/blog/cyera-research-discovers-docker-authorization-bypass-that-silently-disables-security-policies)

### CNCF AI Conformance认证平台数量翻倍

CNCF的Kubernetes AI Conformance认证计划从18个认证平台增长到31个，增长超过70%。新加入的认证平台包括OVHcloud、SpectroCloud、JD Cloud和中国联通云等。该计划新增了代理AI工作负载验证和更严格的硬件要求，标志着Kubernetes生态系统在AI基础设施标准化方面的重要进展。

**Source:** [CNCF Nearly Doubles Certified Kubernetes AI Platforms](https://machineherald.io/article/2026-04/14-kubernetes-ai-conformance-program-nearly-doubles-certified-platforms-to-31-as-cncf-adds-agentic-workflow-validation-and-stricter-hardware-requirements)

### Kubescape 4.0发布：AI时代的Kubernetes安全

Kubescape 4.0正式发布，引入了生产就绪的运行时威胁检测和AI代理安全扫描功能。运行时威胁检测引擎现在支持对容器系统交互、网络事件和Linux能力的监控。AI代理安全扫描功能允许AI代理调用Kubescape进行集群安全扫描，为运行在Kubernetes上的AI代理提供安全保障。

**Source:** [Kubescape 4.0: Kubernetes Security for the AI Era](https://lucaberton.com/blog/kubescape-4-kubernetes-security-ai-era-2026/)

### Broadcom将Velero捐赠给CNCF Sandbox

Broadcom将Velero（广泛采用的Kubernetes原生备份、恢复和迁移工具）捐赠给CNCF作为Sandbox项目。Velero支持Kubernetes 1.18到1.35版本，在企业级环境中拥有广泛的用户基础。该捐赠遵循CNCF TOC于3月17日批准的提案，标志着Kubernetes备份工具治理向社区驱动模式的转变。

**Source:** [Broadcom Donates Velero to the CNCF Sandbox](https://machineherald.io/article/2026-04/07-broadcom-donates-velero-to-the-cncf-sandbox-shifting-kubernetes-backup-governance-to-the-community)

## 分析 (Analysis)

本周的云原生技术更新反映了行业发展的几个关键趋势。

首先，Kubernetes正在成为AI工作负载的首选平台。根据CNCF年度调查，82%的容器用户在生产环境中运行Kubernetes，66%的组织在Kubernetes上运行生成式AI工作负载。AI Conformance认证项目的快速扩展证明了这一趋势，平台提供商正竞相确保其Kubernetes发行版能够满足AI推理和训练的特殊需求。

其次，安全仍然是云原生生态系统的首要关注点。Docker CVE-2026-34040漏洞的高严重性评分（CVSS 8.8）及其对92%企业容器部署的影响凸显了容器运行时安全的脆弱性。Kubescape 4.0的发布表明Kubernetes安全工具正在演进，不仅关注传统的静态配置扫描，还开始覆盖运行时威胁检测和AI代理安全。

第三，Kubernetes正在巩固其作为"云原生操作系统"的地位。1.36版本中的HPA零扩展、用户命名空间和Mutating Admission Policies GA等更新表明，Kubernetes正在将曾经需要复杂定制或第三方工具的功能整合到核心平台中。这种"平台化"趋势正在降低运营复杂性，使组织能够更轻松地运行生产级工作负载。

## 结论 (Conclusion)

本周的云原生技术动态表明，行业正在经历几个重要转变：Kubernetes正在从容器编排工具演变为AI基础设施平台，安全工具正在适应AI工作负载的新威胁模式，而核心平台功能正在整合曾经属于生态系统工具链的复杂能力。

对于平台工程团队而言，这些发展意味着需要重新评估其工具链策略，特别是在AI工作负载支持和安全监控领域。随着Kubernetes 1.36的发布和AI Conformance认证的扩展，组织应考虑更新其集群配置以利用新的GA功能，同时评估新兴的安全工具以应对AI时代的新威胁。
