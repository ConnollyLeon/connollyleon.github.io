---
layout: post
title: "云原生技术动态：CNCF Kubernetes AI认证平台翻倍，Trivy供应链攻击警示"
date: 2026-03-24
author: "云原生观察"
source: "https://www.cncf.io/announcements/2026/03/24/cncf-nearly-doubles-certified-kubernetes-ai-platforms/"
categories:
  - cloud-native
tags:
  - kubernetes
  - CNCF
  - AI
  - security
  - container
---

# 云原生技术动态：CNCF Kubernetes AI认证平台翻倍，Trivy供应链攻击警示

本周云原生领域迎来重大进展，CNCF在KubeCon Europe 2026大会上宣布Kubernetes AI合规计划认证平台数量几乎翻倍，同时Docker Hub发生了严重的Trivy镜像供应链安全事件，引发整个行业对容器安全供应链的深度反思。

## 主要新闻 (Main News)

### CNCF Kubernetes AI合规计划认证平台翻倍

CNCF在KubeCon Europe 2026大会上宣布，Kubernetes AI Conformance Program认证平台从去年11月的18个激增至31个，新增包括OVHcloud、SpectroCloud、JD Cloud和中国联通云等主要云服务商。该计划引入了针对Kubernetes v1.35的更严格要求，统称为Kubernetes AI Requirements (KARs)，旨在确保工业级AI部署的一致性。

**Source:** [CNCF Nearly Doubles Certified Kubernetes AI Platforms](https://www.cncf.io/announcements/2026/03/24/cncf-nearly-doubles-certified-kubernetes-ai-platforms/)

### Trivy供应链安全事件

Aqua Security的CI/CD管道于2026年3月19日被攻击者入侵，向Docker Hub上的`aquasec/trivy`镜像注入了恶意代码。受影响版本包括0.69.4、0.69.5、0.69.6和latest标签。Docker Hub用户若在3月19日至23日期间拉取这些镜像，可能已泄露CI/CD密钥、云凭证、SSH密钥和Docker配置。最后已知的干净版本为0.69.3。

**Source:** [Trivy supply chain compromise: What Docker Hub users should know](https://www.docker.com/blog/trivy-supply-chain-compromise-what-docker-hub-users-should-know)

### KubeCon Europe 2026精彩回顾

本届KubeCon Europe 2026大会在阿姆斯特丹举行，汇聚了全球云原生社区的顶尖开发者与厂商。微软发布Azure Kubernetes Service多项更新，包括AI Runway开源项目和Kubernetes 1.36的Workload Aware Scheduling增强；Broadcom展示vSphere Kubernetes Service 3.6并推动Velero进入CNCF Sandbox；AWS宣布$300万云积分支持CNCF 2026年发展。

**Source:** [What's new with Microsoft in open-source and Kubernetes at KubeCon + CloudNativeCon Europe 2026](https://bit.ly/4svmjP2)

### Kubernetes Agent Sandbox项目发布

Kubernetes SIG Apps发布了Agent Sandbox项目，旨在为AI Agent工作负载提供原生支持。该项目引入了Sandbox CRD，为长期运行、有状态的AI Agent提供声明式API，支持gVisor和Kata Containers等安全运行时，以及SandboxWarmPool解决冷启动延迟问题。

**Source:** [Running Agents on Kubernetes with Agent Sandbox](https://kubernetes.io/blog/2026/03/20/running-agents-on-kubernetes-with-agent-sandbox/)

### Ingress2Gateway 1.0正式发布

随着Ingress-NGINX将于2026年3月退休，SIG Network正式发布Ingress2Gateway 1.0，帮助用户从Ingress平滑迁移到Gateway API。新版本支持超过30种Ingress-NGINX注解，提供清晰的迁移路径和替代建议。

**Source:** [Announcing Ingress2Gateway 1.0: Your Path to Gateway API](http://kubernetes.io/blog/2026/03/20/ingress2gateway-1-0-release/)

## 分析 (Analysis)

本周云原生领域呈现两个核心主题：AI与Kubernetes的深度融合，以及供应链安全的严峻挑战。

**KARs规范的深远意义**：CNCF推出的Kubernetes AI Requirements标志着云原生AI基础设施标准化的重要里程碑。KAR-10高性能Pod间通信、KAR-11高级推理入口、KAR-41分离式推理支持等标准，将为工业级AI部署提供统一的技术规范。这不仅有助于消除基础设施碎片化，更为未来主权AI标准的推出奠定基础。

**供应链安全警钟**：Trivy事件再次提醒我们，容器供应链安全仍是行业最大痛点。攻击者仅通过窃取单一推送令牌就成功注入恶意代码，说明可变标签并非安全边界，组织应在生产环境中通过摘要固定镜像。Docker Hardened Images的构建模式——从源码在密封环境中重建——有效防止了此类攻击，这一经验值得整个行业借鉴。

**AI Agent原生支持**：Kubernetes Agent Sandbox项目的发布标志着平台正在为AI时代的关键工作负载做铺垫。随着AI Agent从短期、孤立的任务向长期、自主、多步骤的工作模式演进，传统Kubernetes原语难以完美适配。Sandbox CRD的引入为这类工作负载提供了更优雅的解决方案。

## 结论 (Conclusion)

本周云原生技术生态展现出强劲的演进势头。Kubernetes AI合规认证的快速扩展反映了AI与云原生基础设施融合的不可逆转趋势；Trivy事件则为整个行业敲响供应链安全警钟，推动企业重新审视镜像管理和访问控制策略。展望未来，随着KubeCon Europe 2026上众多创新的展示，我们可以期待看到一个更加标准化、安全且AI友好的云原生生态系统的到来。
