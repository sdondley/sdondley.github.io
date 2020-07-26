---
date: '2020-07-23 22:25:09'
title: vimscripting
updated: '2020-07-25 22:32:03'
---
## Official documentation
[Vim documentation: usr_41](http://vimdoc.sourceforge.net/htmldoc/usr_41.html)

## My Notes
* string comparison
  * `"foo" ==? "FOO"`
    *  "case-**insensitive** no matter what the user has set"
  *  `"foo" ==# "FOO"`
    *  "case-**sensitive** no matter what the user has set"
  * test if not equal
    * `!=?`
    * `!=#`
* echoing variables
  * echom
* abort after function name
  * When the [abort] argument is added, the function [will](/will) abort as soon as an error is detected.

## Functions
* functions with `!` after their name override pre-existing functions with the
  same name

## Tutorials and guides
* [Vim scripting cheatsheet](https://devhints.io/vimscript)
* [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)

---
### Other notes linking here:

[vim](/vim)