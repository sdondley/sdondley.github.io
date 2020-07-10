---
layout: post
title: Notes
comments: false
image: /images/hero/war.jpg
---

Nothing to see here, yet. Just some testing going on.

<ul>
{% for post in site.notes %}
    <li>
        <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
{% endfor %}
</ul>
