---
date: '2020-07-18 10:43:12'
new: '1'
title: fzf
updated_logo: '0'
---
* github page:
  * [junegunn/fzf: A command-line fuzzy finder](https://github.com/junegunn/fzf)
* install (for MacOS)
  * `brew install fzf`
  * to use in vim:
    * add to vimrc (may have different path on your machine):
      * `set rtp+=/usr/local/opt/fzf`
    * install vim plugins:
      * `Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }`
      * `Plug 'junegunn/fzf.vim'`
  * to install useful key bindings and fuzzy completion
    * run `/usr/local/opt/fzf/install` command
    * answer yes to the prompts
    * restart shell
* uninstall:
  * Use uninstall script to remove fzf.
  * For more information, see: [https://github.com](https://github.com/junegunn/fzf)

---
#### Other notes linking here:

[18th](/2020-07-18)

[How This Site Works](/How-this-site-is-built)

[fzf.vim plugin](/fzf.vim)
