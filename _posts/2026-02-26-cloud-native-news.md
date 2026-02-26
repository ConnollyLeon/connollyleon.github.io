---
layout: post
title: "云原生技术动态：Ingress NGINX即将退役与KubeSlice捐赠CNCF"
date: 2026-02-26
author: "云原生观察"
source: "https://dev.to/vainkop/migrating-off-ingress-nginx-before-the-march-deadline-what-the-guides-dont-tell-you-1a21"
categories:
  - cloud-native
tags:
  - kubernetes
  - ingress-nginx
  - cncf
  - containers
  - networking
---

# 云原生技术动态：Ingress NGINX即将退役与KubeSlice捐赠CNCF

本周云原生领域迎来重要变革，Ingress NGINX即将在2026年3月正式退役，同时Broadcom将KubeSlice项目捐赠给CNCF。这些变化将深刻影响企业的云原生架构选择。

## 主要新闻

### Ingress NGINX将于2026年3月正式退役

Kubernetes项目组近日发布警告，Ingress NGINX将在2026年3月结束维护。这一曾被广泛使用的入口控制器因2025年3月的"IngressNightmare"漏洞（CVE-2025-1974，CVSS 9.8）而备受关注，该漏洞允许未经认证的攻击者远程执行代码并完全控制Kubernetes集群。Kubernetes SIG Network和安全响应委员会建议用户尽快迁移至Gateway API。

**Source:** [Kubernetes project issues warning on Ingress NGINX retirement](https://securitylabs.datadoghq.com/articles/kubernetes-ingress-nginx-retirement-warning/)

### Broadcom将KubeSlice捐赠给CNCF

Broadcom宣布将KubeSlice工具捐赠给云原生计算基金会（CNCF），这一举动被视为Broadcom在开源领域的"加倍下注"。然而，考虑到Broadcom过去对VMware等公司的争议性收购，社区对该项目的长期健康状况保持谨慎态度。专家建议监控项目的提交速度、贡献者多样性和问题处理响应能力。

**Source:** [Broadcom 'Doubles Down' on Open Source, Donates Kubernetes Tool to CNCF](https://dev.to/techresolve/solved-broadcom-doubles-down-on-open-source-donates-kubernetes-tool-to-cncf-3db3)

### Cilium Gateway API成为推荐迁移方案

对于正在寻找Ingress NGINX替代方案的企业，Cilium Gateway API被推荐为最全面的迁移选项，特别是对于运行在AKS、EKS或GKE上的Kubernetes环境。该方案提供了更强的安全性和性能特性。

**Source:** [Migrating Off Ingress-NGINX Before the March Deadline](https://dev.to/vainkop/migrating-off-ingress-nginx-before-the-march-deadline-what-the-guides-dont-tell-you-1a21)

## 分析

Ingress NGINX的退役标志着Kubernetes生态系统向前迈出的重要一步。多年来，该项目一直是入门级用户的首选入口解决方案，但其安全性问题和维护负担使其难以继续作为默认选择。Gateway API的兴起代表了Kubernetes网络领域的范式转变，从基于注解的配置模式转向更加声明式和标准化的方式。

对于企业而言，这次迁移既是挑战也是机遇。组织需要重新评估其入口架构，考虑是否需要更高级的流量管理功能，如加权路由、流量镜像和高级限流。Cilium等基于eBPF的解决方案提供了显著的性能优势，特别是在大规模环境中。

KubeSlice的捐赠则反映了企业级开源项目的复杂性。虽然捐赠本身是积极的信号，但社区对大公司主导的项目仍保持警惕。企业在采用新捐赠的项目时，应建立适当的抽象层，以便在未来需要时能够灵活切换。

## 结论

云原生技术生态系统正在经历重要的转型期。Ingress NGINX的退役将推动更现代化、更安全的入口解决方案的采用。企业应立即评估当前的入口配置，制定迁移计划，并在可能的情况下利用这次机会简化架构。Gateway API的成熟为企业提供了更强大的工具集，但需要投入时间学习新的概念和API。
