---
layout: post
title: "云原生动态：SPO v1.0稳定版发布，Kubernetes原地Pod重启Beta，Docker加固供应链安全"
date: 2026-06-29
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/06/26/security-profiles-operator-v1-stable-apis-security-hardened-and-shaping-upstream-kubernetes/"
categories:
  - cloud-native
tags:
  - kubernetes
  - security-profiles-operator
  - cncf
  - docker
  - supply-chain
  - sbom
  - eu-cra
  - pod-restart
  - kubelet
  - automation
  - ai-inference
  - gpu
---

# 云原生动态：SPO v1.0稳定版发布，Kubernetes原地Pod重启Beta，Docker加固供应链安全

本周云原生生态迎来多项关键更新：安全配置文件的声明式管理迈入生产就绪阶段，Kubernetes容器重启机制取得重大进展，以及容器供应链安全法规合规进入倒计时。

## 主要新闻

### Security Profiles Operator v1.0.0 稳定版发布

CNCF项目Security Profiles Operator (SPO) 正式发布v1.0.0，所有八个CRD API毕业至v1稳定版。这是项目的首个稳定版本，经过第三方安全审计、完整的加固周期以及从所有先前API版本的零停机迁移路径。SPO支持以Kubernetes自定义资源方式管理seccomp、SELinux和AppArmor配置文件，并可从实时工作负载记录配置文件。KEP 6061（基于OCI制品的安全配置文件分发）提案将SPO率先实现的OCI分发能力引入kubelet原生支持。

**Source:** [Security Profiles Operator v1: Stable APIs, Security Hardened, and Shaping Upstream Kubernetes](https://www.cncf.io/blog/2026/06/26/security-profiles-operator-v1-stable-apis-security-hardened-and-shaping-upstream-kubernetes/)

### Kubernetes v1.36 原地Pod容器重启进入Beta

Google开源博客宣布，Kubernetes v1.35引入的`RestartAllContainers`操作在v1.36中毕业至Beta并默认启用。该功能允许容器退出时触发整个Pod的快速原地重启，无需重建Pod对象，保留了Pod沙箱、网络标识和存储挂载。引入的`AllContainersRestarting` Pod条件可帮助SRE和自动缩放器准确监控重启事件，防止误报。

**Source:** [In-place pod restarts: Boosting efficiency and workload reliability in Kubernetes v1.35](https://opensource.googleblog.com/2026/06/in-place-pod-restarts-boosting-efficiency-and-workload-reliability-in-kubernetes-v135.html)

### Docker发布SBOM生成指南和EU CRA合规解读

Docker官方博客连续发布两篇重要技术指南：SBOM（软件物料清单）生成最佳实践覆盖构建时与构建后方法、质量标准和CI/CD集成方案；以及EU Cyber Resilience Act（CRA）合规解读——该法规要求2026年9月11日起强制实施漏洞报告义务。Docker Hardened Images现已内置完整SBOM、SLSA可验证证明和OpenVEX数据。此前Docker还宣布加入Athena联盟，这是一项针对AI加速漏洞发现时代的开源软件协同防御跨行业计划。

**Source:** [SBOM Generation for Container Workflows](https://www.docker.com/blog/sbom-generation-for-container-workflows/)

**Source:** [EU Cyber Resilience Act Overview](https://www.docker.com/blog/eu-cyber-resilience-act-overview/)

### Kubernetes团队信任自动化部署但不敢让AI触碰CPU

The New Stack报道的调查显示，82%的Kubernetes从业者高度信任自动化交付，但71%仍要求人工审核资源优化建议，仅27%允许自动应用CPU和内存变更。随着AI推理工作负载大规模登陆Kubernetes，这种谨慎态度正变得更加昂贵。

**Source:** [Kubernetes teams trust automation to ship code but not to touch CPU](https://thenewstack.io/kubernetes-teams-trust-automation/)

## 分析

本周的更新揭示了云原生生态系统的三个核心趋势。首先，安全正在从附加组件变成基础设施的内置属性。SPO v1.0的稳定发布和KEP 6061的推进表明，Kubernetes社区正将安全配置文件管理从手动运维转变为声明式的、可审计的自动化流程。这直接响应了EU CRA等法规对软件供应链透明度的要求。

其次，Kubernetes的工作负载管理正在变得更加精细和智能化。原地Pod重启功能的Beta毕业看似是个小改进，但它解决了实际生产中的痛点——有状态工作负载的快速恢复。结合The New Stack的调查数据，社区对自动化资源管理的信任度仍然较低，这说明Kubernetes的自治能力还有很长的路要走。

最后，容器供应链安全已从最佳实践变为法律义务。Docker的SBOM指南和EU CRA解读标志着行业正在为2026年9月的合规截止日期做准备。AI加速漏洞发现带来的新威胁（如Athena联盟所应对的）表明，供应链安全需要跨组织协同防御。

对于从业者而言，建议立即开始审查SBOM生成流程，评估SPO等安全工具的就绪程度，并规划原地Pod重启功能的采用路径。

## 结论

云原生安全正经历从"可有可无"到"生产必需品"再到"法规强制要求"的三级跳。SPO v1.0、原地Pod重启Beta和EU CRA合规指南共同勾勒出Kubernetes生态成熟化的清晰路线图。随着9月EU CRA强制期限的临近，每个面向欧洲市场的容器化产品团队都应将其视为最高优先级事项。
