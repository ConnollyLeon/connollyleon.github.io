---
layout: post
title: "云原生技术动态：Kubernetes 1.36发布与130K节点集群突破"
date: 2026-04-26
author: "云原生观察"
source: https://dev.to/selmaguedidi/kubernetes-v136-haru-overview-4g1l
categories:
  - cloud-native
tags:
  - kubernetes
  - containers
  - cloud-native
  - orchestration
---

# 云原生技术动态：Kubernetes 1.36发布与130K节点集群突破

本周云原生领域迎来多项重要里程碑。Kubernetes 1.36版本的发布标志着容器编排平台的又一次重大进步，同时Google公布的130K节点K8s集群更是刷新了大规模容器编排的记录。这些发展对云原生生态系统的未来具有深远意义。

## 主要新闻

### Kubernetes 1.36正式发布

Kubernetes 1.36版本于2026年4月22日正式发布，带来了71项改进。该版本引入了多项重要安全特性，包括User Namespaces、细粒度kubelet API授权和Mutating Admission Policies，这些功能已升级为稳定版本并可用于生产环境。三项安全功能的同时稳定标志着Kubernetes在容器隔离和权限管理方面取得重大突破。用户命名空间允许在容器级别实施更细粒度的隔离，而细粒度kubelet API授权则使集群运营商能够对特定端点授予特定访问权限。

**Source:** [Kubernetes v1.36 "Haru" overview](https://dev.to/selmaguedidi/kubernetes-v136-haru-overview-4g1l)

### Google运行130,000节点Kubernetes集群

Google宣布成功运行130,000节点的GKE集群，编排超过130万个虚拟TPU，AllReduce利用率达到90%。这一规模是此前65,000节点记录的两倍，标志着主流Kubernetes已能够胜任大规模AI训练工作负载。Google通过使用Spanner支持的etcd替代方案、分片强一致性Watch缓存以及Kueue和JobSet实现的作业级调度实现了这一突破。此举显示出Kubernetes在AI基础设施领域的巨大潜力。

**Source:** [Google's 130K-Node K8s: AI Scale Hits Hyperscale](https://algeriatech.news/google-kubernetes-130000-node-cluster-ai-scale-2026/)

### Traefik Proxy成为Kubernetes网络新标准

IBM Cloud、Nutanix、OVHcloud、SUSE和TIBCO等平台供应商已选择Traefik Proxy作为其战略入口控制器和Gateway API解决方案，这是在ingress NGINX退役后的重大转变。这些平台代表了数百万个生产环境中的Kubernetes集群。Traefik Proxy提供了超过90%的注解覆盖率，使组织能够使用熟悉的Ingress资源进行迁移，然后按自己的节奏采用Gateway API。

**Source:** [Traefik Proxy Emerges as Kubernetes Networking Standard](https://cloudnativenow.com/kubecon-cloudnativecon-europe-2026/traefik-proxy-emerges-as-kubernetes-networking-standard-as-ibm-nutanix-suse-and-ovhcloud-migrate-from-ingress-nginx/)

### Clever Cloud推出Kubernetes Engine

欧洲云服务商Clever Cloud宣布推出Clever Kubernetes Engine (CKE)，这是一款完全重新实现的托管Kubernetes服务。CKE经过两年研发，旨在提供欧洲主权的Kubernetes替代方案，可部署在客户自己的本地基础设施上。公开测试版将于2026年4月27日发布。

**Source:** [Clever Cloud launches Clever Kubernetes Engine](https://www.clever.cloud/blog/company/2026/04/21/clever-kubernetes-engine-cke-in-public-beta-on-april-27-2026/)

## 分析

本周的云原生发展反映出几个关键趋势。首先，Kubernetes正在从通用容器编排平台向AI工作负载专用基础设施演进。Google的130K节点集群和Kueue、JobSet的作业级调度功能表明，Kubernetes正在成为AI训练的标准平台。其次，安全已成为核心关注点，1.36版本中三项安全功能同时升级为稳定版本反映了整个生态系统对安全性的重视。第三，ingress NGINX的退役推动了Traefik Proxy的采用，这代表了向更��代化网络解决方案的转变。最后，欧洲云服务商正在构建主权Kubernetes替代方案，反映了数据本地化趋势的加剧。

对于从业者而言，这些发展意味着需要重新评估其基础设施战略。托管Kubernetes服务的能力持续提升，但对于有 sovereignty需求的组织，自托管或使用欧洲提供商可能成为必要选择。AI工作负载的兴起要求团队熟悉Kueue和JobSet等作业调度工具。

## 结论

Kubernetes 1.36的发布和130K节点集群的成功运行标志着云原生技术进入新阶段。AI工作负载正在成为Kubernetes的主要驱动力，而安全性和主权性需求的提升则推动着生态系统向更成熟的方向发展。从业者应密切关注这些趋势，并准备好在必要时调整其 Kubernetes 部署策略。