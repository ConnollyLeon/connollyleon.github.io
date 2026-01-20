# 云原生观察 | Daily Cloud Native Insights

基于 Jekyll 的技术网站，用于展示每日云原生技术发展洞察，以及科技领域相关新闻。

## 功能特性

### 分类体系
- **云原生** (cloud-native): Kubernetes、Docker、Service Mesh、Serverless 等
- **科技新闻** (tech): 重大科技事件、产品发布、行业趋势
- **金融科技** (fintech): 区块链、数字货币、金融科技创新
- **科技政策** (politics): 法规、政策动态、监管动态
- **军事应用** (military): 云原生技术在国防军事领域的应用

### UI 特性
- 响应式设计，支持移动端访问
- 移动端汉堡菜单导航
- 侧边栏（分类列表、热门文章、标签云）
- 文章分享功能（微信、复制链接）
- 代码块复制按钮
- 平滑滚动和悬停动画
- 搜索覆盖层

### 文章元信息
- 发布日期
- 作者
- 原文链接（可点击跳转）
- 分类标签
- 标签云

## 使用方法

### 安装依赖
```bash
bundle install
```

### 本地预览
```bash
bundle exec jekyll serve
```

### 构建生产版本
```bash
bundle exec jekyll build
```

## 内容创作

### 创建新文章

在 `_posts` 目录创建 Markdown 文件：

```markdown
---
layout: post
title: "文章标题"
date: 2026-01-20
author: "作者名称"
source: "https://example.com/original-article"
categories:
  - cloud-native
tags:
  - kubernetes
  - container
---

文章内容...
```

### Front Matter 参数

| 参数 | 说明 | 必填 |
|------|------|------|
| `layout` | 布局类型 | 是 |
| `title` | 文章标题 | 是 |
| `date` | 发布日期 | 是 |
| `author` | 作者名称 | 否 |
| `source` | 原文链接 | 否 |
| `categories` | 分类（只能一个） | 是 |
| `tags` | 标签列表 | 否 |

### 可用分类

| 分类 | 文件 |
|------|------|
| 云原生 | `_pages/category-cloud-native.md` |
| 科技新闻 | `_pages/category-tech.md` |
| 金融科技 | `_pages/category-fintech.md` |
| 科技政策 | `_pages/category-politics.md` |
| 军事应用 | `_pages/category-military.md` |

## 文件结构

```
├── _config.yml              # 站点配置（标题、描述、导航、社交链接）
├── _layouts/                # 布局文件
│   ├── default.html         # 默认布局
│   ├── post.html            # 文章页布局
│   └── page.html            # 页面布局
├── _includes/               # 包含文件
│   ├── header.html          # 头部导航
│   ├── footer.html          # 页脚
│   ├── head.html            # HTML 头部
│   ├── icon-github.html     # GitHub 图标
│   └── icon-twitter.html    # Twitter 图标
├── _pages/                  # 页面文件
│   ├── category-cloud-native.md
│   ├── category-tech.md
│   ├── category-fintech.md
│   ├── category-politics.md
│   └── category-military.md
├── _posts/                  # 文章文件（Markdown）
├── _sass/                   # SCSS 样式文件
│   ├── _variables.scss      # 变量（颜色、字体、间距等）
│   ├── _base.scss           # 基础样式
│   ├── _layout.scss         # 布局样式
│   ├── _normalize.scss      # CSS 重置
│   └── _syntax-highlighting.scss  # 代码高亮
├── css/                     # CSS 文件
│   └── main.scss            # 主样式入口
├── js/                      # JavaScript 文件
│   ├── main.js              # 主脚本
│   ├── html5shiv.js         # HTML5 支持
│   └── respond.js           # 响应式支持
├── index.html               # 首页
├── about.md                 # 关于页面
├── feed.xml                 # RSS 订阅
└── README.md                # 说明文档
```

## 配置说明

### _config.yml

```yaml
# 站点设置
title: 云原生观察 | Daily Cloud Native Insights
email: contact@example.com
description: "每日云原生技术发展洞察，科技领域新闻，以及与科技发展相关的金融、政治领域动态"
baseurl: ""
url: "https://example.com"

# 导航菜单
navigation:
  - title: 首页
    url: /
  - title: 云原生
    url: /category/cloud-native/
  # ...更多导航项

# 社交链接
social:
  github: username
  twitter: username
```

## 技术栈

- **Jekyll** - 静态站点生成器
- **Sass** - CSS 预处理器
- **HTML5/CSS3** - 现代网页标准
- **JavaScript** - 交互功能

## 许可证

MIT
