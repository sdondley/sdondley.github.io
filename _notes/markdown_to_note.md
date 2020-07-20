---
date: '2020-07-14 11:11:33'
new: 0
title: 'markdown_to_note perl script'
update_logo: '0'
updated: '2020-07-17 12:08:03'
updated_logo: 0
---
## What is it?
This is bit of perl "glue" script I wrote which is run whenever I save a note in my
wiki. It is located in my bin path.

## What does it do?
It converts an md file in my vimwiki directory to an md file in my jekyll site's
_notes directory

## What triggers it?
Er, it's a bit complicated. But here's a rather cryptic explanation you can
puzzle through:

The script gets run whenever I save a wiki note in my ~/vimwiki/webnotes folder.
It is triggered by an autocmd found in my vim configuration:

```vim
autocmd BufWritePost *.md call vimwiki#vars#set_wikilocal('custom_wiki2html_args', 'no_update', 0) | execute ':silent! Vimwiki2HTML' | call vimwiki#vars#set_wikilocal('custom_wiki2html_args', 'hi', 0) | execute ':redraw!'
```

When I want to convert all the files at once, which is necessary to get accurate
bidirectional links, the script gets run for every file. I have a map in my vim
configuration to trigger this process:

```vim
nnoremap <leader>wha :CvimwikiAll2HTML<cr>
command! CvimwikiAll2HTML call vimwiki#vars#set_wikilocal('custom_wiki2html_args', 'no_update', 0) | execute ':silent! VimwikiAll2HTML' | call vimwiki#vars#set_wikilocal('custom_wiki2html_args', 'hi', 0) | execute ':redraw!'
```

As you can see, it's basically the same as the autocmd except it call
`VimwikiAll2HTML` instead of `Vimwiki2HTML` command for a single file.


The autocmd and map does not tell the whole vim configuration story, however.
The key to getting the `markdown_to_note` script to be called called is to set
the `custom_wiki2html` key for for the wiki in `g:vimwiki_list` with something
like this in your vimrc file:

```vim
let wiki_1                          = {}
let wiki_1.path                     = '~/vimwiki/webnotes/'
let wiki_1.ext                      = '.md'
let wiki_1.path_html                = '~/git_repos/sdondley.github.io/_notes/'
let wiki_1.auto_export              = 1
let wiki_1.syntax                   = 'markdown'
let wiki_1.custom_wiki2html         = '/Users/me/bin/markdown_to_note'
let wiki_1.custom_wiki2html_args    = ''
let g:vimwiki_list                  = [wiki_1]

```

---
#### Other notes linking here:

[Diary entry for 2020-07-18](/2020-07-18)

[How This Site Works](/How-this-site-is-built)

[Diary entry for 2020-07-13](/2020-07-13)

[Diary entry for 2020-07-14](/2020-07-14)

[Diary entry for 2020-07-20](/2020-07-20)
