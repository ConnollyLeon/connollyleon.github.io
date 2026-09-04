---
layout: post
title: "云原生动态：Kubernetes 1.37毕业性增强集中落地、HPA伸缩至零与etcd RangeStream降内存"
date: 2026-09-04
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/09/02/hpa-scale-to-zero-beta"
categories:
  - cloud-native
tags:
  - kubernetes
  - hpa
  - etcd
  - storage
  - cncf
  - kubecon
  - aws
  - service-mesh
---

# 云原生动态：Kubernetes 1.37毕业性增强集中落地、HPA伸缩至零与etcd RangeStream降内存

Kubernetes v1.37（Garhwal）于8月26日正式发布后，其系列毕业性增强在本周陆续披露细节：HorizontalPodAutoscaler支持将工作负载伸缩至0副本（Beta）、etcd RangeStream大幅削减大规模list操作的内存占用（Beta）、存储版本迁移（Storage Version Migration）实现GA。与此同时，AWS宣布将于9月底停止对App Mesh的支持，标志着服务网格生态的一次重要更替。

## 主要新闻

### Kubernetes v1.37：HPA支持将无状态工作负载伸缩至零副本（Beta）

Kubernetes v1.37新增API支持，允许基于对象指标（object metric）或外部指标（external metric）的HorizontalPodAutoscaler将工作负载伸缩至0个副本。该特性现已进入Beta并默认启用，解决了长期以来"Kubernetes无法优雅地在空闲时将无状态服务收缩到零"的痛点。此前平台团队往往需要依赖KEDA等外部组件或自定义HPA控制器才能实现"应用零闲置"的弹性。该功能默认启用意味着规模化集群运维团队可以考虑逐步弃用第三方零伸缩方案，转而使用内建的HPA，但其前提是工作负载必须使用适合对象/外部指标的控制器，且可容忍冷启动延迟。

**Source:** [Kubernetes v1.37: Scale Workloads to Zero with HorizontalPodAutoscaler](https://kubernetes.io/blog/)

### etcd RangeStream进入Beta：大集合读取内存占用显著下降

Kubernetes v1.37将etcd RangeStream提升至Beta，并配合etcd v3.7使用，可将API Server与etcd在读取大规模集合时的内存占用大幅削减，使峰值使用更可预测。此前，kubelet、List整个命名空间或集群范围的资源时，API server与etcd需要在内存中物化完整响应，集群规模越大内存越容易成为瓶颈。RangeStream通过流式传输大集合响应，显著降低了控制平面的内存峰值。对运行数万节点、海量Pod的集群而言，这一改进直接缓解了大规模list操作导致的OOM风险，是大型集群稳定性的重要增益。

**Source:** [Kubernetes v1.37: etcd RangeStream Cuts Memory Use on Large List Reads](https://kubernetes.io/blog/)

### 存储版本迁移（Storage Version Migration）正式GA

Kubernetes v1.37将StorageVersionMigration API（storagemigration.k8s.io/v1）提升为GA并默认启用。该特性帮助集群在API升级（例如首选存储版本从v1beta1变为v1）后，将既有内建及自定义资源从旧存储版本迁移到新存储版本。此前，当存储版本变化时，管理员可能需要手动修改底层etcd数据才能恢复无法通过Kubernetes API访问的历史资源；SVM的GA将其标准化、自动化。对长期运行、经历多次版本升级的企业集群来说，这消除了一个长期存在的运维隐患。

**Source:** [Kubernetes v1.37: Storage Version Migration Enabled by Default](https://kubernetes.io/blog/)

### AWS宣布将于9月30日停止支持App Mesh，服务网格生态迎来更替

AWS App Mesh官方声明显示，自2026年9月30日起将停止支持，届时用户将无法再访问App Mesh控制台及资源。AWS建议用户迁移至基于Istio的Amazon ECS/ EKS服务网格方案或其他受支持的选项。App Mesh的退场，与Kubernetes社区sidecar容器成为稳定特性、以及Istio/Linkerd迅速采用原生sidecar的新格局相呼应。对仍在使用App Mesh的用户，9月30日是一个硬性期限，需要在迁移窗口内完成网格重建；这也再次印证了服务网格市场正加速向开源、CNCF托管的Istio/Linkerd/Cilium聚拢。

**Source:** [AWS App Mesh End of Support](https://aws.amazon.com/blogs/containers/)

## 分析

Kubernetes v1.37这批毕业性增强，共同指向一个清晰的信号：平台正从"功能齐全"走向"规模化可用"。HPA伸缩至零的目标是帮助大规模部署显著节省资源成本，把"空闲即缩容"变成内建能力；etcd RangeStream的目标是控制平面在万节点规模下的内存可预测性；SVM的GA则是在多年升级之后的一次"债务清理"。三项叠加，说明Kubernetes的核心治理重心，正从"能做更多事"转向"在更大的规模上做同样的事而更稳、更省"。

对平台工程团队而言，v1.37引入的变化需要尽快纳入升级评估。首要工作是核查是否依赖第三方零伸缩方案（如KEDA），并权衡是否回转至HPA内建能力——但需注意冷启动与平滑缩放的取舍。其次是评估etcd RangeStream对自身大规模list工作负载的收益，前提是同步升级etcd至v3.7。而SVM的默认启用则要求在升级前确认集群的存储版本迁移路径，避免大规模历史资源在版本切换时出现不可访问。

### 服务网格的更替：从专有到开源原生

App Mesh的退场与sidecar容器稳定的进程几乎同步。AWS最初以托管服务网格差异化，但Kubernetes生态最终选择了开源的Istio、Linkerd与eBPF驱动的Cilium作为事实标准。这提醒从业者：在云原生基础设施层，专有绑定性的托管组件正面临来自CNCF开源项目的系统性替代。对规划架构的团队，服务网格选型应优先考虑可移植性与社区治理，而非单一云厂商的托管绑定，以规避App Mesh式的"硬迁移"风险。

展望未来，值得关注的是即将于9月7–9日在上海举行的KubeCon + CloudNativeCon China，以及11月盐湖城的北美KubeCon。这两场大会将展示v1.37毕业特性在真实生产环境中的落地案例，也是观察DRA（动态资源分配）、Gateway API等AI与网络特性走向成熟的关键窗口。

## 结论

Kubernetes v1.37的HPA伸缩至零、etcd RangeStream与SVM GA，是云原生平台走向规模化、工程化、少运维的关键里程碑；而App Mesh的退役则标志着服务网格进入开源原生主导的新阶段。对运维与平台团队，建议将v1.37升级、etcd v3.7适配、以及服务网格去绑定化列为未来一到两个季度的最高优先级任务，并借助KubeCon China等窗口验证新特性在生产中的表现。
