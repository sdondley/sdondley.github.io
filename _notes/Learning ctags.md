---
date: '2020-07-15 09:59:05'
new: 0
title: 'Learning ctags'
update_logo: 0
updated_logo: '0'
---
Notes compiled from various source to help learn what ctags are and how to use
them in vim with a particular current interest in using them with vimwiki.

## From wiki and other sources
### What are they?
* a programming tool
* generates an index file
  * contains names found in source and header files in code
  * What are "names," exactly?
* the tags in the index file allow definition to be found quickly

### History
The original Ctags was introduced in BSD Unix 3.0 and was written by Ken Arnold, with Fortran support by Jim Kleckner and Pascal support by Bill Joy. It is part of the initial release of Single Unix Specification and XPG4 of 1992.

BSD Unix 3 was released in '79?

* other related terms
  * "exuberant ctags" - Exuberant Ctags, written and maintained by Darren Hiebert until 2009,[2] was initially distributed with Vim, but became a separate project upon the release of Vim 6. It includes support for Emacs and etags compatibility.[3][4]

## Questions
* Are ctags useful for vimwiki?
  * not mentioned in vimwiki help
  * files can be tagged in vimwiki
    * not sure if this is the same as ctags, however
  * Possibly useful for using with vimwiki:
    * [ctags, vimwiki, vim and tagbar-plugin - Stack Overflow](https://stackoverflow.com/questions/7037055/ctags-vimwiki-vim-and-tagbar-plugin)
    * looks like you can use headers to determine ctag definitions?
* Are ctags useful for text documents?
  * Not sure
* What's the proper capitalization of "ctags?"
  *Ctags Tutorial]( Ctags or ctags?
* What is difference between "exuberant" ctags and plain old ctags?
* Are they useful for my perl modules?

## Ctags tutorial
* Notes below from [Ctags Tutorial](https://courses.cs.washington.edu/courses/cse451/10au/tutorials/tutorial_ctags.html)
* ctags is tool that makes it easier to navigate large source code projects
* can be used to find linux kernel files
* ctags has a command on command line:
  * ctags --version
  * has a website: [https://ctags.io](https://ctags.io/)
### Ctags with Vim
* run command:
  * ctags -R *
  * to search for a specific tag:
    * vim -t <tag>

---
#### Other notes linking here:

[vim](/vim)
