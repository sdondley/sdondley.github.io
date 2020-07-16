---
date: '2020-07-13 05:41:57'
new: 0
title: vim
update_logo: 0
updated: '2020-07-16 16:29:39'
updated_logo: '1'
---
## Maps

Here's a collection of vim maps I use:
* [Insert hyper links from Safari](/Insert-hyper-links)
* [Insert date](/Insert-date)

## Plugins
Some useful plugins I use (not a complete list):
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
  [http://vimdoc.sourceforge.net](http://vimdoc.sourceforge.net/htmldoc/spell.html)

## Useful resources and good reads
* [At least one Vim trick you might not know • Hillel Wayne](https://www.hillelwayne.com/post/intermediate-vim/)
* [My Vim-related gists](https://gist.github.com/romainl/4b9f139d2a8694612b924322de1025ce)
  * [Don't use Vim for the wrong reasons](https://gist.github.com/romainl/6b952db7a6138b48657ba0fbb9d65370)

## CTAGS
* [Learning ctags](/Learning-ctags)

## Vim scripting
* [https://devhints.io](https://devhints.io/vimscript)

## Searching
* lvimgrep
  * `:lv[imgrep][!] /{pattern}/[g][j] {file} ...`
* vimgrep
  * `:vim[grep][!] /{pattern}/[g][j] {file} ...`

---
#### Other notes linking here:

[Tech stuff](/Tech-stuff)

[How This Site Works](/How-this-site-is-built)

[vimwiki](/vimwiki)
