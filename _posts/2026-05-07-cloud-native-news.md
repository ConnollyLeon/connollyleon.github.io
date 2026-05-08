---
layout: post
title: "云原生技术动态：Kubernetes 1.36安全增强与CNCF观测性趋势"
date: 2026-05-07
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/05/04/kubernetes-v1-36-manifest-based-admission-control/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - cncf
  - observability
  - microcks
  - policy
---

# 云原生技术动态：Kubernetes 1.36安全增强与CNCF观测性趋势

本周云原生领域持续快速发展，Kubernetes 1.36版本的静态准入策略控制、Pod级资源管理和CNCF观测性调查揭示了生态系统的关键趋势。同时，Microcks晋升为CNCF孵化项目，Broadcom将Velero捐赠给CNCF标志着云原生数据管理进入新阶段。

## 主要新闻

### Kubernetes v1.36：基于清单的准入控制与Pod级资源管理（Alpha）

Kubernetes 1.36引入了一项重要的Alpha功能——基于清单的准入控制（Manifest-Based Admission Control），允许平台团队通过API服务器启动时加载的磁盘文件定义准入Webhook和基于CEL的策略。这一机制解决了Kubernetes长期存在的自举问题：传统基于API的准入策略无法拦截ValidatingAdmissionPolicy或ValidatingWebhookConfiguration的创建/删除，导致关键安全策略面临被集群管理员意外删除的风险。基于清单的策略存储在磁盘上，可通过标准配置管理工具（Ansible、Puppet或ConfigMap）进行管理，API服务器运行时监控文件变更并原子化地热加载更新，无需重启API服务器。

同时，Pod级资源管理器作为Alpha特性首次亮相，通过`PodLevelResourceManagers`和`PodLevelResources`特性门控，允许CPU管理器、内存管理器和拓扑管理器基于Pod级别（而非容器级别）进行资源分配。这对于AI/ML推理Pod尤其有价值——ML容器可获得独占的NUMA对齐CPU，而Service Mesh Sidecar则使用节点级共享池，在保障性能的前提下优化资源利用率。

**Source:** [Kubernetes v1.36: Admission Policies That Can't Be Deleted](https://kubernetes.io/blog/2026/05/04/kubernetes-v1-36-manifest-based-admission-control/)
**Source:** [Kubernetes v1.36: Pod-Level Resource Managers (Alpha)](https://kubernetes.io/blog/2026/05/01/kubernetes-v1-36-feature-pod-level-resource-managers-alpha/)

### CNCF发布观测性调查报告：46.7%团队仍运行2-3套观测性工具

CNCF发布了一项基于407名从业者的2026年2月观测性调查结果。数据显示，尽管成熟的开源观测性项目已经可用，仍有近46.7%的组织并行运行2到3套观测性工具，仅7.4%实现了统一的观测性体验。81%的团队对当前配置表示满意，但63%仍对切换持开放态度——其中55.5%将"集成质量"列为首要原因，超越功能、成本和性能。调查表明，OpenTelemetry的采用是解决集成碎片化的关键路径，但团队在实际部署中仍面临配置复杂度和时间到价值的挑战。

**Source:** [The tools are ready. So why are most cloud native teams still running three observability stacks?](https://www.cncf.io/blog/2026/05/06/the-tools-are-ready-so-why-are-most-cloud-native-teams-still-running-three-observability-stacks/)

### Microcks晋升为CNCF孵化项目

CNCF技术监督委员会（TOC）正式将API模拟与测试平台Microcks从沙箱项目提升为孵化项目。Microcks自2015年由Laurent Broudoux创建以来，已被BNP Paribas、Societe Generale、Deloitte等大型金融机构和咨询公司广泛采用，支持API模拟、契约测试和多协议兼容。CNCF孵化状态将为其提供更多资源和最佳实践指导，进一步推动API测试标准化在云原生生态系统中的发展。

**Source:** [Microcks CNCF Incubating Project for API Mocking](https://cloudninjas.ca/kubernetes/microcks-cncf-incubating-project-for-api-mocking/)

### Kubernetes 1.36：用户命名空间正式GA——根权限容器安全的十年之役告捷

经过长达十年的KEP历程和六年的积极开发，Kubernetes v1.36中的用户命名空间（User Namespaces）支持正式达到GA状态。当设置`hostUsers: false`时，容器内的root用户不再是主机上的root，即使容器被授予`CAP_NET_ADMIN`等权限，这些权限也只能作用于容器本地资源。实现这一突破的关键内核技术是ID映射挂载（ID-mapped mounts），它使用O(1)操作在挂载时透明地重映射UID/GID，避免了对大型卷进行递归chown操作的性能灾难。这是Kubernetes安全性自Pod Security Standards以来最重大的进步之一。

**Source:** [Kubernetes v1.36: User Namespaces in Kubernetes are finally GA](https://kubernetes.io/blog/2026/04/23/kubernetes-v1-36-userns-ga/)

## 分析

Kubernetes 1.36的安全特性集成形成了一幅连贯的安全增强图景。基于清单的准入控制解决了Kubernetes长期以来的"自举悖论"——如何保护安全策略本身不被攻击者或误操作删除。在传统Kubernete集群中，如果一个攻击者获得了cluster-admin权限，可以轻松删除ValidatingWebhookConfiguration来绕过所有准入控制。基于清单的准入控制从根本上解决了这个问题，因为策略文件存储在磁盘上，通过API无法删除。这不仅是技术特性，更是安全架构思维的转变——将系统底盘信任从API层迁移到基础设施层。

用户命名空间GA是另一个历史性里程碑。从2016年第一个KEP提出，到Linux内核5.12引入ID映射挂载，再到v1.36正式GA，这个功能走过了近十年的漫长历程。它的价值不仅仅是安全隔离，更关键的是它让"特权容器"变得更安全。过去，如果工作负载需要`CAP_NET_ADMIN`或`SYS_ADMIN`，管理员必须授予大量主机级权限。现在，这些权限在用户命名空间内被强烈隔离，即使被滥用，也无法影响到主机。这将直接推动更多网络插件、存储插件和安全监控工具以更少的权限运行。

观测性调查数据揭示了云原生社区面临的"选择悖论"——工具丰富但集成困难。OpenTelemetry作为统一数据平面已经获得了社区共识，但端到端的可观测性体验仍然碎片化。46.7%的团队运行多套工具的现实表明，部署和配置的复杂性是采用统一观测性的主要障碍。对于平台团队而言，投资于Operator工具链、完善的默认配置和参考架构将是降低时间到价值的关键举措。

Microcks晋升为CNCF孵化项目反映了API契约测试在云原生架构中的核心地位。随着微服务和API网关的广泛使用，API兼容性和契约一致性已从"最佳实践"演变为"生产必须"。Microcks的采用验证了开源驱动的API测试标准化道路的可行性。

## 结论

2026年5月初的云原生技术生态系统显示出明确的演进方向：安全正在从"可选增强"变成"基础架构"。Kubernetes 1.36的安全特性套件（用户命名空间GA、基于清单的准入控制Alpha、细粒度kubelet授权GA、Mutating Admission Policies GA）共同定义了下一代Kubernetes的安全基线。对于平台团队而言，这些都是必须规划采纳的特性。

观测性碎片化问题提醒我们，工具生态的成熟不等于部署体验的成熟。OpenTelemetry的普及虽然解决了数据标准化问题，但从数据收集到可操作的洞察之间仍有巨大的配置鸿沟。未来的观测性创新将更多集中在降低部署复杂度和提升集成质量上。

对于从业者，建议重点关注：(1) 评估用户命名空间对安全合规的影响并制定迁移策略；(2) 试验基于清单的准入控制以保护关键安全策略；(3) 利用OpenTelemetry简化观测性栈并评估AI辅助观测性工具；(4) 关注Microcks等API契约测试工具在CI/CD中的集成。
