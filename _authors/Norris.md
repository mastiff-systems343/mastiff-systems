---
layout: default
name: Norris
fullname: Norris Vargas
---

<h2 class="page-heading"> {{ page.fullname }} </h2>
SHORT BIO.


<h3>Posts by {{ page.name }}</h3>
  <div class="post-list">
  {% assign filtered_posts = site.posts | where: 'author', page.name %}
  {% for post in filtered_posts %}
    <article class="post-preview">
      <div class="post-image">
        {% if post.image %}
          <img src="{{ site.baseurl }}{{ post.image }}" alt="{{ post.title }}">
        {% endif %}
      </div>
      <h2 class="post-title">
        <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
      </h2>
      <div class="post-meta">
        {% if post.author %}
          <span class="post-author">by {{ post.author }}</span>
        {% endif %}
        <span class="post-date">{{ post.date | date_to_string }}</span>
      </div>
      <div class="post-excerpt">
        {{ post.excerpt | strip_html | truncatewords: 50 }}
      </div>
      <a href="{{ site.baseurl }}{{ post.url }}" class="read-more">Read More</a>
    </article>
    {% endfor %}
  </div>

  {% if page_count > 1 %}
  <div class="post-pagination">
    <button class="prev-page" {% if page_count == 1 %}disabled{% endif %}>
      <img src="{{ site.baseurl }}/assets/img/icons/prev.png" alt="Previous" height="16" /> Prev
    </button>
    
  <span class="page-numbers">
      {% for i in (1..page_count) %}
        <button class="page-number" data-page="{{ i }}">{{ i }}</button>
      {% endfor %}
    </span>
    
  <button class="next-page" {% if page_count == 1 %}disabled{% endif %}>
      Next <img src="{{ site.baseurl }}/assets/img/icons/next.png" alt="Next" height="16" />
    </button>
  </div>
  {% endif %}
</div>