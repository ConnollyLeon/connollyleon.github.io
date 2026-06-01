---
layout: post
title: "云原生技术动态：Kubernetes 1.36深化安全与AI调度、Ingress-NGINX退役危机与OCI VolumeSource GA"
date: 2026-06-01
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/04/22/kubernetes-v1-36-release/"
categories:
  - cloud-native
tags:
  - kubernetes
  - k8s-1.36
  - ingress-nginx
  - was
  - dra
  - user-namespaces
  - psi
  - cloud-native
---

# 云原生技术动态：Kubernetes 1.36深化安全与AI调度、Ingress-NGINX退役危机与OCI VolumeSource GA

本周云原生领域迎来Kubernetes 1.36 "Haru"（春/晴天）发布后的持续影响期——70项增强特性中18项晋升Stable、25项进入Beta、25项进入Alpha。同时Ingress-NGINX因停止安全补丁引发行业连锁反应，OCI VolumeSource晋升Stable为ML模型部署带来新范式。

## 主要新闻

### Kubernetes 1.36深度解读：Workload Aware Scheduling与DRA重塑AI基础设施

Kubernetes 1.36 Release Lead Ryota Sawada在TFiR访谈中详细介绍了该版本的核心创新。Workload Aware Scheduling (WAS)引入了Workload和PodGroup两个新API，将Pod组视为单一调度单元实现原子调度，彻底解决分布式AI训练中部分调度导致的资源浪费问题。DRA（动态资源分配）管理GPU和外设资源的能力与PodGroup API深度集成，使得GPU资源与计算任务可通过原生Kubernetes原语统一管理。此外，细粒度Kubelet API授权晋升GA，运维人员可精确限制可观测性组件仅读取健康检查端点，消除安全风险。

**Source:** [Kubernetes 1.36 GPU Scheduling, Kubelet Security Explained - TFiR](https://tfir.io/kubernetes-1-36-gpu-scheduling-dra-kubelet-security/)

### Ingress-NGINX停止维护：业界面临紧急路由迁移

Ingress-NGINX控制器于2026年3月24日起停止接收安全补丁，影响约半数Kubernetes集群的路由基础设施。新CVE将不再修复，仓库转为只读模式。行业面临三个选择：自行fork维护（不推荐）、迁移至Gateway API（推荐长期方案）、切换至活跃维护的Ingress控制器（如kgateway、NGINX Gateway Fabric、Envoy Gateway或Traefik v3）。K8s 1.36同时移除了IPVS kube-proxy模式（已在1.35标记弃用），建议迁移至NFTables或eBPF（通过Cilium/Calico）。

**Source:** [Kubernetes 1.36 "Haru": Ingress-NGINX Is Gone — Act Now - byteiota](https://byteiota.com/kubernetes-136-haru-ingress-nginx-migration/)

### Kubernetes 1.36 PSI Metrics晋升GA与OCI VolumeSource Stable

PSI（Pressure Stall Information）指标在1.36中晋升GA，使运维人员可直接通过Prometheus兼容端点监控节点CPU、内存和I/O压力。经Google Cloud大规模测试验证，开启PSI的额外开销控制在0.1核或节点总容量的2.5%以内，适合生产环境。同时OCI VolumeSource晋升Stable，允许将ML模型权重等OCI制品直接挂载为Pod卷，无需自定义init容器。

**Source:** [Kubernetes v1.36: PSI Metrics for Kubernetes Graduates to GA - Kubernetes Blog](https://kubernetes.io/blog/2026/05/12/kubernetes-v1-36-psi-metrics-ga/)

### Oracle OKE正式支持Kubernetes 1.36

Oracle Cloud Infrastructure Kubernetes Engine（OKE）宣布支持Kubernetes v1.36，客户可立即通过OCI Console、CLI、API、SDK和Terraform创建新集群或升级现有集群。OKE用户将获得User Namespaces GA、Mutating Admission Policies GA、DRA增强等关键安全与AI工作负载支持能力。

**Source:** [Kubernetes v1.36 is now available on OKE - Oracle Blog](https://blogs.oracle.com/cloud-infrastructure/kubernetes-v1-36-is-now-available-on-oke)

## 分析

Kubernetes 1.36是一个"巩固型"版本，其核心主题围绕三条主线：安全基建、AI硬件调度和运维可观测性。User Namespaces历经4年从KEP-127走到GA，是Kubernetes历史上最有意义的容器逃逸防护增强之一——设置`hostUsers: false`即可将容器内的root映射为宿主机的非特权用户。配合GA的细粒度Kubelet授权和Mutating Admission Policies，K8s安全体系在1.36中完成了从"够用"到"可信"的跃迁。

Ingress-NGINX的退役是2026年云原生领域最重要的基础设施事件。作为部署最广泛的Ingress控制器，其维护停止的影响将在未来数月逐步显现。SIG Network推动的Gateway API正从实验走向主流——它在角色分离（基础设施提供商→Cluster Operator→应用团队）、流量拆分、header匹配等方面优于Ingress规范。对于仍在运行Ingress-NGINX的团队，Q2是迁移的关键窗口期。

WAS和DRA的组合标志着Kubernetes从通用容器编排平台向AI基础设施核心层的战略转型。PodGroup的原子调度语义、DRA与GPU资源的原生管理、ResourceClaim与PodGroup的集成——这些能力使Kubernetes在运行大规模分布式AI训练工作负载时具备了与专用调度器竞争的能力。

## 结论

Kubernetes 1.36开启了云原生平台的新篇章：安全层面，User Namespaces GA和细粒度授权让多租户生产集群更可信；AI基础设施层面，WAS和DRA为GPU密集型工作负载提供了原生调度能力；生态层面，Ingress-NGINX的退役加速了Gateway API的全面采用。云原生从业者应立即盘点Ingress-NGINX使用情况、规划迁移路径，并开始评估User Namespaces和DRA为新工作负载带来的价值。
