---
layout: post
title: "云原生动态：CloudNativePG 1.30发布，EKS回滚功能上线，Red Hat推出数字主权评估工具"
date: 2026-07-07
author: "云原生观察"
source: "https://devops-daily.com/news/2026-week-28"
categories:
  - cloud-native
tags:
  - cloudnativepg
  - postgresql
  - AWS
  - EKS
  - Red-Hat
  - openshift
  - gateway-api
  - kpt
  - kubernetes
  - cncf
  - eks-rollback
  - digital-sovereignty
  - backendtlspolicy
  - dynamic-resource-allocation
  - devops-agent
---

# 云原生动态：CloudNativePG 1.30发布，EKS回滚功能上线，Red Hat推出数字主权评估工具

过去一周云原生生态迎来多项重要更新：CloudNativePG 1.30.0发布，新增DatabaseRole CRD实现声明式PostgreSQL管理；AWS推出Amazon EKS Rollback功能用于安全回滚集群升级；Red Hat发布数字主权就绪评估工具，已有超过1500家组织使用。

## 主要新闻

### CloudNativePG 1.30.0正式发布

CloudNativePG社区宣布1.30.0版本正式可用。此版本引入了全新的DatabaseRole CRD（自定义资源定义），使用户能够以声明式、GitOps友好的方式管理PostgreSQL数据库角色。这一改进让PostgreSQL的角色权限管理可以直接嵌入Kubernetes原生的声明式工作流，显著简化了数据库运维的复杂度。CloudNativePG是Kubernetes上运行PostgreSQL的领先Operator，此次更新进一步强化了其在生产环境中的管理能力。

**Source:** [CloudNativePG 1.30.0 Released](https://www.postgresql.org/about/news/cloudnativepg-1300-released-3337/)

### Amazon EKS推出集群升级回滚功能

AWS宣布推出Amazon EKS Rollback功能，允许用户在集群升级出现问题时安全可靠地回滚到之前的Kubernetes版本。该功能解决了Kubernetes集群升级中"升级失败难以回退"的核心痛点，支持自动化回滚流程，最大限度地减少升级对生产工作负载的影响。EKS Rollback是AWS在提升托管Kubernetes服务运维体验方面的关键改进。

**Source:** [Announcing Amazon EKS Rollback for safe and reliable management of cluster upgrades](https://aws.amazon.com/blogs/containers/)

### Red Hat推出数字主权就绪评估工具

Red Hat宣布推出Digital Sovereignty Readiness Appraisal（数字主权就绪评估工具），自2月上线以来已有超过1500家组织使用。该工具可在15分钟内帮助组织建立数字主权基线，识别在数据驻留、访问控制和合规性方面的差距。Red Hat还推出了Beyond the Baseline版本，为需要深度评估的客户提供更详细的建议和报告，涵盖OpenShift平台上的数据治理和主权合规策略。

**Source:** [Beyond the baseline: Introducing the Digital Sovereignty Readiness Appraisal](https://www.redhat.com/en/blog/beyond-baseline-introducing-digital-sovereignty-readiness-appraisal)

### BackendTLSPolicy扩展Gateway API传输安全

Red Hat OpenShift宣布BackendTLSPolicy正式可用，这是Gateway API中允许指定额外TLS加密的Kubernetes资源。BackendTLSPolicy使Gateway API用户能够在Red Hat OpenShift上实现端到端的传输层安全加密，支持从网关到后端服务之间的独立TLS配置。这一功能填补了Gateway API在传输安全性方面的重要空白，为多集群和多服务架构提供了更细粒度的安全控制。

**Source:** [BackendTLSPolicy expands Gateway API transport security](https://www.redhat.com/en/blog/backendtlspolicy-expands-gateway-api-transport-security)

### CNCF重新引入kpt：基础设施自动化工具链

CNCF博客宣布重新引入kpt——一个以包为中心的工具链，支持所见即所得的配置创作、自动化和交付体验。kpt最初由Google开源，现由CNCF社区维护。此版本专注于简化Kubernetes配置管理，支持GitOps工作流中配置包的版本控制、差异比较和自动化应用。kpt的重新推出标志着CNCF在基础设施即代码领域的重要布局。

**Source:** [(re)introducing kpt: Your toolchain for infrastructure automation](https://www.cncf.io/blog/2026/07/02/reintroducing-kpt-your-toolchain-for-infrastructure-automation/)

### CNCF发布动态资源分配深度解析

CNCF博客发布技术文章，深入解析Kubernetes中的动态资源分配（Dynamic Resource Allocation, DRA）机制。DRA是Kubernetes v1.26引入的功能，随后在v1.36中进一步成熟。文章详细介绍了DRA如何让工作负载在运行时动态请求和释放GPU、FPGA等特殊硬件资源，以及如何通过ResourceClass和ResourceClaim API实现细粒度的资源管理。这对AI/ML工作负载在Kubernetes上的调度和资源利用至关重要。

**Source:** [Understanding dynamic resource allocation in Kubernetes](https://www.cncf.io/blog/2026/07/01/understanding-dynamic-resource-allocation-in-kubernetes/)

## 分析

本周云原生新闻呈现出"生产化"和"安全合规"两大主题。CloudNativePG 1.30.0对DatabaseRole CRD的支持，将数据库角色管理纳入了Kubernetes声明式体系，这是PostgreSQL Operator从"基础设施管理"向"应用层管理"演进的关键一步。GitOps友好化的设计意味着数据库角色变更可以被纳入CI/CD流水线，实现真正端到端的数据库运维自动化。

Amazon EKS Rollback功能的推出回应了Kubernetes社区长期以来的核心痛点。集群升级一直被视为"高危操作"，一旦控制平面升级失败或API版本不兼容，回退流程往往需要数小时的人工干预。EKS Rollback将这一流程自动化，实质是AWS在"零宕机升级"方向上的重要投入。这一功能将直接影响企业在生产环境中的升级策略——升级频率可能从"季度一次"提升到"月度一次"甚至更高。

Red Hat的数字主权评估工具反映了地缘政治对云原生技术栈的深刻影响。随着欧盟数据法案、美国CLARITY Act等立法推进，数字主权不再是合规部门的孤立议题，而是直接影响平台架构设计的核心约束。超过1500家组织在不到半年内使用该工具，说明企业对数据驻留和主权合规的需求已经从"关注"转变为"行动"。

kpt的CNCF重新引入则展示了CNCF在配置管理领域持续投入的决心。在Helm、Kustomize等工具主导市场多年的背景下，kpt以包管理为核心的不同哲学能否获得社区认可值得关注。其"所见即所得"的配置创作体验在复杂多集群场景下可能有独特优势。

## 结论

2026年7月第一周的云原生新闻标志着技术栈正在从"功能完善"走向"运维体验优化"。CloudNativePG的声明式角色管理、EKS的回滚能力、Red Hat的数字主权工具、Gateway API的传输安全扩展，都指向同一个方向：云原生平台正在将更多传统运维痛点转化为声明式、自动化的平台能力。建议平台团队评估EKS Rollback对升级策略的影响，将数字主权评估纳入架构规划，并关注CloudNativePG 1.30.0在数据库管理自动化方面的潜力。
