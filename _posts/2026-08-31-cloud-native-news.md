---
layout: post
title: "云原生技术动态：Kubernetes 1.37 Garhwal发布与容器运行时安全"
date: 2026-08-31
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/08/26/kubernetes-v1-37-release/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - security
  - AI
  - container-runtime
---

# 云原生技术动态：Kubernetes 1.37 Garhwal发布与容器运行时安全

本周云原生领域迎来多项重大进展，Kubernetes v1.37（代号Garhwal）正式发布，标志着容器编排平台在AI工作负载调度、安全身份与网络能力上的新一轮跃进。与此同时，GKE与AKS的容器运行时漏洞集群再次将安全焦点拉回很少有人关注的运行时层，为平台工程团队敲响了警钟。

## 主要新闻

### Kubernetes v1.37 Garhwal正式发布

8月26日，Kubernetes v1.37（代号Garhwal，取自印度北部喜马拉雅地区）正式发布，包含67项增强，其中16项升级至Stable、23项升级至Beta、27项进入Alpha、1项为弃用。Metrics API在历经九年Beta状态后终于晋升GA；HorizontalPodAutoscaler scale-to-zero与gang scheduling（KEP-4671）进入Beta；Dynamic Resource Allocation（DRA）device taints与tolerations达到Stable。发布周期从5月18日持续到8月26日，共有212家公司与1,754名贡献者参与。

**Source:** [Kubernetes v1.37: Garhwal](https://kubernetes.io/blog/2026/08/26/kubernetes-v1-37-release/)

### Kubernetes清理遗留组件：kube-dns、IPVS与cgroup v1退役

同日的分析指出，v1.37在增加新能力的同时大力清理遗留技术。kube-dns逐步退役并移至CoreDNS；kube-proxy的IPVS模式正式进入弃用轨道，计划在v1.40禁用、v1.43移除，转向更高效的nftables；cgroup v1也面临退役。CNCF调查显示约82%的容器用户已在生产环境运行Kubernetes，其中66%的组织使用Kubernetes管理生成式AI推理负载。

**Source:** [Kubernetes cleans house, bins legacy kube-dns, IPVS, and cgroup v1](https://www.theregister.com/devops/2026/08/26/kubernetes-cleans-house-bins-legacy-kube-dns-ipvs-and-cgroup-v1/5292717)

### GKE容器运行时漏洞集群与运行时安全

8月，Google Cloud修复了GKE节点软件中的四类漏洞，其中CVE-2026-53492在CVSS v3.1下高达9.6。Linux内核XFRM ESP-in-TCP路径的"Fragnesia"（CVE-2026-46300）允许容器内攻击者逃逸并取得宿主机root权限，仅影响GKE Standard的Ubuntu节点镜像。与此同时，Microsoft披露了AKS的CVE-2026-50516缺失认证漏洞。安全研究者指出，2026年Kubernetes最大的攻击面已不是控制平面，而是被忽视的运行时层。

**Source:** [GKE Containerd CVEs Hit 9.6 CVSS, Fragnesia Roots Nodes](https://shattered.io/gke-containerd-fragnesia-cve-2026/)

### Pod Certificates与Cluster Trust Bundles晋升GA

Kubernetes v1.37将Pod Certificates与Cluster Trust Bundles带至GA，为工作负载构建X.509证书签发的内建目录。这意味着Pods可以请求短期X.509证书并通过投射卷接收集群级信任锚点，无需cert-manager或SPIFFE/SPIRE等外部工具即可实现mTLS，为Kubernetes首次提供完整的原生工作负载PKI能力。

**Source:** [Kubernetes v1.37: Pod Certificates and Cluster Trust Bundles](https://kubernetes.io/blog/2026/08/28/kubernetes-v1-37-pod-certificates-and-cluster-trust-bundles/)

## 分析

本周新闻最显著的趋势是Kubernetes从"新增功能"转向"生产成熟与清理"。v1.37是一次"硬化与成熟"型发布：Metrics API从beta走到GA结束了九年的beta历史，HPA-to-zero与gang scheduling是最直接有用的成本与AI/ML能力，DRA的stable-set则让异构硬件真正落地。这背后是社区对生产环境的重新定位——CNCF明确指出约82%的用户已在生产使用Kubernetes。

对平台工程师而言，弃用清单比新特性更需优先处理。IPVS、cgroup v1与kube-dns的退役意味着升级前必须完成迁移。与此同时，AI工作负载被刻意嵌入调度层——gang scheduling为分布式训练提供all-or-nothing的pod放置，workload-aware preemption让scheduler按PodGroup而非单个pod抢占，HPA scale-to-zero则针对昂贵的GPU成本优化。这些都在印证Kubernetes正从纯粹的容器编排平台演变为AI/ML工作负载的操作系统层。

但安全阴影同样明显。8月GKE与AKS同时开放严重漏洞，与三月公开的ingress-nginx漏洞（CVE-2026-4342）形成叠加，暴露出"云厂商替你打补丁"这一承诺的脆弱性。Fragnesia这类运行时逃逸漏洞的威胁在于无需凭证或错误配置即可利用，凸显运行时层（containerd、Linux内核）正成为2026年Kubernetes最核心的攻击面。安全团队应将节点池版本审计自动化纳入CI/CD管道，而非依赖季度人工检查。

展望未来，从业者应关注9月23日的v1.37发布网络研讨会、役年内的DRA资源接口标准化，以及KubeCon + CloudNativeCon North America（11月9-12日，盐湖城）上关于运行时安全与AI调度的最新讨论。Kubernetes的成熟既是机会也是责任——功能稳定的同时，安全与合规的底线从未如此重要。

## 结论

Kubernetes v1.37的发布与8月的安全事件共同勾勒出云原生生态的现状：平台能力持续走向生产成熟，同时安全防线必须随运行时层威胁同步升级。对于每个依赖Kubernetes的组织，当前的核心课题已从"如何采用"转变为"如何安全地规模化"——在享受AI调度、原生身份与nftables高效网络带来的红利时，把运行时安全与升级迁移纳入常态化运维，方能将技术优势真正转化为可靠的生产能力。
