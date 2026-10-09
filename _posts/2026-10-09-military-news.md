---
layout: post
title: "军事科技动态：AI指挥控制网络与边缘智能加速落地"
date: 2026-10-09
author: "云原生观察"
source: "https://www.armyrecognition.com/news/army-news/2026/u-s-army-expands-1-8-billion-ai-battle-network-to-connect-forces-and-weapons-across-the-pacific"
categories:
  - military
tags:
  - military
  - defense
  - ai
  - edge-computing
  - 国防科技
---

# 军事科技动态：AI指挥控制网络与边缘智能加速落地

2026年10月8日，国防科技领域集中于AI驱动的指挥控制与边缘智能两大方向。美国陆军将其下一代指挥控制网络扩展至印太地区，并加速在士兵随身设备上部署"断云可用"的抗毁AI；同时，AI自主无人机和跨厂商无人机互联互通正在欧洲战场上加速验证。

## 主要新闻

### 1. 美陆军以最高18亿美元将NGC2 AI指挥网络扩展至印太

美国陆军正将下一代指挥控制（NGC2）网络扩展至印太地区的第1军，并辅以总额最高18亿美元的新合同。10月7日公布的初步软件合同覆盖通用动力任务系统、Air Space Intelligence Federal、Immersive Wisdom、Onebrief等九家厂商，一年期合同总额约9360万美元，涵盖指挥控制、情报、火力、机动、后勤与部队防护等应用。NGC2以Anduril的Lattice软件为核心构建分布式数据架构，由Palantir的Foundry与Raft提供数据支撑。在Ivy Mass演习中，超2500台用户设备通过共享架构运行，Anduril报告称该系统将炮兵射击任务的处理时间相比传统流程缩短了90%。

**Source:** [U.S. Army Expands $1.8 Billion AI Battle Network to Connect Forces and Weapons Across the Pacific](https://www.armyrecognition.com/news/army-news/2026/u-s-army-expands-1-8-billion-ai-battle-network-to-connect-forces-and-weapons-across-the-pacific)

### 2. 美陆军授予webAI 1450万美元，将抗毁AI部署到士兵设备

美国陆军依据"人工智能快速实施计划"（Project ARIA）向webAI公共部门授予1450万美元固定价格合同，将主权、抗毁的AI能力推向战术边缘。webAI的软件直接运行在士兵已有的笔记本、手持设备和车载计算平台上，并通过"智能分发网络"（IDN）在无云、网络被拒止或间歇受限（DDIL）的条件下实现设备间协作。每个节点在断连时仍保留完整本地功能与决策权，在链路可用时再安全发现对等节点、交换数据与AI模型以及共同的作战图景。

**Source:** [Army Awards webAI $14.5M to Put Resilient AI on Soldiers' Devices Under Project ARIA](https://www.prnewswire.com/news-releases/army-awards-webai-14-5m-to-put-resilient-ai-on-soldiers-devices-under-project-aria-302902705.html)

### 3. 美海军与Shield AI追加3亿美元投入X-BAT无人机

AI初创公司Shield AI与美国海军将再向X-BAT垂直起降无人机项目投入3亿美元。海军签署了1.5亿美元的现有其他交易协议（OTA）修改，Shield AI则以自有资金等额匹配。叠加此前8月的1亿美元投资，双方合计投入已达4亿美元。X-BAT被定位为"全球首款AI驾驶的垂直起降战斗机"，长26英尺、翼展39英尺、航程超过2000海里，旨在让Arleigh Burke级驱逐舰等无大型飞行甲板的舰艇具备远程打击能力，计划于今年晚些时候进行飞行测试。

**Source:** [Navy, Shield AI pour big bucks into X-BAT drone development](https://breakingdefense.com/2026/10/navy-shield-ai-pour-big-bucks-into-x-bat-drone-development/)

### 4. 荷兰Intelic用AI打通乌克兰战场多厂商无人机

荷兰软件公司Intelic与荷兰国防部签有3000万欧元合同以升级防空能力，其AI驱动的Nexus软件正被部署到乌克兰战场。Nexus可整合多家公司提供的多部雷达、传感器和摄像头，用AI识别判定来袭目标，再由侦察无人机通过图像识别进行核实，最终由指挥官决策发射AI制导拦截无人机。Intelic指出，欧洲有超过700家无人机制造商，各系统往往互不通信，Nexus意在成为连接这些异构系统的"结缔组织"，并可让指挥官从单一控制面板操作整个流程。

**Source:** [Dutch firm uses AI to help drone systems 'talk' on Ukraine's battlefield](https://www.straitstimes.com/world/europe/dutch-firm-uses-ai-to-help-drone-systems-talk-on-ukraines-battlefield)

## 分析

### 指挥控制从"系统集成"转向"共享数据底座"

NGC2最具颠覆性的地方，不在于新增了哪些应用，而在于用Anduril的Lattice构建了一层共享的数据基础，使传感器、车辆、指挥所和应用通过统一软件基座交换数据，摆脱了过去"各系统各自为政、人工转抄"的局限。模块化开放架构（MOSA）的意味十分明显：任何厂商的软件都能在不重建底层的前提下接入。这种"数据底座优先"的思路，正是云原生架构在军事领域的直接投射，也是实现多域作战快速协同的前提。

### 边缘智能成为DDIL环境的刚需

webAI的合同与Intelic的战场实践共同揭示一个核心矛盾：越是依赖AI的部队，就越容易在通信被干扰时失去能力。webAI给出的答案是"AI与决策权下沉到设备"，Intelic给出的答案是"用软件把异构传感器与武器缝合成统一态势"。两者的共同点是把智能化从"云端实验室"前推到战术边缘，并强调在无连接、高时延、强对抗条件下保持本地自主。这与民用领域Kubernetes向边缘延伸、以及"主权AI/本地部署回归"的趋势高度一致。

### "软件定义"正在改变国防采购逻辑

X-BAT项目通过OTA快速追加资金、Project ARIA强调"以月而非年为单位"交付、NGC2以模块化方式容纳多家软件厂商，都反映出国防采购正从"一次性大平台"转向"持续迭代的软件能力"。AI与自主系统的快速演进，使得传统多年周期的采购流程难以适应，这也解释了为何五角大楼越来越依赖Tradewinds、ARIA等机制引入"非传统"承包商。

## 结论

AI、边缘计算与分布式数据架构正深刻重塑军事信息基础设施。从印太的指挥控制网络到士兵随身设备上的抗毁AI，再到战场上的多厂商无人机互联，国防领域正在把民用云原生的最佳实践与军用严苛的韧性、安全要求相结合。对从业者而言，值得关注的是模块化开放架构、DDIL环境下的边缘自治，以及软件快速迭代的采办模式。未来战场的优势，将越来越取决于谁能更快地把数据、算法与边缘算力整合为可用的决策优势。
