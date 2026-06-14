---
layout: post
title: "云原生技术动态：Longhorn V2存储引擎GA、Crossplane迈向v2、containerd安全修复"
date: 2026-06-14
author: "云原生观察"
source: "https://lwcn.dev/newsletter/2026-week-24/"
categories:
  - cloud-native
tags:
  - longhorn
  - crossplane
  - containerd
  - keda
  - kind
  - k9s
  - envoy
  - cloud-native
---

# 云原生技术动态：Longhorn V2存储引擎GA、Crossplane迈向v2、containerd安全修复

本周云原生生态系统迎来大量项目更新，Longhorn 1.12.0 V2数据引擎正式GA，Crossplane引入v2升级检查工具，containerd修复高危CVE，Kind默认使用Kubernetes 1.36.1，CNCF发布分布式IAM白皮书。

## 主要新闻 (Main News)

### Longhorn 1.12.0正式发布：V2数据引擎GA

Longhorn 1.12.0宣布V2数据引擎（V2 Data Engine）正式GA，这是基于SPDK的下一代存储引擎。新版本还引入了拓扑感知配置（topology-aware provisioning）、双栈和V2 IPv6支持，以及改进的可观测性。V2引擎的GA标志着Longhorn在生产环境中的性能关键型工作负载支持迈出重要一步。

**Source:** [Longhorn v1.12.0 Release](https://github.com/longhorn/longhorn/releases/tag/v1.12.0)

### Crossplane 1.20.9发布：引入v2升级检查

Crossplane 1.20.9修复了用户报告的问题和依赖项安全漏洞，并引入了`crossplane beta upgrade check`命令，用于评估v2升级就绪状态。这一变化表明Crossplane v2的正式发布已进入倒计时阶段。

**Source:** [Crossplane v1.20.9 Release](https://github.com/crossplane/crossplane/releases/tag/v1.20.9)

### containerd 2.1.8修复高危CVE

containerd 2.1.8修复了CVE-2026-46680，该漏洞涉及OCI规范中越界USER值的处理问题。同时修复了沙箱服务中的多个bug。这是继上周安全公告后的重要补丁更新。

**Source:** [containerd v2.1.8 Release](https://github.com/containerd/containerd/releases/tag/v2.1.8)

### KEDA 2.20.0发布：新增Kubernetes事件记录

KEDA 2.20.0通过`events.k8s.io` API组记录Kubernetes事件，自定义部署需要更新RBAC配置。这一改进使基于事件的自动缩放更具可观察性和可审计性。

**Source:** [KEDA v2.20.0 Release](https://github.com/kedacore/keda/releases/tag/v2.20.0)

### Kind 0.32.0发布：默认使用Kubernetes 1.36.1

Kind 0.32.0包含关键的依赖项更新和bug修复，默认使用Kubernetes 1.36.1。由于containerd升级，需要更新kind以兼容新的节点镜像。K9s 0.51.0也同时发布，包含常规修复和增强。

**Source:** [Kind v0.32.0 Release](https://github.com/kubernetes-sigs/kind/releases/tag/v0.32.0)

### Envoy多版本安全修复

Envoy发布了1.38.1、1.37.3、1.36.7和1.35.11等多个版本的安全修复，修复CVE-2026-47774——当HTTP/2流超过头部列表大小限制时将其重置，并将未压缩的cookies计入头部限制。多个Kuma版本同步更新了Envoy依赖。

**Source:** [Envoy v1.38.1 Release](https://github.com/envoyproxy/envoy/releases/tag/v1.38.1)

### CNCF发布云原生IAM白皮书

CNCF本周发布了分布式云原生架构中的身份与访问管理（IAM）白皮书，讨论了在云原生环境中确保CI/CD流水线安全的策略，以及InSpektor Gadget完成首次独立安全审计的结果。

**Source:** [CNCF IAM Whitepaper](https://www.cncf.io/blog/2026/06/10/identity-and-access-management-in-cloud-native-architectures/)

## 分析 (Analysis)

本周的发布节奏再次验证了云原生生态系统的成熟度。69个版本、159个新闻项——这种发布密度要求团队建立自动化的依赖更新和补丁管理机制。containerd的CVE修复和Envoy的多版本同步更新提醒我们，安全漏洞管理在任何规模的组织中都不应被忽视。

Longhorn V2数据引擎的GA是Kubernetes存储领域的一个重要里程碑。基于SPDK的V2引擎为有状态工作负载提供了接近裸机性能的块存储支持，这降低了在Kubernetes上运行数据库等IO密集型应用的性能障碍。结合拓扑感知配置功能，Longhorn正在缩小与商业存储解决方案的差距。

Crossplane引入v2升级检查工具反映了控制平面领域的一个重要趋势。作为CNCF的孵化项目，Crossplane正在从"Kubernetes上的云资源管理工具"演变为"企业基础设施控制平面"。v2版本的迁移工具表明团队已为大规模生产用户准备了平滑升级路径。

Kind 0.32.0默认使用Kubernetes 1.36.1，显示出Kubernetes版本迭代的加速。对于开发者而言，本地开发环境与生产环境版本的一致性比以往任何时候都更重要。

## 结论 (Conclusion)

本周的云原生发布周期展现了生态系统在三个层面的持续演进：存储层（Longhorn V2 GA）、控制层（Crossplane v2准备）和安全层（containerd/Envoy CVE修复）。建议团队关注Longhorn V2引擎在生产环境中的部署反馈，以及Crossplane v2的正式发布时间线。同时，及时应用containerd和Envoy的安全补丁应作为本周的优先事项。