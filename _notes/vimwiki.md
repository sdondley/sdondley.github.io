---
date: '2020-07-13 04:19:04'
title: vimwiki
updated: '2020-07-23 20:21:27'
---
* Home page [vimwiki plugin page](https://vimwiki.github.io)
* GitHub page: [vimwiki/vimwiki: Personal Wiki for Vim](https://github.com/vimwiki/vimwiki)
* vimwiki issue queue: [Issues · vimwiki/vimwiki](https://github.com/vimwiki/vimwiki/issues)


## What is it?

vimwiki is a [vim](/vim) plugin that helps you write a wiki, which is just a
collection of hyperlinked documents.

## What makes it so good?

I'm still learning the ropes but the short answer is:

1. Double tap `<enter>` on word or highlighted group of words to open and edit
   a new wike page.
2. Type into your new document
3. Hit `<backspace>` to return to your original document
4. Easily navigate between your wiki pages
5. Easily maintain a diary. See [keeping a diary](/Keeping-a-diary)
6. Absolutely fantastic for generating content as an outline which is far faster
   and easier to write than prose.

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
* use [fzf](fzf) and [ripgrep](/ripgrep) to search vimwiki
  * see maps section below

### Shell integration
#### useful aliases
Launch default wiki pages from command line:
```bash
# launch diary from command line:
alias diary='vim -c ":VimwikiMakeDiaryNote"'

# launch index page from command line
alias vw='vim -c ":VimwikiIndex"'
```

### Maps
* Insert link to another wiki page:
  * type in first couple of letters and then:
    * `inoremap <buffer> <leader>xo <C-o>"cciW[](<C-r>c)<left><c-x><c-o>`
    * Then to actually select a file:
      * `inoremap <buffer> <c-y><c-y> <c-y><esc><esc>T(vt)y<esc>F[pf)a  <left>`
* Rewrite `<cr>` to `Vimwiki 3, 5` per help file
  * Needed if you are using hard wraps
  * This will create a bullet on the next line after hitting return if there is
    more than one line in the bullet
* faster indenting
  * `<c-d>` and `<c-t>` outdent and indent
    * too cumbersome to type
      * remap `<<` to outdent
      * remap `>>` to indent

        ```vim
        " faster in/outdenting
        inoremap << <c-d>
        inoremap >> <c-t>

        "outdent all the way to margin
        inoremap <leader>,, <esc>0dt*$a
        nnoremap <leader>,, 0dt*$

        " needed for vimwiki plugin with hard wrapping
        inoremap <cr> <esc>:VimwikiReturn 3, 5<cr>

        " in/outdent next bullet
        imap <c-i><cr> <cr><c-t>
        imap <c-i><c-i><cr> <cr><c-d>
        ```
* search file names, buffers and file text quickly with [fzf](fzf)/[fzf vim plugin](fzf vim plugin)
```vim
nnoremap <leader>f :up<cr>:Files<cr>
nnoremap <leader>r :up<cr>:Rg<cr>
nnoremap <leader>b :up<cr>:Buffers<cr>
```
  * see [How FZF and ripgrep improved my workflow | by Sidney Liebrand | Medium](https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861) for more details

* `<tab>` key should be remapped
  * by default vimwiki maps `<tab>` to `VimwikiNextLink`
    * Since `<tab>` and `<c-i>` are the same as a result of some terminal quirk,
      you are also overriding the default behavior of `<c-i>`
      * default behavior is to go forward in jump list
  * I use: `nmap <leader>n <Plug>VimwikiNextLink`

* Create link and new vimwiki page with same title as bullet:
```vim
inoremap <leader>lb <esc>^wy$i[<esc>$a](<esc>pa)<esc>:VimwikiFollowLink<cr>i# <esc>p:w<cr>a<cr><cr>
```

## Resources
* [https://mkaz.blog](https://mkaz.blog/working-with-vim/vimwiki/)
* [Getting started guide](https://blog.mague.com/?p=602) ~~**broken link as of
  7/16/2020**~~
* <iframe width="560" style="margin-left: 2.0em" height="315" src="https://www.youtube.com/embed/GPSmRuKL5KQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  * guy in video keeps syaing to use mod-v
    * actual combo by default:
      * <leader>ww
      * consult documentation for how to quickly open other wikis
      * :h vimwiki-global-mappings

## Bugs and Troubles
Stuff I'm having problems with
* [No file extension generated for new files generated with :VimwikiFollowLink that contain a period in URL (markdown syntax) · Issue #950 · vimwiki/vimwiki](https://github.com/vimwiki/vimwiki/issues/950)
*

---
### Other notes linking here:

[vim](/vim)

[How This Site Works](/How-this-site-is-built)

[Thoughts on Digital Gardening](/Digital-Gardening)

[Diary entry for 2020-07-14](/2020-07-14)
