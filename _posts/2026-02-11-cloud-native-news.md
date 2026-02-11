---
layout: post
title: "云原生技术动态：Kubernetes用户面临重大截止日期，Docker推出免费强化镜像"
date: 2026-02-11
author: "云原生观察"
source: "https://www.runtime.news/kubernetes-users-face-a-huge-deadline/"
categories:
  - cloud-native
tags:
  - kubernetes
  - docker
  - ingress-nginx
  - security
  - cloud-native
---

# 云原生技术动态：Kubernetes用户面临重大截止日期，Docker推出免费强化镜像

本周云原生生态系统迎来关键更新，Kubernetes用户面临Ingress NGINX控制器的重要迁移截止日期，同时Docker宣布其强化镜像免费提供，为容器安全带来重大变革。

## 主要新闻

### Kubernetes用户面临一个月迁移期限

Kubernetes安装使用Ingress NGINX控制器的用户面临紧急时间压力，需在一个月内完成迁移安排。Ingress-Nginx项目宣布将于2026年3月停止所有补丁和更新维护，用户需要迁移到Gateway API。虽然迁移过程并非完全自动化，但建议用户立即开始规划此过渡。

**Source:** [Kubernetes users face a huge deadline](https://www.runtime.news/kubernetes-users-face-a-huge-deadline/)

### Docker强化镜像现在免费提供

Docker公司宣布其强化镜像（Docker Hardened Images）现在免费提供，涵盖Alpine、Debian和超过1000个镜像，包括数据库、运行时和消息总线。这一变化从根本上改变了容器漏洞管理的经济学，为安全团队提供了由Docker安全团队维护的安全修复，简化了安全响应流程。

**Source:** [Hardened Images Are Free. Now What?](https://www.docker.com/blog/hardened-images-free-now-what/)

### Dragonfly v2.4.0发布新特性

CNCF项目Dragonfly发布了v2.4.0版本，引入了负载感知调度算法和Vortex协议支持。新的两阶段调度算法结合中央调度与节点级二次调度，基于实时负载感知优化P2P下载性能。Vortex协议使用TLV格式替代gRPC进行对等文件传输，有效减少大文件下载时间和峰值内存使用。

**Source:** [Dragonfly v2.4.0 is released](https://www.cncf.io/blog/2026/02/05/dragonfly-v2-4-0-is-released/)

## 分析

这些发展反映了云原生生态系统的几个关键趋势。首先，社区正在积极推动技术架构的现代化，Ingress NGINX控制器的EOL标志着Gateway API作为下一代入口管理标准的成熟。这种技术演进虽然给用户带来迁移压力，但从长远看有助于统一标准，减少碎片化。

其次，Docker强化镜像的免费化反映了容器安全从附加功能向基础设施服务的转变。通过降低安全门槛，Docker正在推动整个行业的安全基线提升，这对中小企业尤其重要，因为他们往往缺乏专门的安全团队资源。

第三，Dragonfly的更新展示了对性能优化的持续关注。在AI工作负载和大模型训练日益普及的背景下，高效的P2P文件传输对于大规模集群部署变得至关重要，这些技术改进直接支撑了云原生环境下的AI应用部署。

## 结论

云原生技术生态正在经历重要转型期。用户需要密切关注技术路线图变化，及时规划迁移策略，同时利用新的安全增强工具提升整体安全水位。对企业和开发者而言，这些变化既带来挑战，也提供了优化基础设施和提升安全性的机会。建议团队建立定期技术债务评估机制，确保与社区发展方向保持一致。