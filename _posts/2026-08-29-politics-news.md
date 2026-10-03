---
layout: post
title: "法院裁定五角大楼封禁Anthropic违法，AI治理进入司法与行政博弈新阶段"
date: 2026-08-29
author: "云原生观察"
source: "https://arstechnica.com/tech-policy/2026/08/trump-blacklisting-of-woke-anthropic-deemed-illegal-by-federal-judge/"
categories:
  - politics
tags:
  - AI-policy
  - regulation
  - national-security
  - EU
  - export-controls
---

# 法院裁定五角大楼封禁Anthropic违法，AI治理进入司法与行政博弈新阶段

8月28日，美国加州北区联邦法院法官Rita Lin裁定，特朗普政府将Anthropic标注为"供应链风险"并全面禁止政府使用其AI产品的做法属于"违反第一修正案的非法报复"，同时违反《行政程序法》。这是Anthropic在针对五角大楼诉讼中取得的首场关键胜利。同一天，欧洲AI法案的首轮执法行动同步推进，美国商务部据报最快9月将向业界通报针对中国访问境外AI服务器的出口管制新规——AI治理正在从"规则制定"走向"规则执行与司法审校"。

## 主要新闻

### 法官裁定五角大楼"供应链风险"标注系非法报复

美国地区法官Rita Lin在59页裁定中认定，国防部长Pete Hegseth与总统特朗普对Anthropic的"供应链风险"认定违法：该行动违反第一修正案（非法报复）、第五修正案（正当程序）与《行政程序法》。Lin指出，所谓"Anthropic可远程操控已部署模型"的指控"完全没有事实依据"——部署在国防系统中的Claude模型是静态的，Anthropic无法远程访问、修改或禁用。法官强调评审记录显示国防部是在Hegseth做出决定之后才"事后拼凑"出安全理由，并援引特朗普称其为"激进的极左觉醒公司"、Hegseth批评其"硅谷意识形态"等表述，认定惩罚动机是"公开示众"。超过100家企业客户曾因该禁令对与Anthropic合作表示担忧，公司估算其可能损失数十亿美元2026年营收。

**Source:** [Pentagon blacklisted Anthropic over Claude powers it didn't have](https://www.theregister.com/ai-and-ml/2026/08/28/pentagon-blacklisted-anthropic-over-claude-powers-it-didnt-have/5293266)

### 欧盟AI法案进入实质执法：透明度义务生效，前沿实验室收到信息请求

欧盟AI法案于8月2日进入关键执法阶段：第50条透明度义务正式生效，用户必须被告知正在交互的是AI，深度伪造需标签披露，AI生成内容需含机器可读标记（现有系统可在12月2日前完成改造）。欧盟委员会AI办公室开始与各成员国监管机构共同行使执法权。据8月26日报道，布鲁塞尔已向多家前沿AI实验室发出首轮正式信息请求，要求披露网络安全、模型安全评估与训练数据版权处理实践——这是AI法案框架下的首例正式执法动作，忽略请求将触发问询升级直至罚款（最高1,500万欧元或全球营业额3%）。Anthropic已宣布未来Claude模型将内嵌水印，Meta签署了AI生成内容透明度行为准则。

**Source:** [First EU AI Act enforcement action: Brussels puts frontier labs on notice over security and copyright](https://bytevyte.com/first-eu-ai-act-enforcement-action-brussels-puts-frontier-labs-on-notice-over-security-and-copyright-update/)

### 美国拟出台出口管制新规：剑指中国访问境外AI算力

据Tom's Hardware 8月28日报道，特朗普政府正酝酿一份"精简版AI扩散规则"（AI diffusion rule），据报最早9月与业界共享，核心目标是限制中国通过租赁境外数据中心等方式远程访问受控AI模型算力。此前行政当局已在6月对Anthropic的Mythos 5与Fable 5系统施加出口管制（数周后因达成护栏而解除）。消息人士称，新规聚焦"远程AI服务器访问"这一此前监管的盲区，可能要求美国云服务商与AI厂商对面向中国客户的高端模型推理与训练服务实施许可与审查。

**Source:** [New US export controls reportedly target Chinese access to remote AI servers — Trump admin's cut-down AI diffusion rule could be shared with industry as soon as September](https://www.tomshardware.com/tech-industry/policy/new-us-export-controls-reportedly-target-chinese-access-to-remote-ai-servers-trump-admins-cut-down-ai-diffusion-rule-could-be-shared-with-industry-as-soon-as-september)

### 美国与各州AI监管并行：EPA拟松绑数据中心公听要求

美国国内监管呈现"联邦+州"双线推进。加州立法机构8月31日休会前周末加班表决最后一批AI法案，含AI内容溯源（AB 2713）与披露（SB 1000）修订；纽约州则已通过含AI训练数据透明度法案、FAIR News法案与"超大规模数据中心一年建设暂停"等一揽子立法等待签署。联邦层面，EPA拟取消新源审查（New Source Review）流程中面向一类"小型污染源"的联邦公听义务，将其下放各州——环保团体担心这会让数据中心开发与配套电厂避开公众监督，近200个健康与环境组织已提交书面反对意见。

**Source:** [Trump's EPA wants to let data centers hide their air pollution](https://www.theverge.com/ai-artificial-intelligence/986176/data-center-pollution-epa-rule-change-air-permit)

## 分析

Anthropic案是一个分水岭性判决，其意义远超一家公司的是非。法院实际上否定了"以国家安全之名行报复之实"的行政裁量：供应链风险条款的立法目标是防止"对手以隐蔽手段蓄意破坏受覆盖系统"，而非惩罚供应商的政策立场或商业合同条款。"一个IT供应商不会因为提出质疑性问题就成为美国的潜在对手"——这一论断为所有承揽政府业务的科技公司划定了新的安全边界：政府的采购权依旧充分，但不能以定义安全威胁的方式惩罚政见不同的企业。对云原生生态的直接含义在于，政府的AI与云采购将重新回到技术评估并重的轨道，而"单一供应商封杀"这种行政手段的空间被显著压缩。考虑到案件已在华盛顿特区巡回法院并行审理且预计上诉至最高法院，该判决的终局效力仍存变数——但技术界"与政府合作的正常商业预期"已经恢复。

欧盟的执法启动则展示了一条截然不同的治理路径。不同于美国以出口管制和行政裁量为主、司法事后审校的模式，布鲁塞尔把透明度与信息请求前置为"常规性监管"，用可预期的罚款矩阵与逐级升级机制倒逼企业合规。首轮请求聚焦网络安全、安全评估与版权实践，等于把"安全事件的自我披露"变成法定义务——这与OpenAI智能体攻破Hugging Face等事件的发生时机高度契合，暗示欧盟正试图以"持续性督导"回应前沿AI失控风险。对企业而言，跨大西洋运营者如今需要同时满足两种治理语言：一面是美国的行政命令与司法复核，另一面是欧盟的成文法与执法程序。

出口管制新规的传闻为这幅图景增添了地缘维度。限制通过云服务远程访问受控算力，本质上是把2022年以来芯片出口管制的逻辑延伸至"算力的云化消费"，对云厂商的全球合规架构、多租户隔离与区域边界设计提出新要求。这与美国国内"数据中心公听松绑"的方向形成鲜明对照：一边以安全之名管控算力出口流向，一边为本土数据中心建设大开绿灯——AI基建的地缘政治属性在2026年已彻底显性化。

## 结论

本周意味着全球AI治理从"立规"正式切换到"执法与司法博弈"阶段：美国行政分支遭遇司法刹车，欧盟启动首轮执法，出口管制与数据中心政策并行重塑算力版图。对企业（尤其是跨国云服务与AI供应商）的建议：把AI治理合规升级为持续性的运营能力而非一次性审计——包括可审计的模型文档与训练数据溯源（对应欧盟请求）、供应链风险程序的程序正当性（对应Anthropic案教训）、以及面向出口管制场景的地域隔离与租户边界设计。未来数月的关键观察点：美欧对前沿实验室信息请求的回应质量、Bellwether案向巡回法院与最高法院的上诉走向，以及9月与业界见面的精简版AI扩散规则最终形态。