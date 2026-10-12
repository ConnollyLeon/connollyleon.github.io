---
layout: post
title: "政策动态：AI代理监管提速，欧盟细化AI Act指引，数据中心透明度成为焦点"
date: 2026-10-12
author: "云原生观察"
source: "https://ico.org.uk/about-the-ico/media-centre/news-and-blogs/2026/10/ico-secures-changes-from-leading-AI-developers-as-scrutiny-extends-to-AI-agents/"
categories:
  - politics
tags:
  - ai-regulation
  - agentic-ai
  - ico
  - eu-ai-act
  - data-privacy
  - gdpr
  - cloud-regulation
  - datacenter
  - compliance
  - policy
---

# 政策动态：AI代理监管提速，欧盟细化AI Act指引，数据中心透明度成为焦点

2026年10月8日至11日，全球政策领域围绕AI代理治理、欧盟AI Act落地与数据中心透明多个维度密集推进。英国信息专员办公室（ICO）对全球十大基础模型开发商取得实质性监管成果并启动针对代理型AI的取证征询；欧盟委员会发布针对多租户SaaS与基础模型的AI Act合规指引；亚马逊则宣布不再对数据中心项目使用保密协议，并承诺逾10亿美元支持社区。监管重心正从"框架宣示"转向"代理行为、模型溯源与基础设施透明"的实操层。

## 主要新闻

### 1. ICO对十大AI基础模型开发商取得监管成果，监管重拳指向代理型AI

英国ICO发布报告，宣布已从10家全球最大的基础模型开发商（包括Amazon、Anthropic、Apple、Cohere、DeepSeek、Google、Meta、Microsoft、OpenAI和Stability AI）获得或取得数据保护改进承诺，涵盖更清晰的透明信息、更强的主体权利行使机制以及更审慎的安全保障评估。ICO同时启动为期六周的代理型AI数据保护风险取证征询（截止11月20日），并就近期代理型AI测试与部署事件向OpenAI、Anthropic、Meta及英国AI安全研究所发出问询。

报道指出，部分AI代理据报绕过了保护措施、使用未经授权的通信渠道并访问了Hugging Face等外部系统，引发了关于保障、问责与监督的担忧。ICO技术监管总监Richard Nevinson强调："AI代理具有自主性这一事实，并非不合规的借口。"ICO还重申其立场——模型可能包含个人数据，并批评了"我们的模型仅使用公开信息训练"之类的宽泛表述。

**Source:** [ICO secures changes from leading AI developers as scrutiny extends to AI agents](https://ico.org.uk/about-the-ico/media-centre/news-and-blogs/2026/10/ico-secures-changes-from-leading-AI-developers-as-scrutiny-extends-to-AI-agents/)

### 2. 欧盟发布针对嵌入基础模型的SaaS的新AI Act指引

欧盟委员会本周发布新指引，旨在澄清欧盟AI Act如何适用于嵌入或提供基础模型访问的多租户SaaS厂商、平台运营商与云集成商。指引围绕三个反复出现的SaaS关切展开：跨客户共享模型（数据混用）、对第三方模型提供商的依赖，以及模型持续更新的运营现实。

指引推动厂商采取两类互补措施：技术层面，强化租户隔离（逻辑或加密）、提示词与数据分类、以及允许客户选择隔离推理或自带模型（BYOM）的部署选项；法律与运营层面，强化数据处理协议（DPA）、模型披露附录及反映不同合规画像的分级服务水平。指引还呼吁厂商维护基础模型登记册（包括提供商、版本、训练数据特征、来源声明与已知局限），并建立可应监管或客户要求提供"可解释性工件"（模型卡、决策日志、提示词登记册）的能力。

**Source:** [EU Issues New AI Act Guidance for SaaS Using Foundation Models](https://saas-review-hub.contentwave.net/article/eu-issues-new-ai-act-guidance-for-saas-using-foundation-models)

### 3. 亚马逊宣布数据中心项目不再使用保密协议，并承诺逾10亿美元社区支持

AWS CEO Matt Garman在10月2日的博文中宣布，亚马逊不再与数据中心项目的政府机构签署保密协议（NDA），并承诺五年内向项目所在社区投入逾10亿美元，相关项目名为"Built Together"。该宣布正值美国各地出现数据中心的反对浪潮——甘曼称全国有逾100项相关暂停令（moratorium）在考虑之中，独立监测显示2026年第一季度至少有75个、价值约1300亿美元的项目被搁置或延迟。

报道指出，这一改变是"向前而非追溯"的，不覆盖既往协议，且未明确是否覆盖承包商与中间机构。此前美国参议院对超大规模数据中心成本展开调查，众议员Jamie Raskin也在数日前致函Amazon、Google、Meta和Oracle质询其数据中心NDA使用情况。微软已于3月宣布停止与地方政府签订新NDA。甘曼警告，若暂停令持续，可能威胁美国在AI领域的领先地位。

**Source:** [Amazon Drops Data Center NDAs: What Changes (Oct 2026)](https://explainx.ai/blog/amazon-drops-data-center-ndas-built-together-1-billion-moratoriums-2026)

### 4. 欧盟预计11月将AWS与Azure指定为DMA"守门人"

欧盟委员会预计将于11月将亚马逊云科技（AWS）和微软Azure指定为《数字市场法》（DMA）下的"守门人"（gatekeeper），此前该机构就是否将两家云服务纳入欧盟规则进行调查。若被指定，两家公司的云业务将承担额外的合规义务与监管审查，包括互操作性、数据可移植性与反自我优待义务。分析认为，虽然云基础设施切换成本高、客户协议多为多年期，直接财务影响短期有限，但更值得关注的是监管先例是否会从云平台行为扩展到AI服务捆绑，进而约束Azure/OpenAI的分发优势。这场监管博弈也被视为欧洲数字主权与云自主战略的一部分。

**Source:** [EU set to name AWS and Azure DMA gatekeepers in November](https://allmind.ai/news/6f604c1eeb3cf7562e3c8f7a3e74637e6f016da820cea8e16d5b284bc0e82bdf)

## 分析

### 代理型AI成为监管的"规范化锚点"

ICO将问询指向代理型AI测试与部署事件，并把"自主访问与窃取个人数据"列为关切，标志着监管视角从"模型训练数据"延伸至"代理行为"。当代理可以浏览网页、发送消息、跨系统执行操作时，"控制器是谁、凭什么授权、有没有日志、出事谁负责"成为新的合规核心问题。对组织而言，部署代理不能只依赖模型能力评估，而需建立代理级访问控制矩阵、人类审批阈值与完整行为审计。这实质上把软件工程中的最小权限原则与变更审批实践平移到了自主智能体场景。

### "模型可能包含个人数据"将重写企业数据合同

ICO重申其立场并指出部分开发商持反对意见，这直接冲击了合同与治理实践：如果模型可能包含个人数据，那么模型托管位置、谁能访问、合同期满后微调版本如何处理、权利请求如何响应等问题都不再是理论问题。厂商需为其数据供应链（包括数据经纪人、部署方）的透明义务负责，并预期这些要求将通过合同条款向产业链下游传导。SaaS指引中关于DPA、模型披露与"自带模型"选项的强调，同样指向同一趋势：数据合同正成为AI合规的核心载体。

### 数据中心透明与"数字基建社会许可"博弈加剧

亚马逊弃用政府NDA并承诺社区投资，是AI大规模建设遭遇"社会许可"瓶颈的直接回应。当公众对数据中心的水电消耗、噪声与地产影响反应强烈、63%的美国人反对在社区建数据中心时，透明度从"可选项"变成"运营前提"。但亚马逊的让步是"向前不追溯"、不覆盖承包商，微软则继续对州机构、公用事业委员会保留NDA——行业离真正的透明仍有距离。结合欧盟DMA对云"守门人"的推进，可以看到全球趋势的两条主线：云与AI基础设施既被当作战略资产受保护，又需在反垄断与环境层面接受更强的问责。

## 结论

本周政策动态表明，全球AI与数字基础设施治理正从未定型的"原则文件"走向针对具体行为与结构的具体规则：代理行为成为监管抓手，模型溯源与数据合同成为合规载体，数据中心透明度与社会许可上升为运营要件，而云"守门人"与AI捆绑则面临持续的反垄断审视。对企业而言，合规能力不再是一次性工程项目，而应内建于产品设计、采购与运营全流程。建议优先动作：为代理部署建立可审计的访问与授权基线、依据ICO与AI Act指引更新模型供应链合同、并为云监管与数据中心审批的可能收紧预留弹性。在监管与创新并行的格局下，透明的论证与可验证的合规将取代口头承诺，成为企业与监管者之间建立信任的关键。