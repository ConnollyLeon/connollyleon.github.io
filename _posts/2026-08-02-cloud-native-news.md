---
layout: post
title: "Kubernetes维护周：三个补丁分支齐发，OpenTelemetry正式毕业成为CNCF顶级项目"
date: 2026-08-02
author: "云原生观察"
source: "https://lwcn.dev/newsletter/2026-week-31/"
categories:
  - cloud-native
tags:
  - kubernetes
  - opentelemetry
  - etcd
  - crossplane
  - confidential-containers
  - cncf
  - cloud-native
---

# Kubernetes维护周：三个补丁分支齐发，OpenTelemetry正式毕业成为CNCF顶级项目

云原生生态本周进入密集的维护发布期。Kubernetes三个活跃补丁分支（v1.36.3、v1.35.7、v1.34.10）同时更新，Crossplane和etcd也发布了安全补丁。更受瞩目的是，OpenTelemetry正式获得CNCF毕业（Graduated）状态，成为继Kubernetes、Prometheus之后又一位顶级项目，而Confidential Containers则被接纳为CNCF孵化项目。

## 主要新闻

### Kubernetes、Crossplane与etcd同步发布安全补丁

本周云原生生态迎来一波密集的维护性发布。Kubernetes发布v1.36.3、v1.35.7和v1.34.10三个补丁版本，提供错误修复和安全更新。Crossplane在四个维护分支（v2.3.4、v2.2.4、v2.1.8、v1.20.11）上同步发布补丁，修复了Composed Usage重复owner更新的问题，并整合了Crossplane及其依赖的安全更新。etcd同样在三个受支持分支（v3.7.1、v3.6.14、v3.5.33）上发布补丁，修复两个安全漏洞及多个可靠性问题。此外，Dapr v1.18.2修复了SPIFFE SVID传播等问题，KubeVela v1.11.0发布，Capsule v0.13.10增强了元数据强制与ingress规则能力。

**Source:** [LWCN Week 31, Jul 27 - Aug 2, 2026](https://lwcn.dev/newsletter/2026-week-31/)
**Source:** [Etcd Patch Releases: v3.7.1, v3.6.14, and v3.5.33](https://etcd.io/blog/2026/july-23-patch-release/)

### OpenTelemetry正式毕业：可观测性事实标准的里程碑

OpenTelemetry（OTel）本周正式获得CNCF毕业状态，与Kubernetes、Prometheus等顶级项目并列。CNCF在公告中强调，OTel已成为云原生可观测性领域无可争议的事实标准——它的指标、日志和追踪API被全球绝大多数云原生应用采用。CNCF博客撰文回顾了毕业后的下一步方向：继续推动语义约定的标准化、增强AI/LLM应用的可观测性支持、以及处理Collector在大规模部署中的演进问题。OTel的毕业不仅是对项目成熟度的认可，更标志着可观测性技术栈在CNCF治理下的长期稳定承诺。

**Source:** [OpenTelemetry has graduated… Now what?](https://www.cncf.io/blog/2026/07/24/opentelemetry-has-graduated-now-what/)
**Source:** [CNCF Announcements](https://www.cncf.io/announcements/)

### Confidential Containers被接纳为CNCF孵化项目

Confidential Containers（CoCo）本周被CNCF接纳为孵化（Incubating）项目。CoCo致力于在容器化环境中保护使用中的数据——通过硬件辅助的可信执行环境（TEE），使工作负载即使运行在共享或不可信的主机基础设施上，其内存和运行状态也保持加密和隔离。该项目的孵化里程碑反映了业界对机密计算需求的快速增长，特别是在多租户云、AI推理和监管合规场景中，客户要求平台运行商无法访问其敏感工作负载。CoCo与Kubernetes的深度集成使其能够以标准容器接口运行，降低了机密计算采用门槛。

**Source:** [LWCN Week 31 - Confidential Containers accepted as CNCF incubating project](https://lwcn.dev/newsletter/2026-week-31/)

### 其他维护发布：Podman v6.0.2、Flux2 v2.9.3与Kubescape v4.0.11

维护浪潮同样波及容器生态工具链。Podman v6.0.2修复了Windows下WSL Provider的VM清理问题；Flux2 v2.9.3修复了Helm Chart渲染中空行、HelmRelease测试标记及spec.images字段被丢弃的问题；Kubescape v4.0.11为编译的CEL程序增加了缓存，并扩展了VAP策略元数据能力。OpenCost v1.121.0则首次实现了AI推理成本报告，与IBM Apptio关于AI成本优化的工作形成呼应。本周总计有41个发布、199条新闻，维护型发布占比显著提高。

**Source:** [LWCN Week 31, Jul 27 - Aug 2, 2026](https://lwcn.dev/newsletter/2026-week-31/)

## 分析

本周云原生领域最值得关注的事件是OpenTelemetry的毕业。OTel自2024年成为CNCF孵化项目以来，经历了从追踪标准到全栈可观测性标准的快速演进。其毕业意味着项目治理、版本策略和API稳定性达到了顶级项目的门槛——对于采用OTel的企业而言，这是一个强烈的信号：围绕OTel构建可观测性平台的投资是长期且安全的。而OTel下一步对AI/LLM可观测性的投入，正与本周CNCF对AI基础设施SIG的推动相呼应，指向"云原生+AI"这一2026年最确定的趋势。

维护性发布的集中爆发同样值得解读。Kubernetes、Crossplane、etcd三大基础组件同时进行多分支补丁维护，说明生态已经进入成熟的"稳定维护期"——功能创新让位于稳定性与安全性的打磨。这一方面反映了生产环境对Kubernetes依赖之深，另一方面也提醒实践者：多分支的补丁维护意味着升级策略需要更细致的规划。etcd连续三个分支发布安全补丁，尤其值得大规模集群运维团队警惕，应尽快评估当前运行的etcd版本是否已纳入补丁范围。

Confidential Containers进入孵化项目，标志着云原生安全叙事从"供应链安全"（镜像签名、SBOM）向"运行态安全"（数据在使用中加密）延伸。随着AI工作负载携带越来越多敏感数据在共享GPU基础设施上运行，TEE与容器技术的结合可能成为金融、医疗、政府等强监管行业采用云端AI的关键前提。这一趋势与本周IBM数据泄露报告所揭示的AI攻击增长（详见科技新闻）形成了防御与攻击两个方向的对照。

OpenTelemetry Collector v0.157.0引入的指标桶边界破坏性变更也值得关注——它改用了2的幂字节级桶。这类看似微小的变更提醒可观测性从业者：即使是最成熟的项目，其内部指标契约也在持续演进，依赖自定义查询的组织需要持续跟进上游变更。

## 结论

本周的云原生动态可以概括为"稳定与成熟"。OpenTelemetry的毕业确立了一个事实标准的长期治理承诺；多组件的同步补丁发布提醒我们基础设施维护需要制度化的升级与监控流程；Confidential Containers的孵化则预示着云原生安全的下一个战场——运行态数据保护。对于平台团队，建议尽快将etcd、Crossplane等组件升级至最新补丁版本，同时开始评估OTel毕业带来的语义约定演进对现有仪表盘的影响，并关注CoCo项目在TEE与Kubernetes集成上的早期实践。
