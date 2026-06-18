---
layout: post
title: "云原生技术动态：Tigera推出Lynx AI代理安全控制平面，Istio强化多集群与AI推理扩展"
date: 2026-06-18
author: "云原生观察"
source: "https://www.helpnetsecurity.com/2026/06/17/tigera-lynx/"
categories:
  - cloud-native
tags:
  - kubernetes
  - ai-agents
  - tigera
  - istio
  - service-mesh
  - cloud-native
---

# 云原生技术动态：Tigera推出Lynx AI代理安全控制平面，Istio强化多集群与AI推理扩展

本周云原生生态系统迎来多项重要安全与基础设施更新。Tigera发布Lynx统一控制平面为Kubernetes原生AI代理提供身份认证与访问控制，Istio推出Ambient Multicluster beta与Gateway API Inference Extension，Nirmata与Broadcom合作将Kyverno策略引擎集成至VMware Cloud Foundation。这些更新表明云原生安全正在从容器层面延伸至AI代理行为管理层面。

## 主要新闻

### Tigera发布Lynx：Kubernetes AI代理的统一安全控制平面

Tigera宣布Lynx正式可用，这是一个专为Kubernetes原生AI代理设计的统一控制平面。Lynx位于代理调用的路径中——代理到代理、代理到工具、代理到LLM——对每一次调用进行认证、授权、中介和审计。每个代理通过EntraID、Okta或SPIFFE/SPIRE获得可验证的加密身份，长期API密钥被短生命周期的自动轮换令牌取代。采用Cedar策略语言的默认拒绝策略在网关层强制执行，无需修改任何代理代码。eBPF和LSM在内核层监控系统调用、网络调用和文件访问，捕捉凭证窃取和横向移动行为。

**Source:** [Tigera introduces unified control plane for Kubernetes-based AI agent security](https://www.helpnetsecurity.com/2026/06/17/tigera-lynx/)

### Istio发布Ambient Multicluster beta与Gateway API Inference Extension

CNCF项目Istio发布多项新功能。Ambient Multicluster进入beta阶段，扩展Istio的ambient模式以支持跨集群流量路由，无需sidecar即可简化多区域或多云环境中的服务网格部署。Gateway API Inference Extension同样进入beta，将机器学习推理直接集成到网格流量流中，为平台团队提供一致的开发者体验。此外，实验性的agentgateway支持反映了社区对更灵活、轻量级流量处理的探索，适应AI驱动的动态流量模式。

**Source:** [Istio Adds New Ambient Multicluster, Gateway API Inference Extension and More](https://www.devopsdigest.com/istio-adds-new-ambient-multicluster-gateway-api-inference-extension-and-more)

### Nirmata与Broadcom合作交付企业级Kubernetes治理

Nirmata宣布与Broadcom合作，通过VMware vSphere Kubernetes Service（VKS）为企业级VMware Cloud Foundation环境提供策略治理和合规自动化。Nirmata是CNCF毕业项目Kyverno的创建者，其策略引擎利用Kubernetes原生资源和工作流定义策略，实现准入控制、跨集群一致性治理和持续合规监控。该合作使得企业在运行传统工作负载的同时，能为现代化应用提供一致的安全策略管理。

**Source:** [Nirmata Collaborates with Broadcom to Deliver Enterprise Kubernetes Governance for VMware Cloud Foundation](https://nirmata.com/2026/06/16/nirmata-collaborates-with-broadcom-to-deliver-enterprise-kubernetes-governance-for-vmware-cloud-foundation/)

### Kaspersky Container Security新增GitHub Actions误配置检测

Kaspersky发布其容器安全解决方案的重要更新，新增安全代理对master节点的支持，实现对控制平面集群的深度审计。新增专门规则用于检测GitHub Actions误配置，包括不安全的工作流触发器、不受信任输入数据的不当处理和版本策略不安全等问题。该功能可嵌入CI/CD工作流或在独立模式下运行，有助于在供应链攻击发生前识别和缓解风险。

**Source:** [Kaspersky Container Security Introduces New Features to Optimize DevSecOps](https://www.kaspersky.com/about/press-releases/kaspersky-container-security-introduces-new-features-to-optimize-devsecops-and-detect-github-actions-misconfigurations)

## 分析

这几天发布的产品揭示了一个清晰的趋势：云原生安全正在经历从"基础设施安全"到"行为安全"的范式转变。Tigera Lynx的发布尤其值得关注。在AI代理越来越自主地执行任务的背景下，传统基于网络边界或容器隔离的安全模型已无法应对AI代理带来的新型风险——凭证窃取、横向移动、非预期的工具调用等。Lynx通过将认证、授权和审计机制嵌入代理调用的每个环节，并利用eBPF在内核层监控行为，建立了一个"不可篡改"的安全审计链。这种设计思路与Dapr 1.18中引入的可验证执行功能如出一辙，表明行业正在形成共识：AI代理的可信执行需要从代码层面获得保证。

Istio的Ambient Multicluster和Gateway API Inference Extension标志着服务网格技术正在向两个方向演进：一是消除sidecar开销以提升大规模部署效率，二是原生支持AI/ML推理工作负载的特殊流量模式。Ambient模式将网络功能从sidecar中解耦到节点级代理，这对于运行AI工作负载的集群尤为重要——GPU资源昂贵且敏感，任何额外的资源开销都会直接影响训练成本和推理延迟。

Nirmata与Broadcom的合作则是企业级Kubernetes治理的重要里程碑。VMware Cloud Foundation在企业市场的渗透率极高，将Kyverno策略引擎直接集成到VKS中，意味着大量传统企业客户可以无缝获得Kubernetes原生策略治理能力，而不需要引入额外的复杂工具链。

## 结论

2026年6月的云原生动态表明，AI代理的安全治理已成为行业最紧迫的课题之一。Tigera Lynx为Kubernetes上的AI代理提供了业界首个统一安全控制平面，Istio的Ambient模式降低了服务网格在大规模AI集群中的部署门槛，Nirmata与Broadcom的合作为企业级Kubernetes治理开辟了新的交付渠道。对于平台工程团队而言，重点关注AI代理的身份管理和行为审计，将是未来6-12个月的核心工作方向。
