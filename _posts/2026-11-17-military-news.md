---
layout: post
title: "军事应用动态：云端电子战指挥、无GPS导航与反无人机C2集成加速"
date: 2026-11-17
author: "云原生观察"
source: "https://satnews.com/2026/11/16/space-force-awards-10-million-in-sewol-prototype-contracts-to-three-firms/"
categories:
  - military
tags:
  - defense
  - electronic-warfare
  - autonomous-systems
  - counter-uas
  - command-and-control
---

# 军事应用动态：云端电子战指挥、无GPS导航与反无人机C2集成加速

11月16日至17日的防务技术新闻显示，软件化与云原生思路正加速进入作战体系。美国太空军以三家公司竞标方式推进云端电子战指挥系统原型；海军验证无人机在GPS与数据链中断条件下的视觉导航；荷兰公司把商用雷达快速接入反无人机C2平台；乌克兰厂商则将AI任务规划器嵌入无人平台控制系统。共同趋势是：把指挥、导航与任务规划从专用硬件中解耦，转为可快速迭代、可替换的软件层。

## 主要新闻

### 太空军向三家公司发放1000万美元SEWOL原型合同

SatNews于11月16日报道，美国太空军系统司令部向Anduril、Booz Allen Hamilton和Peerless Technologies发放合计1000万美元的第一阶段合同，为"太空电磁战作战位置"（SEWOL）项目开发云端指挥系统。系统目标是统一管理太空军的电子战资产，支持频谱作战、干扰源定位以及轨道与地面链路的快速响应。三家公司各有三个月时间构建软件原型，随后由太空军人员在作战场景中测试评估，最终选择一家开发并部署实用版本。

**Source:** [Space Force Awards $10 Million in SEWOL Prototype Contracts to Three Firms](https://satnews.com/2026/11/16/space-force-awards-10-million-in-sewol-prototype-contracts-to-three-firms/)

### 美国海军测试ScanEagle无GPS视觉导航，漂移低于航程0.5%

Defence Blog于11月16日报道，美国海军研究生院与Rhoman Aerospace合作，使一架ScanEagle无人机在南加州圣克莱门特岛附近海域关闭GPS和地面链路后，依靠摄像头与惯性传感器连续飞行六小时并按航点飞行。公司称在"GPS拒止"环境下实现闭环飞行，位置漂移低于飞行距离的0.5%，即每100公里误差小于500米。系统把视觉惯性里程计与飞行遥测融合，海军研究生院的自主软件在机上充当"另一个地面站"。下一步将移植到可垂直起降、续航超过13小时的AeroVironment JUMP 20。

**Source:** [U.S. Navy tests camera navigation for drones over jammed seas](https://defence-blog.com/u-s-navy-tests-camera-navigation-for-drones-over-jammed-seas/)

### Intelic在30分钟内将萨博Giraffe 1X雷达接入NEXUS反无人机C2

Defense WarRoom于11月16日报道，荷兰公司Intelic在荷兰军事基地的测试中，用30分钟把萨博Giraffe 1X雷达接入其NEXUS反无人机指挥控制平台。Giraffe 1X是X波段短程3D雷达，仪表量程75公里、360度更新周期1秒；其航迹直接进入NEXUS操作员界面，可用于评估空中威胁并引导拦截。NEXUS定位为平台无关的C2层，可把传感器、侦察与拦截无人机及人员纳入统一态势图。报道同时指出，30分钟是厂商在受控场景下的说法，未披露实地拦截、接口协议或安全认证细节。

**Source:** [Dutch Firm Intelic Links Saab’s Giraffe 1X Radar to Its NEXUS Counter-Drone Command System in 30 Minutes](https://defensewarroom.com/2026/11/16/intelic-nexus-saab-giraffe-1x-radar/)

### 乌克兰MAC HUB把AI任务规划助手嵌入无人机控制软件

DroneNews.org于11月16日报道，乌克兰军事装备公司MAC HUB与国防情报部门合作，将AI助手"Miss Kraken"集成进其无人平台控制系统MAC Mission Control。该公司称该助手可在数秒内收集分析侦察数据、评估态势、生成方案并准备行动，还能识别目标、规划路线和协调多类无人平台；其关键特性是在互联网连接不稳定时仍可完成任务，并能在链路中断后自行重复或完成既定任务。任务前系统会生成地形与航线3D模型供模拟器演练。

**Source:** [MAC HUB adds an AI mission planner to its MAC Mission Control drone software](https://www.dronenews.org/story/mac-hub-adds-an-ai-mission-planner-to-its-mac-mission-control-drone-software)

## 分析

SEWOL的采购方式很有代表性：小额、多方案、短周期原型，再进入竞争性淘汰。把电子战指挥系统定义为"云端软件"而不是绑定到地面站硬件，意味着频谱管理、干扰源定位和资产调度可以像平台服务一样迭代。但这也带来新的工程问题——电子战决策链路对时延和可用性极为敏感，云原生架构中的多租户、网络跳数和升级节奏，在作战环境中必须重新评估。三家公司三个月内交付原型，考验的正是把软件工程速度转化为可部署能力的能力。

无GPS导航的进展则反映了对抗环境的现实。GPS干扰与欺骗在乌克兰和中东已是常态，而太平洋方向的长距离海上飞行无法依赖地面视觉特征。Rhoman的方案把摄像头、惯导和飞行遥测融合，并在机端运行自主控制，实际上是把"导航+自驾"压缩进一个不依赖外部链路的闭环。0.5%的漂移数字若能在更恶劣海况和更长航程下复现，将显著改变海上侦察与打击的半径。但目前公开信息未说明海况、总航程和具体传感器融合方法，因此仍应视为阶段性验证。

反无人机C2与AI任务规划的新闻则指向同一个瓶颈：传感器、决策者和执行器之间的连接速度。Giraffe 1X这类雷达已广泛存在于北约库存中，如果C2层能在几分钟内吸收新传感器，就能把既有装备快速组成分层防空网络。乌克兰的Miss Kraken则把规划环节前移到AI辅助决策，并强调断网可用性——这与云端的SEWOL形成有趣对照：一边是把能力上收至云端统一调度，另一边是把决策能力下沉到边缘并在失联时自主运行。两者并非替代关系，而是不同作战层级对连接性的不同假设。

从更广的视角看，这些项目都在把军事能力从"平台中心"转向"软件中心"。云端C2、视觉里程计、平台无关C2层和AI任务规划器，本质都是可替换、可升级的软件组件。这降低了新能力进入战场的门槛，也提高了对接口标准、验证流程和安全认证的要求——没有这些"云原生"意义上的治理，快速集成反而可能变成新的脆弱点。

## 结论

值得持续跟踪的指标包括：SEWOL原型在实测中的时延与可用性表现，Rhoman系统在JUMP 20上的海况与航程扩展结果，Intelic是否公开包含实弹拦截的端到端验证，以及Miss Kraken在真实任务中的人机审批边界。对关注军民两用技术的从业者而言，这些案例表明边缘自主、云端调度和快速集成正在成为防务软件的通用范式。
