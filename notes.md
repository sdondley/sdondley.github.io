---
layout: post
title: Notes
comments: false
image: /images/hero/war.jpg
---

These notes are just that: notes. They aren't polished or comprehensive but
serve more like memory jogs. I'm sharing my notes because a) they can give
anyone who cares a good sense of what's on my mind and what I do, b) they might
be useful to others, and c) I want be more diligent about keeping notes and
making them public may help motivate me, and d) I want to find a good recipe for
[digitial gardening](https://christiantietze.de/posts/2020/05/digital-gardening/) that
others may find useful ([my son](http://sean.dondley.com), for example). So this
is a way for me to experiment. We'll see how it goes.

Anyway, here are some notes on my notes:

* The long bullet list of links below is a pile of notes, listed in alphabetical
  order.
* The notes are a mix of diary entries and wiki entries about various topics
  (mostly geared toward my current primary interests of programming, automation,
  and other technical matters).
* There is currently no way to search or filter the notes
* However, there are two index pages, one for the diary and one for the wiki.
  These are good places to start browsing through my notes:
  * [Diary Index](/diary)
  * [Wiki Index](/index/)

## Diary and Wiki Notes

* <span style="display: block">Notes marked 🆕 were <b>created</b> within past 48 hours.</span>
* <span style="display: block">Notes marked 🆙 were <b>updated</b> within past 48 hours.</span>
* <span style="display: block">Notes marked 🏁 are <b>finished</b> notes of high quality.</span>

<ul style="list-style:none">
{% for post in site.notes %}
    {% if post.new == '1' %}
      <li class="new">
    {% else %}
      {% if post.updated_logo == '1' %}
      <li class="updated">

      {% else %}
        <li class="plain">
      {% endif %}
    {% endif %}
    <a style="text-indent: 0" href="{{ post.url }}">{{ post.title }}</a>
    </li>
{% endfor %}
</ul>
