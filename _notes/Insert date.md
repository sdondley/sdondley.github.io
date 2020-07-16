---
date: '2020-07-15 00:13:34'
new: '1'
title: 'Insert date in vim'
updated: '2020-07-16 09:27:52'
---
* normal mode
  * `nnoremap <F4> "=strftime("%m/%d/%y")<CR>P`
* insert mode
  * `inoremap <F4> <C-R>=strftime("%m/%d/%y")<CR>`

---
#### Other notes linking here:

[vim](/vim)
