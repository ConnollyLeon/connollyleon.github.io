---
layout: post
title: "云原生动态：KubeCon China开幕在即，v1.37根less与DRA特性密集毕业、v1.38周期启动"
date: 2026-09-06
author: "云原生观察"
source: "https://kubernetes.io/blog/2026/09/04/kubernetes-v1-37-rootless-beta/"
categories:
  - cloud-native
tags:
  - kubernetes
  - kubecon
  - dra
  - rootless
  - kyaml
  - cncf
  - ai
  - platform-engineering
---

# 云原生动态：KubeCon China开幕在即，v1.37根less与DRA特性密集毕业、v1.38周期启动

Kubernetes v1.37（Garhwal）发布两周后，社区本周集中放出系列特性深度解读：KubeletInUserNamespace（根less模式）正式进入Beta、DRA扩展资源（Extended Resource）达成GA、KYAML成为Stable。与此同时，v1.38发布周期已于8月31日启动，目标12月发布；而9月7至9日，首届KubeCon + CloudNativeCon + OpenInfra Summit + PyTorch Conference China将在上海召开，把云原生、开放基础设施与人工智能社区首次推向同一舞台。

## 主要新闻

### 根less kubelet进入Beta：以用户命名空间收窄容器逃逸的"爆炸半径"

Kubernetes v1.37将`KubeletInUserNamespace`特性门控提升为Beta并默认启用。启用后，节点侧全部组件（kubelet、CRI与OCI运行时、CNI插件、kube-proxy）都可在宿主机上以非root身份运行，通过Linux用户命名空间将宿主UID映射为命名空间内的root。该工作始于2018年的实验，历经v1.22的Alpha（KEP-2033），如今在CI中已成为默认的节点一致性测试基线。功能启用本身不会自动把kubelet放入用户命名空间，已有rootful集群行为不变；但`kubectl get nodes -o yaml`将新增`runningInUserNamespace`字段，供管理员对"Isolation-Sensitive"工作负载设置标签或污点。对运维而言，其直接价值是压缩CRI-O、runc、kubelet、containerd一类容器逃逸漏洞（如2022-0811、2023-27561等系列CVE）利用后的影响面，并为共享机器、边缘盒与嵌套集群（Kubernetes-in-Kubernetes）开辟新的部署形态。

**Source:** [Kubernetes v1.37: KubeletInUserNamespace (aka Rootless mode) Graduates to Beta](https://kubernetes.io/blog/2026/09/04/kubernetes-v1-37-rootless-beta/)

### DRA扩展资源GA：设备管理迈向"生产就绪"里程碑

v1.37将Dynamic Resource Allocation（DRA）的扩展资源支持提升为GA，这是DRA连续三个版本积累后的最大节点。现在，管理员可以直接在`DeviceClass`上声明扩展资源名（如`example.com/gpu`），调度器自动按DRA路径匹配设备，传统"独立设备插件"不再必需；同时`ResourceClaim.status.devices`支持网络接口名、MAC与IP等设备状态输出，`DeviceTaintRule`使驱动可为设备打污点并强制未容忍的Pod被驱逐，NUMA节点标签`resource.kubernetes.io/numaNode`也随之稳定。另一值得关注的变化是`DRAWorkloadResourceClaims`进入Beta（默认关闭）：启用后Workload与PodGroup可直接引用单个ResourceClaim并在整组Pod间共享，突破此前每Claim最多256个Pod的限制；调度器排队路径也从O(N²)级全量扫描收敛到O(1)的定向检索，实测调度性能近乎翻倍。

**Source:** [Kubernetes v1.37: DRA Updates](https://kubernetes.io/blog/2026/09/03/kubernetes-v1-37-dra-updates/)

### KYAML正式Stable：为清单配置收敛歧义

Kubernetes v1.37把KYAML——一个比标准YAML更严格、更少歧义的子集——推进到Stable，同时`kubectl get -o kyaml`输出选项也宣告稳定。KYAML并非新语言，仍是语法合法的YAML：它消除了隐式类型强转一类长期困扰行业的"惊喜"，同时保持与既有YAML解析器、旧版本kubectl和后端工具的完全兼容。开发者无需手工重写清单，`kubectl`的kyaml输出格式与`yamlfmt`等工具可以自动完成转换。对大规模平台团队而言，KYAML的意义在于将"配置方言"收敛为更可预测的规范形态，为校验、模板与AI辅助生成清单提供更稳定的底层格式。

**Source:** [Kubernetes Promotes KYAML as a Safer, More Consistent Way to Work with Manifests](https://www.infoq.com/news/2026/09/kubernetes-kyaml-manifests/)

### v1.38周期启动与KubeCon China：下一代发布与AI时代的风向标

据Last Week in Kubernetes Development（LWKD）第2026/09/04期，Kubernetes v1.38发布周期已于8月31日正式启动，最终版本目标定为2026年12月16日；为给予贡献者更多审查合并时间，v1.38起在Enhancements Freeze与Code Freeze之间插入了更长窗口。与此同时，CNCF宣布首届KubeCon + CloudNativeCon + OpenInfra Summit + PyTorch Conference China（9月7至9日，上海国际会议中心）将三大开源社区首次同台，聚焦"为生产级AI标准化平台"；同周的AGNTCon + MCPCon China（9月6至7日）则专门覆盖智能体全栈——从基础设施、生产系统、编排到MCP等智能体协议。

**Source:** [KubeCon + CloudNativeCon, OpenInfra Summit and PyTorch Conference unite in China to scale AI](https://www.cncf.io/announcements/2026/06/18/kubecon-cloudnativecon-openinfra-summit-and-pytorch-conference-unite-in-china-to-scale-ai/)

## 分析

本周v1.37系列特性解读与v1.38周期启动，共同指向两个主线。其一是"安全纵深"：根less kubelet把节点组件的权限进行"最小化"，配合pod级`hostUsers:false`与内核态seccomp，构成容器逃逸攻击的多层防线。这对监管要求高的行业与共享、多租户环境尤其关键——过去"一个漏洞梭哈整台宿主root权限"的经典攻击面正在被系统性收窄。其二是"AI硬件就绪"：DRA的GA化、设备污点与NUMA标签，本质上是让Kubernetes把GPU等异构设备当作"一等公民"来调度、隔离与排障。这与CNCF过去两周围绕"AI工厂"、GPU预测式扩缩的系列发文一脉相承：平台正在把AI训练/推理负载的调度语义（队列、配额、设备生命周期）原生化，而非依靠外部胶水层。

对平台工程团队而言，v1.37这批毕业特性应尽快进入升级与验收清单。根less模式建议先在测试集群验证CNI/CSI驱动的兼容性再推广，它并不能替代seccomp等内核级防护，而是"另一层保险"；DRA的GA意味着评估GPU集群时可以开始把独立设备插件迁移到DRA driver，并关注`DRAWorkloadResourceClaims`在超大训练场景下的价值；KYAML则适合在CI中逐步引入，作为清单格式的规范化第一步。

另一个值得紧盯的信号是KubeCon China。首次将KubeCon、OpenInfra Summit与PyTorch Conference合体，并把AGNTCon（智能体基础设施）与MCPcon并列，说明CNCF正在把"智能体经济"纳入云原生版图——MCP协议如何成为智能体接入企业系统的标准，eBPF/Ambient等无Sidecar架构如何在AI工作负载下演进，都将在上海得到集中展示。对国内团队而言，这也是观察国产GPU与Kubernetes生态融合（如DRA的国产化适配）的关键窗口。此外，v1.38调整Release Cadence释放的信号同样重要：在AI工作负载带来的增强数量持续高企的背景下，社区正通过流程优化来保障KEP质量，而不是压缩贡献者审查时间。

## 结论

Kubernetes本周的密集动作——根less Beta、DRA扩展资源GA、KYAML Stable与v1.38周期启动——共同描绘了云原生平台驶向AI时代的两条车道：安全纵深与异构硬件原生调度。9月7日开幕的KubeCon China将是观察这些能力在真实生产与智能体生态中落地的最好窗口。对运维与平台团队，建议把根less兼容性验证、DRA驱动迁移评估与本月底的v1.37 Release Team线上解读一并纳入后续一到两个季度的路线图。