---
date: '2020-07-13 04:19:04'
new: 0
title: vimwiki
update_logo: 0
updated: '2020-07-16 09:58:23'
updated_logo: '1'
---
* See the [vimwiki plugin page](https://vimwiki.github.io)

## What is it?

vimwiki is a [vim](/vim) plugin that helps you write a wiki, which is just a
collection of hyperlinked documents.

## What makes it so good?

I'm still learning the ropes but the short answer is:

1. Double tap `<enter>` on word or highlighte group of words to open and edit
   a new wike page.
2. Type into your new document
3. Hit `<backspace>` to return to your original document
4. Easily navigate between your wiki pages
5. Easily maintain a diary. See [keeping a diary](/Keeping-a-diary)

## Random tech notes
* vimwiki is running out of my `~/git_repos` directory using the
  `customizations` branch

## Searching and navigating a vimwiki quickly
* use [CtrlP](/ctrlp) plugin to jump to files
* Searching the wiki:
  * use `:VWS /term/`
    * use `:lopen` to see results

### Diary navigation
* `<C-Up_Arrow>`
  * Open the previous day's diary link if available.
* `<C-Down_Arrow>`
  * Open the next day's diary link if available.

## Other Tips, Tricks and Advice
### If used in conjunctions with a Jekyll site
  * Be sure to use markdown as the syntax for best integration with Jekyll site
    generation
  * Do not place diary in subdirectory (this is the default)
    * Instead, ensure entries are created in same folder as wiki so that documents
      in diary can link to wiki documents not in the diary
      * Accomplished by modifying `g:vimwiki_list`:
        * `let wiki_1.diary_rel_path = '.'`
* Use omni completion to find existing file names:
  * Type `[](ind`
    * Now type `<C-x><C-o>` to search for files that begin with `ind`

## Maps
* Insert link to another wiki page:
  * type in first couple of letters and then:
    * `inoremap <buffer> <leader>xo <C-o>"cciW[](<C-r>c)<left><c-x><c-o>`
    * Then to actually select a file:
      * `inoremap <buffer> <c-y><c-y> <c-y><esc><esc>T(vt)y<esc>F[pf)a  <left>`

## Resources
* [https://mkaz.blog](https://mkaz.blog/working-with-vim/vimwiki/)
* [Getting started guide](https://blog.mague.com/?p=602)

---
#### Other notes linking here:

[vim](/vim)

[How This Site Works](/How-this-site-is-built)

[Thoughts on Digital Gardening](/Digital-Gardening)

[14th](/2020-07-14)
