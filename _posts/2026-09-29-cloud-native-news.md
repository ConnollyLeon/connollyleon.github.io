---
layout: post
title: "云原生动态：Uber用ServiceScale把扩缩容意图与执行彻底解耦并以metadata.generation做read-your-own-write护栏、Artifactory三个CVE被在野利用且一个尾斜杠就能换出admin令牌、Aurora DSQL补上外键但用序列化错误代替阻塞迫使应用自建重试、Cloudflare与Google前后脚开源OpenAPI代码生成器把Stainless关停的影响接了下来"
date: 2026-09-29
author: "云原生观察"
source: "https://www.infoq.com/news/2026/09/uber-kubernetes-scaling/"
categories: [cloud-native]
tags: [cloud-native, kubernetes, uber, servicescale, crd, controller, control-plane, read-your-own-write, metadata-generation, informer-cache, replica, udc, failover, openkruise, cloneset, karmada, platform-engineering, artifact, jfrog, supply-chain, cve-2026-42018, cve-2026-42016, cve-2026-82329, unauthenticated, token, jwt, groovy-plugin, sre, incident-response, aws, aurora-dsql, postgresql, foreign-key, serialization-error, no-blocking, serverless-database, distributed-sql, cloudflare, forge, google, speakeasy, openapi, sdk-generator, anthropic, stainless, vendor-lock-in, open-source, api-management, agent-tooling, docker, cloud-sandboxes, microvm, oci, sandbox-kit]
---

9月28日的云原生新闻里，最有工程含量的一条来自Uber：他们把"谁想扩缩容"和"谁来执行扩缩容"拆成了两个独立的控制循环，并用一个看起来极其朴素、实则直击Kubernetes控制器模型软肋的机制解决了自己写控制器时最常踩的坑。其余三条则分别指向**分发环节、数据库能力补齐、以及工具链供给**。把这四条并排看，会得到一个统一判断：**云原生栈的问题重心正在从"能不能跑起来"迁移到"边界上的默认值与可审计性"**——多控制器的写冲突、HTTP路径规范化的差异、分布式数据库里"约束必须以冲突检测实现"这一取舍、以及单一供应商关停代码生成器导致的生态脆弱性，本质上都是同一类问题的不同表现：抽象层宣称抹平的差异，在具体实现里全都回来了。

## 主要新闻 (Main News)

### Uber把扩缩容意图从执行中分离：ServiceScale CRD + Service Scale Controller，一年灰度无客户影响

InfoQ报道了Uber工程博客"Evolving Uber's Compute Platform"的内容，作者是高级软件工程师Egor Grishechko与Srikar Paruchuru。Uber的容器平台团队运行着**100多个计算集群**，横跨自有数据中心与包括Oracle、Google在内的云厂商，规模是**约4,000个服务跑在300万核上、每天150万次Pod启动**。平台的内部结构是：`Up`作为覆盖整个Kubernetes集群群的联邦层，`UDC`（Uber Deployment Controller）负责把意图调和（reconcile）成Kubernetes原语。此前区域故障转移（failover）的逻辑是由某个编排器直接改ReplicaSet/HPA来实现的，这次改动引入了新的`ServiceScale` CRD与一个Service Scale Controller（SSC），把"要扩缩容"这件事变成一份可以独立声明的数据。

这个设计的核心考量被写得很直白。Uber明确**拒绝**把故障转移逻辑塞进UDC，理由是"故障转移处理上的回归不会只局限在故障转移范围内"——即**关注点分离在这里不是代码洁癖，而是一条事故边界线**。另一条同样直白的原则是"我们不想要额外的外部数据库、不想要独立的协调服务、也不想要一个在事故压力下变得更难调试的控制平面"。这一条决定了架构：SSC自己没有状态存储，状态就是Kubernetes里的对象。

最值得逐字抄下来的是read-your-own-write一致性护栏。控制器在更新下游资源时，会把**自己当前的`metadata.generation`作为注解挂上去**，然后在报告状态前**校验缓存中的数据至少反映了那个generation**。这条规则解决的是informer缓存的陈旧读问题：控制器写了副本数，缓存还没追上，它就基于旧值继续做决策并报告成功。InfoQ指出，Kubernetes v1.36（2026年4月发布）引入了面向控制器的陈旧性缓解，Uber正在与**controller-runtime**合作，把read-your-own-write语义推广到所有控制器。第三方评论者Prasad M K在LinkedIn上的判断值得引用：**"这是一个API契约问题，不是后端缓存问题。"**

多写者问题是被坦诚写出来的现实：UDC与SSC并发更新同一资源，会导致**ReplicaSet的metadata与spec漂移**，进而破坏滚动更新时的比例扩缩容。Uber的应对不是消除并发，而是**全集群的漂移可观测性加上UDC内部的一个自动化healer**，去修补受影响的ReplicaSet。发布过程用了**整整一年**，通过staging、canary与`kind`测试工具推进，同时支持原生Kubernetes Deployment与**OpenKruise CloneSet**，并明确报告**没有造成客户影响的宕机**。文章还关联了Uber 2026年1月的arXiv论文：其统一故障转移架构把稳态置备从2倍降到1.3倍，消除了超过**100万CPU核**的冗余；InfoQ同时提到CNCF近期毕业的**Karmada**是另一条可选路径。

**Source:** [Uber Separates Scaling Intent From Execution on Kubernetes Platform | InfoQ](https://www.infoq.com/news/2026/09/uber-kubernetes-scaling/)

### JFrog Artifactory三个CVE被在野利用：一个尾斜杠换出admin令牌，攻击链最短只需几次未认证HTTP请求

Wiz披露的三个Artifactory漏洞已在被主动利用，面向互联网暴露的自托管部署受影响，**攻击者可在五分钟内取得管理员访问**。三个CVE分别是：**CVE-2026-42018**（高危）——即使禁用了匿名访问，Artifactory仍可能向未认证的请求方返回一个**内部匿名用户令牌**；**CVE-2026-42016**（高危）——请求令牌校验不当，低权限攻击者可持有效令牌执行未授权操作并提权；**CVE-2026-82329**（严重）——未认证攻击者**可直接取得admin作用域的令牌**。

完整利用链在细节上几乎是对"规范假设"的教科书式攻击：一个未认证的`POST /access/api/v1/aws/token/`请求**带一个尾斜杠**返回HTTP 200与一个内部匿名用户的JWT（对应CVE-2026-42018）；该JWT随后经`POST /access/api/v1/tokens`兑换，同样返回HTTP 200，**且是admin作用域**（对应CVE-2026-42016）。尾斜杠是否是问题不是重点，重点是**后端对等价路径的规范化与认证中间件对等价路径的处理并不一致**。

更具操作意义的是这个提权令牌的**可观测性特征**：它保留了匿名用户名，却携带管理员权限，因此后续请求在日志中呈现为操作者`token:anonymous`——**混在合法流量里**。已观察到的利用后行为包括：创建**持久化管理员账户**、部署**恶意Groovy插件**以执行代码、窃取凭据与**Access signing keys**、建立后门、部署**反取证机制**。Wiz的警告措辞值得原样引用：**"如果你的实例在漏洞存在期间暴露过，假定已被攻陷并开始搜寻利用后痕迹。升级只是关门，不会驱逐已经在里面的攻击者。"** 修复版本按分支为7.111.21、7.117.28、7.125.20、7.133.29、7.146.38、7.161.20或更高。Graylog信息安全高级总监Jim Nitterauer表示在第三个漏洞披露后**四天内**即观察到攻击；另一则以"这就是那种不快速打补丁就会变成下一个SolarWinds故事的漏洞"来形容。

**Source:** [Artifactory Vulnerabilities Under Active Exploitation Enable Authentication Bypass and Admin Access | InfoQ](https://www.infoq.com/news/2026/09/artifactory-vulnerabilities/)

### AWS为Aurora DSQL补上外键约束：用快照验证加提交时冲突检测换掉阻塞，代价是应用必须自建重试

AWS宣布Aurora DSQL支持**外键约束**，并支持`CASCADE`、`SET NULL`等引用动作，同期还新增了CloudWatch Database Insights做集群级、逐语句的性能监控。Aurora DSQL是serverless的、分布式的、PostgreSQL兼容的SQL数据库，**这个能力缺失自re:Invent 2024首次发布起就被反复提及**——AWS高级首席工程师Marc Bowes当时说过"是的，外键会来的，我们听到了"。

实现方式决定了它的全部性能特征。Aurora DSQL不通过锁表来强制外键，而是在**事务期间做快照验证、在提交时做冲突检测**，用隐式的**KEY SHARE检查**来判断外键关系，**违规事务被以序列化错误拒绝，而不是被阻塞等待**。AWS副总裁兼杰出工程师Marc Brooker的表述概括了这一取舍：**"无阻塞、非外键读取的扩缩容行为不变、外键读取者从不会导致其他读取者中止、而在分布良好的工作负载上外键扩展性很好。"** 代价也同样明确：**所有涉及被引用表或引用表的DML都会产生额外读取**，AWS建议加约束前先做基准测试。AWS还给出了一条具体的设计建议：对被频繁引用的行，**避免把经常变化的列作为键**，保持被引用键稳定，把变化的值放到非键列。荷兰铁路的首席工程师Luc van Donkersgoed从用户角度给出的评价是："缺少外键曾是DSQL与'正常'Postgres之间最大的鸿沟，阻止了很多迁移。"社区中也有反声，Reddit上有评论认为该特性"会让东西慢很多，考虑到DSQL的架构，我不确定这会有多好"。

**Source:** [AWS Introduces Foreign Key Constraints in Aurora DSQL | InfoQ](https://www.infoq.com/news/2026/09/aurora-dsql-foreign-keys/)

### Cloudflare与Google前后脚开源OpenAPI代码生成器：Stainless关停后，SDK生成层被判定为"不该是SaaS"

The New Stack报道，Google在**11天前**（9月17日）宣布与Speakeasy合作，把自己的OpenAPI代码生成套件以**AGPLv3**开源；Cloudflare在9月28日（周一）发布开源的**Forge**（Apache 2.0，可自托管、可修改、无需向Cloudflare付费），博客作者为Dimitri Mitropoulos、Matt Taylor与Samuel MacLeod。触发点是**Anthropic于2026年5月18日收购了Stainless**，Stainless随后宣布关停其产品线包括SDK生成器，受影响的客户中点名的正是**OpenAI、Google与Cloudflare**——它们保住了已生成的SDK，但失去了再生成的服务。

Google给出的理由可以直接当作行业共识引用：**"这种突然的中断凸显了专有的、闭源的生成器造成了不可接受的平台风险。如果整个行业依赖OpenAPI来定义接口，那么把这些接口编译成客户端库、CLI和agent工具的工具链，应当是开放基础设施。"** Cloudflare的表述同样直接：**"我们认为，为API构建工具是互联网的核心组成部分，你不应该需要一个SaaS产品才能做这件事。"** CTO Dane Knecht补充了一个与agent时代直接相关的理由：**"如果那一层过时或不完整，agent不只是开发体验变差，它会误解一个服务能做什么。"**

Forge的第一个生产产物是Cloudflare的统一CLI **`cf`**，目前处于公开测试版，规模上**从Wrangler的约280个函数扩展到覆盖Cloudflare全API的3,000多个操作**（Cloudflare称自己维护着3,500多个API操作、横跨数百个由不同工程团队负责的服务）。`cf`面向agent做了专门设计：默认JSON输出，并内置**自然语言命令搜索**，以避免把数千条命令塞进上下文；可以部署与监控Worker、配置Cloudflare Access、购买域名、管理WAF。Kits工具包方面，**Kits v3起不再是独立制品，而是打包成标准OCI镜像**，可用`build`与`pull`直接使用。Cloudflare对托管生成器的评价也值得记住：**"我们试过几个试图解决这个问题的托管产品，有些还在生产中被依赖。它们没有一个解决了我们的问题，有些已经完全关停了。"** 项目仍处早期：API文档与现有SDK将在"未来几个月"迁移，若干输入格式与生成目标仍是未来工作。

**Source:** [Anthropic bought Stainless and shuttered its SDK generator. Cloudflare open-sourced Forge instead. | The New Stack](https://thenewstack.io/cloudflare-forge-anthropic-stainless/)

### 一则延伸观察：Docker Cloud Sandboxes把沙箱抽象推向云端，但社区质疑它是否是正确的抽象

InfoQ在9月26日报道了Docker Cloud Sandboxes：基于**硬件强制的microVM隔离**为AI编码agent提供托管执行环境，与本地Docker Sandboxes使用同一套CLI与同一隔离模型，迁移命令为`sbx move my-project --to cloud`。Docker的论证抓住了agent工作形态的变化：**"当agent以短促的爆发方式工作时，问题在于模型能否维持一个任务。现在它们要工作数小时，问题变成这些小时发生在哪里。笔记本是围绕人设计的——合上盖子就睡，电量不足就变慢，移动时断连。"** 目标负载是"同时跑十几个agent，每个五小时、十小时或21小时，全程不盯着"。Kits v3改为标准OCI镜像打包与云端沙箱是同一套制品体系，逻辑自洽。

但社区反馈提出了更根本的质疑。Reddit上的一条评论指出沙箱只解决了问题的一部分：任何有用的agent工作负载都必须连接有限的外部服务（"它在现实生活里真的会调用的那套窄服务……PyPI或Docker Hub或Hugging Face"），**受控不等于无攻击面**——"它完全可以只跟自己被授权的那套服务说话，通过跟它们说话把它们搞坏，同时始终待在沙箱里面。" Hacker News上另一位评论者的判断更彻底：**"传统沙箱不会是正确的抽象"**，主张转向**对象能力（object-capability）式的harness**，精确限定agent能访问什么、能访问到什么程度。Deutsche Bank的DevOps工程师Florin Lungu则从企业侧看到了"在microVM环境中实现安全的自主编码"这一价值。

**Source:** [Docker Cloud Sandboxes Provide a Consistent Sandbox Abstraction across Laptop and Cloud | InfoQ](https://www.infoq.com/news/2026/09/docker-cloud-sandboxes/)

## 分析 (Analysis)

Uber那条新闻最值得学习的不是"用CRD解耦"这个结论本身，而是它把**控制器的陈旧读问题还原成了API契约问题**。`metadata.generation`这个字段之所以能当护栏用，是因为API服务器已经在为它维护单调递增的版本号——控制器只要把自己的generation记在写出去的对象上，就能用"缓存里读到的generation是否≥我写的那一代"这个问题，来判定自己是否基于陈旧数据做了决策。这是一个**用只读查询解决一致性语义**的技巧，不需要etcd、不需要watch重连、不需要自建一致性哈希。而InfoQ转述的那句"这是API契约问题，不是后端缓存问题"，准确地指出了问题的归属：informer缓存的行为不是bug，是契约的一部分；把它当bug修（重连、强制全量重列）是在对抗一个不该对抗的东西。Karmada作为另一条路径被提及时，两者的分野也很清楚：Karmada是**跨集群**的意图分发，而Uber解决的是**同集群内多写者**的意图归属问题——这两个问题经常被混为一谈，但它们的失效模式完全不同。

Artifactory那条与Uber那条在根因层面呈现出一种不太舒服的对称。Uber的失效源于**两个控制器的写意图缺少可验证的版本约束**；Artifactory的失效源于**认证中间件对路径规范化的处理与后端路由不一致**。两者都是同一种工程文化缺陷的产物：**同一条语义在系统的不同层用不同的方式实现，而没有任何一层负责检查它们是否一致。** 尾斜杠问题之所以能返回内部匿名用户令牌，恰恰是因为"带不带尾斜杠是同一资源"这个假设只在网关层成立，在后端不成立；`metadata.generation`之所以能救Uber，是因为generation的语义**恰好在所有层都成立**。这给平台团队一条可操作的筛选标准：**当你排查一个边界绕过类漏洞时，先问"这个等价性假设在哪几层各自成立、在哪一层不成立"，而不是先去找"哪个参数没做校验"。**

Aurora DSQL的外键实现是本周最值得反复引用的一条工程权衡。它的选择是"**用冲突检测代替阻塞**"，代价是把正确性责任推给了应用层——事务失败时抛序列化错误，应用必须重试。这在OLTP领域是成熟范式（PostgreSQL的SERIALIZABLE隔离级别、Snowflake的乐观并发、etcd的事务冲突重试都是同一族），但对从单机PostgreSQL迁移过来的团队是**行为差异而非功能差异**：单机PG的外键冲突会把事务挂起等待，DSQL直接失败。InfoQ收录的那条社区质疑（"会让东西慢很多"）与AWS的建议（"被频繁引用的行避免把常变列做键"）其实指向同一个未被充分讨论的问题：**外键在分布式的无锁实现里，其成本主要由数据分布的形态决定，而不是由约束本身决定。** 一个键值分布均匀的外键几乎不增加读放大；一个被99%的行指向同一个父键的外键，会让KEY SHARE检查退化成对那一个热点父键的高频读取——而热点父键恰恰是分布式系统中最难扩展的地方。这与"FLP风格的coordination在热点键上退化"是同一个物理约束的两种表现。Marc Brooker那句"分布良好的工作负载上外键扩展性很好"里的那个限定语，不是修辞。

把Cloudflare与Google的开源动作与Artifactory事件放在一起，能看到一条**工具链供给的脆弱性曲线**。生成器关停之所以是"平台风险"而非普通的产品下线，是因为它位于**源码与可运行客户端之间**——Google博客里"把这些接口编译成客户端库、CLI和agent工具的工具链，应当是开放基础设施"这句话，精确地把这一层定性为**基础设施而非工具**。而agent时代的到来让这层的重要性又上了一个台阶：Dane Knecht说的"agent会误解一个服务能做什么"，在生成器缺失时不是"体验变差"，而是agent会基于过时或缺失的接口描述做出错误规划。Kits v3改用标准OCI镜像、Forge自托管、`cf`默认JSON输出并内置自然语言命令搜索，都是把"可被程序读取的接口描述"往可分发的、可审计的制品方向推的动作。**具体建议是：把"我的服务接口是否有可离线获取、可版本化、可自托管的机器可读描述"纳入平台工程的检查清单，其优先级应与"我的服务是否有OpenAPI文档"同等——区别在于后者坏了人还能猜，前者坏了agent会直接编。**

最后，Docker Cloud Sandboxes那两条社区评论与本周的其余新闻构成了一组对照。评论者对"沙箱不等于安全"的判断是正确的：microVM解决的是**执行隔离**，而agent的真实攻击面是**它被授权访问的那组窄服务**——沙箱内的一切都在遵守规则，但通过合法通道发起的破坏不属于"逃逸"。这与Cloudflare的dm-thin事件是同一枚硬币的两面：那里是存储分配层向被授权方泄漏了前一位主人的残存数据，这里是授权方在授权范围内造成了破坏。Netscan的advisor之外，InfoQ收录的HN评论把出路指向**对象能力模型**——不是"能不能进沙箱"，而是"能拿到哪些对象的哪些操作"。这个转变在K8s生态里并不陌生，ServiceAccount + RBAC + ResourceQuota 事实上就是一种粗粒度的对象能力系统；差别在于agent需要的粒度比RBAC细得多，这可能是未来平台工程里最值得提前投入的一块。

## 结论 (Conclusion)

9月28日的云原生新闻可以归纳为一个判断：**云原生的"边界"正在成为唯一真正需要工程投入的地方。** 编排已经足够便宜与幂等，存储已经足够抽象，数据库已经足够兼容——这些都可以被模板化、被托管、被替换。真正留下的是边界上的三件事：**谁有权写、写的时候基于什么版本、验证在哪些层之间保持一致。** Uber用`metadata.generation`回答了第二个问题，Artifactory的尾斜杠证明第三个问题会真实失守，Aurora DSQL用"宁可失败也不阻塞"回答了第一个问题的代价核算。

对实践者，本周可执行的动作清单是：(1) **审计自己控制器的写路径**——凡是自研operator或控制器，只要与任何其他组件并发写同一资源，就要检查是否存在"写完立刻读"的假设，并把`metadata.generation`注解护栏作为默认实现模板；这一步可以立刻做且没有迁移成本；(2) **把"等价路径规范化"纳入自建服务的认证测试**——不要只测`/api/v1/tokens`，要测`/api/v1/tokens/`、`//api/v1/tokens`、`/api/v1/../v1/tokens`、大小写变体与URL编码变体，重点是**每一层（网关、Ingress、LB、应用）都独立测一遍**，因为漏洞正是从"各层都测了但没测交叉"里长出来的；(3) **在升级JFrog制品库的检查清单中区分"打补丁"与"假定已攻陷"**——Artifactory的三个CVE已明确进入在野利用，Wiz的措辞是"升级只是关门，不会驱逐已经在里面的攻击者"，因此对暴露过的实例需要单独做日志搜寻，重点查`token:anonymous`的操作痕迹、异常的Groovy插件部署、异常的Access signing key使用，以及新增的管理员账户；(4) **迁移到Aurora DSQL或任何无锁分布式数据库时，把外键的失败模式当作迁移检查项**——审计现有schema中"多个外键指向同一父键"的比例，对这部分表先测基线延迟；同时在应用层确认重试逻辑真的存在并对序列化错误分类处理，因为"不阻塞"的另一面是"不等待"，等待会掩盖的重试缺失会立刻变成生产故障。

值得持续跟踪的观察点有四个：其一，**controller-runtime的read-your-own-write语义能否在1.37之后的某个版本成为所有控制器的默认行为**——如果能，Uber这个护栏就从"每个团队自己写"变成"框架默认"，这是本周最有可能被上游吸收的工程实践；其二，**Karmada与Uber式方案在跨集群故障转移上的边界如何划分**——目前两者在解决不同的问题，但如果意图层进一步统一，"谁有权写"这个问题就会从集群内上升到集群间；其三，**Forge与Google/Speakeasy的开源套件是否会形成事实上的SDK生成标准**，以及在这层能力分散之后，"客户端库版本落后于服务端接口版本"这一新漂移源会在哪里被检测到——目前没有任何工具在管这件事；其四，**对象能力式harness是否会进入主流agent运行时的默认配置**——如果Docker、Nvidia（OpenShell）、Cloudflare各自实现的能力模型互不兼容，那么"agent能访问什么"这个问题的治理难度，会远超今天"agent能跑到哪里"。

---
*本文基于2026年9月28日公开资讯整理，来源URL均经核验可访问。*
