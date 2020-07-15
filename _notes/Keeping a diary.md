---
date: '2020-07-13 04:19:25'
title: 'Keeping a diary in vimwiki'
---
## Default Mappings

* `<Leader>w<Leader>w` create new note for today
* `<Leader>w<Leader>i` generates a diary index


## vimwiki help (from `:h vimwiki`)

The diary helps you make daily notes. You can easily add information into
Vimwiki that should be sorted out later. Just hit <Leader>w<Leader>w to create
a new note for today with a name based on the current date.

To generate the diary section with all available links one can use
|:VimwikiDiaryGenerateLinks| or `<Leader>w<Leader>i` .

Note: it works only for diary index file.

Example of diary section: >
    = Diary =

    == 2011 ==

    === December ===
        * [[2011-12-09]]
        * [[2011-12-08]]


See `g:vimwiki_diary_months` if you would like to rename months.

---
#### Other notes linking here:

[vimwiki](/vimwiki)
