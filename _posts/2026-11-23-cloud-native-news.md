---
layout: post
title: "云原生安全与平台韧性：AI代理沙箱、Kubernetes凭证泄露与内核级故障排查"
date: 2026-11-23
author: "云原生观察"
source: "https://www.infoq.com/news/2026/11/google-agent-compute-engine/"
categories:
  - cloud-native
tags:
  - kubernetes
  - security
  - ai-agents
  - google-cloud
  - reliability
---

# 云原生安全与平台韧性：AI代理沙箱、Kubernetes凭证泄露与内核级故障排查

过去一天云原生领域的焦点集中在两条主线：AI代理执行环境的安全隔离，以及托管Kubernetes平台在凭证泄露和底层网络故障面前的韧性。Google公布了Agent Compute Engine的微VM隔离架构，Rackspace披露Spot平台入侵导致客户Kubernetes Secrets可能被读取，Google同时复盘了一起跨越GKE、Private Service Connect与Linux内核的复合故障。这三件事共同说明，云原生基础设施的竞争已经从"能不能跑"转向"能不能安全地跑、出事能不能查清"。

## 主要新闻

### Google公布Agent Compute Engine：微VM隔离与凭证外置

Google于11月22日披露了Agent Compute Engine的架构细节。这是一项托管服务，将AI代理运行在隔离的微虚拟机中，并通过检查点（checkpoint）机制暂停和恢复执行环境。其最核心的设计是"凭证不进沙箱"：API密钥、OAuth刷新令牌等敏感凭据保留在代理沙箱之外，由外部的Agent Gateway在请求时注入。Google还把编排层（harness）与执行层（sandbox）彻底分离，让不可信的客户环境只执行显式下发的命令，从而建立可确定性的审计轨迹。服务采用写时复制内存共享，在单一操作系统模板上运行多个代理，并以SPIFFE身份、Agent Registry和OpenTelemetry兼容的可观测性构成治理栈。与此同时，开源的Agent Substrate提供了可跨Kubernetes环境移植的运行时。该服务尚未上市，定价未公布，计划在未来数月进入预览。

**Source:** [Google Announces Agent Compute Engine for Secure AI Agent Execution](https://www.infoq.com/news/2026/11/google-agent-compute-engine/)

### Rackspace Spot凭证泄露：攻击者读取客户Kubernetes Secrets

Rackspace向客户通报，攻击者利用泄露的凭证于11月17日入侵其Spot云平台，在部分客户组织中以合法用户身份创建Pod、读取Kubernetes Secrets、列举节点和卷。由于Secrets通常存放数据库口令、认证令牌和API密钥，公司警告任何受影响用户集群中的Secret以及Spot API令牌、刷新令牌都可能被读取。Rackspace已撤销令牌与会话、清除异常Pod、轮换密钥并强化访问控制，要求客户重新签发API令牌、更新自动化工具中的刷新令牌、下载新的kubeconfig并轮换Secret中的凭证。公司给出的失陷指标包括IP地址23.224.79.106以及i1、glm-、probe等可疑Pod前缀。事件还导致Spot管理控制台长时间停用，服务直到11月21日才完全恢复。

**Source:** [Rackspace Spot breach let hackers access customer Kubernetes secrets](https://www.bleepingcomputer.com/news/security/rackspace-spot-breach-let-hackers-access-customer-kubernetes-secrets/)

### GKE API超时追至Linux内核TCP缺陷

Google于11月21日复盘了一起影响约800名开发者的生产事故：多个使用Private Service Connect私有访问控制平面的GKE集群出现间歇性Kubernetes API超时。抓包显示控制平面用已关闭连接的陈旧ACK响应新连接请求，根因是三层缺陷叠加——PSC中的数据包重排序、Envoy的半关闭行为导致TCP连接未正确关闭、Linux内核丢弃特定重排序FIN包，使套接字永久停留在FIN_WAIT_2状态。修复分三步完成：回滚PSC变更恢复连通性、修正代理协议处理并加入回归测试、最终由Eric Dumazet编写内核补丁。该补丁已合入Linux 6.9.7并回移植到6.6与6.1 LTS分支，随GKE 1.33.5及以上版本交付。

**Source:** [How Google Traced GKE API Timeouts to a Linux Kernel TCP Bug](https://www.infoq.com/news/2026/11/gke-kernel-network-bug/)

## 分析

AI代理正在成为云原生栈的新一等公民，而它的安全模型与传统的"工作负载隔离"有本质区别。代理会主动调用工具、访问凭证并作出决策，如果密钥与代理同处一个沙箱，一次提示注入就可能演变为凭证外泄。Google把harness与sandbox分离、把凭证移到外部网关、用SPIFFE身份和审计轨迹锁定每一次工具调用，本质上是在给"非确定性行为"套上确定性的基础设施边界。这与CNCF近期接纳Agent Substrate、gVisor、OpenShell等项目的方向一致：开源社区正在把代理运行时、隔离内核和策略执行纳入同一治理框架。对平台团队而言，值得关注的不只是功能，而是可移植性——Agent Substrate可以跨Kubernetes环境运行，而Agent Compute Engine目前仅限Google Cloud，选择哪种路径将直接影响未来的供应商议价能力。

Rackspace事件则提醒我们，Kubernetes Secrets依然是最具吸引力的攻击目标之一。攻击者并没有利用复杂的容器逃逸或零日漏洞，只是使用了泄露的凭证，就获得了创建Pod和读取Secret的合法权限。在托管平台上，安全责任的分界线往往模糊：平台方负责控制平面和令牌撤销，客户负责Secret内容、自动化凭证和日志审计。事件中管理控制台被迫关闭，反而阻碍了客户及时轮换凭证，这暴露出"安全响应与可操作性"之间的张力。实践层面，组织应当缩短令牌寿命、使用工作负载身份替代长期静态凭证、对Pod创建和Secret读取设置告警，并把数据库、镜像仓库、Git与对象存储的日志纳入统一排查窗口。

GKE故障说明，云原生平台的可靠性问题越来越呈现跨层耦合特征。单一层面的行为在各自语境下都合理，叠加后却形成难以复现的故障；症状在PSC、Envoy和内核TCP状态机上看起来完全一样，只有多点抓取数据包并关联变更事件才能定位。这里的现实教训相当朴素：AIOps和混沌工程可以提供方法框架，但关键时刻仍依赖工程师对协议状态机的理解。另一个细节同样重要——GKE当时运行的是三年前的6.1内核，修复其实是上游已解决问题的回移植。平台版本滞后会把"已知问题"转化为"自家事故"，这对使用托管Kubernetes的团队是一个直接的运维提醒。

把三件事放在一起看，云原生生态正在同时加固三个面：运行时隔离（代理沙箱）、身份与机密管理（凭证外置与轮换），以及可观测性与根因定位（多抓包、多层级关联）。它们不是彼此独立的项目，而是同一条防御链上的环节。未来几个月值得持续跟踪的，包括Agent Compute Engine预览版的实际定价与密度指标、CNCF代理相关项目的治理进展、Rackspace事件的受影响范围披露，以及各大云厂商的内核补丁交付节奏。

## 结论

云原生已经进入"深水区"：AI代理需要新的隔离原语，托管平台需要更细的凭证治理，而复杂性本身成为可靠性的主要敌人。对从业者来说，短期行动清单很明确——审计长期凭证、为Secret访问设置可观测性、核对集群内核版本与上游修复状态；中期则应评估代理运行时标准的走向，避免把治理能力完全绑定在单一云厂商上。安全与韧性不再是发布前的检查项，而是平台设计的起点。
