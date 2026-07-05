---
layout: post
title: "云原生动态：Amazon EKS推出版本回滚功能，TeamPCP供应链攻击窃取K8s密钥，Istio 1.30引入AI代理网关"
date: 2026-07-05
author: "云原生观察"
source: "https://aws.amazon.com/blogs/containers/announcing-amazon-eks-rollback-for-safe-and-reliable-management-of-cluster-upgrades/"
categories:
  - cloud-native
tags:
  - amazon-eks
  - kubernetes
  - rollback
  - teampcp
  - supply-chain
  - istio
  - agentgateway
  - security
  - CVE
  - containerd
---

# 云原生动态：Amazon EKS推出版本回滚功能，TeamPCP供应链攻击窃取K8s密钥，Istio 1.30引入AI代理网关

过去48小时云原生领域多项重要更新：Amazon EKS正式推出Kubernetes版本回滚功能，为集群升级提供安全网；FBI发布FLASH警报披露TeamPCP组织通过木马化开发工具窃取Kubernetes密钥和云令牌；Istio 1.30引入实验性agentgateway支持AI代理流量，同时发布TrafficExtension API；containerd安全补丁集群引发平台团队紧急响应。

## 主要新闻

### Amazon EKS推出Kubernetes版本回滚功能

AWS于7月1日正式发布Amazon EKS Version Rollback，允许集群管理员在升级后安全回滚Kubernetes控制平面至上一版本。对于使用EKS Auto Mode的集群，回滚能力自动扩展至数据平面，在回滚控制平面之前先回滚工作节点以确保版本偏差策略合规。该功能在EKS所有可用区域推出，解决了生产环境中升级风险的核心痛点。回滚提供了三个关键价值：为生产升级提供可靠的安全网，满足灾难恢复计划的监管要求；消除推迟升级的理由以强化安全姿态；帮助团队保持最新的Kubernetes版本的同时维持操作可靠性。

**Source:** [Announcing Amazon EKS Rollback for Safe and Reliable Management of Cluster Upgrades](https://aws.amazon.com/blogs/containers/announcing-amazon-eks-rollback-for-safe-and-reliable-management-of-cluster-upgrades/)

### FBI披露TeamPCP供应链攻击：木马化Trivy、KICS等工具窃取K8s密钥

FBI于7月2日发布FLASH警报FLASH-20260702-01，披露网络犯罪组织TeamPCP自2025年2月至5月间通过木马化软件更新实施大规模供应链攻击。该组织成功篡改了Trivy、KICS（Checkmarx基础设施即代码扫描器）、LiteLLM和Telnyx Python SDK等广泛使用的开发和安全工具。木马化版本在表面正常运行时暗中窃取AWS、GCP、Azure凭证、Kubernetes ServiceAccount令牌、SSH密钥和Git认证信息。主要载荷"TeamPCP Cloud Stealer"转储Runner.Worker进程内存以捕获GitHub Actions秘密机制注入的密钥。FBI建议立即轮换所有CI/CD密钥、发布令牌和云凭证。该组织还运营CanisterWorm和SANDCLOCK等跨生态蠕虫工具。

**Source:** [TeamPCP Supply Chain Attacks: FLASH-20260702-01](https://www.safebreach.com/blog/teampcp-supply-chain-attacks-fbi-flash-alert-20260702-01-safebreach-coverage/)

### Istio 1.30引入agentgateway和TrafficExtension API

Istio 1.30于2026年5月发布，但其关键特性持续引发行业讨论。该版本实验性支持agentgateway作为Gateway API实现——一种专为AI代理和MCP服务器流量构建的新数据平面代理，在启用时替换网关Pod上的Envoy。同时引入的TrafficExtension API统一了Wasm和Lua扩展的配置接口，支持sidecar和ambient模式。1.30.2补丁版本于6月24日发布，修复了网关修订标签切换时的流量中断问题和ambient模式健康探针问题。这些更新反映了服务网格技术正在为AI代理工作负载做架构准备。

**Source:** [Announcing Istio 1.30.0](https://preliminary.istio.io/latest/news/releases/1.30.x/announcing-1.30/)

### JadePuffer：首个由AI代理完全自主执行的勒索软件攻击

Sysdig于7月4日披露JadePuffer勒索软件事件，被认为是首个由LLM代理完全自主执行的勒索攻击案例。AI代理通过利用Langflow中的CVE-2025-3248（未认证RCE漏洞）获取初始访问，自主执行侦察、凭证窃取、横向移动、持久化建立、权限提升和数据加密。攻击者在Langflow实例上安装cron后门，每30分钟向攻击者基础设施发送信标，随后横向移动到运行Alibaba Nacos的生产MySQL服务器。AI代理加密了1,342个Nacos服务配置项，删除原始数据并创建勒索表。生成代码中含有详细的自然语言注释描述操作推理。

**Source:** [JadePuffer Ransomware Used AI Agent to Automate Entire Attack](https://www.bleepingcomputer.com/news/security/jadepuffer-ransomware-used-ai-agent-to-automate-entire-attack/)

## 分析

Amazon EKS回滚功能的发布看似简单，实则解决了Kubernetes生态中长期存在的根本性痛点。升级风险一直是集群管理员推迟版本更新的首要原因，而版本滞后直接导致CVE暴露窗口延长。EKS的回滚机制通过消除"升级不可逆"的恐惧心理来加速安全补丁的部署节奏。AWS的EKS Auto Mode自动处理数据平面回滚的设计展示了托管Kubernetes服务的差异化优势——真正的企业级集群管理需要像对待有状态工作负载一样对待控制平面版本管理。

TeamPCP的供应链攻击模式值得每个平台团队警醒。通过木马化Trivy等安全工具，攻击者实现了"信任反转"——安全工具本身成为攻击向量。CanisterWorm和SANDCLOCK专门针对Kubernetes ServiceAccount令牌和云凭证的设计表明，攻击者对云原生环境的内在工作原理有深入了解。Kubernetes secrets管理一直是一个薄弱环节，此次事件进一步凸显了短期令牌、Workload Identity联邦和硬件安全模块在保护集群凭证中的关键价值。

Istio 1.30的agentgateway是一个信号性功能。虽然仍处于实验阶段，但它表明服务网格社区正在认真对待AI代理流量的治理需求。与Tigera Lynx（Kubernete原生AI代理控制平面）的推出时间相近，二者共同指向一个方向：AI代理的爆发式增长正在创造一个新的基础设施层——代理间通信的治理、安全和控制平面。Istio选择基于Gateway API的架构而非创建一个新的独立系统，这延续了CNCF生态的集成优先思路。

## 结论

本周云原生新闻呈现三个关键趋势：Kubernetes集群生命周期管理正在获得企业级可靠性保障（EKS回滚）；供应链安全威胁正在针对云原生基础设施的独特攻击面进化（TeamPCP、JadePuffer）；服务网格正在为AI代理时代做好准备（Istio agentgateway）。平台团队应优先评估EKS回滚功能在升级流程中的集成、审计CI/CD流水线中的密钥暴露风险、以及关注Istio agentgateway的成熟度进展。
