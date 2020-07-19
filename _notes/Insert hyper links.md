---
date: '2020-07-14 14:23:47'
new: 0
title: 'Insert hyperlinks into vim (Mac only)'
update_logo: '0'
updated: '2020-07-18 00:35:57'
updated_logo: '1'
---
# Insert hyperlinks into vim (Mac only)

## These are useful maps for quickly popping in titles/urls/links open in Safari browser into vim

* These maps run apple scripts which are posted below
* These lines get added to your vim configuration file

```vim
" safari browser maps
" Copy and paste **url** of current open Safari tab into vim
inoremap <Leader>gu <esc>:silent !~/bin/copy_safari_url.osa <cr>a <esc>"+p<cr>
nnoremap <Leader>gu :silent !~/bin/copy_safari_url.osa <cr>"+p<cr>

" Copy and paste **title** of current open Safari tab into vim
inoremap <Leader>gt <esc>:silent !~/bin/copy_safari_title.osa <cr>a <esc>"+p<cr>
nnoremap <Leader>gt :silent !~/bin/copy_safari_title.osa <cr>"+p<cr>

" Copy and paste **markdown link** of current open Safari tab into vim using title and url
inoremap <leader>gg <esc>:set fo-=t <cr>:!~/bin/copy_safari_title.osa <cr>:let @+ = substitute(@+, '\|', '\\|', 'g')<cr>:let @x=@+<cr>:!~/bin/copy_safari_url.osa <cr>:let @+ = substitute(@+, '(', '%28', 'g')<cr>:let @+ = substitute(@+, ')', '%29', 'g')<cr>:let @y=@+<cr>:let @z=' [' . getreg('x') . '](/'-.-getreg('y') . ')'<cr>"zp:set fo+=t<cr>a
nnoremap <leader>gg :set fo-=t <cr>:!~/bin/copy_safari_title.osa <cr>:let @+ = substitute(@+, '\|', '\\|', 'g')<cr>:let @x=@+<cr>:!~/bin/copy_safari_url.osa <cr>:let @+ = substitute(@+, '(', '%28', 'g')<cr>:let @+ = substitute(@+, ')', '%29', 'g')<cr>:let @y=@+<cr>:let @z=' [' . getreg('x') . '](/'-.-getreg('y') . ')'<cr>"zp:set fo+=t<cr>
```

### Applescripts

Add these Applescripts to a directory in your shell's bin `$PATH`

```applescript
#!/usr/bin/osascript

tell application "Safari"
	set theURL to URL of current tab of front window
	set the clipboard to theURL
end tell
```

```applescript
#!/usr/bin/osascript

tell application "Safari"
	set theTitle to the name of the current tab of window 1
	set the clipboard to theTitle
end tell
```

---
#### Other notes linking here:

[Diary entry for 2020-07-18](/2020-07-18)

[vim](/vim)

[How This Site Works](/How-this-site-is-built)
