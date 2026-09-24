---
layout: post
title: "云原生动态：AWS Elastic Beanstalk新增Cluster Mode在共享EKS集群上运行应用、Modal以每秒数万规模重建沙箱调度绕过Kubernetes集中协调、CRI-O检查点恢复漏洞CVE-2026-92574可绕过Pod安全策略"
date: 2026-09-24
author: "云原生观察"
source: "https://www.infoq.com/news/2026/09/elastic-beanstalk-cluster-eks/"
categories: [cloud-native]
tags: [cloud-native, aws, elastic-beanstalk, eks, eks-auto-mode, kubernetes, modal, sandbox, scheduling, scalability, cri-o, checkpoint, criu, cve-2026-92574, pod-security, security]
---

9月23日，云原生平台演进与运行时安全再次成为焦点。平台侧，AWS推出Elastic Beanstalk的Cluster Mode，让应用以容器形式运行在共享的EKS集群上——节点由EKS Auto Mode提供、观测测基于OpenTelemetry，直指"多个应用共享底层Kubernetes"的成本治理命题；同一时间，Modal工程师以技术博客详解如何重建沙箱基础设施，用"去集中协调"的调度架构在数秒内创建100万个并发沙箱，直言传统Kubernetes的etcd与集中调度在超高频率Pod编排下成为瓶颈；安全侧，CVE-2026-92574披露CRI-O在从检查点（checkpoint）恢复进程时可能把旧的凭据、权限与seccomp状态带进目标Pod，绕过Kubernetes的准入与安全策略声明。三者叠加，勾勒出"平台如何变便宜、编排如何突破规模化极限、运行时如何守住信任边界"三条主线。

## 主要新闻 (Main News)

### AWS Elastic Beanstalk新增Cluster Mode：应用从EC2环境迁移到共享EKS集群

AWS于本周推出Elastic Beanstalk的Cluster Mode，与原有基于EC2的环境类型（现称Beanstalk Standard）并列。新模式下，开发者提交源码、Dockerfile或ECR镜像，服务在用户账户内用Cloud Native Buildpacks在CodeBuild上构建镜像，节点来自EKS Auto Mode，观测走OpenTelemetry。其核心价值是共享：同一账户中采用相同VPC子网集的环境会加入同一个集群，应用以无状态模型运行在共享节点上，从而把底层基础设施成本摊薄。代价同样明确：用户无法选择集群或其Kubernetes版本，子网与集群IAM角色一经确立不可更改；若有人在Elastic Beanstalk之外改动集群，服务将检测到配置漂移、停止维护并拒绝其上环境更新。隔离由默认的网络流量阻断提供，但AWS文档明确提醒"共享集群并不等同于隔离集群"，合规敏感或跨租户场景仍建议分割子网与集群。计费上Cluster Mode在EC2费率之外新增按集群计的EKS小时费与EKS Auto Mode管理费。

**Source:** [Elastic Beanstalk Adds Cluster Mode, Running Applications on Shared EKS Clusters | InfoQ](https://www.infoq.com/news/2026/09/elastic-beanstalk-cluster-eks/)

### Modal重构思调：在Kubernetes之外用"去集中协调"秒级创建百万级沙箱

Modal的员工工程师Colin Weld与Connor Adams发表技术文章，讲述如何从零重建沙箱基础设施以支撑每秒数万个沙箱创建、总量达数百万并发的规模。他们给出的理由是：Kubernetes依赖中心化协调与强一致状态，调度算法与etcd的负载随节点和Pod数量同步增长，而Pod与节点对etcd的多重写入在高创建率、高扩容风暴下会成为硬瓶颈，且etcd无法在键空间内原生分片。Modal的解法是"绕过全局协调"：每个worker自身即事实来源，用一组并行运行的调度服务器替代单一串行调度器，使调度层可以水平扩展；整个系统唯一的瓶颈是一个Redis流，据称在超过10万个worker之前仍然可行。基准测试中，他们在1分钟内创建了100万个沙箱，中位启动到运行代码时间低于0.5秒。AWS首席AI工程师Alex Jones的评价颇具深意：这是"Kubernetes未能足够快速适配GenAI基础设施需求的首个可信信号"，指向协调平面与执行平面正在解耦。

**Source:** [Beyond Kubernetes at Modal: How to Scale 1 Million Concurrent Sandboxes in Seconds | InfoQ](https://www.infoq.com/news/2026/09/modal-scaling-sandboxes/)

### CRI-O检查点恢复漏洞CVE-2026-92574：进程安全状态可穿越Pod边界

安全研究披露的CVE-2026-92574影响CRI-O（受影响版本1.34及之后，Red Hat OpenShift 4.17起受影响）。容器运行时通过CRIU（Checkpoint/Restore In Userspace）从检查点恢复进程时，所保存的进程状态不仅包含应用内存，还包含与身份和权限相关的信息：凭据、Linux capabilities、no_new_privs与seccomp状态都可能从检查点数据中原样恢复，从而覆盖目标Pod声明请求的安全规则。这造成"策略声明与运行进程脱节"：Kubernetes可能批准了一个受限配置，而实际运行的进程保留了制作检查点时更宽泛的权限集。目前无活跃利用报告，攻击前提是攻击者能创建来自恶意检查点镜像的Pod且集群启用了checkpoint restore。公告称修复已应用到受支持的发布分支但尚未发布，管理员应关注厂商渠道获取修复版本，并按"检查点即特权工件"来管理恢复权限、镜像仓库准入与运行时验证。

**Source:** [CRI-O Restore Flaw Can Bypass Kubernetes Security Policies | LinuxSecurity](https://linuxsecurity.com/news/security-vulnerabilities/cri-o-restore-kubernetes-privilege-boundaries)

## 分析 (Analysis)

Elastic Beanstalk的Cluster Mode是AWS对"管理服务是否应该替用户藏起Kubernetes"这一问题的最新回答。它把Beanstalk既有的应用、版本、环境抽象直接映射到共享EKS集群上，用EKS Auto Mode消化节点运维、用Buildpacks消化镜像构建、用OpenTelemetry统一观测，实际上是把"平台工程"的默认值做成了产品。此举直击多应用共享基础设施场景的成本痛点——共享节点是节省的来源，但代价是失去对集群、网络与隔离粒度的自主权。对平台团队而言，Cluster Mode的价值不在于替代EKS或ECS，而在于为"中等规模的应用组合"提供一条运维负担极低的新路径；真正的悬而未决之处是它与ECS的边界能否保持清晰，以及当用户在Beanstalk之外改动集群后"停止维护"的惩罚逻辑如何影响GitOps协同。

Modal的实践则提出了更根本的命题：当Pod创建频率到达"秒级数万、总量百万"量级时，etcd为中心的强一致模型在物理上不再适配。Modal没有改造Kubernetes，而是绕开了它——用每worker自持状态加并行调度器，把调度从"全局决策"退化为"接近负载均衡"。这种"协调与执行解耦"的架构主张，与AWS工程师"Kubernetes未跟上GenAI基础设施需求"的判断相互印证。值得从业者警惕的是：Modal的例子恰恰说明，Kubernetes并非所有沙箱类工作负载的终点，平台选型需要按创建频率与状态一致性要求来分层——低频长生命周期服务仍属于Kubernetes，而高频微隔离沙箱可能需要专门的执行平面。

CVE-2026-92574把注意力拉回一个容易被忽视的事实：Kubernetes的安全模型建立在"声明即事实"之上，而checkpoint恢复打破了这一假设。当运行时可以从检查点中恢复凭据、capabilities与seccomp状态，准入控制与YAML声明的可信度就有了前提条件。该漏洞的真正教训不是"CRI-O有问题"，而是容器安全的信任边界必须延伸到运行时的每一个状态注入路径：检查点镜像应当被视为与特权镜像同级的工件，恢复权限要与普通Pod创建权限彻底分离。随着K8s v1.37将Pod证书与集群信任绑定推向GA、支撑更多的状态化身份流转，这类"状态如何被信任与验证"的问题只会更加关键。

## 结论 (Conclusion)

过去24小时的三条云原生新闻，从不同侧面刻画了平台工程进入"规模与信任分水岭"的现状：Elastic Beanstalk Cluster Mode用共享EKS把基础设施成本做薄，说明托管平台正在把"替用户运营Kubernetes"与"替用户隔离"拆分定价；Modal的百万沙箱架构则证明，面向GenAI的下一代执行平面可能不再由Kubernetes形状的系统独享，协调与执行正在解耦；而CRI-O检查点漏洞提醒所有平台团队，安全策略只有在运行时真正逐位验证时才可信。对实践者，下一步行动清单可以是：评估Cluster Mode对自身"多应用共享集群"场景的适配性与EKS双层计费的影响；在面向高频沙箱/代理负载的平台设计中，把"调度是否必须全局强一致"作为首要架构问题；并将checkpoint镜像纳入特权工件管理，在启用恢复功能前完成权限审计与运行时加固。

---
*本文基于2026年9月23日公开资讯整理，来源URL均经核验可访问。*