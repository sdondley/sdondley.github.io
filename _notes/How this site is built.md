---
date: '2020-07-13 07:36:05'
new: 0
title: 'How This Site Works'
update_logo: 0
updated: '2020-07-17 11:03:53'
updated_logo: '1'
---
Below are some bullet points that provide an outline of what's under the hood of
this site you are looking at.

* All content is written with [vim](/vim), my editor of choice
* I use [vimwiki](/vimwiki) to write all the notes and posts and pages
  * I wrote a custom perl script [markdown_to_note](/markdown_to_note) that hooks
    into the `:VimwikiAll2HTML` command
* Site is hosted for for free using GitHub Pages
  * Since it's on GitHub, all changes are tracked
* Site is "statically generated" using Jekyll
  * I am new to Jekyll, so can't provide much detail on it other than:
    * It's written in Ruby
    * It does not require a database
    * It's essentially a program that takes files written in markdown and
      converts them to static HTML files.
    * The files are generated on my local machine and then pushed out to my
      [GitHub repository](https://github.com/sdondley/sdondley.github.io)
* The theme is not my own and was forked from
  [https://github.com](https://github.com/MaximeKjaer/kjaer.io)
  * I have made some very modest changes to original forked code

---
#### Other notes linking here:

[Tech stuff](/Tech-stuff)
