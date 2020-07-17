---
date: '2020-07-17 01:40:48'
new: '1'
title: 'Web Development'
update_logo: 0
updated_logo: '0'
---
## css
### utf8 characters for bullets

This solution solves the problem of long bulleted text wrapping below the
bullet.

```html
<style>
li.new:before { content: "🆕"; margin-left: -1.5em;}
li.updated:before { content: "🆙"; margin-left: -1.5em; }
li.plain:before { content: "●"; margin-left: -1.2em; margin-right: .3em; }
a.link { text-indent: 0 }
</style>

<ul style="list-style:none">
<li class="new"><a class="link" href="">Some text</a></li>
<li class="update"><a class="link" href="">Some text</a></li>
<li class="plain"><a class="link" href="">Some text</a></li>
</ul>
```

Hat tip to commenter "judyofthewoods" at
[https://ryansechrest.com](https://ryansechrest.com/2012/11/change-your-list-bullet-to-a-custom-character-in-css/#comment-331251)
for this trick.

---
#### Other notes linking here:

[Tech stuff](/Tech-stuff)

[17th](/2020-07-17)