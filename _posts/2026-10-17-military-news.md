---
layout: post
title: "军事技术动态：云原生与边缘计算加速军队数字化转型"
date: 2026-10-17
author: "云原生观察"
source: "https://www.afcea.org/signal-media"
categories:
  - military
tags:
  - military
  - defense
  - kubernetes
  - edge-computing
  - cloud-native
---

# 军事技术动态：云原生与边缘计算加速军队数字化转型

美国国防部持续推进数字化转型，加速采用云原生、边缘计算和容器化技术，以提升作战敏捷性、韧性和决策速度。在受限、间歇性和低带宽（DDIL）环境下构建可弹性运行的计算平台，正成为现代化联合作战能力建设的重点方向。

## 主要新闻

### 国防信息系统局（DISA）推出容器即服务（CaaS）

DISA主机与计算中心（HaCC）推出容器即服务（CaaS）解决方案，为国防部提供基于Kubernetes的容器化托管平台。该平台采用Red Hat OpenShift，在保持数据和应用程序驻留在本地的同时，为任务伙伴提供云原生能力，包括应用可移植性、更小的计算占用、零配置漂移以及简化的部署流程。

**Source:** [‘Game-Changing’ Containers as a Service for Warfighters](https://www.afcea.org/signal-media/cyber-edge/game-changing-containers-service-warfighters)

### 联合作战云能力（JWCC）持续推进

国防部联合作战云能力（JWCC）合同已进入落地阶段，为作战司令部、国防部机构、军种等用户提供涵盖非机密、秘密和绝密三个安全等级的商用云服务。JWCC强调全球覆盖、战术边缘可达性以及在DDIL（Denied, Degraded, Intermittent, Limited）环境下的韧性，以支撑联合作战所需的计算能力。

**Source:** [DoD Joint Cloud Opens for Warfighters](https://www.afcea.org/signal-media/cyber-edge/dod-joint-cloud-opens-warfighters)

### 国防部推进多集群Kubernetes参考设计

国防部发布多集群Kubernetes参考设计，为军队构建安全的云原生应用平台提供蓝图。该设计强调不可变基础设施、多集群编排、平台互联以及在跨机密环境下保持一致性的能力，旨在支持DevSecOps实践并实现持续授权（Continuous ATO）。

**Source:** [DoD DevSecOps Reference Design: Multi-cluster Kubernetes](https://dodcio.defense.gov/Portals/0/Documents/Library/DevSecOpsRefDesign-Multi-ClusterKubernetes.pdf)

## 分析

国防部采用云原生技术的核心驱动力是"作战速度"和"韧性"。传统的单体应用和静态基础设施难以满足现代联合全域作战对敏捷性和弹性的要求。通过采用Kubernetes和微服务架构，作战系统能够实现更快速的迭代、更细粒度的弹性扩缩容，以及在受损或受限环境下的自愈能力。

DISA的CaaS平台是一个重要里程碑。它不仅为开发团队提供了现代化的容器编排能力，更关键的是解决了"云原生与数据主权"的平衡问题。在军事场景中，数据驻留和安全边界至关重要。CaaS采用"本地部署的云原生平台"模式，使任务伙伴能够享受公有云般的开发者体验和应用可移植性，同时将敏感数据控制在国防部的受控环境内。

边缘计算在军事应用中具有不可替代的战略价值。作战行动往往发生在DDIL环境中，依赖中心化云的"回传（reach-back）"模式在对抗环境下极易失效。将计算能力推向战术边缘，使传感器、无人平台和前沿作战单元能够在断连状态下本地处理数据、做出决策，这对于保持作战节奏和生存能力至关重要。云原生技术（特别是轻量化的Kubernetes发行版和边缘优化方案）为在资源受限的边缘节点一致地部署和管理应用提供了可能。

多集群Kubernetes参考设计体现了国防部对规模化采用的务实思路。国防部环境高度分散，涵盖多个安全域、多个作战领域和不同的任务需求。通过多集群架构，平台团队能够在统一的治理框架下，实现资源的逻辑隔离和灵活调度，同时避免单一集群故障影响整个作战体系。这种设计也为后续整合AI推理、传感器融合等计算密集型任务提供了可扩展的基础。

值得注意的是，国防部在采用商业云原生技术时始终强调"安全左移"（Shift-Left Security）和持续合规。DevSecOps与Kubernetes的结合，使安全策略能够以代码形式（Policy as Code）自动化地嵌入到CI/CD流水线和运行时环境中，从而在满足严格安全要求的同时维持交付速度。

## 结论

云原生和边缘计算正在重塑军事信息基础设施的架构范式。从中心化、静态的IT系统向分布式、韧性、可编排的战术计算平台转变，将显著提升美军在竞争性和对抗性环境中的决策优势。DISA的CaaS、JWCC以及多集群Kubernetes参考设计等举措，表明国防部正系统性地将商业云原生最佳实践适配到军事场景的特殊需求中。未来，随着边缘AI、无人系统和传感器网络的进一步发展，以Kubernetes为代表的云原生平台将成为支撑"感知-理解-行动"闭环的关键数字底座。
