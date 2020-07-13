---
layout: post
title: Notes
comments: false
image: /images/hero/war.jpg
---

These notes aren't meant to be polished or comprehensive, just mental jogs for the
mind. I'm sharing my notes because a) they can give anyone who cares a good sense
of what's on my mind and what I do, b) they might be useful to others, and c) I
want be more diligent keeping notes and making them public will hopefull
motivate me to do that. I think I've got a good, easy system in place that makes
posting my notes painless. We'll see how it goes.

Anyway, some notes on my notes:

* The long bullet list of links below is a pile of notes, listed in alphabetical
  order.
* The notes are a mix of diary entries and wiki entries about various topics
  (mostly geared toward my current primary interests of programming, automation,
  and other technical matters).
* There is currently no way to search the notes
* However, there are two index pages, one for the diary and one for the wiki.
  These are good places to start browsing through my notes:
  * [Diary Index](/diary)
  * [Wiki Index](/index)

## Diary and Wiki Notes

<ul>
{% for post in site.notes %}
    <li>
        <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
{% endfor %}
</ul>
