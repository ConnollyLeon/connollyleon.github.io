---
layout: post
title: "云原生技术动态：Kubernetes 1.36即将发布与CNCF生态持续演进"
date: 2026-07-20
author: "云原生观察"
source: "https://lwkd.info/2026/20260716"
categories:
  - cloud-native
tags:
  - kubernetes
  - cncf
  - devops
  - etcd
---

# 云原生技术动态：Kubernetes 1.36即将发布与CNCF生态持续演进

本周云原生领域迎来多项重要动态。Kubernetes 1.36版本进入Code Freeze阶段，DRA Device Taints and Tolerations特性正式达到GA状态，etcd升级至v3.7.0标志着存储层的重大进步。同时，CNCF宣布Broadcom升级为白金会员，进一步强化AI就绪云原生基础设施的生态建设。

## 主要新闻

### Kubernetes 1.36 Code Freeze：发布进入倒计时

Kubernetes 1.36版本计划于2026年7月23日进入Code Freeze阶段，这意味着所有需要包含在此版本中的增强功能必须在此日期前完成代码合并。与此同时，etcd已被更新至v3.7.0稳定版本，为Kubernetes带来了新的存储能力，包括高效的Watch/List操作支持。

**Source:** [Last Week in Kubernetes Development](https://lwkd.info/2026/20260716)

### DRA Device Taints and Tolerations达到GA状态

Dynamic Resource Allocation (DRA) 的Device Taints和Tolerations功能已通过`resource.k8s.io/v1` API正式达到General Availability状态。这一里程碑稳定了集群如何使用设备级别的taints来限制或允许对GPU等专用硬件的访问，对于AI/ML工作负载的调度具有重要意义。

**Source:** [Kubernetes Pull Request #138676](https://github.com/kubernetes/kubernetes/pull/138676)

### CNCF宣布Broadcom升级为白金会员

Cloud Native Computing Foundation宣布Broadcom已将其会员资格升级为白金级，深化了其对CNCF生态系统和云原生社区的承诺。Broadcom近期还向CNCF Sandbox贡献了Velero——一个Kubernetes原生的备份、恢复和迁移平台。这一合作反映了在AI时代构建弹性基础设施的共同愿景。

**Source:** [CNCF Announcement](https://www.tmcnet.com/usubmit/2026/07/16/10416072.htm)

## 分析

Kubernetes 1.36的Code Freeze标志着又一个重要版本即将完成。etcd v3.7.0的引入不仅是版本号的简单升级，更代表了存储层在大规模集群场景下的性能优化方向。对于正在运行大规模Kubernetes集群的组织而言，Watch/List操作的效率提升将直接降低API Server的负载，这在管理数千节点的环境中尤为关键。

DRA Device Taints and Tolerations达到GA状态则反映了Kubernetes在异构计算资源管理方面的持续演进。随着AI训练和推理工作负载对GPU、TPU等加速器的需求激增，能够精细控制硬件访问权限的能力变得至关重要。这一特性的GA意味着组织可以更安全地在同一集群中混合运行不同安全级别的GPU工作负载。

CNCF与Broadcom的合作升级则体现了云原生生态系统在AI时代的战略定位。Velero作为备份恢复工具进入CNCF Sandbox，意味着在云原生环境中保护AI训练数据和模型状态的能力将得到社区的持续关注和改进。

## 结论

本周的云原生动态表明，Kubernetes生态正在从通用容器编排平台向AI就绪的基础设施操作系统演进。Code Freeze的倒计时、存储层的升级、异构资源管理的成熟，以及生态伙伴的战略投入，共同推动着云原生技术进入新的发展阶段。对于从业者而言，关注Kubernetes 1.36的最终发布、DRA特性的生产部署最佳实践，以及Velero在CNCF生态中的发展，将是接下来几个月的重点。
