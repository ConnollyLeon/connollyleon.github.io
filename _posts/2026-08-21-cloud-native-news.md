---
layout: post
title: "云原生技术动态：Kubeflow正式毕业与Kubernetes v1.37发布在即"
date: 2026-08-21
author: "云原生观察"
source: "https://www.hpcwire.com/aiwire/2026/08/17/cncf-graduates-kubeflow-for-production-ai-workloads-on-kubernetes/"
categories:
  - cloud-native
tags:
  - kubernetes
  - kubeflow
  - cncf
  - cloud-native
  - ai-infrastructure
---

# 云原生技术动态：Kubeflow正式毕业与Kubernetes v1.37发布在即

本周云原生领域迎来两项标志性事件——CNCF正式宣布Kubeflow毕业，确立其作为云原生AI运营标准的地位，同时Kubernetes v1.37将于8月26日发布，带来多项破坏性弃用变更需要运维团队提前应对。亚太云市场方面，腾讯与阿里巴巴加速扩张区域基础设施，而CNCF博客关于德国密码学与数据主权的深度文章则揭示了欧洲主权云的技术走向。

## 主要新闻

### Kubeflow正式从CNCF毕业，成为云原生AI运营标准

CNCF于8月17日宣布Kubeflow项目正式毕业，这是继OpenTelemetry之后云原生AI基础设施领域的又一重要里程碑。Kubeflow为在Kubernetes上运行机器学习工作负载提供了完整的工具链——包括模型训练、超参数调优、流水线编排和模型服务。毕业意味着该项目已满足CNCF最严格的成熟度要求：生产环境广泛采用、健康的维护者社区和独立的项目治理。随着企业AI工作负载大规模迁移至Kubernetes平台，Kubeflow的毕业为"AI on K8s"提供了生产级的信任背书。

**Source:** [CNCF Graduates Kubeflow for Production AI Workloads on Kubernetes](https://www.hpcwire.com/aiwire/2026/08/17/cncf-graduates-kubeflow-for-production-ai-workloads-on-kubernetes/)

### Kubernetes v1.37即将于8月26日发布，多项弃用变更需提前应对

Kubernetes v1.37定于8月26日正式发布。根据SIG Release团队7月31日发布的预览，本次版本的破坏性变更值得高度关注：静态Pod将不再能引用Secret或ConfigMap——这一变更会影响最不显眼但最容易出问题的节点清单；kube-proxy的ipvs模式进入弃用轨道，预计v1.40默认禁用、v1.43彻底移除，nftables将成为默认后端；cgroup v1继续退出进程，`failCgroupV1`自v1.35起已默认拒绝在cgroup v1节点上初始化kubelet。稳定特性方面，约16项增强功能预计毕业，包括`kubectl`的KYAML输出、Pod级资源管理和DRA设备级污点与容忍度。

**Source:** [Kubernetes v1.37 Sneak Peek](https://kubernetes.io/blog/2026/07/31/kubernetes-v1-37-sneak-peek/)

### 腾讯与阿里巴巴加速扩张亚太云基础设施

腾讯与阿里巴巴正在同步扩大其在亚太地区的云计算基础设施布局，两家中国云巨头正通过新增数据中心和服务能力争夺快速增长的区域AI与企业工作负载需求。此举发生在AWS、Microsoft和Google持续加码亚太市场的背景下，区域内多云竞争格局进一步复杂化。对于东南亚、日韩等市场的企业而言，本地化云容量的增加意味着更低的延迟、更好的数据驻留合规选项以及更强的议价能力。

**Source:** [Tencent and Alibaba expand APAC cloud infrastructure](https://www.cloudcomputing-news.net/news/tencent-alibaba-apac-cloud-infrastructure/)

### CNCF深度解析：从德式密码学到云原生数据主权

CNCF博客8月20日刊发了一篇别具一格的技术史与架构分析文章，从二战时期德国Enigma密码机与电报通信的历史出发，探讨现代云原生环境下的数据主权挑战。文章指出，加密通信、密钥管理与可信传输的历史教训直接映射到当今多云环境中的mTLS、机密管理和跨辖区数据流动问题。在欧洲监管环境日益强调"数字主权"的背景下，这类讨论为企业选择云架构时平衡合规性与技术可行性提供了重要参考。

**Source:** [German ciphers, telegrams, and cloud native data sovereignty](https://www.cncf.io/blog/2026/08/20/german-ciphers-telegrams-and-cloud-native-data-sovereignty/)

## 分析

Kubeflow的毕业是观察云原生与AI两条技术主线融合的最佳窗口。三年前，MLOps社区还在争论"专用ML平台 vs Kubernetes原生方案"，如今答案已经明朗——当DRA（动态资源分配）GA、GPU调度生态成熟、KEDA支持队列驱动的弹性伸缩后，Kubernetes事实上已经成为AI工作负载的调度层标准。Kubeflow毕业的意义不在于它本身的使用率，而在于CNCF以最高成熟度等级为其背书，这将影响大量受监管行业（金融、医疗、政府）的平台选型决策。值得注意的是，Kubeflow毕业与Broadcom升级白金会员、NVIDIA加入治理委员会几乎同期发生，云原生基金会正在系统性地把自己重塑为"AI时代的基础设施中立组织"。

Kubernetes v1.37的弃用清单则揭示了另一个趋势：安全默认值与现代化底座的强制推进。静态Pod禁止引用Secret/ConfigMap看似苛刻，实则切断了绕过API Server审计的配置注入路径；ipvs到nftables的迁移反映了内核网络栈的代际更替；cgroup v1的清退则宣告了2010年代节点镜像的终结。对平台工程团队而言，这次升级的正确姿势不是急于尝鲜新特性，而是先做三件审计：扫描所有静态Pod清单、确认kube-proxy模式、排查cgroup版本。距离v1.34 EOL（10月27日）只剩两个月，升级窗口正在收窄。

腾讯与阿里的亚太扩张则提醒我们，云原生早已不是北美主导的单极叙事。中国云厂商在东南亚的价格竞争力和本地化能力，正在迫使三大超大规模厂商在区域市场做出更精细的投资取舍。叠加欧洲的主权云运动（CNCF这篇数据主权文章正是这一思潮的技术注脚），全球云基础设施正在从"全球化规模经济"转向"区域化合规经济"。未来一年，跨云可移植性标准（Gateway API、CoHDI等）的重要性会显著上升，因为客户比以往任何时候都更需要保留"换云"的选项。

## 结论

本周的新闻共同指向一个判断：云原生技术栈已经完成向AI基础设施平台的转型，同时进入了"强制现代化"阶段。企业应关注：（1）评估Kubeflow毕业后在内部ML平台路线图中的定位，尤其是已有Ray/Kubeflow混合部署的团队；（2）立即启动v1.37升级前的三项审计，并为10月Kubernetes 1.34 EOL制定升级计划；（3）在亚太和欧洲部署策略中纳入数据主权与多云退出成本评估。云原生的下一个十年，将由AI工作负载和地缘合规这两股力量共同定义。
