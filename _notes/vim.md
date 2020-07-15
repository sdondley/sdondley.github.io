---
date: '2020-07-13 05:41:57'
title: vim
updated: '2020-07-15 09:32:13'
---
## Maps
Here's a collection of vim maps I use:
* [Insert hyper links from Safari](/Insert-hyper-links)
* [Insert date](/Insert-date)

## Plugins
Some useful plugins I use (this list is not complete):
* [vimwiki](/vimwiki) - used to generate these notes very quickly
* [CtrlP](/CtrlP) - for opening files quickly

## Completion

* `echo complete_info()` to get current completion info
* `<c-e>` to exit completion mode
* `<c-y>` to choose currently highlighted item in menu
* good to add to vimrc: `set completeopt+=longest`
  * allows you to whittle down options in the popup menu by typing more letters

### Official documentation
From vim command line, run:
* :h ins-completion
* :h omnifunc
* :h compl-omni
* :h completeopt

## spell check feature
* turn on with `set spell`
* highlight red with: `hi SpellBad guifg=red`
* useful mappings
  * zg -> add word under cursor to dictionary permanently
  * zG -> add word under cursor to dictionary temporarily
* more mappings:
  [http://vimdoc.sourceforge.net/htmldoc/spell.html](http://vimdoc.sourceforge.net/htmldoc/spell.html)

## Useful links
* [At least one Vim trick you might not know • Hillel
  Wayne](https://www.hillelwayne.com/post/intermediate-vim/)

---
#### Other notes linking here:

[Tech stuff](/Tech-stuff)

[How This Site Works](/How-this-site-is-built)

[vimwiki](/vimwiki)
