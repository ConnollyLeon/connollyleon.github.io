---
layout: post
title: "云原生技术动态：Kubernetes淘汰IPVS、KubeCon聚焦AI代理与Pod级微虚拟机隔离"
date: 2026-11-17
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/11/16/ipvs-removal/"
categories:
  - cloud-native
tags:
  - kubernetes
  - ipvs
  - nftables
  - kubecon
  - ai-agents
  - microvm
---

# 云原生技术动态：Kubernetes淘汰IPVS、KubeCon聚焦AI代理与Pod级微虚拟机隔离

过去24小时内，云原生领域同时出现基础设施"减法"与运行时"加法"两类信号。Kubernetes SIG Network宣布在1.40中移除kube-proxy的IPVS后端，而KubeCon北美大会的总结显示AI代理、应用安全与虚拟化已成为平台团队的核心议题；AWS则把微虚拟机隔离下沉为EKS的一个RuntimeClass字段。三条线索共同指向一个方向：云原生平台正在收紧数据面复杂度，同时为不可信工作负载提供更强的运行时边界。

## 主要新闻

### Kubernetes计划1.40移除kube-proxy IPVS后端

Kubernetes SIG Network成员Dan Winship于11月16日在官方博客宣布，自1.35起已弃用的kube-proxy `ipvs`模式计划在1.40中移除。官方给出的理由包括：内核IPVS API与Kubernetes Services模型匹配度差、后端始终未能覆盖全部Service边界场景、代码复杂度高且与iptables/nftables架构差异过大。nftables后端在1.29引入、1.33达到GA，官方建议1.36及以上且内核5.13及以上的集群迁移到nftables；更旧的环境可退回iptables。kubeadm集群只需把ConfigMap中的`mode: ipvs`改为`mode: nftables`并重启kube-proxy，若改回iptables则建议逐节点重启。

**Source:** [Scheduling the removal of the kube-proxy IPVS backend](https://kubernetes.io/blog/2026/11/16/ipvs-removal/)

### KubeCon北美2026回顾：AI生产化、应用安全与虚拟化三线并行

Isovalent于11月17日发布的大会总结指出，盐湖城KubeCon + CloudNativeCon North America 2026上，AI基础设施与智能体成为最突出主题，应用安全和在Kubernetes上运行虚拟机是两条重要副线。动态资源分配（DRA）、GPU调度、分布式推理、加速器共享与利用率成为反复出现的运维问题；智能体则带来隔离、沙箱、凭据与网络访问限制、高风险动作人工审批等新要求。安全方面，AI辅助漏洞发现带来的重复报告与验证负担引发维护者讨论；虚拟化方面，KubeVirt的VM生命周期、存储与可观测性，以及向VM直通GPU/网络设备，成为混合工作负载管理的重点。

**Source:** [KubeCon North America 2026 Wrap-Up: AI, Application Security, and Virtualization](https://isovalent.com/blog/post/kubecon-north-america-2026-wrap-up/)

### AWS推出Nitro Sandboxes，为每个EKS Pod提供独立微虚拟机

InfoQ于11月16日报道，AWS上线Nitro Sandboxes，可将 opted-in 的EKS Pod、ECS任务或EC2工作负载放入由Nitro管理程序切出的轻量虚拟机中，拥有独立客户机内核。EKS侧只需设置`runtimeClassName: isolated-sandbox`或`confidential-sandbox`。隔离模式保留kubectl exec与日志能力；机密模式将父节点视为不可信，用Cedar策略固定镜像摘要、参数、挂载与能力，并由Nitro Secure Module写入PCR测量值。限制同样明确：Firecracker不支持GPU设备直通，沙箱vCPU总数受节点vCPU倍数约束，且若没有KMS策略或外部验证器校验PCR，"测量被记录但从未验证"。

**Source:** [AWS Nitro Sandboxes Put Each EKS Pod in Its Own MicroVM with One RuntimeClass Field](https://www.infoq.com/news/2026/11/aws-nitro-sandboxes-eks/)

## 分析

IPVS的退场说明Kubernetes数据面正在从"多后端并存"转向收敛。早期引入IPVS是为了解决iptables在大量Service下的O(n)匹配与全量规则重写问题，但一个实验性后端在长期演进中积累了功能缺口、维护断层和发行版依赖（RHEL计划移除iptables接口）。对平台团队而言，这不是功能倒退，而是维护成本的再平衡：nftables经过多个版本的修复后已具备替代能力，继续保留三套后端只会放大兼容性矩阵。值得注意的是，1.36是迁移的分水岭——性能与扩展性修复并未全部回移到更早版本，这意味着"能用"和"好用"之间仍有版本门槛。

KubeCon的讨论则揭示了另一个结构性变化：AI工作负载正在把Kubernetes推向"多类计算单元调度器"的角色。DRA解决设备描述与分配，gang scheduling解决成组 admission，而智能体带来的突发调用、长空闲期和状态保存需求，又要求平台具备挂起/恢复与会话级隔离。传统微服务的运维经验在这里并不完全适用——智能体的权限边界、重试行为和可归因性变成了可靠性问题本身。对企业架构师而言，评估平台时不能只看GPU调度能力，还要看沙箱、策略执行和审计链路是否在同一控制面内闭合。

AWS Nitro Sandboxes体现了同一趋势的云端实现路径：把隔离从应用层下沉到基础设施层。用RuntimeClass而不是新的编排API来表达信任边界，降低了开发者的认知负担，但文档中列出的前提和限制也提醒我们，隔离并非默认万能。机密模式的有效性依赖测量验证闭环；隔离模式只保护单向；GPU场景暂不支持。对于运行编码代理或多租户SaaS的平台团队，合理的做法是先把沙箱作为一层额外防御，而不是替代镜像扫描、网络策略和身份治理。

三条消息放在一起看，云原生平台的变化不是简单的"功能叠加"，而是围绕不可信工作负载重新划定边界：数据面减少历史包袱，调度面容纳AI特有的生命周期，运行时面提供可验证的隔离。这种分工如果成熟，平台团队将能以更少的网络实现变体，换取更强的默认安全与更清晰的责任划分。

## 结论

短期内，仍在使用kube-proxy ipvs模式的集群应尽快盘点配置并规划向nftables迁移，避免把代理模式切换与1.40升级挤在同一维护窗口。中期看，AI代理与混合VM/容器工作负载将成为平台工程的常态需求，建议优先验证沙箱、挂起恢复、设备直通和测量验证这几条链路在自身环境中的真实表现，再决定采用哪一层隔离方案。
