---
layout: page
permalink: /category/politics/
---

<div class="category-header">
  <h2>科技政策</h2>
  <p class="category-description">各国科技政策、数据隐私法规、行业监管动态</p>
</div>

<div class="posts-list">
  {% for post in site.categories['politics'] %}
  <article class="article-card">
    <div class="article-card-header">
      <span class="article-date">{{ post.date | date: "%Y年%m月%d日" }}</span>
    </div>
    <h2 class="article-title">
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
    </h2>
    <p class="article-excerpt">{{ post.excerpt | strip_html | truncate: 150 }}</p>
    <div class="article-footer">
      <a href="{{ post.url | prepend: site.baseurl }}" class="read-more">阅读更多 →</a>
    </div>
  </article>
  {% endfor %}
</div>

<style>
.category-header {
  margin-bottom: 32px;
  padding-bottom: 24px;
  border-bottom: 2px solid #e2e8f0;
}

.category-description {
  color: #718096;
  font-size: 18px;
  margin-top: 8px;
}

.posts-list {
  display: flex;
  flex-direction: column;
  gap: 24px;
}
</style>
