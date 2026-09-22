---
layout: post
title: "政策动态：美CISA/NSA/FBI联合警告中国公司'工业规模知识蒸馏'、英国数据监管AI征询今日截止、Anthropic暂缓旗舰模型交予英国AISI预测试"
date: 2026-09-10
author: "云原生观察"
source: "https://www.cisa.gov/news-events/news/cisa-nsa-and-fbi-warn-china-based-ai-companies-targeting-us-ai-models-industrial-scale-knowledge"
categories: [news]
tags: [politics, AI-policy, cybersecurity, CISA, UK, AISI, governance]
---

# 政策动态：美CISA/NSA/FBI联合警告中国公司"工业规模知识蒸馏"、英国数据监管AI征询今日截止、Anthropic暂缓旗舰模型交予英国AISI预测试

AI治理与产业安全本周在三地同步升温：美国CISA、NSA与FBI联合发布警告，指中国AI公司正以"工业规模的知识蒸馏"手段，通过海量自动化请求从Anthropic、OpenAI、Google、xAI等前沿模型中抽取训练信号，试图快速补齐自身基础模型能力；英国DSIT的"AI时代数据监管"征询今日23:59截止，数据监管与AI战略权责在政府重组后出现分散；同期FT报道Anthropic将受限版旗舰模型拒绝送交英国AISI预发布测试，首次将英国政府测试机构排除在外，引发对"美国保护主义外溢"的忧虑。AI竞合摩擦，已落到公司与政府互动的具体层面。

## 主要新闻 (Main News)

### CISA/NSA/FBI联合警告：中国公司正对美前沿模型发起"工业规模知识蒸馏"

CISA、NSA与FBI于9月8日发布联合指南（含AA26-251A系列），指控DeepSeek、Moonshot AI、阿里、MiniMax、StepFun与Z.AI等中国AI公司持续对美国前沿模型（Claude、GPT、Gemini、Grok等）实施"工业规模的知识蒸馏"：自2024年底起，通过自动化工具发起数以百万计的会话与请求，抽取数以十亿计的token，大量绕过访问控制并违反服务条款，以"捷径"缩短研发周期、削弱美国在AI领域的竞争优势。联合指南给出三类应对：检测与缓解（监测订阅—用量是否异常、跟踪企业级吞吐）、针对性的目标响应（如消耗token、微妙改变模型输出以干扰蒸馏）、以及与跨机构情报共享。CISA代理局长Nick Andersen称此为"窃取美国最先进AI技术的皇冠明珠"。

**Source:** [CISA, NSA and FBI Warn About China-Based AI Companies Conducting Industrial-Scale Knowledge Distillation - CISA](https://www.cisa.gov/news-events/news/cisa-nsa-and-fbi-warn-china-based-ai-companies-targeting-us-ai-models-industrial-scale-knowledge)

### 英国"AI时代的数据监管"征询今日截止：政改后由谁负责仍是悬案

英国DSIT就"数据法规如何适配AI等数据密集型技术"发起的征询今日23:59截止。征询围绕五个主题展开：数据的获取与使用（包括"个人数据"定义与AI开发的合法基础是否仍成立）、数据质量及对个体的下游影响、AI供应链上的治理与控制者/处理者角色、复杂数据环境中的透明度与个体权利、以及整体框架对新兴技术的适应性。有意思的是，这次征询7月15日启动，六天后DSIT即被拆分：科学与创新转移至DBIST，AI战略移入内阁办公室（新任AI大臣Kanishka Narayan），数据与数字监管归DCMS——起草征询的部门不再负责落实。业界的回应（如数据与营销协会DMA）正引导成员聚焦对模型训练最关键的争议点：合法利益、目的限制、规模化数据最小化与匿名化（版权明确不在范围内）。

**Source:** [Data regulation in the age of AI and other data intensive technologies - GOV.UK](https://www.gov.uk/government/calls-for-evidence/data-regulation-in-the-age-of-ai-and-other-data-intensive-technologies)

### Anthropic暂缓把旗舰模型提前送测英国AISI：自愿机制的脆弱性再被曝光

金融时报报道，Anthropic未将最新的受限访问旗舰模型送至英国AI安全研究所（AISI）进行预发布评估，而是把提前访问权仅给予美国政府批准的少数组织，这是英国政府测试机构首次在Anthropic前沿模型发布中被排除在外。英国官方表达了深切担忧——正值"美国AI保护主义外溢"（出口管制、预发布测试收窄到美国）议论升温之际。AISI目前预算约6600万英镑、百余名专家，已评估过30多个前沿模型，其参与完全依赖自愿送测而无强制权。英国内阁办公室回应称将继续与包括Anthropic在内的各方密切合作，但并未承诺下次必获送测。

**Source:** [Anthropic skips UK AISI pre-release testing of Mythos 5.1 - Financial Times](https://www.ft.com/content/560e1c8b-f163-4fd6-b604-e905550ac870)

## 分析 (Analysis)

CISA的联合警告是本周政策面最重的动作。它把"知识蒸馏"从一个学术话题升级为国家层面的威胁模型——美国监管者第一次以官方口径点名多家中国AI公司，并将此定性为"绕开授权、批量抽取"的工业级行为。值得注意的是其应对建议里既有传统的检测与缓解，也包含"消耗token、微妙改变输出"这类指向"反制"的战术动作——这实际是把前沿模型的API变成了一场攻防阵地。对在美运营的中国AI公司而言，无论是否主动参与，"被点名+被接口级反制"都可能成为新常态。

英国一侧的两件事则暴露其"自愿式AI监管"的脆弱面。数据征询本身内容务实（五主题直指模型训练的数据合规痛点），但"写征询的部门已被拆掉"折射出政府重组期AI治理的权责真空；Anthropic拒送AISI预测试则更直接——当最先进的模型连"排队等自愿送测"的资格都没有时，来自政府的"深切担忧"与缺少强制权之间出现了真实落差。与其说这是英国特有的困境，不如说是全球AI治理共同的难题：测试机构的能力赶不上模型发布节奏，自愿机制在商业与地缘压力下越来越不稳。

跨新闻看，本周政策主线是"AI竞合摩擦已落到公司与政府互动的具体层"：美方用安全通告与出口审批管控"跨境学习"，英方用征询与自愿测试争取"知情权"，而前沿实验室正在用发布节奏本身行使更大的话语权。AI国际治理的主动权，正从"规则制定"微妙地转向"谁能决定谁先看到模型"。

## 结论 (Conclusion)

CISA/NSA/FBI的联合警告、英国数据征询截止与Anthropic-AISI的送测龃龉，共同指向AI国际治理的两大悬念：知识蒸馏/跨境模型学习将被各国以何种力度定性，以及自愿式预发布测试机制在商业化与地缘压力下能否存续。建议相关从业方关注三组信号：美国对涉事中国公司的后续执法口径、英国AISI获得法定送测权的立法进程、以及其他前沿实验室（OpenAI、Google）是否跟进Anthropic的送测策略。