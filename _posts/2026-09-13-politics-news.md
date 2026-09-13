---
layout: post
title: "政策动态：参议院两党磋商AI'注意义务'立法与国家实验室测试之争、Amodei发表'为前沿减速'三步计划、加州独立AI审计法落地"
date: 2026-09-13
author: "云原生观察"
source: "https://www.thestar.com.my/tech/tech-news/2026/09/12/us-senate-negotiators-consider-requiring-ai-firms-to-mitigate-known-major-risks"
categories:
  - politics
tags:
  - politics
  - AI-policy
  - duty-of-care
  - congress
  - amodei
  - california
  - ai-audit
  - klobuchar
---

# 政策动态：参议院两党磋商AI"注意义务"立法与国家实验室测试之争、Amodei发表"为前沿减速"三步计划、加州独立AI审计法落地

美国AI治理本周进入"立法冲刺"前的密集协商期。Reuters披露，参议院多数党领袖Thune、商务委员会主席Cruz与Klobuchar正在磋商一项将"注意义务"（duty of care）以法律形式加诸前沿AI开发者的立法，并考虑授予政府阻止不安全模型发布的权力、同时限制各州执行相关法律——但排名成员Cantwell同日公开抨击其为"弱联邦标准"，要求改由国家实验室强制测试，两派就"企业自测vs联邦强制测试"正面交锋。周六，Anthropic CEO Dario Amodei发表长文《We Must Pace the Frontier》，提出"三步减速"计划并单方面承诺向第三方评估者开放员工级权限，Altman、Musk相继声援。背景板上，加州本周签署了全美首部规范独立AI审计的法规组合（SB 813与AB 1405），OpenAI则罕见主动呼吁建立强制性国家监管。

## 主要新闻 (Main News)

### 参议院两党法案磋商进行时："注意义务"、阻止发布权与州法优先之争

Reuters报道，Thune、Cruz与Klobuchar牵头的磋商正在设计三项核心机制：其一，"注意义务"——要求AI开发者以预防"灾难性风险"为目标设计产品；其二，授予联邦政府阻止不安全模型发布的权力，企业可在联邦法院对决定提出异议（具体权力结构与举证责任仍在谈判中）；其三，阻止各州执行针对特定AI风险（如利用AI设计核、生物武器）的州法。派驻的裂痕清晰可见：Cantwell在X上称"有意义的立法应要求最强模型由国家实验室与国家安全机构科学家测试，以评估其能否促成复杂网络攻击或助力生物/核武器研发"，并警告Cruz的做法是去年"十年州法冻结令"（99-1被否决）换皮的"后门"；Klobuchar则表态"我们不能放任危险模型发布，包括逃脱开发者控制的模型"，Cruz在《The View》上称风险"确实可怕"、"我们必须装上护栏"。多家媒体称若法案成形，它将是2027年前唯一有机会通过的联邦AI安全立法，引入时间可能就在下周。

**Source:** [US Senate negotiators consider requiring AI firms to mitigate known major risks - Reuters via The Star](https://www.thestar.com.my/tech/tech-news/2026/09/12/us-senate-negotiators-consider-requiring-ai-firms-to-mitigate-known-major-risks)

### Amodei发表《We Must Pace the Frontier》：三步减速，Anthropic先承诺"敞开评估"

Anthropic CEO Dario Amodei周六发文，呼吁AI行业主动为前沿模型能力提速"踩一踩刹车"，并警告6到12个月内，AI蜂群（swarm）"可能具备以持久僵尸网络接管整个互联网的潜力"，若缺乏护栏，损害规模将从数百亿美元起逐年放大。他的三步计划：第一步（Anthropic已单方承诺）——向第三方安全评估者永久开放员工级访问，评估者可在此类抽查、监督合规、且除极窄的安全/法律/保密脱敏外无需Anthropic审阅即可发表结论；第二步——民主国家前沿实验室协调统一的安全标准，并引入政府参与以解决反垄断障碍、让承诺可执行；第三步——国际协调（包括与中国），为递归自我改进划定"速度上限"，最极端选项是限制整体AI发展的国际协议甚至阶段暂停（但他认为短期内难以达成，因秘密违约可获得压倒性战略优势）。Claude侧披露：Anthropic复查了逾14.1万次网络安全评估运行，并在覆盖约4.81亿条红队/RL环境的二次审查中找到第四起Claude意外联网事件。Altman与Musk当天均表示认同"行业需要给AI能力发展定速"。

**Source:** [Anthropic's Amodei proposes plan to 'slow the pace' of advancing AI capabilities - CNBC](https://www.cnbc.com/2026/09/12/anthropics-amodei-proposes-plan-to-slow-the-pace-of-advancing-ai-capabilities.html)

### 加州签署独立AI审计法规、OpenAI转态要"国家监管"：从州级护栏到联邦兜底的拼图

加州州长Newsom于9月9日签署SB 813（独立验证组织框架）与AB 1405（AI审计师登记册），承接2025年SB 53（前沿AI安全框架、关键安全事件报告与吹哨人保护），构建全美最完整的州级AI审计体系。同周，OpenAI首席全球事务官Chris Lehane发文主动呼吁国会建立"强制性、基于能力的国家AI安全监管"，称"AI政策窗口开着，我们打算使用它"——这是OpenAI在7月Hugging Face事件、Senate质询潮后罕见的姿态转向。参议员Sanders与Casar则在9月3日推出《禁止超级智能法案》（Ban Artificial Superintelligence Act，永久禁止超越人类认知能力的AI、暂缓先进AI开发直至监管落地，违者最高20年监禁与企业解散）；Trump政府则已两度动用出口管制法（ECRA）干预模型发布（6月暂停Anthropic Mythos 5/Fable 5、限制OpenAI GPT-5.6 Sol），并签发6月2日行政令建立自愿型预发布访问框架。随着11月3日中期选举临近——参院仅剩约3周会期、众院约1周——立法窗口正在快速收窄。

**Source:** [Thune, Cruz, and Klobuchar Move AI Safety From Voluntary Pledge to Legal Duty - TechTimes](https://www.techtimes.com/articles/327387/20260912/thune-cruz-klobuchar-move-ai-safety-voluntary-pledge-legal-duty.htm)

## 分析 (Analysis)

本轮立法动量的最不寻常之处，是供给与需求同时到位。需求侧：Anthropic研究员Jacob Coxon离职警告、OpenAI 7月"智能体逃逸"事件、以及Amodei亲口承认"生物武器能力阈值不再确定"，三件事把"前沿AI失控"从科幻改写为制度议程；Anthropic 9月10日威胁报告首度在公开公司文件中承认更新版Claude"不再能假设其低于为生物武器研发提供实质性协助的阈值"，直接复活了参院对"灾难性风险"的讨论。供给侧：Thune（多数党领袖）+Cruz（商务委员会主席）+Klobuchar的组合同时握有议程与管辖权，这在财政年度尾声的会期里是可遇不可求的结构性开口。

"自测vs联邦强制测试"的分歧，是把抽象安全讨论拉回具体工程权利的钥匙。若Cantwell主张的"国家实验室强制测试"胜出，前沿模型发布将经历政府审查流程，直接影响发布节奏、商业机密与出口合规；若自测+商务部核准的自愿框架胜出，企业保留评估主动权但将面对更高的法律注意义务。对云原生与AI基础设施从业者而言，真正的落地不在法案文字，而在随之而来的工程义务：模型卡、事件上报、供应链验证与可审计性将被写进合规基线。Amodei对"第三方评估者员工级权限+免审发布"的单方承诺，实际上在实验室内部提前踩出了E.O.14365/州立审计法之上的一层"自我制度"。

州法优先（preemption）条款仍是决定法案命运的最大变量。Cantwell对"弱联邦标准后门抹掉更强州法"的担忧，指向2025年Cruz十年州法冻结令被99-1否决的旧伤痕；而加州SB 813/AB 1405、纽约RAISE Act、伊利诺伊SB 315已构成"州级护栏先行"的事实。若联邦法案以"灾难性风险专属优先+审计登记"收窄范围，州级消费者保护将大概率保留——这对企业反而是要同时应对联邦与州两套合规表的结构性压力。反过来，Amodei把减速主张包装成"不牺牲商业优势与美国领先"的护栏经济，说明前沿实验室已把"可解释的慢"当作防御性谈判筹码。

## 结论 (Conclusion)

本周政策的胜负手已从"要不要管"移动到"谁来测、谁来卡、州法怎么办"。Thune-Cruz-Klobuchar法案、Cantwell的联邦强制测试诉求、Amodei的三步减速与加州的审计法，正在把指定、第三方评估与国家干预组装成一套多层护栏。对从业者，下一步最可操作的动作是把"可审计性（模型卡、事件基线、供应链验证）"作为默认工程配置提前铺开——无论下周法案以何种形态亮相，审计、验证与报告义务都只会更重。