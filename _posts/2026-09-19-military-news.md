---
layout: post
title: "军事科技动态：北约DIANA项目让无人机机载AI自主选择目标完成打击、Naver Cloud发布面向军用的『Defense Sovereign AI』战略、Indra推出DRIZZLE自主拦截无人机与130公里母舰体系"
date: 2026-09-19
author: "云原生观察"
source: "https://arstechnica.com/ai/2026/09/nato-backed-startup-adapts-ai-for-autonomous-drone-recon-and-attack-missions/"
categories: [military]
tags: [military, scaleout-systems, nato, diana, edge-ai, federated-learning, alma, bae-systems, loitering-munition, autonomous-targeting, naver-cloud, defense-sovereign-ai, south-korea, indra, drizzle, counter-drone, unvex, mothership]
---

9月17日至18日，军事AI的"自主化"进程在三个维度同时推进。软件侧，Ars Technica详细披露北约DIANA加速器支持的瑞典初创Scaleout Systems，如何用机载边缘小模型让ALMA低成本巡飞弹药在通信被压制、中枢失联的战场环境下自主识别、排序并攻击目标。国家队侧，韩国Naver Cloud在首尔举办"Defense AI Day"研讨会，正式提出面向军用的"Defense Sovereign AI"战略——以国防专用云加军事验证审批链控制数据与模型主权。硬件侧，西班牙Indra在UNVEX 2026发布DRIZZLE自主拦截无人机家族，配合在30,000英尺高度巡航的"母舰"把拦截半径扩展到约130公里。三条消息的共同指向是：自主性不再停留在演示，而是以"可采购的系统＋可执行的战略"形态进入各国军队的采购清单——美军的Domain Gap与俄乌战场的经验正在被欧洲与亚洲的行动固化。

## 主要新闻 (Main News)

### Scaleout Systems：边缘AI让巡飞弹药在"无链路"条件下自主选择目标并完成打击

Ars Technica 9月17日报道，北约DIANA加速器支持的瑞典初创Scaleout Systems，正在把紧凑型计算机视觉模型部署到无人机、飞手平板与野战指挥节点之上——不是采用OpenAI或Anthropic式的庞大前沿模型，而是针对巡逻机载处理器优化的轻量型号，让目标识别、定位与打击决策全部在机内完成。在BAE Systems Bofors主导的ALMA（低成本巡飞弹药）项目中，2026年1月瑞典冬季演示中，一架ALMA无人机自主探测、识别并测距全部潜在威胁，并按预设优先级选取了最有价值目标——一辆装甲工程车——飞赴并将其击中，全程无需操作员直接指挥；6月在乌普萨拉空军基地的第二次测试进一步验证了"断链续训"：前出计算节点与后方实验室失联后仍能本地执行推理与主动学习，待网络恢复再把模型更新同步回去。联合创始人兼CEO Andreas Hellander强调，联邦学习架构在原则上可以解锁"北约成员国之间的协作"。这套"多层级：边缘设备推理＋本地节点重训＋选择性上传"的设计，直指电子战与中枢摧毁的经典软肋——依托中心的AI在断链瞬间即失效，而乌克兰战场上大量廉价FPV已在用机载AI证明这一点。

**Source:** [Small AI models let drones autonomously identify and attack battlefield targets | Ars Technica](https://arstechnica.com/ai/2026/09/nato-backed-startup-adapts-ai-for-autonomous-drone-recon-and-attack-missions/)

### Naver Cloud发布"Defense Sovereign AI"战略：以国防专用云+军事验证链控制数据与模型主权

9月18日，Naver Cloud在首尔新罗酒店举办"Defense AI Day"研讨会，吸引韩国国防部、联合参谋本部及各军种代表约550人出席。会上，Naver Cloud正式提出"Defense Sovereign AI"战略：把民用AI技术与云能力验证应用于军事场景，包括增强自主武器系统、支撑基于数据的实时决策——同时强调军队必须对数据与模型保有最终控制，落点是国防专用云。其副总裁Yoo Kyung-beom指出，关键不是单个AI模型而是"体系性运行"，要让战场数据贯通供AI使用，并设计与国防部实际作战相符的云与数据中心；演示环节（炮兵火力与海上异常两个场景）展示了如何把无人机/CCTV影像、语音报告、海面雷达等异源信息汇入统一态势图并给出多套响应选项。Naver Cloud的推进节奏可见其商业化决心：3月启动国防AI技术合作、6月设立专职组织、9月抛出完整战略——提出的流程是"中心模型训练评估→军事验证审批→部署至任务现场"，且"断链也须能继续使用已获批的AI服务与数据"，任何更新模型同样须经军方验证后方可重新部署。作为韩国本土云厂商，这既是对美系平台（Palantir等）进入韩国军方的对冲，也是首尔"自主国防AI"叙事的产业落地。

**Source:** [Naver Cloud Unveils Defense AI Strategy for Military Applications | Aju Press](https://www.ajupress.com/view/20260918150870892)

### Indra发布DRIZZLE自主拦截无人机：30,000英尺母舰把反无人机半径拉升到130公里

在9月16-17日于西班牙圣哈维尔举行的UNVEX 2026上，西班牙科技集团Indra发布DRIZZLE——应对无人机蜂群攻击的自主拦截无人机家族，定位为低成本的"可消耗硬杀伤"反无人机执行器，可保护基础设施、军用车队与部署部队，也可作为地面车辆与直升机的机载自防护层。其关键是"母舰"设计：一架更大的可消耗母舰可在任务前80公里飞行中于30,000英尺高空巡航，随后释放多架DRIZZLE拦截器，拦截器再自行飞行约50公里，使整个系统打击半径接近130公里——这让反无人机能力从"阵地与车队周边"前出为"战役级纵深遮断"。DRIZZLE可与现有C-UAS系统协同，构成硬杀伤层。在俄乌战场无人机攻防双方快速迭代的背景下，西班牙以"低成本可消耗+母舰投送+硬杀伤"的组合进入欧洲反无人机赛道，与北欧（Scaleout/ALMA）、东欧（乌克兰Ai-Petri等）形成了互为补充的产业拼图。

**Source:** [Indra Unveils DRIZZLE Autonomous Interceptor Drone With 130-km Mothership-Enabled Range | The Defense News](https://www.thedefensenews.com/Indra-Unveils-DRIZZLE-Autonomous-Interceptor-Drone-With-130-km-Mothership-Enabled-Range/)

## 分析 (Analysis)

Scaleout案例最值得拆解的不是"无人机自主选目标"的新闻性（乌克兰战场上已存在大量机载AI终端制导），而是"断链续训"的架构意义。传统推理架构在链路被压制或数据中心被摧毁后即刻失效；Scaleout以"边缘推理＋本地节点主动学习＋间断同步"把AI从「固定能力」变成「复合能力」——模型在失联期间持续改进、归来时把增益同步回网。这直接回应了美伊冲突中数据中心遭袭与俄乌战场上电子战压制的教训，也解释了为什么北约DIANA把该项目按TRL 6-8推进：这不是研究，而是可采购的系统。但同样的架构也带来治理真空：当杀伤链的终点不再依赖通信链路，人类"否决权（veto）"在断链状态下是否还能到达机，成为CCW日内瓦进程与11月审议会议的核心悬案——这正是9月5日CCW各方就自主武器"非约束性文本"艰难达成共识、美国又推动灵活措辞的背景。评估Scaleout（及其同类）的标准，不只是"能否自主打击"，更是"谁在断链时仍保有问责点"。

Naver Cloud的"Defense Sovereign AI"则是主权叙事在亚洲的镜像。它把"数据与模型最终控制权在军队手中"作为第一原则，并用"军事验证审批链"把AI生命周期（训练→验证→部署→重部署）纳入军法约束——机制上比美系"人在环上"更强调把关口前移到模型更新。这一战略的产业含义同样清晰：当美系平台（Palantir的Maven等）持续渗入欧洲战场与NATO，韩国以「本土云＋本土模型＋军用验证链」构建了对冲；而Spr的"断链续用已批准AI"要求，与Scaleout的断链续训在设计哲学上惊人地一致——2026年军事AI的通行答案，正在收敛为"主权控制的数据底座＋断链可用的边缘智能＋可验证的模型生命周期"。对观察者，Naver Cloud能否把演示视频推进到实际列装、以及其模型在真实战场数据下的泛化表现，是判断"其到底是有战略还是有产品"的分水岭。

Indra的DRIZZLE则把关注拉回传统军工业的工程化路径：不追求复杂自主平台，而是把"低成本可消耗拦截器＋母舰投送"作为反蜂群的第一性解法。130公里半径的意义在于，反无人机不再是被动防御（车队/阵地的贴身硬杀伤），而是战役纵深的前出遮断——这在乌克兰战场"攻方低成本蜂群、守方昂贵拦截"的成本失衡背景下，提供了一条把拦截成本降到蜂群成本之下的路径。把三条消息并置，2026年军事科技的所有权结构已现：自主"判定"（Scaleout）靠在边缘算力、主权"底座"（Naver）靠国防云＋验证链、执行"末端"（DRIZZLE）靠低成本消耗品——三者共同把"人在环上"从口号变成需要被工程与法理同时回答的问题。

## 结论 (Conclusion)

过去48小时，军事AI的"自主化"在三个层面同时发生：Scaleout用边缘模型与断链续训让巡飞弹药在无链路条件下自主选目标并完成打击，Naver Cloud以国防专用云＋军事验证链发布"Defense Sovereign AI"战略，Indra用母舰＋低成本拦截器把反无人机半径扩充到130公里。它们共享一个判断：自主与主权是2026年军事科技的孪生主题——一边是"机器在失联时仍在决策"的工程现实，一边是"数据与模型最后必须归谁"的治理问题。对跟踪者，三个节点值得锁定：CCW第七次审议会议（11月16-20日，日内瓦）决定自主武器谈判是否启动；Naver Cloud是否把演示推进为韩军列装；以及Scaleout的联邦学习框架能否在NATO成员间真正展开跨国防数据协作——它们将共同回答"自主武器时代，问责点与主权点落在哪里"。