---
date: '2020-07-15 00:13:34'
title: 'Insert date in vim'
---
* normal mode
  * nnoremap <F4> "=strftime("%m/%d/%y")<CR>P
* insert mode
  * inoremap <F4> <C-R>=strftime("%m/%d/%y")<CR>

---
#### Other notes linking here:

[vim](/vim)
