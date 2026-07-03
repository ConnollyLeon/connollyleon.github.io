---
layout: post
title: "云原生动态：EKS推出版本回滚，K8s DRA正式GA，Argo CD未修复漏洞警告"
date: 2026-07-03
author: "云原生观察"
source: "https://aws.amazon.com/blogs/containers/announcing-amazon-eks-rollback-for-safe-and-reliable-management-of-cluster-upgrades/"
categories:
  - cloud-native
tags:
  - kubernetes
  - EKS
  - DRA
  - argo-cd
  - kpt
  - CNCF
  - gitops
  - security
  - aws
---

# 云原生动态：EKS推出版本回滚，K8s DRA正式GA，Argo CD未修复漏洞警告

本周云原生领域迎来多项重要更新：AWS推出Amazon EKS版本回滚功能，Kubernetes Dynamic Resource Allocation在v1.35正式GA，Argo CD曝出未修复的repo-server漏洞，以及CNCF新晋沙箱项目kpt获重新介绍。

## 主要新闻

### Amazon EKS推出Kubernetes版本回滚功能

AWS于7月1日宣布Amazon EKS版本回滚功能正式上线。该功能允许集群管理员在升级后7天内将控制平面回滚到上一个已知良好的Kubernetes小版本。对于使用EKS Auto Mode的集群，回滚能力延伸至数据面，实现集群级别的全面保护。回滚过程约需20分钟，集群在回滚期间保持可用。该功能已在所有商业AWS区域提供，无需额外费用。

**Source:** [Announcing Amazon EKS Rollback for Safe and Reliable Management of Cluster Upgrades](https://aws.amazon.com/blogs/containers/announcing-amazon-eks-rollback-for-safe-and-reliable-management-of-cluster-upgrades/)

### Kubernetes Dynamic Resource Allocation正式GA

CNCF官方博客发布教程详解Kubernetes v1.35中Dynamic Resource Allocation（DRA）的GA特性。NVIDIA已将dra-driver-nvidia-gpu移入Kubernetes SIGs，文档正式移除Beta标签。DRA提供了比传统Device Plugin更简洁的设备分配模型，支持GPU Time Slicing、设备健康报告（v1.36+），未来还将支持Cluster Autoscaler按需自动扩缩GPU节点。

**Source:** [Understanding Dynamic Resource Allocation in Kubernetes](https://www.cncf.io/blog/2026/07/01/understanding-dynamic-resource-allocation-in-kubernetes/)

### Argo CD曝未修复repo-server漏洞，可致集群接管

安全公司Synacktiv于7月1日公开披露Argo CD repo-server组件的未修复漏洞。攻击者若能到达repo-server的gRPC端口和Redis数据库端口，可通过未认证的GenerateManifest端点执行任意命令，进而获取Redis密码并操纵缓存部署数据。该漏洞于2025年1月报告至今未修复，Helm Chart部署默认不启用网络策略防护。Argo CD已在v3.2.12、v3.3.10和v3.4.2中修复了相关的Secret数据泄露漏洞（CVE-2026-45737）。

**Source:** [Argo CD flaw shows why GitOps infrastructure should be treated as tier zero](https://www.infoworld.com/article/4192199/argo-cd-flaw-shows-why-gitops-infrastructure-should-be-treated-as-tier-zero-2.html)

### kpt作为CNCF沙箱项目重新亮相

kpt项目在成功加入CNCF沙箱后发布重新介绍，定位为Kubernete资源描述文件的完整生命周期管理工具链。kpt支持从引导新包、通过管道自动化定制、审核验证到最终部署到生产环境的全流程。其核心价值在于"就地"操作范式——直接操作KRM文件以精确描述期望状态，减少副作用和配置漂移。项目计划后续推进v1 API稳定版、多集群支持和Helm集成。

**Source:** [(re)introducing kpt: Your toolchain for infrastructure automation](https://www.cncf.io/blog/2026/07/02/reintroducing-kpt-your-toolchain-for-infrastructure-automation/)

## 分析

本周的新闻集中于四个方向：集群运维安全性提升、资源管理精细化、GitOps安全风险警示和配置管理工具链的演进。EKS版本回滚功能直接回应了Kubernetes升级"不可逆"的长期痛点——升级失败往往意味着集群重建或复杂的故障恢复流程，7天回滚窗口为平台团队提供了实质性的安全网。DRA正式GA则标志着Kubernetes设备管理进入精细化时代，GPU等异构资源的分配从"尽力而为"走向"声明式可控"。

Argo CD漏洞的持续未修复状态值得高度关注。这并非Argo CD第一次暴露内部接口安全问题——从2025年9月的凭证泄露（CVE-2025-55190）到2026年5月的Secret读取（CVE-2026-42880），再到当前的repo-server漏洞，反映出GitOps平台的安全设计面临根本性挑战。将GitOps引擎视为Tier-0基础设施组件、默认启用网络隔离、最小权限原则，应成为所有Argo CD用户的必修课。

kpt加入CNCF沙箱标志着Google系配置管理工具在KRM生态中的回归。在Kustomize和Helm主导的配置管理领域，kpt的"包管理+管道自动化"范式为大规模多集群场景提供了差异化价值，值得平台团队纳入评估范围。

## 结论

集群管理员应立即评估EKS版本回滚功能在生产升级流程中的应用；关注Kubernetes DRA的GA状态，为GPU密集型工作负载规划迁移路径；尽快启用Argo CD的Kubernete网络策略或升级至最新补丁版本。
