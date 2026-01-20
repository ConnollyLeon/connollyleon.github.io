---
layout: page
title: 关于
permalink: /about/
---

<div class="about-section">
  <div class="about-header">
    <h2>关于云原生观察</h2>
    <p class="about-tagline">每日云原生技术发展洞察，科技领域新闻，以及与科技发展相关的金融、政治领域动态</p>
  </div>

  <div class="about-content">
    <h3>本站作用</h3>
    <p>本网站为技术从业者、投资者和政策制定者提供每日更新的云原生技术发展动态。我相信，了解技术的最佳方式是从多个角度同时观察——技术本身、商业应用、金融影响以及政策环境。</p>

    <h3>内容覆盖</h3>
    <ul>
      <li><strong>云原生技术</strong> - Kubernetes、Docker、Service Mesh、Serverless等最新技术动态</li>
      <li><strong>科技新闻</strong> - 重大科技事件、产品发布、行业趋势分析</li>
      <li><strong>金融科技</strong> - 区块链、数字货币、金融科技创新</li>
      <li><strong>科技政策</strong> - 各国科技政策、数据隐私法规、行业监管动态</li>
    </ul>

    <h3>联系方式</h3>
    <p>如果您有任何建议、合作意向，请通过以下方式联系我：</p>
    <ul>
      <li>邮箱: <a href="mailto:{{ site.email }}">{{ site.email }}</a></li>
      <li>GitHub: <a href="https://github.com/{{ site.github_username }}">{{ site.github_username }}</a></li>
    </ul>

    <h3>订阅我们</h3>
    <p>获取每日云原生技术动态，直接发送到您的邮箱。</p>
    <form class="newsletter-signup">
      <input type="email" placeholder="输入您的邮箱地址" required>
      <button type="submit">订阅</button>
    </form>
  </div>
</div>

<style>
.about-section {
  max-width: 800px;
  margin: 0 auto;
}

.about-header {
  text-align: center;
  margin-bottom: 48px;
  padding-bottom: 32px;
  border-bottom: 2px solid #e2e8f0;
}

.about-tagline {
  font-size: 18px;
  color: #718096;
  max-width: 600px;
  margin: 16px auto 0;
}

.about-content h3 {
  margin-top: 32px;
  margin-bottom: 16px;
  color: #1a202c;
}

.about-content p, .about-content li {
  color: #4a5568;
  line-height: 1.8;
}

.about-content ul {
  margin-left: 24px;
  margin-bottom: 24px;
}

.about-content li {
  margin-bottom: 12px;
}

.newsletter-signup {
  display: flex;
  gap: 12px;
  margin-top: 24px;
}

.newsletter-signup input {
  flex: 1;
  padding: 12px 16px;
  border: 1px solid #e2e8f0;
  border-radius: 8px;
  font-size: 16px;
}

.newsletter-signup button {
  padding: 12px 24px;
  background: #0066cc;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  font-weight: 500;
  cursor: pointer;
  transition: background 0.2s;
}

.newsletter-signup button:hover {
  background: #004c99;
}

@media (max-width: 640px) {
  .newsletter-signup {
    flex-direction: column;
  }
}
</style>
