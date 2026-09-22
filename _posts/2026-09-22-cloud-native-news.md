---
layout: post
title: "云原生动态：Kubernetes 1.37正式发布聚焦稳定与AI/ML负载、Cloudflare以按源站实测切换TLS密钥交换将握手重试从52%降至3.7%、v1.37 Pod证书与集群信任绑定转正"
date: 2026-09-22
author: "云原生观察"
source: "https://www.infoq.com/news/2026/09/kubernetes-1-37/"
categories: [cloud-native]
tags: [cloud-native, kubernetes, v1-37, garhwal, metrics-api, rootless-kubelet, hpa-scale-to-zero, watchcache, cloudflare, tls, x25519, post-quantum, pod-certificates, cluster-trust-bundles, security]
---

9月21日，云原生在"调度平台底座"与"传输层身份与安全"两条线上同时取得关键进展。平台侧，CNCF正式发布Kubernetes 1.37（代号Garhwal），以67项增强把重点放在稳定性、安全性与AI/ML工作负载优化上——Metrics API转正GA、rootless kubelet与HPA scale-to-zero进入Beta、弹性WatchCache转正；网络与安全侧，Cloudflare用"按源站实测TLS密钥交换偏好"替代了此前固定的X25519猜测，把HelloRetryRequests重试率从约52%砍到3.7%，p90握手延迟下降超过150ms；同日Kubernetes官方博客详解v1.37中Pod证书与集群信任绑定（Cluster Trust Bundles）的GA路径，为集群内的X.509身份体系铺平道路。

## 主要新闻 (Main News)

### Kubernetes 1.37正式发布：Metrics API转正GA、rootless kubelet与HPA scale-to-zero进入Beta

CNCF于9月21日宣布发布Kubernetes 1.37。本次发布包含67项增强：27项进入alpha、23项进入beta、16项达到GA、1项被弃用。核心交付包括：Metrics API转正为GA，为水平与垂直扩缩容、自动巡检等依赖资源用量的下游组件提供了稳定契约，HPA的scale-to-zero（缩容至零副本）随之进入Beta并默认启用；KubeletInUserNamespace（以rootless模式运行kubelet）进入Beta，进一步把控制面与托管节点推向非root默认的安全基线；弹性WatchCache（resilient watch cache）转正，提升大规模集群下list/watch路径的稳定性。整个版本以"稳定、安全、AI/ML工作负载优化"为主题，官方发布网络研讨会定于9月23日举行，v1.38预计于2026年12月发布。

**Source:** [Kubernetes 1.37 Released: Stable Metrics API and Rootless Kubelet in Beta | InfoQ](https://www.infoq.com/news/2026/09/kubernetes-1-37/)

### Cloudflare按源站实测TLS密钥交换偏好：握手重试从52%降至3.7%

Cloudflare近日部署"Automatic Key Exchange"机制，弃用此前对源站TLS密钥协商算法的静态X25519猜测：此前若源站偏好的算法与猜测不符，握手会以HelloRetryRequest（HRR）重试一次才能真正建立连接，扫描范围内HRR比例一度高达约52%。新方案按源站逐一测量其实际偏好的密钥协商算法（同时计入混合后量子密钥份额），使扫描源站上的HRR从约52%降至3.7%，p90握手延迟因此下降超过150ms。对以互联网边缘为业务核心的站点，这一改动几乎零成本地把"首次连接质量"提升了一个量级，也为TLS 1.3生态中"固定默认"向"智能协商"演进再添一例。

**Source:** [Cloudflare Measures Origin TLS Preferences, Cutting Handshake Retries from 52% to 3.7% | InfoQ](https://www.infoq.com/news/2026/09/cloudflare-automatic-key-exchang/)

### v1.37 Pod证书与集群信任绑定（Cluster Trust Bundles）转正

Kubernetes官方博客（8月28日发布、9月20日更新）详解了v1.37中两项身份相关特性的GA：Pod Certificates允许Pod在启动后通过kubelet自动获取由集群内CA签发的证书，证书以CSI卷编排的轮换形式提供给容器，让工作负载以受管方式获得可持续轮换的X.509身份；ClusterTrustBundle则让集群管理员能够把外部信任锚（X.509根链）作为标准资源分发，供控制器与工作负载在集群内引用并消费。两者组合后，Kubernetes第一次具备了"原生签发、分发、轮换"的完整节点/工作负载身份原语，为mTLS服务网格、外部PKI对接与多集群信任传播提供了统一接口。

**Source:** [Pod Certificates and Cluster Trust Bundles in Kubernetes v1.37 | Kubernetes Blog](https://kubernetes.io/blog/2026/08/28/kubernetes-v1-37-pod-certificates-and-cluster-trust-bundles/)

## 分析 (Analysis)

Kubernetes 1.37把"稳定性与AI/ML就绪"写进发布主题，是对过去两个版本节奏的自然衔接。Metrics API转正GA意味着扩缩容、自动巡检等以用量为输入的控制逻辑历史上第一次拿到稳定契约——HPA scale-to-zero随之默认开启，指向"夜间GPU/内存资源自动归零、白昼竞价扩容"这类成本治理场景的标准化；rootless kubelet进入Beta则延续了v1.37存储加固以来的安全主线，把"以非root运行运行时"从实验选项推向默认安全基线。三者叠加，v1.37实质上在回答"如何让集群既能扛住AI负载的陡峭峰值、又能在不使用时把浪费归零"这一平台团队最关切的命题。

Cloudflare的TLS改动是"数据驱动传输层优化"的教科书案例。握手重试从52%降到3.7%、p90延迟削减150ms+，收益全部来自一个朴素的洞察：源站对密钥协商算法的偏好各异，与其用单一猜测赌概率，不如逐源测量并按需协商，同时把后量子密钥份额纳入测量范畴。对平台与网络工程团队，这意味着"默认不动"的传输层参数同样存在可量化的优化空间；而对TLS/后量子迁移的观察者，这一改动说明混合密钥协商正在从"标准备选"走入"生产默认"，实测数据将成为其推广的最强说服力。

Pod证书与Cluster Trust Bundles的GA，把Kubernetes的"身份叙事"从服务账号（ServiceAccount token）推进到完整的X.509体系：证书自动签发、以CSI卷轮换供给、信任锚以原生资源分发。这为Pod级mTLS、工作负载对外部PKI的依赖解耦、以及跨集群信任传播提供了标准原语，也让多年来自行拼装cert-manager与自建CA的团队多了一条"内核级"的可选路径。结合本版的资源洞察特性，Kubernetes正在把"信任与度量"双双做成平台默认能力，而非事后插件。

## 结论 (Conclusion)

过去24小时的三条云原生进展，共同刻画了2026年"AI就绪型Kubernetes"的完整拼图：v1.37用Metrics API、scale-to-zero与rootless kubelet把稳定性与成本治理做成默认值；Cloudflare用逐源实测把传输层质量提升到新的数量级；Pod证书与集群信任绑定则为规模化集群补上内生身份底座。对实践者的下一步建议是：升级规划中优先验证Metrics API上的下游组件兼容性与scale-to-zero的混布风险，在边缘站点复制Cloudflare式的握手重试监控以量化自身收益，并评估Pod证书/ClusterTrustBundle作为现有cert-manager体系的补充或替代——三者叠加，正是把Kubernetes从"能跑AI"升级为"为AI而设计"的关键一跃。