---
layout: post
title: "云原生动态：Karmada正式毕业与SoftBank、Crusoe加入CNCF，KubeCon上海聚焦多集群AI编排"
date: 2026-09-09
author: "云原生观察"
source: "https://www.cncf.io/announcements/2026/09/07/cloud-native-computing-foundation-announces-karmada-graduation/"
categories: [news]
tags: [cloud-native, kubernetes, karmada, multi-cluster, cncf, AI]
---

# 云原生动态：Karmada正式毕业与SoftBank、Crusoe加入CNCF，KubeCon上海聚焦多集群AI编排

KubeCon + CloudNativeCon + OpenInfra Summit + PyTorch Conference China 2026（9月7-9日，上海）进入主会议阶段，云原生社区迎来两项重磅：跨集群编排项目Karmada正式从CNCF毕业，SoftBank Corp.与Crusoe等新成员加入以支撑"成本高效的算力主权基础设施"。同期公布的China Merchants Bank案例与CNCF-SlashData中国报告显示，云原生平台的叙事重心正从"容器化改造"全面转向"以多集群编排支撑AI训练与推理"。

## 主要新闻 (Main News)

### Karmada正式从CNCF毕业：多集群、多云编排达生产成熟度

CNCF于KubeCon上海宣布Karmada项目毕业，标志着这一"让企业无需改动应用即可跨多个Kubernetes集群、云与区域运行应用"的开源编排引擎达到生产级成熟度。伴随毕业公告，Karmada v1.19发布：面向分布式AI训练作业推进多组件调度，并将优先级调度（priority-based scheduling）提升至Beta且默认启用，确保关键工作负载优先落位。道客（DaoCloud）首席架构师Kay Yan表示，正把Karmada延伸至"AI Token Factory"架构——跨数据中心的多集群推理正变得越来越重要，毕业给予了长期生产级信心。该毕业决定由K8s背后的TOC做出，项目维护者横跨六家组织机构。

**Source:** [Cloud Native Computing Foundation Announces Karmada Graduation](https://www.cncf.io/announcements/2026/09/07/cloud-native-computing-foundation-announces-karmada-graduation/)

### CNCF迎来New Silver Members：SoftBank与Crusoe入列，算力主权基础设施成为主轴

CNCF同步宣布SoftBank Corp.、Crusoe等多家企业成为新晋Silver Member。官方表述将其定位为"加入云原生社区，帮助构建成本高效、主权化的基础设施"——Crusoe是以废弃天然气井与可再生能源为数据中心供电的算力提供商，SoftBank则是日本电信与AI基础设施巨头。在AI训练从集中转向分散推理的当口，新成员的结构暗示着CNCF社区正在把"可持续算力"与"主权云"纳入生态供给的两条新供给线。

**Source:** [CNCF Welcomes New Silver Members as Enterprises Scale AI From Training to Inference](https://www.cncf.io/announcements/2026/09/07/cncf-welcomes-new-silver-members-as-enterprises-scale-ai-from-training-to-inference/)

### 招商银行摘得CNCF用户案例赛冠军：Kubernetes统一AI训练与推理的量化账本

在KubeCon上海的用户案例竞赛中，招商银行凭借"在Kubernetes上统一AI训练与推理"的实践夺冠：新平台将GPU加速器的平均计算利用率从35%提升至60%以上，每百万token推理成本下降超过60%。招行的案例展示了云原生平台如何把分散在训练集群与推理服务中的算力资源池化，借助Kubernetes调度器处理弹性扩缩、故障恢复与多团队共享——这既是算力经济账，也是治理账：统一的平台意味着可观测、可审计、可计费。

**Source:** [China Merchants Bank Wins CNCF End User Case Study Contest for Unifying AI Training and Inference on Kubernetes](https://www.cncf.io/announcements/2026/09/07/china-merchants-bank-wins-cncf-end-user-case-study-contest-for-unifying-ai-training-and-inference-on-kubernetes/)

### CNCF-SlashData报告：中国IIoT开发者云原生采用率48%领先全球，AI走向推理驱动采用

CNCF与SlashData在KubeCon上海联合发布中国云原生报告：中国工业物联网（IIoT）开发者中48%采用云原生技术，高于全球42%的平均水平。报告将增长动力归结为"AI从训练转向推理"——推理工作负载更分散、更贴近边缘与业务系统，恰恰是Kubernetes与云原生生态擅长应对的异构环境。作为本届KubeCon三大社区（CNCF、OpenInfra、PyTorch）首次中国合体的注脚，这份报告把"中国云原生开发者基座"与"AI推理扩散"两点直接绑定。

**Source:** [CNCF and SlashData Report Highlights China's Cloud Native Momentum as AI Moves to Inference](https://www.cncf.io/announcements/2026/09/07/cncf-and-slashdata-report-highlights-chinas-cloud-native-momentum-as-ai-moves-to-inference/)

## 分析 (Analysis)

Karmada毕业是本周最值得玩味的里程碑。它把Kubernetes生态的"扩充叙事"从单集群内部（调度、存储、网络）正式推向"多集群编排"——当单集群的容量上限与地域边界成为瓶颈，跨集群、跨云、跨地域的统一控制面就成了AI时代的底座。Karmada之所以能毕业，靠的不是炫技特性，而是把"优先级调度默认启用""多组件调度支持分布式训练"这类贴近AI工作负载的生产能力做实。对平台团队而言，Karmada毕业的信号非常明确：多集群不再是可以延后的"锦上添花"，而是承接AI训练/推理规模化时必然要面对的工程选择题。

SoftBank与Crusoe加入CNCF，则是产业供给结构的直接反映。Crusoe的"边角料能源即算力"模式此前多活跃在数据中心直供语境，如今进入云原生基金会会员序列，说明"算力成本"与"电力约束"已从基建议题上升为开源治理议题；SoftBank则代表"主权AI"对开源中立层的需求——建设区域化算力不能只买GPU，还需要一套可审计、可扩展的软件底座。这两类新成员的出现，实际上把CNCF由"容器技术社区"推向了"AI算力基础设施社区"。

招行的60%利用率与60%+推理成本下降，给出了云原生之于AI最直接的商业论据。训练与推理长期被当作两条独立轨道：训练集群追求吞吐，推理追求延迟，中间是漫长的模型搬运与资源空转。招行把两者收敛到同一个Kubernetes底座上，换来的是池化与混部收益。这个账本对金融、制造等有规模算力投入的行业有普适意义——利用率提升不再依赖专用硬件，而是依赖调度与编排层的优化。

最后，从SlashData报告到三大社区合体，中国市场的特殊性值得关注：48%的IIoT采用率背后，是大量制造业与能源企业在Kubernetes上跑边缘推理的现实。可以预见，中国云原生社区接下来的竞争焦点将从"是否容器化"转向"多集群编排与推理平台化"，而这正是Karmada、KubeEdge等项目的天然主战场。

## 结论 (Conclusion)

KubeCon上海主会议传递的主线清晰：多集群编排（Karmada）、算力主权基础设施（SoftBank/Crusoe）、AI训练推理一体化（招行案例）共同勾勒出云原生在AI时代的下一站。建议读者跟踪：Karmada v1.19多组件调度在生产环境中的实际收益、Crusoe类"另类能源+云原生"模式对AI成本的压缩幅度，以及国内金融/制造行业复制招行"统一GPU利用率"模式的落地速度。