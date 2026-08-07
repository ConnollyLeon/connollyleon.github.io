---
layout: post
title: "云原生动态：Kubernetes v1.37进入RC与文档冻结、Cluster API v1.14 RC发布与HashiCorp Vault KMS公测"
date: 2026-08-07
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/07/31/kubernetes-v1-37-sneak-peek/"
categories:
  - cloud-native
tags:
  - kubernetes
  - v1-37
  - kube-proxy
  - ipvs
  - containerd
  - cluster-api
  - hashicorp
  - vault
  - kms
  - encryption-at-rest
---

# 云原生动态：Kubernetes v1.37进入RC与文档冻结、Cluster API v1.14 RC发布与HashiCorp Vault KMS公测

Kubernetes生态系统进入v1.37发布冲刺期。v1.37.0-rc.0于8月5日发布、文档正式冻结，正式版预定8月26日落地，同时多项蓄积已久的弃用（kube-proxy ipvs模式、containerd 1.x支持、cgroup v1）进入强制执行倒计时；Cluster API发布v1.14.0-rc.1，控制面故障恢复能力显著增强；HashiCorp推出Vault Kubernetes KMS公测，将Kubernetes静态加密的密钥外置至Vault Enterprise统一管理。

## 主要新闻

### Kubernetes v1.37进入RC阶段：文档冻结、containerd 2.0与cgroup v2成为硬性要求

Kubernetes v1.37发布流程于本周进入关键节点：v1.37.0-rc.0于8月5日（第12周）正式发布，文档冻结于8月5日至6日执行，正式版定于8月26日发布。根据7月31日发布的v1.37 Sneak Peek，本版本是一轮"维护检查点"，多项长期预告的清理工作将被强制执行。运行时层面，v1.37移除对containerd 1.x的支持与旧版CRI v1alpha2 API，节点必须运行containerd 2.0或更高版本，否则kubelet无法与运行时正常协商；cgroup v1节点将在`failCgroupV1`默认开启（自v1.35起为true）的情况下拒绝启动kubelet，cgroup v2事实上成为强制前提，高级特性（In-Place Pod Resizing、Tiered Memory Protection）也依赖v2。网络层面，kube-proxy的ipvs模式启动为期三个版本的弃用时钟（KEP-5495）：v1.37启动时记录弃用警告，v1.40默认禁用（仅可经feature gate开启），v1.43预期移除。静态Pod自v1.37起无法再通过`configMapRef`/`secretRef`解析ConfigMap与Secret（`PreventStaticPodAPIReferences` feature gate随之移除）。`kubectl run`的`--filename/-f`标志被移除。新能力方面，DRA（Dynamic Resource Allocation）的Device Taints and Tolerations经`resource.k8s.io/v1` API晋级GA，为失效加速器提供一等公民的"隔离"手段；etcd v3.7.0的RangeStream特性通过`EtcdRangeStream` feature gate向v1.37开放，大型list操作改为分块流式返回以降低etcd CPU；无root kubelet（以userns运行节点组件）晋级Beta，被视作本版本最大的爆炸半径缩减项。

**Source:** [Kubernetes v1.37 Sneak Peek](https://kubernetes.io/blog/2026/07/31/kubernetes-v1-37-sneak-peek/)
**Source:** [Kubernetes v1.37 Release Information](https://www.kubernetes.dev/resources/release/)

### Cluster API v1.14.0-rc.1发布：控制面故障恢复能力显著增强

Cluster API发布v1.14.0-rc.1候选版本。本版本累计合并258个新提交，包含4项破坏性变更、28项新特性与28项缺陷修复，并升级至Go 1.26。发布说明中最值得关注的是控制面（KCP）稳健性的系统性增强：KCP改进etcd主节点（leadership）的前向切换逻辑，使系统在控制面机器删除过程中更好地处理部分故障；允许KCP在链式升级的中间步骤对不健康机器进行修复；在机器被修复后KCP可清理未启动的etcd成员；同时引入缺失InfraTemplates的容错与过期控制器（stale controller）缓解机制。可扩展性方面，ClusterCache客户端新增缓存调优选项以降低内存占用，并实现managedFields驻留（interning）以减少API服务器负担。Kubernetes版本支持范围为管理集群v1.33至v1.36、工作负载集群v1.31至v1.36，且版本校验改为强制严格语义化版本（semver）兼容。此外新增实验性`clusterctl convert`命令，并开始针对Kubernetes v1.37开展端到端测试。

**Source:** [kubernetes-sigs/cluster-api v1.14.0-rc.1](https://newreleases.io/project/github/kubernetes-sigs/cluster-api/release/v1.14.0-rc.1)

### HashiCorp发布Vault Kubernetes KMS公测：Kubernetes静态加密密钥外置管理

HashiCorp于8月3日发布Vault Kubernetes密钥管理（Vault Kubernetes Key Management）公测版，允许Kubernetes集群将Vault Enterprise作为KMS Provider用于静态数据加密。其核心是KMS v2兼容插件`vault-kube-kms`：kube-apiserver将信封加密（envelope encryption）卸载至Vault，Kubernetes仍生成并高速使用数据加密密钥（DEK）加密写入etcd的敏感资源（保障API服务器吞吐），而DEK的种子由保存在Vault transit引擎中的密钥加密密钥（KEK）保护——没有可达且正确配置的Vault，etcd中的数据无法解密。这一职责分离对受监管团队尤为实用：Kubernetes负责高频加解密，Vault统一管理密钥生命周期、轮换、策略执行与审计。部署无需修改应用代码，HashiCorp将OpenShift、多云生产集群、要求职责分离的受监管环境与零信任项目列为主要场景，并把密钥管理定性为越来越大的"机器身份"问题——应用、容器、CI/CD流水线与AI Agent都需要在无人干预下持续访问敏感资源。评估者需注意约束：该功能仅限Vault Enterprise，且要求修改Kubernetes的`EncryptionConfig`与`kube-apiserver`清单，多数全托管控制面无法使用；Vault可用性也直接位于集群数据解密路径之上。

**Source:** [HashiCorp Ships Public Beta of Vault Kubernetes Key Management](https://www.infoq.com/news/2026/08/vault-kubernetes-key-management/)

## 分析

本周云原生动态的核心词是"清理与加固"——Kubernetes生态正在完成自身技术债的最后偿还，同时把安全边界向基础设施深处推进。

Kubernetes v1.37是一场教科书式的"维护检查点"发布。ipvs模式的三个版本弃用时钟（v1.37警告→v1.40默认关闭→v1.43移除）、containerd 2.0的硬性要求与cgroup v1的默认拒绝启动，共同说明平台层已进入"主动负债清理"阶段：社区不再无限期为旧机制保留兼容路径，而是设定明确的日落时间表。对平台团队而言，v1.37升级的技术门槛清晰且可提前审计——grep节点引导脚本中的kubelet标志、检查`mode: ipvs`的kube-proxy配置、确认每个节点`stat -fc %T /sys/fs/cgroup/`返回cgroup2fs、并将containerd滚动至2.0。这些检查本身并不复杂，真正的风险在于"没有把升级日变成事故日"的系统化准备。与此同时，DRA Device Taints晋级GA、EtcdRangeStream与无root kubelet进入Beta，则延续了v1.34以来"硬件调度精细化+控制面可扩展性+最小权限"三条主线，为AI/GPU集群与更大规模控制面做准备。

Cluster API v1.14 RC对KCP故障处理的大幅增强，反映出集群生命周期管理正从"创建集群"转向"治理退化中的集群"。改进etcd leadership前向切换、链式升级中间步骤的修复、未启动etcd成员的清理——这些细节处理的是真实生产中最棘手的部分故障场景。控制面可靠性在"更多、更小的集群"成为主流部署形态后，其重要性被成倍放大：任何自动化短板都会在集群数量增长时线性放大为运营事故。

HashiCorp Vault KMS公测则把密钥治理的边界推进了一步。此前托管平台（Azure Key Vault KMS for AKS）与社区项目已提供类似能力，HashiCorp的差异化在于"企业级Vault单一信任根"的整合——密钥生命周期、轮换、RBAC与审计全部收敛到一个独立保护的身份与密钥平台。这与云原生生态的"机器身份"主线（SPIFFE、工作负载身份、无secret CI/CD）一脉相承：当AI Agent与自动化流水线越来越多地自主访问敏感资源，静态加密密钥的外置与独立审计不再是"加分项"，而是受监管环境的基本要求。其约束（仅Enterprise、需自改apiserver清单）也提示：该能力面向自管理平台团队而非全托管用户。

## 结论

Kubernetes v1.37的弃用强制执行、Cluster API的控制面稳健性增强与Vault KMS的外置密钥管理，共同勾勒出云原生基础设施从"功能扩张"转向"运营成熟"的清晰路径。建议各团队在v1.37正式发布（8月26日）前的五周窗口内完成containerd 2.0、cgroup v2、kube-proxy模式的全面审计，同步评估Cluster API v1.14的链式升级改进与Vault KMS在受监管集群中的适用性，把"升级"当作一次有准备的运营演练而非风险事件。
