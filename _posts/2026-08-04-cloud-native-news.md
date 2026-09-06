---
layout: post
title: "Gateway API v1.6将TCPRoute与UDPRoute推上Standard，Kubernetes 1.37预告IPVS淘汰与HPA原生缩容至零"
date: 2026-08-04
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/08/03/gateway-api-v1-6-release/"
categories:
  - cloud-native
tags:
  - gateway-api
  - kubernetes
  - networking
  - vault
  - hpa
  - dra
  - kms
  - cloud-native
---

# Gateway API v1.6将TCPRoute与UDPRoute推上Standard，Kubernetes 1.37预告IPVS淘汰与HPA原生缩容至零

本周云原生领域迎来两件大事。其一，Kubernetes官方博客于8月3日正式发布Gateway API v1.6详解：TCPRoute与UDPRoute晋升Standard通道并进入v1 API版本，标志着Gateway API在L4协议路由上补齐了最后一块拼图，同时实验性资源迁移到独立的`gateway.networking.x-k8s.io` API组，实验与标准边界从此在API组层面显式化。其二，Kubernetes 1.37（8月26日发布）的预告信息集中落地：kube-proxy IPVS模式进入淘汰倒计时、HPA Scale-to-Zero进入Beta、DRA设备污点与容忍晋升Stable。此外，HashiCorp在本周正式放出Vault Kubernetes Key Management（vault-kube-kms）公开Beta，为自建集群的加密密钥管理提供了厂商支持路径。

## 主要新闻

### Gateway API v1.6正式发布：TCPRoute与UDPRoute毕业为Standard

Kubernetes SIG Network在8月3日发布的官方博文中确认，Gateway API v1.6.0（于6月30日发布）中，TCPRoute和UDPRoute从Experimental通道毕业为Standard，并迁移至`v1` API版本，v1alpha2版本自此废弃并将于未来版本移除。这两类资源仅凭协议与端口即可将原始L4 TCP/UDP流量路由到后端，无需任何L7感知，补齐了Gateway API在HTTP/TLS（L7）基础之外对纯四层流量的正式支持。同时，实验性资源从标准API组中迁出，新成立的`gateway.networking.x-k8s.io`组使用`X`前缀命名（如XBackend、XMesh），毕业时再移回标准组并去掉前缀——这让"实验性vs标准"的边界从版本号字符串提升为API组层面的硬性约束。v1.6还引入了新的XBackend资源，作为Service及其他后端类型的通用装饰器，支持出口场景（如集群内代理型AI负载）的细粒度配置。

**Source:** [Gateway API v1.6: TCPRoute and UDPRoute Graduate to Standard](https://kubernetes.io/blog/2026/08/03/gateway-api-v1-6-release/)

### Kubernetes 1.37预告：IPVS进入淘汰倒计时、HPA缩容至零转Beta、DRA设备污点转Stable

Kubernetes 1.37预计于8月26日发布，共追踪86项增强，其中16项毕业为Stable。三个信号值得操作者立刻行动：其一，kube-proxy IPVS模式自1.37起在启动时记录弃用警告，1.40默认禁用、1.43彻底移除，替代方案是nftables，两者性能同量级但维护负担更低；其二，`HPAScaleToZero`特性门控进入Beta，Horizontal Pod Autoscaler无需KEDA即可将队列类工作负载缩容到零副本，默认五分钟稳定窗口防止抖动，让"空闲零成本"成为Kubernetes原生能力；其三，DRA的设备污点与容忍（KEP-5055）及设备属性注入Downward API（KEP-5304）毕业为Stable，GPU集群可以像管理节点污点一样标记故障硬件、并让Pod直接读取PCIe地址、NUMA节点等拓扑信息，解决分布式训练NCCL启动期的拓扑发现难题。另有Pod级资源（KEP-2837）转Stable，API server内部类型消除带来5.7倍更快的Pod列表转换。同期提醒：1.37终止对containerd 1.x的支持，1.7及更早版本节点需在升级前迁至containerd 2.0。

**Source:** [Kubernetes 1.37: IPVS Out, HPA Scale-to-Zero In, DRA Stable](https://byteiota.com/kubernetes-1-37-ipvs-out-hpa-scale-to-zero-in-dra-stable/)
**Source:** [Kubernetes v1.37: Kubelet Flag Removals and Containerd 2.0 Deadline](https://www.ownlife.dev/articles/kubernetes-v137-deprecations-and-removals-what-breaks-what-changes-and-what-to-do-before-you-upgrade)

### HashiCorp发布Vault Kubernetes Key Management公开Beta：KMS密钥迁出集群

HashiCorp于本周放出Vault Enterprise作为Kubernetes KMS提供方的公开Beta。新插件`vault-kube-kms`兼容Kubernetes KMS v2接口，让API server将信封加密的密钥加密密钥（KEK）托管在Vault的transit引擎中，而数据加密密钥（DEK）仍由Kubernetes生成，密文与加密后的DEK一并存入etcd——没有可达且配置正确的Vault，集群数据无法解密。该方案将"谁保管密钥"的信任边界从集群内部移动到独立于集群的Vault：密钥生命周期、轮换、策略与审计由Vault集中掌控，并保持RBAC与审计日志可见性。对已经标准化Vault Enterprise的平台团队，这是多年诉求的厂商官方回应（此前仅有Azure Key Vault for AKS及社区项目）。需要注意的是：仅支持Vault Enterprise，且需要修改`EncryptionConfig`与`kube-apiserver`清单，排除了多数全托管控制面；Vault本身位于解密关键路径上，其可用性将成为新的运维依赖。

**Source:** [HashiCorp Ships Public Beta of Vault Kubernetes Key Management - InfoQ](https://www.infoq.com/news/2026/08/vault-kubernetes-key-management/)
**Source:** [HashiCorp Announcement: Vault Kubernetes Key Management](https://www.hashicorp.com/en/blog/announcing-the-public-beta-of-vault-kubernetes-key-management)

### KubeCon Japan余波：CNCF推进AI一致性框架，开放组件拼装AI平台成为共识

从KubeCon + CloudNativeCon Japan 2026（横滨）传来的报道进一步印证了云原生与AI融合的深化：CNCF正在推进"AI一致性框架"（AI conformance framework）——参照既有Kubernetes一致性框架的思路，让AI工作负载可以在不同AI云供应商之间迁移而不重写，以应对新云厂商、超大规模云与欧盟新规共同造成的市场碎片化；同时，一个用于地理分布式AI交互的动态资源编排项目获批成为CNCF沙箱项目，实现了将硬件"以代码描述和组装"的资源组合能力。Subaru在大会案例研究竞赛中胜出，成为"制造业AI on Kubernetes"的社区认可标杆。这些动向共同指向一个判断：2027年的AI平台将是"拼装"出来的，而CNCF的沙箱-孵化路径是让最好的实践成为默认标准的方式。

**Source:** [Open Source AI Building Blocks (KubeCon Japan 2026)](https://lucaberton.com/blog/kubecon-japan-2026-open-source-ai-building-blocks/)

## 分析

本周的Gateway API v1.6在功能之外，真正重要的是它的治理信号。TCPRoute与UDPRoute毕业到Standard，意味着Gateway API成为覆盖L4到L7的"通用入口与网格API"的路线图落到了实处；而实验性资源迁入独立的`x-k8s.io`组并用`X`前缀命名，则把"实验与标准共存于同一API组"的历史遗留问题从设计层面根治。对于正在迁移Ingress的企业，这既是一个提醒——以Ingress NGINX为代表的传统入口控制器维护资源日益吃紧，社区投入正在向Gateway API集中——也是一份行动清单：将L4流量纳入Gateway API治理，可以显著减少kube-proxy与入口控制器之间的能力重复，并为后续XMesh等服务网格标准化铺路。

Kubernetes 1.37的预告则呈现出清晰的"维护期收敛"特征。IPVS的三年倒计时与containerd 2.0硬性要求，本质上是在替整个生态做技术债清理：nftables替代IPVS、containerd 2.0替代1.x，都是社区判断"该交棒了"之后给出的明确时间表。而HPA Scale-to-Zero转Beta与DRA设备污点转Stable，把此前依赖KEDA/Knative与设备插件生态的能力内建到Kubernetes内核——这是Kubernetes从"编排平台"走向"AI/弹性负载运行时"的关键补位。对GPU运维团队而言，DRA设备污点意味着"故障GPU手动cordon"的手工流程将让位于声明式治理。

HashiCorp的vault-kube-kms把本周的叙事串联得更为完整：加密、密钥、信任边界正在被系统性重构。Vault把KEK移出集群，与Kubernetes自带KMS-provider机制、以及CNCF Runtime Supply Chain NRI插件（在容器运行时层做供应链验证）一脉相承——安全控制点正在从"API层"下沉到"运行时层"和"密钥层"，形成纵深防御。这背后是AI代理带来的新现实：CI/CD、基础设施自动化与AI代理都需要无人工干预地持续访问敏感资源，"机器身份"与"独立托管的信任根"成为平台安全设计的新基线。

对实践者的本周行动建议有三条：一是立即检查集群kube-proxy模式与containerd版本，为1.37升级制定迁移计划；二是将Gateway API的L4路由纳入新集群默认架构，逐步评估Ingress控制器迁移；三是把"密钥托管在集群之外"纳入安全基线评估，Vault Enterprise用户可开始测试vault-kube-kms，其余团队至少应明确KEK的存放与轮换策略。

## 结论

本周云原生领域的主线是"标准收敛与安全下沉"。Gateway API以L4毕业完成协议层的拼图，Kubernetes 1.37以IPVS淘汰与原生弹性能力完成内核的收敛，HashiCorp则用vault-kube-kms把密钥管理推向集群外。三者共同指向一个方向：随着AI负载成为Kubernetes的第一等公民，平台工程的重心正从"能跑起来"转向"可治理、可信、可维护"。下一个值得关注的节点是8月26日的Kubernetes 1.37正式发布，以及Gateway API后续XMesh向Mesh的毕业进程。
