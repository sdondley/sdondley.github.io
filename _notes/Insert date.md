---
date: '2020-07-15 00:13:34'
new: 0
title: 'Insert date in vim'
update_logo: '0'
updated: '2020-07-22 20:46:27'
updated_logo: '1'
---
* normal mode
  * `nnoremap <F4> "=strftime("%m/%d/%y")<CR>P`
* insert mode
  * `inoremap <F4> <C-R>=strftime("%m/%d/%y")<CR>`

---
### Other notes linking here:

[vim](/vim)
