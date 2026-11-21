---
layout: post
title: "云原生技术动态：AI智能体基础设施进入CNCF，GKE网络与可观测性同步演进"
date: 2026-11-21
author: "云原生观察"
source: "https://www.infoq.com/news/2026/11/google-substrate-gvisor-cncf/"
categories:
  - cloud-native
tags:
  - kubernetes
  - cncf
  - ai-agents
  - gke
  - observability
  - cloud-native
---

# 云原生技术动态：AI智能体基础设施进入CNCF，GKE网络与可观测性同步演进

过去24小时云原生领域的焦点集中在“Kubernetes如何承载新一代工作负载”。Google将Agent Substrate、gVisor和OpenRL交给CNCF治理，GKE推出Dataplane V2就地迁移预览，AWS则为EKS带来面向开源工具的内置监控。这些进展共同指向一个方向：平台正在从调度无状态容器，转向同时管理智能体会话、GPU网络与可观测性。

## 主要新闻

### Google将Agent Substrate与gVisor捐赠给CNCF

Google宣布把Agent Substrate、gVisor以及强化学习编排项目OpenRL交由云原生计算基金会（CNCF）进行厂商中立治理。Agent Substrate将智能体的“状态”（actors，包括文件系统、内存与执行上下文）与“计算资源”（workers，来自共享Kubernetes池的预热执行环境）分离：智能体空闲时保存状态并释放计算资源，需要恢复时再分配到可用worker，官方称恢复时间可低于500毫秒，且无需为每个执行创建新的Pod。Google估计智能体有90%至95%的时间处于等待推理、外部API或人工审批的空闲状态，传统“一会话一Pod”模式会造成明显浪费。gVisor则通过用户态应用内核拦截系统调用，为执行AI生成代码提供更强的隔离边界；对需要硬件级隔离的场景，Agent Substrate还支持Cloud Hypervisor微虚拟机。

**Source:** [Google Donates Agent Substrate and gVisor to the CNCF to Secure AI Agents at Scale](https://www.infoq.com/news/2026/11/google-substrate-gvisor-cncf/)

### GKE Dataplane V2开放就地迁移预览

Google Cloud发布GKE Dataplane V2的就地迁移预览。Dataplane V2基于eBPF与开源Cilium，替代传统iptables和kube-proxy，可在启用网络策略时支持最多15,000节点的集群，并为GPU/TPU集群、DRANET动态资源分配以及无边车（sidecarless）ambient networking提供底层数据平面。此前企业迁移到V2往往需要新建并行集群、处理有状态工作负载和既有IP分配；新流程通过资格与预检、单条gcloud命令启动迁移、自动滚动升级与最终确认三个阶段完成，且在最终确认前可回滚。该功能适用于GKE 1.35及以上的VPC-native集群，不支持routes-based集群或运行Calico的集群。

**Source:** [Introducing in-place migration to GKE Dataplane V2](https://cloud.google.com/blog/products/networking/gke-dataplane-v2-in-place-migration)

### Karpenter 1.15引入GPU拓扑感知与更温和的节点修复

AWS发布Karpenter 1.15，重点解决“资源请求抽象之下”的物理硬件问题。新版本通过Dynamic Resource Allocation（DRA）感知NVIDIA GPU与Elastic Fabric Adapter的PCIe拓扑，避免分布式训练中因设备不在同一root complex而导致的调度失败；同时会在申请实例前检查EBS卷挂载上限（例如m5.xlarge最多25块），并通过EC2NodeClass的`enclaveOptions`支持Nitro Enclaves机密计算。节点修复被纳入与drift、consolidation相同的“自愿中断”预算和PDB机制，并新增可清除GPU XID错误等故障的`RebootNode`路径，避免不必要地替换实例。DRA支持需EKS 1.34+，GPU时间切片需EKS 1.36+。

**Source:** [Karpenter v1.15: GPU-aware provisioning, smarter node repair, and more](https://aws.amazon.com/blogs/containers/karpenter-v1-15-gpu-aware-provisioning-smarter-node-repair-and-more/)

### Amazon CloudWatch为EKS开源工具提供内置监控

AWS宣布Amazon CloudWatch EKS Container Insights新增对Karpenter、KEDA、vLLM、KServe、SGLang、Ray和Knative Serving的内置监控。启用OTel Container Insights后即自动开始采集，无需自行运行Prometheus或Grafana；AI推理工作负载可查看排队请求、首token时间和每个模型的KV缓存使用率，自动扩缩容场景可查看失败的scaler与scale loop耗时。所有指标均带有pod、workload与node标签，便于把慢速模型服务定位到具体节点。该功能随8.0.0及以上版本插件与Helm chart提供，指标按OTel摄取量计费。

**Source:** [Amazon CloudWatch EKS Container Insights now offers built-in monitoring for open source Kubernetes tools](https://aws.amazon.com/about-aws/whats-new/2026/11/cloudwatch-eks-kubernetes-tools/)

## 分析

Google的捐赠说明云原生基础设施正在为智能体重写调度模型。传统Kubernetes假设工作负载启动后持续运行，而智能体是“短执行、长等待、强状态”的：它们需要挂起、快照、恢复，并在恢复时保留文件系统与会话上下文。把actors与workers解耦，本质上是在Kubernetes之上引入一层面向会话的运行时，既减少Pod对象 churn 对控制面的压力，也避免了缩容到零后重建环境的延迟。gVisor与微虚拟机选项进一步表明，安全边界正从“容器之间”转向“AI生成代码与宿主内核之间”。

这对平台团队的影响很直接：评估智能体平台时，不能只看模型接入和工具调用，还要看状态保存、恢复时延、隔离级别以及并发评估时对控制面的冲击。把这类能力交给CNCF治理，也意味着未来可能出现跨厂商的agent运行时接口，类似于当年容器运行时和CNI的标准化过程。值得关注的是，NVIDIA已将OpenShell捐赠给CNCF，并在推动Agent Substrate与Dynamo推理、KAI Scheduler的集成，智能体治理与资源调度正在走向同一治理体系。

网络层的演进则沿着另一条主线展开。GKE Dataplane V2用eBPF/Cilium替换iptables，把网络策略执行下沉到内核，并将就地迁移做成可回滚的托管流程，实质是在降低“换数据平面”的迁移成本。Karpenter 1.15则把GPU拓扑、卷挂载上限、Nitro Enclaves纳入置备决策，说明节点自动扩缩正在从“按CPU/内存计数”进入“理解硬件拓扑”的阶段。对运行分布式训练和推理的平台来说，这类能力直接决定GPU利用率与训练任务的失败率。

可观测性方面，CloudWatch把vLLM、KServe、Ray等工具的指标纳入托管视图，反映出AI工作负载的监控指标正在标准化：TTFT、KV缓存、队列长度与scaler健康度，正在成为类似“CPU/内存/延迟”的一等公民。接下来的观察点是：Agent Substrate等Sandbox项目何时进入孵化、GKE就地迁移在大规模有状态集群中的稳定性，以及云厂商的AI可观测指标是否会收敛到OpenTelemetry语义约定。

## 结论

本轮更新显示，云原生平台正在补齐AI时代的三层基础：面向智能体会话的运行时与隔离、面向GPU的网络与置备、面向模型服务的可观测性。企业应优先在测试集群验证GKE就地迁移与Karpenter DRA能力，同时用OpenTelemetry统一采集推理指标；对计划运行自主智能体的团队，则应提前评估状态快照、恢复时延和微虚拟机隔离等能力，而不是把智能体简单当作长驻Pod来运维。
