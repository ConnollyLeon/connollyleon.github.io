---
layout: post
title: "云原生动态：Kubernetes v1.37安全加固落地——Bind Mount选项与EmptyDir权限走进Alpha、Pod级资源与内存QoS进入Beta"
date: 2026-09-17
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/09/16/kubernetes-v1-37-hardening-container-storage/"
categories: [cloud-native]
tags: [cloud-native, kubernetes, v1.37, storage, security, bind-mount-options, emptydir, memory-qos, pod-level-resources, kubecon]
---

9月14日至16日，Kubernetes v1.37（Garhwal）特性博客进入密集的"毕业季"。安全侧放出了两枚重磅：KEP-5855（`VolumeBindMountOptions`）与KEP-5502（`EmptyDirVolumeMode`）以Alpha身份开放，从卷挂载点与emptyDir权限两个层面收紧容器存储的默认信任面；资源侧，Pod级资源管理（Pod-Level Resource Managers）与内存QoS（Memory QoS）分别于9月15日和9月14日进入Beta。两周以来，v1.37系列已覆盖Rootless、DRA、etcd RangeStream、存储版本迁移默认开启等20余项特性——"安全硬化＋资源可控"正在成为这一代Kubernetes的发布主线，也为11月9日至12日在盐湖城举办的KubeCon + CloudNativeCon NA 2026预设了叙事。

## 主要新闻 (Main News)

### Kubernetes v1.37：`VolumeBindMountOptions`与`EmptyDirVolumeMode`两大存储加固特性进入Alpha

9月16日，Red Hat的Nispriha Jagan与Neeraj Krishna Gopalakrishna在Kubernetes博客详解了v1.37的两项Alpha存储安全特性。其一是KEP-5855 `VolumeBindMountOptions`：默认情况下卷以bind mount方式挂载时并不带`noexec`/`nosuid`/`nodev`等加固选项，导致即使启用了`readOnlyRootFilesystem`，被攻陷的容器进程仍可在可写卷上下载、`chmod +x`并执行任意二进制；新特性允许在`volumeMounts`上指定`bindMountOptions`（例如`[noexec, nosuid]`），把传统的CSI文件系统级`mountOptions`（仅作用于挂载底层设备，不会翻译为容器内挂载标志）下沉为逐卷的容器内挂载参数。其二是KEP-5502 `EmptyDirVolumeMode`：emptyDir历史上的权限被硬编码为`0777`，任何进程都可读写删除卷内容，多容器Pod共享emptyDir时也无法阻止跨容器删文件（带sticky bit的`01777`是常见诉求）；新特性在emptyDir卷源上新增`mode`字段（如`0750`、`01777`），并保持`fsGroup`对模式的覆盖语义。这两项特性直接回应了Kubernetes 1.24安全审计（Finding NCC-E003660-7HM）与kubernetes/kubernetes#48912、#119627中长期的"挂载点默认不安全"质疑。落地条件上，两者均需在API Server与kubelet上开启对应特性门控，且CRI运行时须通过`runtimeFeatures`声明支持`mount_options`，调度器会依据节点声明过滤Pod，kubelet则拒绝不兼容的Pod；特性仅作用于Linux，image卷不受影响。对平台团队而言，这是把"NFS/S3类持久卷默认加固"与"共享emptyDir的最小权限化"从运维手工操作升级为声明式默认的最佳时机。

**Source:** [Kubernetes v1.37: Hardening Container Storage with Bind Mount Options and EmptyDir Permissions](https://kubernetes.io/blog/2026/09/16/kubernetes-v1-37-hardening-container-storage/)

### Kubernetes v1.37：Pod级资源管理（Pod-Level Resource Managers）进入Beta

9月15日的v1.37特性博客宣布，Pod级资源管理（Pod-Level Resource Managers）alpha特性正式毕业到Beta。该特性将资源请求与限制的管理粒度从"容器级"上提到"Pod级"，使得以Pod为整体申请CPU/内存（配合Sidecar、Init容器以及DRA设备这类"多容器团队"场景）的负载，可以在一组容器之间共享统一的资源预算与分配语义，而不必各自为战。对AI/ML推理与高性能工作负载而言，这意味着Pod之间更可预测的资源边界——当GPU节点上多个Pod共享CPU/内存时，kubelet可以站在Pod粒度统一协调调度与驱逐，减少"单容器视角"下资源碎片化与突发驱逐。进入Beta的信号通常意味着API与行为已基本稳定，v1.38周期内有望向GA推进；对于计划在v1.37上线的集群，建议先在独立测试环境开启以评估与既有资源Quota、PriorityClass及in-place resize的交互。

**Source:** [Kubernetes v1.37: Pod-Level Resource Managers graduated to Beta](https://kubernetes.io/blog/2026/09/15/kubernetes-v1-37-pod-level-resource-managers-beta/)

### Kubernetes v1.37：内存QoS（Memory QoS）进入Beta，"分层内存保护"迈向可用

9月14日，v1.37系列宣布内存QoS（Memory QoS）由上一版本引入的Alpha转正为Beta。该特性源于对内存资源"分层保护"的诉求：在cgroup v2与PSI指标的基础上，通过区分Burstable/Guaranteed/BestEffort等QoS等级的内存水位，让高优先级工作负载在内存压力时不再轻易被同等压制——对数据库、缓存与在线推理这类延迟敏感Pod尤其重要。它与v1.36同期落地的"Tiered Memory Protection with Memory QoS"一脉相承，也和Pod级资源管理形成互补：一个管Pod粒度的资源分配，一个管突发压力下的内存保护优先级。对多租户与混合负载集群而言，这两项Beta共同收敛了"超卖-保护"之间的天平，管理者终于可以在不激进锁内存的前提下，为关键业务提供相对稳定的服务质量基线。

**Source:** [Kubernetes v1.37: Memory QoS Graduates to Beta](https://kubernetes.io/blog/2026/09/14/kubernetes-v1-37-memory-qos-graduates-to-beta/)

## 分析 (Analysis)

把存储加固与资源治理放在同一个发布周期里读，能看出Kubernetes的"默认安全"哲学正在向更底层渗透。`VolumeBindMountOptions`直击的痛点是"只读根文件系统≠只读卷"——容器逃逸后的横向动作往往依赖在可写挂载点上落地执行体，`noexec`/`nosuid`的声明式加持，等于把过去需要SecurityContext、PodSecurity标准与运维巡检分散完成的加固动作，压缩成卷定义里的一个字段。它与v1.36用户命名空间GA、PSP退化后的策略体系一起，构成"mount安全、userns隔离、策略兜底"的三层防御闭环。优先级：对于多租户K8s与边缘/裸机场景，这两项Alpha应直接列入试点清单，因为它们的价值恰恰在"攻击面收敛"而非新功能的表面增量。

资源侧的两项Beta则回答了另一个问题：当GPU与推理负载把Pod当作最小调度单元时，kubelet的视野也必须从容器上升到Pod。Pod级资源管理与内存QoS的叠加，让"超卖集群上关键服务免遭驱逐"从运气变成配置——这正是AI/ML生产环境把Kubernetes当"训练与推理操作系统"时的真实刚需。综合看，v1.37在"安全默认化"与"资源可预期"两条主轴上同步推进，建议基础设施团队将`VolumeBindMountOptions`/`EmptyDirVolumeMode`试点、与Pod级资源/内存QoS的Beta评估，一并纳入KubeCon NA 2026之前的升级就绪项，先行验证与CRI运行时、CSI驱动及现有Quota策略的兼容性。

## 结论 (Conclusion)

Kubernetes v1.37的特性周在本周交出"安全＋资源"两张成绩单：Bind挂载选项与emptyDir权限的Alpha特性，把卷级顽疾从"运维修补"变为"声明式默认加固"；Pod级资源管理与内存QoS进入Beta，让集群在高超卖下的服务质量从"不可控"走向"可配置"。对平台工程团队，下一步是把这两组特性放进隔离的canary集群验证CRI能力协商与调度过滤逻辑，再决定是否随v1.38进入生产基线。