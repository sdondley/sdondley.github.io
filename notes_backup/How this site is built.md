---
date: '2020-07-14 11:06:07'
title: 'How This Site Works'


Below are some bullet points that provide an outline of what's under the hood of
this site you are looking at.

* Site is hosted for for free using GitHub Pages
  * Since it's on github, all changes are tracked
* Site is "statically generated" using Jekyll
  * I am new to jekyll, so can't provide much detail on it other than:
    * It's written in Ruby
    * It does not require a database
    * It's essentially a program that takes files written in markdown and
      converts them to static HTML files.
    * The files are generated on my local machine and then pushed out to my
      GitHub repo at [http://sdondley.github.io
](http://sdondley.github.io)
* I use [vimwiki](/vimwiki) to write all the notes and posts and pages
  * Use [vim](/vim), of course
  * I wrote a custom perl script [markdown_to_note](/markdown_to_note) that hooks
    into the `:VimwikiAll2HTML` command
* The theme is not my own and was forked from
  [https://github.com/MaximeKjaer/kjaer.io
](https://github.com/MaximeKjaer/kjaer.io)
  * I have made some very modest changes to original forked code

---
#### Other notes linking here:

[Tech stuff](/Tech-stuff)
