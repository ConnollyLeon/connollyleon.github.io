---
layout: post
title: "云原生技术动态：Kubernetes 1.36正式发布与欧洲主权云Kubernetes发布"
date: 2026-04-22
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/04/22/kubernetes-v1-36-release/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cloud-native
  - service-mesh
  - cncf
---

# 云原生技术动态：Kubernetes 1.36正式发布与欧洲主权云Kubernetes发布

本周云原生领域迎来重大更新。Kubernetes 1.36版本（代号"哈鲁"）正式发布，包含70项增强功能，其中18项升级为稳定版本。与此同时，欧洲云服务商Clever Cloud推出自主研发的Kubernetes引擎，标志着云原生基础设施主权化趋势加速。

## 主要新闻 (Main News)

### Kubernetes 1.36正式发布：70项增强功能

Kubernetes v1.36于2026年4月22日正式发布，包含18项稳定功能、25项Beta功能和25项Alpha功能。本次发布特别值得关注的是工作负载感知调度（Workload Aware Scheduling，WAS）功能进入Alpha阶段，允许将相关Pod作为单一逻辑实体进行调度，实现Gang Scheduling能力。此外，动态资源分配（DRA）框架扩展了设备健康状态报告，kubelet API授权也正式GA，提供了细粒度的访问控制。

**Source:** [Kubernetes v1.36: ハル (Haru)](https://kubernetes.io/blog/2026/04/22/kubernetes-v1-36-release/)

### Kubernetes 1.36增强安全与AI支持

Kubernetes 1.36在安全性和AI工作负载支持方面有显著改进。Resource Health Status进入Beta阶段，现在可以报告GPU等硬件的健康状态，帮助管理员快速定位容器崩溃与硬件故障的关联。访问控制方面，Least-privileged access control for the kubelet API现已普遍可用，使集群操作员可以授予监控和可观测性任务所需的最小权限。

**Source:** [Kubernetes v1.36 enhances security and AI support](https://www.techzine.eu/news/infrastructure/140704/kubernetes-v1-36-enhances-security-and-ai-support/)

### Clever Cloud推出欧洲主权Kubernetes引擎

法国云服务商Clever Cloud宣布将于2026年4月27日推出公测版Clever Kubernetes Engine（CKE）。该产品经过两年研发，是完全重新实现的Kubernetes托管版本，设计目标是与Clever Cloud生态系统自然集成，提供与平台其他服务相同的简单性。CKE可在欧洲完全托管的公有云上运行，也可部署在客户的本地基础设施上，为组织提供不依赖美国主要云平台的替代方案，同时不牺牲性能或数据法律控制。

**Source:** [Clever Cloud launches Clever Kubernetes Engine (CKE) in public beta](https://www.clever.cloud/blog/company/2026/04/21/clever-kubernetes-engine-cke-in-public-beta-on-april-27-2026/)

### Traefik Proxy成为Kubernetes网络新标准

随着ingress-nginx于2026年3月24日停用，Traefik Proxy正在成为Kubernetes网络的新标准。IBM Cloud、Nutanix、OVHcloud、SUSE、TIBCO等主流平台供应商已选择Traefik作为战略入口控制器和Gateway API解决方案。这些平台代表数百万个生产环境中的Kubernetes集群，涵盖金融服务、医疗、政府和电信行业。SUSE宣布从RKE2 v1.36开始将Traefik设为默认入口控制器。

**Source:** [Traefik Proxy Emerges as Kubernetes Networking Standard](https://cloudnativenow.com/kubecon-cloudnativecon-europe-2026/traefik-proxy-emerges-as-kubernetes-networking-standard-as-ibm-nutanix-suse-and-ovhcloud-migrate-from-ingress-nginx/)

### Google展示130,000节点Kubernetes集群

Google在KubeCon 2025期间展示了130,000节点的GKE集群，编排约130万个虚拟TPU，AllReduce利用率达到90%。这一规模是此前65,000节点上限的两倍，是截至目前公开披露的最大Kubernetes集群。该演示证明了主流Kubernetes现在可以运行前沿AI训练所需的规模，无需依赖自定义调度器。AWS EKS上限为10,000节点，Azure AKS为5,000节点，Google目前拥有13倍至26倍的领先优势。

**Source:** [Google's 130K-Node K8s: AI Scale Hits Hyperscale](https://algeriatech.news/google-kubernetes-130000-node-cluster-ai-scale-2026/)

## 分析 (Analysis)

Kubernetes 1.36的发布再次证明了云原生生态系统的强大生命力。本次发布的工作负载感知调度功能对于AI和批处理工作负载具有重要意义。传统上，Kubernetes将Pod作为独立单元进行调度，导致分布式工作负载的资源浪费或碎片化。新引入的Workload API和PodGroup API允许将相关Pod视为单一逻辑实体，实现Gang Scheduling，这对于需要协调大量GPU资源的AI训练任务至关重要。

欧洲云服务商推出自主研发的Kubernetes引擎反映了云原生基础设施领域的区域化趋势。在数据主权和监管合规日益重要的背景下，组织越来越关注其基础设施的地理位置和控制权。Clever Cloud的CKE不仅提供托管公有云选项，还支持本地部署，为对数据驻留有严格要求的组织提供了选择。

Traefik作为Kubernetes网络新标准的崛起是本周的另一个重要趋势。ingress-nginx的停用促使整个行业向Gateway API迁移，Traefik凭借其超过90%的注解覆盖率和灵活的迁移路径，成为众多企业的首选。这一转变将推动Kubernetes网络配置的标准化和现代化。

## 结论 (Conclusion)

本周的云原生技术动态表明，Kubernetes正在为AI时代的大规模工作负载做好充分准备。130,000节点集群的演示和Workload感知调度的引入，证明了Kubernetes已经超越了传统的容器编排范畴，成为下一代AI基础设施的核心平台。对于平台工程团队而言，这些发展意味着需要关注Kubernetes的新发布周期，特别是在AI工作负载支持和多集群管理方面的能力提升。同时，随着欧洲云服务商推出主权Kubernetes解决方案，组织在选择云原生基础设施时将拥有更多选择，但也需要仔细评估数据合规性和运营连续性要求。