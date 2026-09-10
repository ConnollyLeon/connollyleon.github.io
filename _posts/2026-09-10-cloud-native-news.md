---
layout: post
title: "云原生动态：CNCF三篇连发聚焦AI原生——多租户GPU可观测、K8s身份接入、云原生何以走向AI原生"
date: 2026-09-10
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/09/09/how-cloud-native-goes-ai-native/"
categories: [news]
tags: [cloud-native, kubernetes, AI-native, GPU, observability, security]
---

# 云原生动态：CNCF三篇连发聚焦AI原生——多租户GPU可观测、K8s身份接入、云原生何以走向AI原生

CNCF博客本周连续刊出三篇聚焦"AI原生基础设施"的文章，勾勒出云原生与AI交汇的三个切面：Control Plane CEO Doron Grinstein论证"云原生天然适配AI原生"，把vibe coding时代的应用安全拉回到SRE的可测试断言框架；Adobe的Golden Kubestronauts公开多租户GPU指标方案，以约97%的序列裁剪让每个租户"看得见自己的GPU"；CNCF大使Kolawole Olowoporoku则给出Kubernetes集群通过OAuth2 Public Client接入企业身份提供商的落地路径。三篇并读，恰好回应AI落地期的平台三问——AI应用如何安全上云、算力如何计量归属、身份如何可信接入。

## 主要新闻 (Main News)

### 云原生如何走向"AI原生"：把生产就绪的护栏交给声明式栈

Doron Grinstein撰文指出，vibe coding正让应用创建速度空前加快，但"建得快"不等于"跑得稳"。他援引SRE的框架提出判断标准：生产率应由可测试、可验证的断言衡量，而AI智能体倾向于选取"便捷栈"（如Supabase、serverless之类），这种以便利性为启发式的选择已多次付出代价——Lovable的RLS误配置（CVE-2025-48757）、Replit误删生产数据库、OpenAI生态曝出的Hugging Face相关泄露事件，都是"便捷压倒安全"的注脚。他的处方是把云原生的声明式接口、策略引擎与reconciliation loop变成Agent的天然护栏：AI原生基础设施不能比人类构建的更不安全，而云原生栈的自动化、可审计与策略可执行特质，正是把"AI写出来的应用"安全带上生产的桥梁。

**Source:** [How cloud native goes AI native — CNCF Blog](https://www.cncf.io/blog/2026/09/09/how-cloud-native-goes-ai-native/)

### 这些GPU到底是谁的？Adobe开源多租户GPU可观测性代理

来自Adobe Golden Kubestronauts（Bingi Narasimha Karthik与Ramkumar Nagaraj）的工程分享聚焦算力的"成本与归属"：在集中式Prometheus上，开发者与平台团队无法在各命名空间内安全查看GPU用量——安全隔离与"吵闹邻居"让共享指标不可行。他们的方案是叠加多层代理：kube-rbac-proxy负责身份识别，prom-label-proxy注入命名空间标签实现数据隔离，再按租户独立remote-write到各自的Prometheus实例，并以MetricAccess CRD暴露细粒度授权。实测效果是存储序列从约一万条裁至约三百条（下降约97%），借助6条PromQL即可定位闲置GPU。代码已以Apache 2.0开源（github.com/adobe/prometheus-multi-tenant-proxy）。

**Source:** [Whose GPUs are these, anyway? Secure, self-service metrics for multi-tenant Kubernetes — CNCF Blog](https://www.cncf.io/blog/2026/09/09/whose-gpus-are-these-anyway-secure-self-service-metrics-for-multi-tenant-kubernetes/)

### Kubernetes接入身份提供商：用Public Client，而非Confidential Client

CNCF大使Kolawole Olowoporoku将"集群访问控制"列为day-zero清单项：托管云集群开箱即带SSO/IAM，本地部署却常缺失。针对kubectl这类无法安全保管客户端密钥的工具，他推荐OAuth2 Public Client（配合设备码流程与PKCE）而非Confidential Client：把认证委托给企业身份提供商，密钥不落终端，以"设备码+无密钥"完成安全登录，从而把集群接入从"共享kubeconfig"升级为"人人SSO、处处可审计"。

**Source:** [Kubernetes access via an identity provider: Public client, not confidential — CNCF Blog](https://www.cncf.io/blog/2026/09/08/kubernetes-access-via-an-identity-provider-public-client-not-confidential/)

## 分析 (Analysis)

三篇文章看似分散在"生产安全—算力计量—访问控制"三个角落，实则共享同一个时代变量：AI正在成为Kubernetes上的第一等公民。Grinstein的文章点破了最容易被忽视的一层——当写代码的主体从工程师变成智能体，传统"靠人肉review兜底"的安全模型失效，安全必须提前铸进基础设施本身，这正是声明式、可审计的云原生栈能给出比"便捷栈"更优解的地方。它不是让AI写得更快，而是让AI写出来的东西在无人工值守时依然不越界。

Adobe的方案则回答"算力上云之后如何分账"这个更实操的问题。真正困难的不是采集GPU指标，而是在不牺牲安全性的前提下把它交给每个租户——把"中央Prometheus"拆成"身份认证+标签隔离+按租户落库"，本质上是一次治理下沉：谁用GPU、用了多久、是否闲置，由租户自查，平台只提供证据。这一模式对任何正在做FinOps的多人租集群都是可直接照搬的架构范本。

Olowoporoku的Public Client实践看似老生常谈，但在AI应用大量以"平台内嵌工具"形态入云的今天意义被放大：kubectl、k9s乃至各类CLI工具纷纷接入来自身份商的授权，设备流+PKCE让"无密钥终端登录"成为默认，直接呼应了前两篇文章强调的"可审计性"。三者汇成一个判断：AI原生时代，云原生的价值正在从"容器编排的便利"转向"治理与归属的契约"。

## 结论 (Conclusion)

CNCF本周三篇连发，把"云原生必须承载AI原生"从口号拆成了可落地的工程清单：声明式安全护栏（Grinstein）、按租户下放的GPU可观测（Adobe）与基于身份提供商的零密钥接入（Olowoporoku）。建议平台团队优先做三件事：为AI工作负载配置策略即代码与最小权限、用Adobe式代理给每个租户开GPU账本、把kubeconfig统一收敛到OIDC设备流。这三点做完，AI原生才算真正"可运行、可计量、可信赖"。