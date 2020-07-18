---
date: '2020-07-13 05:41:57'
new: 0
title: vim
update_logo: 0
updated: '2020-07-18 00:08:43'
updated_logo: '1'
---
## Why vim?
* To my knowledge, it is the fastest way for a human to process text on a
  computer
  * Can anyone think of another?
* It's highly customizable and programmable
* It's highly extensible with plugins
* It's a power tool, which after a lot of practice and experience with it allows
  you to:
  * write almost as fast as you think
  * correct, revise and reorganize your text extremely fast
* vim was created mostly for coders, but is also an excellent platform for
  writers. If you are coder and a writer, vim is pure joy to work with.

## Registers

### vim documentation
* `:h registers`

### Basic tutorial
* [Vim registers: The basics and beyond](https://www.brianstorti.com/vim-registers/)
  * Intro
    * bunch of spaces in memory
      * these spaces are the registers
      * vim uses them to store text
      * each space has an identifier
      * text in the spaces can be accessed later
      * similar to storing text in computer clipboard
        * but vim has many places to store the text
  * The basic usage
    * accessing a register
      * use a double quote before its name
      * Example, to access text in register 'r':
        * `"r`
      * copying selected text to register:
        * `"ry`
      * pasting text from register:
        * `"rp`
      * registers can be accessed from insert mode:
        * `<c-r>`<REGISTER_NAME>
        * Example `<c-r> r`
      * `:reg` command shows all registers and the content
        * to view only certain registers, add a space separated list after the
          command:
          * `:reg a b c`
  * the unnamed register
    * accessed with `""`
    * holds any text deleted or yanked
    * by default, `p` key pastes from unnamed register
      * same as doing `""p
    * Never lose a yanked text again
      * Numbered registers
        * numbered 0 through 9 ("0 to "9)
        * "0 has the latest **yanked** text
        * "1 through "9 has the latest **deleted** text (with 9 being the
          oldest)
        * you can always paste yanked text with `"0p`
  * The read only registers
    * There are 4 read only registers: "., "%, ": and "#
      * `".` contains the **last inserted text**
      * `"%` contains the current file path
        * copy current path to file to clipboard
          * `:let @+=@%`
      * `":`
        * most recently executed command
        * can be used to rerun last command:
          * `@:`
      * `"#` name of the alternate file
        * can be thought of as the last edited file
        * see `:h alternate-file`
        * vim uses it to switch between files when <c-^> is used
          * can also do `:e <c-r> #`
  * The expression and the search registers
    * `"=`
      * known as the *expression register*
      * used to deal with the result of expressions
      * in insert mode, type `<c-r> =`
        * type in the expression and result will be printed
        * Examples:
          * `<c-r>=2+2` will output `4` to the buffer
          * `<c-r>=system('ls')` will output the list of all files to the buffer
    * `"/`
      * Search register
      * where the last search text goes
        * changed when a search is performed with `/`, `?`, `*` or `#`
  * Macros
    * recording are stored in named registers
    * you don't have to re record a macro if you do it wrong
      * you can just edit the register it is in, instead
    * uppercase register names are how we append contents to a register:
      * `:let @W='i;'`
    * to edit a macro in the middle, do:
      * `:let @w='<c-r> <REGISTER>`



## Maps

Here's a random collection of vim maps I use:
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

## Navigating buffers
* From [Buffers  Working with Vim - mkaz.blog](https://mkaz.blog/working-with-vim/buffers/)
  * What are buffers?
    * text files residing "in-memory"
    * vim window is a viewport on the buffer
    * switching
      * you can switch between buffers
        * viewport can show a different buffer
    * author posits that buffers are better than tabs
      * [Vim Tab Madness. Buffers vs Tabs - Josh Davis](https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/)
  * Opening Multiple Files
    * `vim file1 file2 file3`
    * open new file in an additional buffer
      * `:e file`
  * Main Buffer Commands
    * `:buffers` or `:ls`
      * list buffers
    * `:b {bufname}` use buffer name, supports completion
      * good for switching between buffers
    * `:bd`
      * close current buffer
    * `:bn`
      * next buffer
    * `:bp`
      * previous buffer
    * `:b#`
      * last buffer
    * `:b1`
      * buffer 1
    * `:bm`
      * move not next modified buffer
      * buffer 1
  * Recommended shortcuts
    * `<leader>3`
      * to bounce back to last buffer



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
