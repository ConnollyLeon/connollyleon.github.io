---
layout: post
title: "军事应用：DoD DevSecOps 与企业级云原生军事系统"
date: 2026-05-05
author: "云原生观察"
source: "https://www.secondfront.com/resources/blog/the-dod-enterprise-devsecops-initiative-dsop-what-you-need-to-know/"
categories:
  - military
tags:
  - military
  - dod
  - kubernetes
  - devsecops
  - cloud-native
---

# 军事应用：DoD DevSecOps 与企业级云原生军事系统

本周军事云原生领域的重要进展包括：美国国防部（DoD）企业 DevSecOps 计划（DSOP）持续推进，要求所有新软件项目采用基于 Kubernetes 的云原生架构和零信任安全模型；Wind River Studio Operator 宣布支持 CJADC2（联合全域指挥控制）作战行动，为战术边缘提供云原生 Kubernetes 基础设施；Ravonics 等国防承包商展示其在 IC 层级（SIPR、JWICS）的云原生平台能力。这些动向表明，云原生技术已成为现代军事系统的核心基础设施。

## 主要新闻

### DoD 企业 DevSecOps 计划（DSOP）：现代国防软件蓝图

美国国防部企业 DevSecOps 计划（DSOP）是国防部对系统性软件交付失败的根本性回应。该计划由国防部首席信息官共同领导，最初由空军首席软件官推动，代表了国防部在构建、保护和部署软件方面的文化、技术和程序性全面改革。

DSOP 的核心要求包括：
1. **云原生基础设施**：强制使用 CNCF 认证的 Kubernetes 进行容器编排和 OCI 兼容容器。这种标准化保证了软件工作负载可以在超大规模商业云（如 AWS GovCloud）、本地 DoD 数据中心或战术边缘平台（如战斗机、海军舰艇和卫星）上无缝运行。
2. **零信任架构**：通过 Sidecar 容器安全栈（SCSS）将零信任原则硬编码到每个集群中，在每个任务应用程序旁边自动注入安全容器，拦截所有网络流量，强制执行 mTLS，并应用严格的访问管理策略。
3. **基础设施即代码（IaC）**：通过自动化管道实现持续集成/持续部署，将传统 18-24 个月的 ATO（操作授权）流程压缩到 90 天以内。

**Source:** [The DoD Enterprise DevSecOps Initiative (DSOP): What You Need to Know](https://www.secondfront.com/resources/blog/the-dod-enterprise-devsecops-initiative-dsop-what-you-need-to-know/)

### Wind River Studio Operator：推进 CJADC2 作战行动

Wind River Studio Operator 为国防部联合全域指挥控制（CJADC2）任务提供支持，旨在通过 AI 在统一网络上实现近乎实时的决策优势，该网络连接所有武装部队的数据库、传感器、武器和作战人员。

Studio Operator 提供分布式、云原生 Kubernetes 基础设施，用于在地理分布式部署中托管战术工作负载，即使在间歇性和连接降级的情况下也能实现集中管理的子云。其核心能力包括：

- **云原生设计**：Studio Cloud Platform 提供软件定义、云原生基础设施，专为高可用性地理分布式操作而强化。对容器和 Kubernetes 的支持是平台的基本要求。
- **小 footprint**：Studio Cloud Platform 可以扩展到小于许多传统平台，适合资源受限的战术环境。
- **可靠性/可用性**：Studio Operator 旨在通过高级故障检测和自动故障解决实现六九（99.9999%）可用性。
- **大规模自动化**：从 0-1 天部署到 2 天运营，所有操作都实现自动化。

**Source:** [Advancing CJADC2 Operations with Wind River Studio Operator](https://www.windriver.com/resource/studio-operator-for-DoD-ABMS-and-JADC2)

### 情报社区层级的 Kubernetes：OpenShift、RKE2 与实际部署

在情报社区（IC）和 DoD 部分运营的机密和特殊访问环境中（SIPR、JWICS、AWS Secret Region、Azure Secret 等），Kubernetes 已成为新服务交付的默认方式，但在约束条件下运行，这些约束显著塑造了架构。

目前，OpenShift 是 IC 企业的标准，RKE2（Rancher Kubernetes Engine 2）在 DoD 边缘和 IC 项目中的存在感日益增长。OpenShift 提供强大的集成（身份验证、注册表、监控、SDN、操作员框架）、STIG 支持、FIPS-140 模式；RKE2 则提供较小的攻击面和默认强化的配置（CIS Kubernetes Benchmark 预设）。

在生产联邦集群中，通常使用批准的 WAF 和到服务网格的 mTLS 来前置入口。网络策略默认为拒绝所有流量，仅允许明确许可的 pod 间通信。

**Source:** [Kubernetes in the IC Tier: OpenShift, RKE2, and What Actually Runs](https://precisionfederal.com/insights/kubernetes-in-the-ic-tier)

## 分析

国防部 DevSecOps 计划（DSOP）的推进标志着军事软件采购和部署模式的根本性转变。从传统的"瀑布式"开发（3-10 年交付周期）转向持续的、自动化的 DevSecOps 管道，这不仅提高了软件交付速度，更重要的是提升了作战系统的适应性和响应能力。在快速变化的威胁环境中，能够以天为单位而非年为单位更新作战软件，是获得决策优势的关键。

Kubernetes 在军事系统中的广泛应用反映了云原生技术的成熟度和可靠性。从 F-16 战斗机到海军舰艇，从战术边缘到机密数据中心，Kubernetes 提供了统一的编排层，使得应用可以在不同安全级别和环境之间无缝迁移。特别是 Wind River Studio Operator 对 CJADC2 的支持，展示了云原生架构如何满足最苛刻的战术需求：在连接断开、资源受限和高可靠性要求的环境中运行。

然而，军事云原生部署也面临着独特的挑战。首先，安全合规要求极高：STIG 强化镜像、FIPS-140 认证、零信任网络策略等都是强制性要求，这大大增加了系统复杂性。其次，在多层级安全环境（IL2 到 IL6+）中运行的集群需要精细的隔离和跨域解决方案。第三，在战术边缘部署的 Kubernetes 集群必须能够在完全断开连接的情况下自主运行数周甚至数月，这对集群的自愈能力和资源管理提出了极高要求。

从战略角度看，云原生技术正在成为军事技术优势的新基石。正如 DoD 的案例研究所示，采用 Kubernetes 和 DevSecOps 后，软件发布时间从 3-8 个月缩短到 1 周，ATO 获取时间从数月缩短到数天。这种敏捷性不仅提高了作战效率，也改变了军事技术创新的经济学：现在可以进行更频繁的实验和迭代，而不必担心漫长的采购周期。

## 结论

本周的军事云原生动态表明，Kubernetes 和 DevSecOps 已成为现代国防系统的标准基础设施。从 DoD 的 DSOP 计划到 Wind River 的 CJADC2 支持，云原生技术正在重塑军事软件的构建、部署和运营模式。对于国防承包商和军事软件开发团队来说，掌握云原生技术不再是可选技能，而是参与未来国防项目的必要条件。随着 2026 年更多军事系统向云原生架构迁移，我们可以期待看到更先进的战术边缘计算、更智能的自主系统和更敏捷的作战软件生态。那些能够快速适应这一转变的组织，将在未来的国防技术竞争中占据领先地位。
