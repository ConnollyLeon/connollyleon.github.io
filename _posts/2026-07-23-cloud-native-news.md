---
layout: post
title: "云原生技术动态：EKS版本回滚革命与GKE AI安全蓝图发布"
date: 2026-07-23
author: "云原生观察"
source: "https://aws.amazon.com/about-aws/whats-new/2026/07/amazon-eks-efa-placement-groups/"
categories:
  - cloud-native
tags:
  - kubernetes
  - eks
  - gke
  - ai-security
  - cloud-native
---

# 云原生技术动态：EKS版本回滚革命与GKE AI安全蓝图发布

云原生领域迎来多项重大突破。AWS宣布Amazon EKS支持Kubernetes版本回滚能力，解决了长期困扰运维团队的升级风险问题。Google Cloud发布GKE AI工作负载安全蓝图，为AI生产部署提供三层安全框架。与此同时，Karpenter正式登陆OpenShift，etcd 3.7和containerd 2.3.3同步发布，云原生基础设施生态全面升级。

## 主要新闻

### Amazon EKS引入Kubernetes版本回滚能力

AWS宣布Amazon EKS推出Kubernetes版本回滚功能，允许集群管理员在升级后七天内回滚到之前的稳定版本。这一功能支持一次回滚一个次要版本，通过EKS Cluster Insights预评估回滚就绪状态，包括节点版本兼容性和插件依赖检查。对于使用EKS Auto Mode的集群，回滚流程更加简化，支持取消API以在节点回滚过程中暂停操作。该功能已在所有商业AWS区域可用，无需额外费用。

**Source:** [Amazon EKS Introduces Kubernetes Version Rollback Capability](https://codeguilds.com/amazon-eks-introduces-groundbreaking-kubernetes-version-rollback-capability-offering-unprecedented-safety-net-for-cluster-upgrades/)

### Google Cloud发布GKE AI工作负载安全蓝图

Google Cloud发布针对GKE上AI工作负载的三层安全蓝图，涵盖基础设施、模型完整性和应用安全。蓝图推荐使用Confidential GKE Nodes扩展硬件级内存加密至Nvidia H100 GPU和TPU，通过Workload Identity Federation让推理Pod无需长期密钥即可获取模型权重。蓝图引入k8s-aibom开源Kubernetes控制器，自动生成AI物料清单。应用层使用Model Armor检测提示注入，GKE Sandbox基于gVisor隔离AI代理。

**Source:** [Google Cloud Publishes GKE Security Blueprint for AI Workloads](https://news.lavx.hu/article/google-cloud-publishes-gke-security-blueprint-for-ai-workloads)

### Karpenter登陆OpenShift，etcd 3.7与containerd 2.3.3发布

Red Hat OpenShift 4.22正式引入Karpenter构建版本，实现工作负载感知的自动扩缩容。Karpenter评估待处理Pod的集体资源需求，即时配置最优EC2实例，需求下降时自动整合和终止低利用率节点。etcd 3.7.0作为主要版本发布，带来性能改进和Raft共识处理优化。containerd 2.3.3修复了NRI GetIPs空指针引用等关键CRI Bug，改善了OCI错误响应的可调试性。

**Source:** [Karpenter Arrives on OpenShift, etcd 3.7 Ships](https://thestackobserver.com/karpenter-arrives-on-openshift-etcd-3-7-ships-and-containerd-patches-cri-kubernetes-this-july/)

## 分析

AWS EKS版本回滚功能的发布标志着托管Kubernetes服务进入新阶段。此前，Kubernetes版本升级是一个单向过程，运维团队必须投入大量资源制定复杂的补偿策略来缓解升级风险。回滚功能的引入从根本上改变了这一范式，将Kubernetes版本管理从"高风险一次性决策"转变为"可逆的渐进式操作"。这一功能与EKS Auto Mode的结合尤其重要——在全托管环境中，控制平面和节点必须同步回滚，而Pod Disruption Budgets的严格遵守确保了工作负载的最小影响。从行业角度看，这将加速组织采用最新Kubernetes版本的速度，因为升级风险的降低直接转化为更高的变更频率和更好的安全态势。

Google Cloud的GKE AI安全蓝图则回应了AI从原型到生产的关键安全缺口。传统软件安全模型无法覆盖AI特有的风险——模型权重泄露、提示注入、AI代理的工具调用风险。蓝图的三层架构（基础设施加密、模型完整性、应用层防护）提供了一个系统化的解决方案。k8s-aibom项目的引入尤为重要，它填补了AI系统物料清单的空白——传统SBOM无法捕获数据集、训练框架等AI特有组件。随着AWS、Google和Microsoft分别发布各自的AI安全框架，云原生AI安全正在从零散的最佳实践演变为标准化的能力要求。

OpenShift 4.22引入Karpenter则代表了自动扩缩容范式的根本转变。从基于固定池的传统Cluster Autoscaler到工作负载感知的即时配置，Karpenter的模式正在成为行业标准。其在OpenShift上的GA意味着企业级Kubernetes用户也能享受到这一能力，而不再局限于AWS原生环境。etcd和containerd的版本更新虽然不如前者引人注目，但它们是Kubernetes控制平面和运行时层的基石——containerd 2.3.3中的CRI Bug修复对于生产环境的稳定性至关重要。

## 结论

本周的云原生技术动态呈现出三个明确趋势：运维安全性正在从被动响应转向主动保障（EKS回滚）、AI安全正在成为平台能力的标配（GKE蓝图）、智能自动扩缩容正在跨越企业采用门槛（Karpenter on OpenShift）。从业者应立即评估EKS回滚功能对自身升级策略的影响，将AI安全蓝图中的k8s-aibom和Model Armor纳入AI工作负载的安全评估清单，并关注Karpenter在非AWS平台上的成熟度。下一阶段的云原生竞争将不仅围绕功能丰富度，更围绕运维安全性和AI就绪度。
