# Skill: Daily Cloud Native News Generator

## Description
Generates daily blog posts about global cloud native technology developments, including related tech news, fintech news, policy developments, and military applications. Each post includes publication date, source URL, summary, and insightful analysis. Posts are formatted for Jekyll.

## Category
Content Generation - Technical Writing

## Parameters
- `date` (optional): Target date in YYYY-MM-DD format. Defaults to yesterday.
- `categories` (optional): Array of categories to include. Options: `cloud-native`, `tech`, `fintech`, `politics`, `military`. Defaults to all categories.

## Instructions

### Task Overview
For each specified category, search for news from the past 24 hours and generate a comprehensive blog post in Jekyll Markdown format matching the existing site structure.

### Jekyll Post Format

Each generated post MUST follow this exact format:

```markdown
---
layout: post
title: "Post Title"
date: YYYY-MM-DD
author: "Author Name"
source: "https://source-url.com/article"
categories:
  - category-name
tags:
  - tag1
  - tag2
  - tag3
---

# Post Title

Brief summary paragraph introducing the key news (2-3 sentences).

## 主要新闻 (Main News)

### Article Title 1
Summary of key points from the article.

**Source:** [Article Title](https://source-url)

### Article Title 2
Summary of key points from the article.

**Source:** [Article Title](https://source-url)

## 分析 (Analysis)

Provide deep analysis (3-4 paragraphs):
- What does this news mean for the industry?
- What are the implications for practitioners?
- How does this fit into broader trends?
- What should readers watch for next?

## 结论 (Conclusion)

Wrap up with key takeaways and forward-looking perspective.
```

### Categories and Search Guidelines

#### 1. Cloud Native Technology (云原生)
Search queries:
- "Kubernetes container orchestration news today"
- "Docker container latest updates"
- "CNCF projects announcements"
- "service mesh serverless cloud native"
- "container security orchestration platform"

#### 2. Technology News (科技新闻)
Search queries:
- "cloud computing AI machine learning enterprise news"
- "devops platform infrastructure technology"
- "enterprise software cloud services"
- "kubernetes docker cloud native tech"

#### 3. Financial Technology (金融科技)
Search queries:
- "blockchain cryptocurrency cloud fintech"
- "digital banking cloud financial services"
- "cloud native financial technology"
- "deFi payment technology blockchain"

#### 4. Policy & Regulations (政策动态)
Search queries:
- "cloud computing regulation government policy"
- "data privacy cloud security compliance"
- "cloud native government legislation"
- "cloud regulation policy announcement"

#### 5. Military Applications (军事应用)
Search queries:
- "cloud native military defense kubernetes"
- "DOD military drone swarm edge computing"
- "military cloud warfare command control"
- "defense cloud native technology adoption"

### Post Generation Requirements

For each post, you must:

1. **Search for News**: Use web search to find relevant news from the past 24 hours.

2. **Select Quality Articles**: Choose 2-4 significant news items that are:
   - Relevant to cloud native technology
   - From credible sources
   - Timely (within 24-48 hours)
   - Substantive (not just product announcements)

3. **Extract Information**:
   - Title of the article
   - Publication date
   - Source URL (must be real and accessible)
   - Author (if available)
   - Key points and summary

4. **Generate Jekyll Post**:
   - Match the exact format shown above
   - Use Chinese headings (主要新闻, 分析, 结论)
   - Include proper YAML front matter
   - Add source URLs for each article
   - Provide deep analysis (not just summary)

5. **Output Format**:
   Return a JSON object with:
   ```json
   {
     "posts": [
       {
         "category": "cloud-native",
         "filename": "YYYY-MM-DD-cloud-native-news.md",
         "front_matter": {
           "layout": "post",
           "title": "Clear, concise title",
           "date": "YYYY-MM-DD",
           "author": "云原生观察",
           "source": "https://source-url.com/article",
           "categories": ["cloud-native"],
           "tags": ["kubernetes", "cloud", "news"]
         },
         "content": "# Title\n\n..."
       }
     ],
     "summary": "Brief summary of all generated posts",
     "stats": {
       "total_posts": 5,
       "posts_by_category": { ... }
     }
   }
   ```

### Quality Standards

1. **Source URLs**: Must be real, accessible URLs from reputable sources (TechCrunch, VentureBeat, CNCF blog, official company blogs, government websites, etc.)

2. **Writing Quality**:
   - Professional, informative tone
   - Clear, concise language
   - Proper Markdown formatting
   - Comprehensive yet readable
   - Chinese headings for structure

3. **Analysis Depth**:
   - Go beyond surface-level summary
   - Provide industry context
   - Discuss implications and trends
   - Offer original insights
   - Consider global perspective

4. **Exclusions**:
   - No product launch announcements without analysis
   - No paywalled content without summary
   - No speculative rumors without credible sources
   - If no significant news in a category, skip that category entirely

### Example Output

```json
{
  "posts": [
    {
      "category": "cloud-native",
      "filename": "2026-01-19-cloud-native-news.md",
      "front_matter": {
        "layout": "post",
        "title": "云原生技术动态：Kubernetes新版本发布与服务网格演进",
        "date": "2026-01-19",
        "author": "云原生观察",
        "source": "https://kubernetes.io/blog/2026/01/19/kubernetes-1-31",
        "categories": ["cloud-native"],
        "tags": ["kubernetes", "service-mesh", "cloud-native"]
      },
      "content": "# 云原生技术动态：Kubernetes新版本发布与服务网格演进\n\n本周云原生领域迎来多项重要更新，Kubernetes新版本的发布标志着容器编排平台的又一次重大进步...\n\n## 主要新闻\n\n### Kubernetes 1.31正式发布\n\nKubernetes 1.31带来了多项重要特性更新，包括增强的节点管理能力和改进的服务网格集成...\n\n**Source:** [Kubernetes 1.31 Release Notes](https://kubernetes.io/blog/2026/01/19/kubernetes-1-31)\n\n### 服务网格新标准发布\n\n服务网格领域传来新消息，最新的标准规范为多云环境下的服务通信提供了统一的解决方案...\n\n**Source:** [Service Mesh Specification Update](https://smi-spec.io/blog/2026/01/18)\n\n## 分析\n\n这些更新反映了云原生生态系统的几个关键趋势...\n\n## 结论\n\n..."
    }
  ],
  "summary": "Generated posts covering cloud native news for January 19, 2026.",
  "stats": {
    "total_posts": 1,
    "posts_by_category": {
      "cloud-native": 1
    }
  }
}
```

## Usage Example

```json
{
  "date": "2026-01-19",
  "categories": ["cloud-native", "tech", "fintech", "politics", "military"]
}
```

## Important Notes
- If no significant news is found in a category, skip that category completely
- Always provide real, accessible source URLs
- Use Chinese headings (主要新闻, 分析, 结论) in post content
- Provide original analysis, don't just summarize
- Match the exact Jekyll format shown in the examples
