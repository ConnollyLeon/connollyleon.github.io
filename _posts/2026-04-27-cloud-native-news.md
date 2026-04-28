---
layout: post
title: "云原生技术动态：Helm 4发布与Kubernetes v1.36新特性"
date: 2026-04-27
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/04/27/kubernetes-v1-36-mutable-pod-resources-for-suspended-jobs/"
categories:
  - cloud-native
tags:
  - kubernetes
  - helm
  - cloud-native
  - containers
---

# 云原生技术动态：Helm 4发布与Kubernetes v1.36新特性

2026年4月27日，云原生领域迎来多项重要更新。Helm 4正式发布，被誉为六年来Kubernetes部署领域最大的变革；同时Kubernetes v1.36将可变更Pod资源功能提升至beta阶段，为批处理工作负载带来更灵活的资源管理能力。此外，欧洲云服务商Clever Cloud也在同日推出其自研的Clever Kubernetes Engine公开测试版，进一步丰富了云原生生态的选择。

## 主要新闻

### Helm 4正式发布：Kubernetes部署架构重大升级

Helm团队于2026年4月27日正式宣布Helm 4发布，这是自2019年Helm 3发布以来最重大的架构更新。新版本采用服务器端应用（Server-Side Apply）机制，改变了多工具协作管理集群资源的方式。与Helm 3相比，Helm 4并不改变核心心智模型，但引入了三项关键策略合并补丁（Three-Way Strategic Merge Patch），解决了长期以来资源更新时的冲突问题。维护者强调此次更新遵循向后兼容原则，现有chart和工作流不会受到影响。SDK层面的改动为后续小版本迭代奠定了基础，特别是在CRD生命周期管理方面。对于运行多集群的企业用户而言，这一变更提供了更清晰的资源状态视图。

**Source:** [Helm 4 Is Here — The Biggest Kubernetes Deployment Shift in 6 Years](https://medium.com/@surbhi19/helm-4-is-here-the-biggest-kubernetes-deployment-shift-in-6-years-afc35124239b)

### Kubernetes v1.36：可变更Pod资源支持挂起作业（Beta）

Kubernetes v1.36于2026年4月27日宣布，将"Mutable Pod Resources for Suspended Jobs"特性提升至beta阶段。该功能最初在v1.35中以alpha形式引入，允许集群管理员在Job挂起状态下修改容器资源请求和限制，包括CPU、内存、GPU及扩展资源。这一特性对于批处理系统、AI训练任务和队列控制器尤为重要——在作业启动或恢复之前即可动态调整资源配置。随着v1.36中`MutablePodResourcesForSuspendedJobs`特性门控默认启用，用户无需额外配置即可使用这一功能。需要注意的是，对于已在运行的Job，必须先等待所有活跃Pod终止后才能修改资源，API服务器会在`status.active`大于零时拒绝资源变更请求，从而避免运行中的Pod与更新后的pod模板之间出现不一致。

**Source:** [Kubernetes v1.36: Mutable Pod Resources for Suspended Jobs (beta)](https://kubernetes.io/blog/2026/04/27/kubernetes-v1-36-mutable-pod-resources-for-suspended-jobs/)

### Clever Cloud推出Clever Kubernetes Engine公开测试版

欧洲云服务提供商Clever Cloud于2026年4月27日下午正式推出Clever Kubernetes Engine（CKE）公开测试版。该产品是Clever Cloud两年研发的结晶，基于完全重新实现的Kubernetes架构，旨在为欧洲市场提供主权可控的容器编排服务。CKE原生集成Clever Cloud生态系统中的各项服务——包括Cellar对象存储（S3兼容）、托管数据库、IAM即服务、网络组等，同时支持通过kubectl、Helm或GitOps等标准行业工具进行访问。与主流美国云平台不同，CKE由Clever Cloud在欧洲本土运营，为组织提供了无需在性能或数据法律控制上妥协的替代方案。该产品已在Devoxx大会上Preview，并已有部分客户通过私人测试使用超过六个月。

**Source:** [Clever Cloud launches Clever Kubernetes Engine (CKE) in public beta on April 27, 2026](https://www.clever.cloud/blog/company/2026/04/21/clever-kubernetes-engine-cke-in-public-beta-on-april-27-2026/)

## 分析

Helm 4的发布标志着Kubernetes包管理工具进入了一个新的成熟阶段。从技术架构来看，服务器端应用的引入不仅仅是实现方式的改变，更反映了云原生生态对多工具协同、GitOps工作流深度集成的需求。在过往实践中，Helm、kubectl、CI/CD工具同时操作同一资源时常常产生冲突，而三路合并策略让Kubernetes能够智能地识别哪些变更来自哪个工具，从而做出正确的合并决策。这对于拥有复杂平台工程栈的企业而言，意味着更少的手动干预和更可预测的部署行为。

Kubernetes v1.36对挂起作业的可变资源支持，则精准地击中了AI/ML工作负载和批处理系统的痛点。在现实场景中，数据科学和机器学习团队往往需要先提交作业，然后根据队列情况或资源可用性动态调整资源配置。以往的做法是删除并重建Job，这不仅浪费时间，还可能导致任务状态丢失。新特性允许在作业挂起状态下灵活调整，体现了Kubernetes对多样化工作负载支持的持续深化。这也与CNCF年度云原生调查的结果相呼应——82%的容器用户已在生产环境运行Kubernetes，而AI工作负载正是推动使用率持续攀升的关键因素之一。

欧洲云服务商Clever Cloud的CKE发布，则从地缘战略角度揭示了云原生市场的新趋势。在全球数据主权呼声日益高涨的背景下，欧洲企业迫切需要的不仅是技术上的Kubernetes发行版，更是能够确保数据不会流出欧盟边界、且受欧盟法律管辖的云基础设施。CKE的两年研发周期和完全重新实现，表明欧洲厂商正在从单纯的"消费者"转向"创造者"，试图在云原生技术栈上建立自主性。这与欧盟委员会近期推出的Cloud Sovereignty Framework（云主权框架）形成呼应——该框架通过SEAL（主权效能保证级别）对云服务商进行分级，而CKE显然瞄准的是SEAL-3及以上级别的市场需求。

展望未来，这三个动态共同指向一个核心趋势：云原生技术正在从"通用基础设施"向"场景化、区域化、合规化"方向演进。Helm 4解决了工程复杂性问题，Kubernetes v1.36增强了对专业工作负载的支持，而CKE则代表了区域云服务商对主权云需求的响应。对于从业者而言，这意味着技术选型和架构设计时需要更全面地考虑合规性、地域性和工作负载特性，而非仅仅关注功能特性本身。

## 结论

2026年4月27日的云原生技术动态展现了生态系统的持续创新与多元化发展。Helm 4的架构升级、Kubernetes v1.36对批处理作业的增强支持，以及欧洲本土Kubernetes发行版的崛起，共同构成了当前云原生领域的关键图景。对于企业和平台工程师而言，这些更新不仅提供了更强大的技术工具，也提示我们在全球化与区域化并存的时代，技术决策需要平衡功能性、合规性和战略自主性。接下来值得关注的是，Helm 4的服务器端应用模式将如何影响现有的GitOps工具链，以及Kubernetes在AI工作负载上的持续优化是否能够满足日益增长的模型训练和推理需求。
