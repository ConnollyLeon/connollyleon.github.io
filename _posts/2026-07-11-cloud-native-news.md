---
layout: post
title: "云原生动态：etcd v3.7.0正式发布，ingress-nginx退役迁移指南，GKE Autopilot支持GPU/TPU加速，Supermicro推出Kubernetes边缘AI设备"
date: 2026-07-11
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/07/08/announcing-etcd-3.7/"
categories:
  - cloud-native
tags:
  - etcd
  - kubernetes
  - ingress-nginx
  - gateway-api
  - gke
  - autopilot
  - gpu
  - tpu
  - edge-ai
  - supermicro
  - red-hat
  - openshift
  - cloud-native
  - cncf
---

# 云原生动态：etcd v3.7.0正式发布，ingress-nginx退役迁移指南，GKE Autopilot支持GPU/TPU加速，Supermicro推出Kubernetes边缘AI设备

过去24小时云原生生态迎来多项重要进展：SIG etcd发布etcd v3.7.0，引入RangeStream流式查询等重大性能改进；CNCF发布ingress-nginx退役迁移指南，为组织提供两条迁移路径；Google GKE Autopilot新增GPU和TPU原生支持，简化AI加速工作负载部署；Supermicro联合Red Hat和Everpure推出预验证Kubernetes边缘AI设备。

## 主要新闻

### etcd v3.7.0正式发布：RangeStream流式查询与v3store完全引导

SIG etcd发布etcd v3.7.0，这是Kubernetes核心分布式键值存储组件的最新小版本。v3.7最重要的新特性是RangeStream——允许以分块方式流式传输大型查询结果，避免了此前需要缓冲整个响应集的内存压力问题。该特性将在Kubernetes v1.37中通过EtcdRangeStream feature gate向用户开放。另一个里程碑式变化是etcd现在完全从v3store启动，彻底消除了对遗留v2store的依赖。此外，v3.7完成了protobuf库的全面迁移，将过时的golang/protobuf和gogo/protobuf替换为官方支持的google.golang.org/protobuf。在性能方面，Kubernetes用户应能观察到etcd成员整体CPU使用量的显著下降。v3.7还附带了bbolt v1.5.1和raft v3.7.0的同步更新。

**Source:** [Announcing etcd v3.7.0](https://kubernetes.io/blog/2026/07/08/announcing-etcd-3.7/)

### CNCF发布ingress-nginx退役迁移指南：Contour横向迁移与Gateway API现代化

CNCF发布深度技术指南，为仍在使用已退役ingress-nginx控制器的组织提供迁移路径。2026年3月，Kubernetes SIG Network宣布退役社区维护的ingress-nginx控制器，这意味着继续使用该控制器将面临未修补的CVE漏洞和功能更新完全停止的风险。指南明确指出被退役的并非Kubernetes Ingress API本身，而是ingress-nginx控制器实现。组织面临两条主要迁移路径：路径A是横向迁移至Contour等其他Ingress控制器，可保留现有Ingress YAML资源，仅需替换IngressClass并翻译nginx特定注解，迁移成本低至中等但属于短期权宜之计；路径B是迁移到Gateway API——Kubernetes上游支持的Ingress后继者，采用角色导向设计，将基础设施关注点与应用路由明确分离，支持标准化的流量分割、高级头部匹配和安全的跨命名空间路由，迁移成本高但面向未来。

**Source:** [Navigating the ingress-NGINX retirement](https://www.cncf.io/blog/2026/07/09/navigating-the-ingress-nginx-retirement/)

### Google GKE Autopilot新增GPU和TPU原生支持

Google为GKE Autopilot集群添加了GPU和TPU支持，并引入托管DRANET（Dynamic Resource Attachment Networking）用于加速器工作负载的自动化网络资源分配。Autopilot用户现在可以设置请求TPU和RDMA网络接口的Pod，无需直接管理底层节点。该功能通过Autopilot集群、自定义ComputeClass定义和ResourceClaimTemplate对象的组合实现，将工作负载与所需网络资源绑定。GPU部署示例使用Nvidia B200配置在a4-highgpu-8g机器类型上运行Gemma 4 31B模型的vLLM推理，每容器请求8个GPU和RDMA网络声明。TPU部署则使用v6e切片配置。两者的共同模式是通过声明式规范（ComputeClass + ResourceClaimTemplate）将加速器访问打包为Kubernetes原生抽象，将节点生命周期管理交由Google控制，同时用户通过声明式配置获得低级别加速器网络访问能力。

**Source:** [Google adds GPU & TPU support to GKE Autopilot](https://datacenternews.asia/story/google-adds-gpu-tpu-support-to-gke-autopilot)

### Supermicro联合Red Hat和Everpure推出Kubernetes边缘AI设备

Supermicro推出预验证Kubernetes边缘AI设备，与Red Hat和Everpure合作，旨在简化AI应用在分布式边缘环境中的部署。该设备整合了Supermicro的边缘计算服务器、Red Hat OpenShift（基于Kubernetes的混合云平台）和Portworx by Everpure（Kubernetes原生存储和数据管理平台）。架构核心理念是"统一运维模型"——组织可以在从边缘位置到核心数据中心再到云环境的全链路中应用一致的存储策略和管理实践。与传统在每个站点部署专用硬件的存储阵列不同，软件定义存储方法使组织能够在紧凑的边缘基础设施上提供企业级存储服务。该设备面向AI推理而非模型训练场景，因为推理通常需要在更靠近用户和连接设备的位置运行以获得快速响应时间。

**Source:** [Supermicro Debuts Kubernetes Edge AI Appliance](https://cloudnativenow.com/features/supermicro-debuts-kubernetes-edge-ai-appliance-with-red-hat-and-everpure/)

## 分析

etcd v3.7.0的发布对Kubernetes生态系统具有深远影响。RangeStream特性解决了长期以来在大规模Kubernetes集群中查询etcd时的内存瓶颈问题——当集群中存在数十万甚至数百万个对象时，传统的全量缓冲查询方式可能导致etcd OOM。流式传输使客户端可以增量处理结果集，这对于备份工具、资源审计、迁移脚本等场景尤为重要。etcd完全从v3store启动则消除了另一个历史遗留风险——v2store到v3store的迁移路径在过去数年中一直是etcd升级过程中的主要复杂性来源。protobuf迁移则确保了etcd与gRPC生态的长期兼容性。配合Kubernetes v1.37的EtcdRangeStream feature gate，这标志着etcd-Kubernetes集成进入了新的成熟阶段。

ingress-nginx退役指南的发布时机恰到好处。Gateway API虽然在技术上更为先进，但"角色导向设计"的本质意味着组织需要重新思考DevOps团队与平台团队之间的职责划分——这不仅是技术迁移，更是组织流程的变革。指南将Contour定位为"争取时间的过渡方案"是务实的：大多数企业无法在短期内完成从Ingress到Gateway API的全面重写，但必须立即解决CVE漏洞风险。建议组织的迁移策略是"双轨并行"——短期通过Contour消除安全风险，中期制定Gateway API迁移路线图。

GKE Autopilot的GPU/TPU支持和Supermicro边缘AI设备分别代表了云原生AI的两个方向：公有云上的托管加速和边缘场景的预集成部署。两者共同的趋势是"Kubernetes成为AI基础设施的标准接口"——无论工作负载运行在Google的TPU集群上还是战场边缘的加固服务器上，开发者使用的都是相同的Kubernetes API和声明式配置模式。这种一致性显著降低了AI应用在不同环境间迁移的认知成本和工程负担。

## 结论

本周云原生生态在基础设施层（etcd v3.7.0）、网络层（ingress-nginx退役与Gateway API）、计算层（GKE Autopilot GPU/TPU）和边缘层（Supermicro设备）四个维度同时推进。建议平台团队优先评估etcd v3.7.0的升级路径和RangeStream特性的适用场景；网络团队立即启动ingress-nginx退役的风险评估，制定"安全迁移（Contour）+ 架构演进（Gateway API）"的双轨计划；AI/ML团队关注GKE Autopilot加速器支持在自身推理工作负载中的可行性；边缘部署场景的组织则可评估Supermicro预验证设备是否能缩短其边缘AI部署周期。
