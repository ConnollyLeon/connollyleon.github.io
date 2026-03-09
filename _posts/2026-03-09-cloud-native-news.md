---
layout: post
title: "Kubernetes 1.36开发进展与AI网关工作组成立：云原生生态持续演进"
date: 2026-03-09
author: "云原生观察"
source: https://www.cncf.io/blog/2026/03/05/the-great-migration-why-every-ai-platform-is-converging-on-kubernetes/
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - ai
  - service-mesh
---

# Kubernetes 1.36开发进展与AI网关工作组成立：云原生生态持续演进

本周云原生领域迎来多项重要更新，Kubernetes社区宣布成立AI网关工作组，同时1.36版本进入代码冻结阶段，标志着容器编排平台的又一次重大演进。这些发展反映了云原生技术从传统的无状态Web服务向分布式AI工作负载的深刻转型。

## 主要新闻

### Kubernetes AI网关工作组正式成立

Kubernetes社区于2026年3月9日正式宣布成立AI网关工作组（AI Gateway Working Group），专注于为Kubernetes环境中的AI工作负载制定网络基础设施标准和最佳实践。该工作组将开发涵盖代理服务器、负载均衡器等网络网关基础设施的标准规范，解决AI推理和训练场景下的独特网络需求。

**Source:** [Announcing the AI Gateway Working Group](https://www.kubernetes.dev/blog/2026/03/09/announcing-ai-gateway-wg/)

### Kubernetes 1.36版本进入代码冻结

Kubernetes 1.36版本将于2026年3月19日进入代码冻结（Code and Test Freeze），所有功能工作必须在冻结前完成合并。此后仅接受关键错误修复，并需要对任何额外更改获得批准异常。这是Kubernetes持续快速迭代的体现，同时也为1.36版本的正式发布奠定基础。

**Source:** [Week Ending March 1, 2026 | Last Week in Kubernetes Development](https://lwkd.info/2026/20260305)

### AWS负载均衡器控制器支持Gateway API正式可用

AWS宣布AWS Load Balancer Controller现已全面支持Kubernetes Gateway API。此前，该控制器仅满足Kubernetes Ingress和Service资源要求，通过配置应用程序负载均衡器（ALB）和网络负载均衡器（NLB）来实现。现在用户可以定义更灵活的网关路由策略，进一步简化云原生网络管理。

**Source:** [AWS Load Balancer Controller adds general availability support for Kubernetes Gateway API](https://aws.amazon.com/blogs/networking-and-content-delivery/aws-load-balancer-controller-adds-general-availability-support-for-kubernetes-gateway-api/)

### Calico发布2026冬季版本

Calico于2026年3月4日发布冬季更新版本，引入了AI助手、统一流量可观测性和可扩展多集群管理功能。该版本针对管理一个或多个Kubernetes集群时面临的指数级增长问题提供了解决方案，帮助简化大规模集群的运维复杂性。

**Source:** [Calico Winter 2026 Release: AI Assistant, Unified Traffic Observability & Scalable Multi-Cluster Management](https://www.tigera.io/blog/whats-new-in-calico-winter-2026-release/)

## 分析

Kubernetes社区本周宣布成立AI网关工作组，这标志着云原生生态系统对AI工作负载的重视程度达到了新的里程碑。根据CNCF 2026年1月发布的调查，82%的容器用户已在生产环境中运行Kubernetes，66%的组织使用Kubernetes托管生成式AI模型进行推理工作负载。这一趋势推动Kubernetes从传统的无状态Web应用扩展到分布式数据处理、分布式训练任务和LLM推理领域。

AWS Load Balancer Controller对Gateway API的全面支持则反映了云服务商对标准化网络接口的重视。Gateway API提供了比传统Ingress更灵活的路由配置能力，支持更细粒度的流量管理策略。这对于需要复杂路由规则的AI推理服务尤为重要，可以实现A/B测试、金丝雀部署等高级部署策略。

从运维角度看，Calico的2026冬季版本通过引入AI助手来应对大规模集群管理的挑战。随着集群规模增长，指标、日志等数据的数量呈指数级增长，成为有效故障排除的障碍而非资产。AI驱动的智能分析能力将帮助运维团队更快速地定位和解决问题。

## 结论

云原生技术生态系统正在经历从传统容器编排向AI基础设施平台的深刻转型。Kubernetes 1.36版本的即将发布和AI网关工作组的成立，预示着社区正积极应对AI工作负载带来的新挑战。对于云原生从业者而言，关注这些发展趋势、理解AI工作负载的特殊需求，将是未来几年的重要课题。企业应开始评估其Kubernetes基础设施是否准备好支持生产级AI工作负载，包括GPU调度、模型服务化、推理优化等关键技术能力。
