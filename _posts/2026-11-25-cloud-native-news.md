---
layout: post
title: "云原生技术动态：虚拟机与AI工作负载重塑云原生基础设施边界"
date: 2026-11-25
author: "云原生观察"
source: "https://www.cncf.io/blog/2026/11/09/new-research-virtual-machines-remain-central-to-cloud-native-infrastructure-as-ai-workloads-evolve/"
categories:
  - cloud-native
tags:
  - cloud-native
  - kubernetes
  - virtualization
  - ai-agents
  - cncf
---

# 云原生技术动态：虚拟机与AI工作负载重塑云原生基础设施边界

今日云原生领域的焦点集中在基础设施形态的再平衡：CNCF与Linux Foundation Research最新调研显示，虚拟机仍承载大量生产工作负载，而AI与Agentic应用正在推动隔离性与运行时架构演进。与此同时，Google Cloud将Agent Substrate、gVisor和OpenRL捐赠给CNCF，标志着面向自主代理的开放基础设施进入社区协作阶段。

## 主要新闻

### CNCF调研：虚拟机仍是云原生生产环境核心组成

CNCF与Broadcom赞助、Linux Foundation Research发布的《2026 Cloud Native Workloads Survey》显示，在492名受访者中，虚拟机平均承载53%的生产应用，51%的组织至少一半生产应用运行在VM上。调研还指出，34%计划扩展VM规模的组织将AI和Agentic工作负载列为原因之一，61%的受访者表示VM与容器团队已协作或融合。这一结果挑战了“云原生等于完全去虚拟机”的简单叙事，反映出多运行时并存正在成为常态。

**Source:** [New research: Virtual machines remain central to cloud native infrastructure as AI workloads evolve](https://www.cncf.io/blog/2026/11/09/new-research-virtual-machines-remain-central-to-cloud-native-infrastructure-as-ai-workloads-evolve/)

### Google Cloud向CNCF捐赠Agent Substrate、gVisor与OpenRL

Google Cloud宣布将Agent Substrate、gVisor和OpenRL捐赠给CNCF Sandbox，并同时发布Agent Substrate 1.0及其在GKE上的正式可用版本。Agent Substrate通过将有状态Actor与可复用Worker解耦，在代理空闲时快照并释放计算资源，恢复时间低于500毫秒；gVisor提供用户态内核隔离以安全运行不受信代码；OpenRL则面向Kubernetes环境提供自托管强化学习后训练基础设施。该举措旨在为大规模Agent工作负载建立开放、中立的运行时与训练栈。

**Source:** [Powering open infrastructure for autonomous agents](https://cloud.google.com/blog/products/containers-kubernetes/open-infrastructure-for-autonomous-agents-comes-to-cncf)

### Broadcom将VM API项目贡献给CNCF Sandbox

在KubeCon North America 2026期间，Broadcom宣布将面向虚拟机的API开源项目贡献给CNCF Sandbox，目标是为Kubernetes环境中的虚拟机管理提供厂商中立接口。结合其围绕vSphere Kubernetes Service推出的验证方案，Broadcom试图降低企业在同一平台管理容器与VM的摩擦。这一动作与CNCF调研结论相呼应：基础设施团队需要在统一控制平面下支持异构工作负载，而非强制单一路径迁移。

**Source:** [Broadcom Contributes VM API Open Source Project to Cloud Native Computing Foundation](https://www.broadcom.com/company/news/product-releases/64846)

## 分析

今天的云原生信号表明，行业正在从“容器优先”的口号转向“工作负载适配”的务实架构。CNCF调研数据最值得关注的不是VM占比本身，而是VM扩张与AI工作负载、安全隔离需求之间的关联。Agentic应用天然包含代码执行、工具调用和长时间等待，这使传统Pod常驻模型在成本和隔离边界上都面临压力。虚拟化、MicroVM、用户态沙箱等技术重新获得战略地位，并非倒退，而是云原生能力边界的扩展。

对从业者而言，平台工程的核心任务将从“统一到容器”变为“统一治理异构运行时”。KubeVirt、gVisor、Agent Substrate这类项目说明，Kubernetes正在演化为多执行环境的调度与控制层。团队需要重新评估平台抽象：身份、策略、快照恢复、资源密度和安全边界应成为一等设计对象。尤其在AI代理场景中，秘密注入、出站控制、审计和可回滚性比单纯的容器编排更关键。

从生态角度看，Google将关键Agent基础设施捐入CNCF，延续了Kubernetes时代“通过中立治理扩大采用”的路径。若社区能在性能补丁、API标准和运行时互操作上形成共识，Agent基础设施可能避免早期容器生态的碎片化。但风险也存在：项目虽开放，实际落地仍高度依赖云厂商产品化能力、硬件支持和运维成熟度。企业应关注开源治理进展与生产级SLA之间的差距。

未来值得观察三点：第一，Kubernetes是否能成为VM、容器、MicroVM和Agent运行时的统一控制平面；第二，AI工作负载的安全隔离是否会催生新的默认运行时标准；第三，平台团队如何在成本、性能与合规之间找到可持续的混合架构。云原生的下一阶段，不是替代旧技术，而是把不同技术纳入同一套可治理、可审计、可扩展的系统工程。

## 结论

云原生基础设施正在进入“异构共存、代理驱动”的新阶段。虚拟机没有退出舞台，反而在AI安全隔离与资源治理中获得新角色；Kubernetes生态也在通过开放项目吸纳Agent运行时需求。对企业而言，关键不在于选择单一技术栈，而在于建立能持续适应新工作负载形态的平台能力。
