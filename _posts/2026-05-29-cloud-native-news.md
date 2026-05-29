---
layout: post
title: "云原生技术动态：GPU自动缩放与IBM/Red Hat 50亿美元开源安全计划"
date: 2026-05-29
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/05/27/gpu-autoscaling-on-kubernetes-with-keda-building-an-external-scaler/"
categories:
  - cloud-native
tags:
  - kubernetes
  - keda
  - gpu
  - ibm
  - red-hat
  - snowflake
  - aws
  - cncf
  - cloud-native
---

# 云原生技术动态：GPU自动缩放与IBM/Red Hat 50亿美元开源安全计划

本周云原生领域迎来多项重磅消息：CNCF发布GPU自动缩放方案填补Kubernetes在AI负载调度能力上的关键缺口、IBM与Red Hat宣布50亿美元Project Lightwell保护开源软件供应链、Snowflake与AWS签署60亿美元战略扩展协议，以及etcd v3.7 Beta发布移除v2存储引擎。

## 主要新闻

### KEDA GPU外部缩放器：Kubernetes AI工作负载自动缩放新方案

CNCF博客发布了一篇详细的技术文章，介绍如何利用KEDA的外部缩放器（ExternalScaler）构建GPU感知的自动缩放方案。由于KEDA使用CGO_ENABLED=0编译而NVIDIA NVML要求CGO，GPU缩放器无法作为内置缩放器。文章提出了一种DaemonSet架构——在每个GPU节点上运行gRPC服务端采集NVML指标，KEDA Operator连接该服务端驱动HPA决策。该方案支持vLLM推理、Triton模型服务、训练作业等不同配置文件的缩放策略，包括scale-to-zero。

**Source:** [GPU Autoscaling on Kubernetes with KEDA - CNCF Blog](https://www.cncf.io/blog/2026/05/27/gpu-autoscaling-on-kubernetes-with-keda-building-an-external-scaler/)

### IBM与Red Hat宣布Project Lightwell：50亿美元守护开源安全

IBM和Red Hat联合宣布Project Lightwell，一项50亿美元的投资计划，由20,000名工程师组成全球力量，利用前沿AI能力保护企业级开源软件安全。该项目将建立可信的企业级开源代码清算中心，使用AI辅助进行漏洞评审、分类和优先级排序，为企业提供商业订阅式的安全补丁生命周期管理。IBM表示这借鉴了Anthropic的Project Glasswing和OpenAI的Trust Access for Cyber项目的经验。

**Source:** [IBM and Red Hat Commit $5 Billion to Redefine the Future of Open Source in the AI Era](https://www.newswire.ca/news-releases/ibm-and-red-hat-commit-5-billion-to-redefine-the-future-of-open-source-in-the-ai-era-852070303.html)

### Snowflake与AWS签署60亿美元战略协议

Snowflake宣布与AWS签署了其历史上最大规模的战略合作协议，承诺在五年内在AWS上投入60亿美元用于Graviton计算和AI工作负载。该协议将加速企业Agentic AI的采用，Snowflake的Cortex AI能力将直接在AWS上运行。Snowflake在AWS Marketplace上的累计销售额已超过70亿美元。这一合作标志着AI数据云与基础设施云的深度绑定。

**Source:** [Snowflake Expands AWS Collaboration with $6B Commitment](https://press.aboutamazon.com/2026/5/snowflake-expands-aws-collaboration-with-6b-commitment-to-accelerate-enterprise-agentic-ai-adoption)

### etcd v3.7 Beta：v2存储引擎正式移除

SIG-Etcd发布了etcd v3.7.0-beta.0，该版本完全移除了v2 store兼容层。v2发现、v2引导、v2请求和v2客户端全部被清除。受此影响最大的工具是Flannel CNI插件。同时新引入了RangeStream功能，允许大结果集的分块流式传输，显著降低大规模集群的kube-apiserver内存峰值。SIG-Etcd特别强调：如果你仍然运行etcd v3.4，该版本已于5月15日停止支持，必须立即升级到v3.5或v3.6。

**Source:** [etcd v3.7 Beta: The v2 Store Is Gone](https://byteiota.com/etcd-v3-7-beta-v2store-removed-kubernetes/)

### Kubernetes 1.36 "Haru"：Ingress-NGINX安全补丁停止

Kubernetes 1.36 "Haru"发布后，最大的新闻是Ingress-NGINX已于2026年3月24日停止接收安全补丁。SIG Network建议用户迁移至Gateway API。Kubernetes 1.36还带来了User Namespaces GA、Dynamic Resource Allocation Stable、以及Fine-Grained Kubelet API Authorization（KEP-2862）的GA。IPVS kube-proxy模式已被移除。对于仍在运行Ingress-NGINX的集群，社区建议立即规划迁移路径。

**Source:** [Kubernetes 1.36 "Haru": Ingress-NGINX Is Gone](https://byteiota.com/kubernetes-136-haru-ingress-nginx-migration/)

## 分析

本周云原生动态最引人注目的主题是"云原生基础设施正在被AI工作负载重新定义"。KEDA GPU缩放器填补了一个关键空白——此前Kubernetes的HPA无法感知GPU利用率，导致AI推理集群在负载波动时要么资源浪费要么响应延迟。这一方案通过外部缩放器模式绕过KEDA的CGO限制，展示了CNCF生态系统的灵活性和扩展能力。对于运行vLLM或Triton的生产集群来说，这是一个可以直接落地的方案。

IBM和Red Hat的Project Lightwell值得从两个角度解读。一方面，50亿美元和20,000名工程师的投入规模在开源领域前所未有，反映了企业对开源供应链安全的高度重视——特别是在XZ后门事件之后。另一方面，这一模式将开源安全从社区志愿行为转变为商业服务，可能改变企业参与开源上游维护的方式。

Snowflake的60亿美元AWS承诺和etcd v3.7的发布分别代表了云原生生态的两个方向：向上，AI数据平台与基础设施云正在形成更紧密的绑定关系；向下，etcd这样的底层基础设施正在经历技术债务的清理和性能的优化。

## 结论

本周云原生领域的多项进展表明，生态系统正在经历从"通用容器编排"到"AI原生基础设施"的范式转变。KEDA GPU缩放器解决了AI推理的弹性问题，Project Lightwell为AI时代的开源供应链安全提供了新范式，etcd v3.7清理了遗留技术债务。平台工程团队应将GPU感知的自动缩放、开源供应链安全审计和Ingress-NGINX迁移纳入Q3技术规划。
