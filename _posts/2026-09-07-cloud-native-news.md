---
layout: post
title: "云原生动态：KubeCon China今日上海开幕，Kubernetes v1.37身份与Metrics双GA、Envoy高危CVE集中修复"
date: 2026-09-07
author: "云原生观察"
source: "https://www.cncf.io/announcements/2026/06/18/kubecon-cloudnativecon-openinfra-summit-and-pytorch-conference-unite-in-china-to-scale-ai/"
categories: [news]
tags: [cloud-native, kubernetes, kubecon, envoy, cncf, AI]
---

2026年9月7日，KubeCon + CloudNativeCon + OpenInfra Summit + PyTorch Conference China在上海国际会议中心正式开幕，CNCF、OpenInfra与PyTorch三大开源社区首次在中国同台，把"生产级AI基础设施"推到了聚光灯下。与此同时，Kubernetes v1.37（Garhwal）本周完成最后一批特性落地：Pod Certificates与Cluster Trust Bundles正式GA、metrics.k8s.io API坚守九年终达Stable，为AI与高性能计算工作负载铺平了身份与调度之路。服务网格侧，Envoy连发多个补丁版本，修复包括HTTP/3内核级漏洞在内的两项高危安全告警，提醒业界在网关与安全层做足功课。

## 主要新闻 (Main News)

### KubeCon China 2026上海开幕：三大开源社区首次合体，聚焦规模化AI落地

KubeCon + CloudNativeCon + OpenInfra Summit + PyTorch Conference China 2026于9月7日至9日在上海举行，CNCF、OpenInfra基金会与Linux基金会AI & Data（含PyTorch社区）首次以联合大会形式集结。第一天议程由中国开源组织（COS）协办，涵盖云原生技术委员会、分论坛、项目与示例演示、CNCF/AI日等活动，紧随其后的是9月8日至9日的主会议。作为34场预定活动（含AGNTCon+MCPCon抢先亮相环节）之一，本届大会以超1000名开发者、400多家企业、150多场演讲的规模，聚焦生产级AI基础设施、大规模云原生平台工程及开源治理三大主题。华为作为战略赞助商深度参与，与Cannonballs、EDRATA、Raymick等新赞助商共同支撑起这一社区通道。

**Source:** [KubeCon + CloudNativeCon + OpenInfra Summit + PyTorch Conference China 2026](https://www.lfopensource.cn/kubecon-cloudnativecon-openinfra-summit-pytorch-conference-china/)

### Kubernetes v1.37：Pod Certificates与Cluster Trust Bundles双GA，工作负载身份迈入X.509时代

Kubernetes v1.37（代号Garhwal，发布于8月26日）本周完成特性收尾：Pod Certificates与Cluster Trust Bundles两个特性正式转GA，允许集群内置的Certificates API直接为Pod与服务重载X.509证书，为解决长期安全反模式——把具备广泛权限的服务账户令牌直接挂到工作负载上——提供了官方出路。叠加已稳定八年的ClusterAddress字段，社区用内置API实现了"边发放边撤换"的证书生命周期管理，让沙箱插件、远程调试与短期工作负载的身份获取从此不再依赖共享长期密钥。

**Source:** [Kubernetes v1.37: Pod Certificates and Cluster Trust Bundles](https://kubernetes.io/blog/2026/08/28/kubernetes-v1-37-pod-certificates-and-cluster-trust-bundles/)

### metrics.k8s.io API九年终达Stable，HPA scale-to-zero进入Beta，etcd RangeStream降低大列表读内存

v1.37同期宣布多项调度与可观测性改进：metrics.k8s.io API历经约九年努力终于进入Stable，为HPA等指标消费方提供了稳定的横向扩缩依据；HPA scale-to-zero升级为Beta，且默认启用，可在配置的工作时间窗或流量阈值下自动将无负载Deployment缩放至零副本；配合gang scheduling（弹性组调度）Beta特性，AI/HPC作业得以按整组完成Pod创建，避免部分资源被抢占导致训练任务悬挂。etcd方引入RangeStream特性，以流式分页替代一次性加载，显著削减大规模列表（如all-namespaces Pod枚举）下的内存占用。

**Source:** [Kubernetes v1.37 Release Announcement](https://kubernetes.io/blog/2026/08/26/kubernetes-v1-37-release/)

### Envoy连发四个补丁版本，修复HTTP/3与URL规范化高危漏洞

Envoy本周密集发布安全更新，1.39.1、1.38.4、1.37.6与1.36.10四个补丁版本同步推送，修复CVE-2026-73511（URL重写/规范化过程中的请求处理缺陷）与CVE-2026-73512（HTTP/3内核中因回调竞争导致的use-after-free漏洞）两项高危问题。官方安全发布流程要求使用受支持版本的用户立即升级；由于两项漏洞均可能被远端位姿攻击者利用，社区在各主流发行版跟踪页面同步放出了修复指引，强调凡暴露于互联网的边缘代理都应第一时间跟进。

**Source:** [Envoy v1.39.1 Security Release](https://github.com/envoyproxy/envoy/releases/tag/v1.39.1)

## 分析 (Analysis)

三大社区首次在中国合办大会，是对"云原生调用方」正在向AI演进"这一判断最直白的注脚。PyTorch本是模型训练与推理的天然落点，如今与Kubernetes生态正面同场，意味着从"AI on Kubernetes"的兼容叙事升级为"Kubernetes原生支持AI工作负载"的平台叙事——gang scheduling、HPA scale-to-zero、以及各类GPU设备插件，都是这一平台化的具体体现。对国内一线团队而言，这不仅是技术栈对接，更是本地化GPU调度、多芯适配与开源治理的交汇窗口。

v1.37把"工作负载身份"推到正式可用，是持久性的安全兑付。此前CSR由kubelet以服务账号身份代理，签名权局限，难以承载大规模证书签发；GA后的Pod Certificates让发布平台能以Scope=Node身份在集群内直接签发Pod证书，配合Cluster Trust Bundles，kubelet实现单一信任域即可验证签发方。这为未来集群间联邦、多信任域互认保留了解耦空间——对安全审计者而言，运行负载的密码学身份获取通道从此不再依赖bearer令牌的模糊职责边界。

Envoy的补丁节奏则揭示了网关层的现实处境：代理作为AI流量的第一道关口,既要承载越来越复杂的路由、重写与可观测性逻辑，又要直面HTTP/3这类新生协议的实现风险。两个高危点（请求规范化与UAF）都发生在协议解析与请求处理的交界处，恰好是代理最容易出错、也最容易被构造特殊报文攻击的区域。安全团队应把"边缘代理按安全策略打补丁"列入与K8s控制面升级同级的例行评审，而非寄望于核心组件的单点固若金汤。

最后，本周一系列稳定性相关的GA/Beta特性（metrics.k8s.io、scale-to-zero、RangeStream）都指向同一目标：让集群在大规模AI负载下既站得住、又用得省。从身份到调度再到数据面安全，v1.37把"AI时代的生产级Kubernetes"从口号变成了可审计、可升级、可依赖的工程事实。

## 结论 (Conclusion)

KubeCon China站在上海开启的，不只是三大社区的物理合体，更是云原生平台承接AI工作负载从实验走向生产的里程碑时刻。Kubernetes v1.37在工作负载身份、调度弹性与可观测性三方面同时提速，Envoy的高危补丁则提醒运维方安全升级永不停摆。建议重点关注：Pod Certificates/Cluster Trust Bundles的落地路径、HPA scale-to-zero的生产化节奏，以及边缘代理的安全更新排期。