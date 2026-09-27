---
layout: post
title: "云原生动态：Docker Cloud Sandboxes把microVM代理执行搬上托管云并与本地沙箱互通、Kits v3把Agent权限清单改为一等OCI镜像、AWS解读MCP新规范如何取消无状态MCP服务器的会话亲和要求、OpenTelemetry与Prometheus互操作调查两年后仍有缺口、Cloudflare披露博客从WordPress迁到自建EmDash的7千RPS实践"
date: 2026-09-27
author: "云原生观察"
source: "https://www.infoq.com/news/2026/09/docker-cloud-sandboxes/"
categories: [cloud-native]
tags: [cloud-native, docker, cloud-sandboxes, microvm, ai-agent, isolation, kits, oci-artefacts, mcp, model-context-protocol, stateless, serverless, lambda, session-affinity, opentelemetry, prometheus, observability, interop, vendor-lock-in, opensource, cncf, cloudflare, emdash, workers, edge-compute, planet-scale, kubernetes, liveness-probe]
---

9月25日至26日，云原生生态的消息集中在两条主线上：一条是**AI代理的执行基础设施正在向托管侧迁移并走向标准化**——Docker推出Cloud Sandboxes，把microVM里的代理执行搬到Docker托管的云上，并允许沙箱在笔记本与云之间一条命令迁移；同一时间，Kits v3把原本独立分发的Agent工具包改为一等OCI镜像，权限清单与代理同镜像分发；AWS则系统解读了MCP最新规范如何移除协议层会话，使无状态MCP服务器不再需要会话亲和。另一条是**可观测性与厂商锁定这两项"元问题"同时出现可量化的进展与遗留缺口**：2026年互操作调查显示OpenTelemetry与Prometheus的易用度确实改善，但数据模型对齐、resource属性处理等缺口仍被受访者点名；Cloudflare则公开了自己把主博客从WordPress迁到自研TypeScript内容系统EmDash的完整工程细节，包括约75 RPS常态、峰值5000+ RPS、实测7000 RPS的容量选择。两条线合起来说明，云原生正在把重心从"跑容器"移向"跑不可信代码"与"看清系统在发生什么"。

## 主要新闻 (Main News)

### Docker Cloud Sandboxes：一条命令把microVM代理执行从笔记本搬到托管云

InfoQ报道，Docker推出Cloud Sandboxes，在Docker托管的基础设施上提供安全的托管执行环境，专门用于运行AI编码代理，其底层是基于硬件强制的microVM隔离，并沿用与本地Docker Sandboxes相同的隔离模型与CLI。关键能力是沙箱可在本地与云之间迁移：`sbx move my-project --to cloud` 会"捕获沙箱的文件系统并在另一侧重建它，让你的工作得以延续"。Docker把这一能力定位在长时程、并行代理执行上，宣称开发者可以"同时跑十几个代理，每个跑五小时、十小时或21小时，全程不必盯着它们"，每个任务隔离在自己的云沙箱中。公司同时出货预配置的kits，并明确在Kits v3规范中kits不再是独立工件，而是被打包为标准OCI镜像，可直接用`build`与`pull`操作，也可作为构建更复杂kits的基础。Deutsche Bank首席DevOps工程师Florin Lungu评价称，"有趣的是，这项创新让在microVM环境中进行安全的自主编码成为可能"。不过评论区的反驳同样值得记录：隔离只是部分的——任何有用的代理仍然需要对PyPI、Docker Hub或Hugging Face等服务的窄范围网络访问，"它们完全可以只与被授予访问权的少数服务对话，并通过与它们对话来破坏它们，同时仍待在沙箱内部"，有读者因此认为"传统沙箱不会是正确的抽象"。

**Source:** [Docker Cloud Sandboxes Provide a Consistent Sandbox Abstraction Across Laptop and Cloud | InfoQ](https://www.infoq.com/news/2026/09/docker-cloud-sandboxes/)

### MCP新规范取消协议层会话：无状态MCP服务器不再需要会话亲和

InfoQ报道，AWS详细解读了最新版Model Context Protocol（MCP）规范对远程MCP服务器部署的改变：**协议层的会话被移除**，请求可以到达任意可用服务器实例，从而消除了对粘性会话（sticky sessions）与共享会话存储的协议性要求。规范取消了`initialize`/`initialized`握手与`Mcp-Session-Id`头，新增可选的`server/discover`操作，并引入MRTR以替代此前需要保持长连接的服务器发起的请求，改由`input_required`响应支撑多步交互。新增的`Mcp-Method`与`Mcp-Name`头支持网关路由与限流，W3C Trace Context支持分布式追踪，`ttlMs`与`cacheScope`提供缓存控制；同时**流可恢复性被移除**，客户端可能需要重试被中断的操作，这使有副作用的工具调用对幂等性的要求显著提高。AWS架构博客作者Anand Komandooru、Steven DeVries与Haleh Najafzadeh把这些变化映射到Well-Architected Agentic AI Lens，并指出AWS Lambda现在作为部署选项才真正契合请求-响应模型，因为持久会话不再是必要前提。迁移仍需过渡路径：Apify的MCP服务器项目正在会话式服务器之外并行实现无状态支持，并为两个协议版本准备路由与一致性测试，AWS建议在网关层跟踪协议版本、并保留会话基础设施直到遗留流量清零。Michael Madsen把这一变化总结为："协议是无状态的。你的应用不必如此。"

**Source:** [Stateless MCP Removes Session Affinity Requirements for AWS Server Deployments | InfoQ](https://www.infoq.com/news/2026/09/aws-stateless-mcp/)

### OpenTelemetry与Prometheus终于"处得来"了？2026年互操作调查：易用度升至3.6，但缺口仍在

The New Stack在Road to KubeCon专题中公布了2026年Prometheus与OpenTelemetry互操作调查的结果，并直言两者正在"处得来"。改善是可量化的：平均易用度评分上升0.5分，从3.1升至3.6；认为两者难以配合使用的受访者比例从29%降至10%。受访者中约一半在基础设施指标上混用Prometheus风格与OTel风格埋点，30.7%在应用指标上同时使用两者。OTel贡献者Dhruv Ahuja（SigNoz）、Andrej Kiripolsky与Arthur Sens（Grafana Labs）以及Ana Muenz表示"两年在互操作上的工作正在见效"。但受访者点名的遗留缺口依然存在：两个项目的数据模型需要更好的对齐、resource属性与元数据处理需要改进、命名与格式问题仍然偏多。该期还报道了Atlassian把指标从`gostatsd`迁移到OpenTelemetry的案例，覆盖14个区域约10万台主机；由于保持面向服务的接口不变，这成了一次"平台团队式的迁移"，聚合侧在同等流量下CPU占用降至约一半，sidecar成本在集群规模上下降约30%。New Relic的2026年可观测性预测（基于2575位IT与工程负责人）发现73%的组织已标准化于OTel、正在迁移或处于测试阶段，83%认为可观测性对AI生成代码至关重要，而组织每年因高影响级故障平均损失7400万美元——每小时185万美元，或系统每宕机一分钟超过3万美元。该期以11月9日在盐湖城KubeCon + CloudNativeCon北美站举办的Observability Day收尾，Capital One、Cisco与Nubank将分享项目进展与经验。

**Source:** [OpenTelemetry and Prometheus are getting along. What's still missing? | The New Stack](https://thenewstack.io/opentelemetry-prometheus-observability-interoperability/)

### Cloudflare公开WordPress→EmDash迁移：约75 RPS常态、峰值5000+、实测7000 RPS的边缘内容架构

InfoQ报道，Cloudflare记录了把主博客从WordPress迁移到EmDash的全过程——EmDash是Cloudflare内部自建、定位为WordPress后继者的开源TypeScript内容管理系统，Cloudflare自称该项目的"Customer Zero"。生产环境中EmDash运行在Worker上，前面有多层缓存——Workers Cache加上构建在Workers KV之上的EmDash对象缓存；Cloudflare Hyperdrive负责把EmDash连到PlanetScale数据库。该博客通常处理约每秒75个请求，峰值超过5000 RPS，而新平台被测试到可处理7000 RPS。对比p95响应延迟，旧WordPress架构（绿线）在负载下呈现周期性尖刺，而EmDash方案（黄线）"保持了非常平坦、一致的响应曲线"。迁移采用了一个代理Worker，通过设置版本cookie进行流量路由，并在任何500错误时自动回退到旧博客，从1%流量起步，"一天之内"达到100%。迁移还为Cloudflare博客与EmDash各自增加了MCP服务器，使作者可以浏览、创建、编辑、发布与排期内容；编辑侧在早期采用中遇到编辑体验与定时发布方面的问题，Cloudflare表示正在推进一个v1版本但未公布日期。

**Source:** [Cloudflare Details Its Migration from WordPress to EmDash | InfoQ](https://www.infoq.com/news/2026/09/cloudflare-emdash-migration/)

### 两则反思性报道：开源不是锁定豁免；一个缺失的二进制如何把liveness探针变成重启循环

The New Stack刊出一篇观点文章，主张厂商锁定的问题不在于"依赖厂商"，而在于"变得过于昂贵或不切实际以致无法解开的依赖"——它在API、托管服务、身份模式、可观测性管线与运维工具中累积。文中直接点名云原生案例：托管数据库引入专有扩展后应用代码开始假定其存在，"一个Kubernetes环境可能绑定到某一家云的IAM、网络、存储与负载均衡模型上"，"可观测性与日志管线可能围绕单一供应商的格式硬化"。文章推荐的检验标准是可逆性——在承诺之前就确定日后改变主意的难度。它以Linux内核数千名code owner使重新许可不切实际、以及Kubernetes的Apache 2.0许可加CNCF治理作为"没有任何单一厂商（包括SUSE）能事后从项目既有形态中收回这些开源权利"的持久保护，并复盘了2023年HashiCorp把Terraform从MPL 2.0改为BUSL 1.1、社区fork出OpenTofu（现为Linux Foundation项目、仍用MPL 2.0）的案例。文章自带的前提是："开源同样不提供免于锁定的保证，因为团队仍然可以在开放基础上构建紧密耦合。"

Cloud Native Now则收录了一个故障复盘：一个从Redis取任务的Node.js worker陷入崩溃循环，原因是它的exec型liveness探针实际执行的是`pgrep -f server/worker`，而精简运行时镜像里并没有`pgrep`——于是kubelet把每一次检查都判定为存活失败，反复重启一个完全健康的worker，直到进入`CrashLoopBackOff`。修复方案是在仅Pod内可见、无任何Service暴露的健康端口上加了一个小HTTP服务：`/health`返回worker数量与`process.uptime()`并刻意不触碰Redis，以免Redis故障触发同时重启而制造第二起事故；`/ready`执行带两秒超时的Redis实时ping，失败时返回503。两个探针均使用`httpGet`，配置为`periodSeconds: 30`、`timeoutSeconds: 5`、`failureThreshold: 3`。核心教训是：就绪探针可以把Pod的`Ready`条件置为false并把它移出匹配Service的端点，但"它无法阻止队列消费者继续接收工作"——Kubernetes并不把Service就绪状态与外部队列的消费者生命周期关联起来，排空必须由应用自己处理。

**Source:** [Avoiding vendor lock-in through an open-source approach: a developer's perspective | The New Stack](https://thenewstack.io/avoiding-vendor-lock-in/)

**Source:** [A Missing Binary Turned a Kubernetes Liveness Probe Into a Restart Loop | Cloud Native Now](https://cloudnativenow.com/contributed-content/a-missing-binary-turned-a-kubernetes-liveness-probe-into-a-restart-loop/)

## 分析 (Analysis)

把Docker的两条消息合起来读，会发现一个此前不明显的事实：**"代理的权限"与"代理的算力位置"正在被当作同一类工程问题处理**。Kits v3把权限清单变成一等OCI镜像，Cloud Sandboxes把执行位置从笔记本搬上托管云——这两件事的技术实现完全不同，但产品逻辑完全一致：让一次代理会话同时具备**可移植的身份**（镜像）与**可迁移的状态**（文件系统快照）。`sbx move`之所以能成立，前提正是Kit在镜像里而非绑在某个本地运行时上；反过来，Kits之所以能被pin住，前提也是沙箱的持久化边界被明确定义为"整个文件系统"。这套组合拳在形态上非常接近2013年"容器即交付单元"的翻版，只是这次被封装的不是服务，而是**一段要在不可信环境中自主运行数十小时的程序**。评论区的反驳恰好指出了这个抽象的裂缝：Kit描述的权限清单管的是"能访问哪些主机、凭据与卷"，但管不了"代理通过被授权的PyPI做些什么"。这不是实现缺陷，而是当前沙箱抽象的共同天花板——**授权粒度与行为粒度之间的鸿沟，只能靠目标侧（供应链信任、可复现构建、包签名）而非执行侧来弥合**。

MCP去会话化的技术影响被普遍低估了。表面看这是协议层的一次瘦身，实际上它拆掉了一个长期横亘在MCP生态面前的架构约束。粘性会话的存在意味着MCP服务器架构上隐含要求"有状态"：要么有中心化的会话存储，要么依赖负载均衡器的哈希路由。这两条路在多可用区、跨区域、Serverless部署下都不成立——Serverless尤其致命，因为实例随时可能被回收，粘性哈希无处可依。MCP此前的实际做法是让社区各自发明变通：把会话塞进进程内存、依赖特定网关的路由能力、或者干脆退回到"一个长连接对应一个常驻进程"的模型，这直接推高了Serverless部署的成本与复杂度。移除会话后，MRTR以`input_required`响应承载多步交互，`Mcp-Method`/`Mcp-Name`把路由与限流责任显式上移到网关层——**协议从"隐含分布式"变成了"显式可分布"**。但代价同样明确：流可恢复性被移除意味着长任务的中断现在要靠客户端重试兜底，而有副作用的工具调用一旦重试就是重复执行。AWS给出的迁移路径（网关层并行跟踪协议版本、保留会话基础设施直到遗留流量清零）在工程上是诚实的，Apify同时实现两版并做一致性测试的做法值得作为参考范式。对平台团队而言，接下来12个月的可观测指标应是：**有多少MCP服务器实现了"任意实例可服务任意请求"，以及网关侧的幂等与重试语义是否被当作一等公民设计**。

互操作调查的数字值得逐个读。"认为两者难以配合使用的比例从29%降至10%"是本轮最实质的成果，它说明两年工作在**上手体验**这一层已经收效；但同一份数据里"约一半受访者混用两种风格做基础设施指标"也说明，**收敛并未发生，只是变容易了**。这是两种截然不同的成功形态：易用性改善可以被新项目快速享受，而数据模型对齐、resource属性语义、命名与格式的收敛需要生态做破坏性迁移，通常以年为单位。这解释了为什么"标准化"这件事在可观测性领域反复出现又反复未竟——**指标、标签、resource、span这四类信号各自的历史包袱不同，最容易统一的（指标格式）已经统一，最难统一的（语义与元数据）至今悬而未决**。Atlassian的案例是这轮进展最有说服力的证据：10万台主机、14个区域之所以能迁，关键不在于OTel有多好，而在于"保持面向服务的接口不变"这一条工程约束——把迁移变成平台团队而非业务团队的负担。新Relic那组数字则从另一侧提醒，可观测性已经不只是工程问题：73%已标准化或正在迁移意味着OTel已成为事实上的默认，而每分钟3万美元的停机成本意味着可观测性的投入产出比已经越过了一个大多数CFO能理解的阈值。

Cloudflare的EmDash迁移与那篇反锁定的文章构成了一组有趣的互文。前者是一个超大用户亲手替换掉运行十余年的内容系统，而它给出的技术论证完全是云原生的：把有状态的CMS拆成"Worker + KV对象缓存 + Hyperdrive连接池 + 代理Worker做灰度与自动回退"，本质是**用无状态的边缘计算原语重新实现一个有状态应用的状态管理**。其中"任何500错误自动回退到旧系统、从1%起步一天到100%"的灰度方式尤其值得平台团队抄——它把金丝雀发布的标准形态（按比例路由 + 指标驱动推进）简化成了一个纯规则版本，在没有完整可观测栈的情况下依然可用。而那篇反锁定文章的核心论点"锁定不在于依赖厂商，而在于无法解开的依赖"，用Terraform→OpenTofu的案例做了最锋利的证明：一个以开放著称的工具，仅仅改了一次许可，社区就用fork的方式承担了全部迁移成本。文章那句"开源同样不提供保证，因为团队仍然可以在开放基础上构建紧密耦合"，其实点出了比厂商锁定更难治的病——**依赖不是被厂商锁住的，是被自己的应用代码结构锁住的**，专有扩展一旦被写入ORM查询、被写入CI流水线，锁定就已经完成，与许可证无关。这也正是Docker把Kits权限清单做成OCI镜像的深层意义：它试图把"权限"从应用代码里的隐性假设，变成镜像标签层面的显式可审计对象。

## 结论 (Conclusion)

9月25日至26日的云原生新闻，可以归纳为一句判断：**云原生的抽象正在从"服务"下沉到"不可信代码的执行环境"，而这一层的能力上限，目前由授权粒度与协议状态管理这两个具体短板决定。** Docker用Cloud Sandboxes与Kits v3把执行位置与权限表达同时推上托管侧与标准格式；MCP新规范则移除了让无状态部署在架构上不可行的那条历史约束；可观测性侧，互操作两年后从"难用"进步到"可混用"，而Cloudflare用一个7千RPS的边缘架构给出了自建内容系统的可行性证明。

对实践者，本周可执行的动作清单是：(1) 评估Docker Kits v3的OCI打包路径对自身构建流水线的适配性——若在用Agent工具链，值得把"权限清单是否随镜像走"列入CI检查项，并同步用cosign/SBOM工具覆盖Agent镜像，因为这条路径复用现有供应链安全栈的成本极低；(2) 若自建或采购MCP服务器基础设施，优先核查"任意实例可服务任意请求"是否成立，并补齐网关侧的幂等键与重试语义，尤其是有副作用的工具调用；(3) 借互操作调查的数据重新评估可观测性栈——若基础设施指标仍双栈并存，可把"统一resource属性模型"作为下一个迁移目标，比追求格式统一更有边际收益，同时参照Atlassian的做法**冻结面向业务的接口、只替换埋点实现**，把迁移成本控制在平台团队内部；(4) 对任何基于exec探针的部署做一次镜像内容审计——`pgrep`、`curl`、`jq`等被探针间接依赖的二进制在精简镜像中缺失，是一个会在容量紧张时才暴露的定时炸弹。

值得持续跟踪的观察点有三个：Kits v3的OCI权限清单是否会出现第二个实现方（这是判断该格式能否避免碎片化的关键早期信号）；MCP去会话化之后，**有副作用工具调用的幂等性由谁来保证**——协议把这个问题交还给了应用，这个缺口会不会在三个月内催生一个新的事实标准；而Cloudflare EmDash的v1发布是否会带来第二批"Custumer Zero"，若自建边缘内容系统从个案变成潮流，说明Web应用的状态管理正在经历一次类似2013年容器化的范式转移。

---
*本文基于2026年9月25-26日公开资讯整理，来源URL均经核验可访问。*
