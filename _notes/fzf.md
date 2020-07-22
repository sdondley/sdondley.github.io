---
date: '2020-07-18 10:43:12'
new: 0
title: fzf
updated: '2020-07-22 17:39:13'
updated_logo: 0
---
## What is fzf and how does it work, exactly?
* It's a filter and a finder
  * Uh, what does that mean?
    * it helps you find stuff by filtering out the other stuff you're not interested in
    * imagine you have a box of dirt and you want to find a large gold nugget inside it
      * fzf is like a sieve you shake the dirt through to help you find the nugget

### What stuff does it filter and find? Gold?
  * Nope, items in a list
    * what kind of list items?
      * items that can be represented as strings of text
        * examples:
          * a list of file names
          * words in a dictionary
          * your bash history
          * lines in files
      * by default, fzf will help you filter a list of all the files in your current directory
        and subdirectory to help you find the files you are looking for
        * Well, OK, not quite all the files
          * by default, it ignores certain files
            * you change what fzf ignores

### How does it filter items in a list?
  * Based on what your input to the fzf prompt
    * prompt is also called the "interactive finder"
    * let's say you run `fzf` on a list contains the words "fire," "water,"
      "earth" with this on the command line:
        * `echo -e 'fire\nwater\nearth' | fzf`
      * Then you type in "fi"
        * "water" and "earth" get filtered out
          * they do not match what you typed in
          * leaves only "fire" behind
        * but it's a fuzzy match
          * this means it doesn't have to be an exact match
            * it filters out based on approximate matches
            * imperfect but close matches are not filtered out
            * better matches appear fist, at the bottom of the list so you can
              select them quickly
          * it also means the match doesn't have the begin at the start of a
            word
          * if you type in the letter "a" into the prompt, "fire" will be
            removed and the other two words will remain because those words
            have an "a"
          * you can tell fzf to do an exact match, too, if you wish

### How do I create other kinds of lists for fzf to filter and how do I get fzf to do something useful with the string of text I select?
  * You use it in combination with other commands
  * See the usage section below for more details

### Don't I already have a `find` command? What do I need fzf for?
  * A few big reasons
    * It's interactive
    * It's fuzzy
    * It's easier
    * It's more flexible
    * You can make it work **much** faster than `find` by using it conjunction
      with other command line utilities

## Notes on the fzf project
* fzf means "fuzzy finder"
* project started in 2013
* written with Rust
* slogan: **command-line fuzzy finder**
  * aka "approximate string matcher"
    * [Approximate string matching - Wikipedia](https://en.wikipedia.org/wiki/Approximate_string_matching)
* a general purpose command-line fuzzy finder
* GitHub page:
  * [junegunn/fzf: A command-line fuzzy finder](https://github.com/junegunn/fzf)

### Consists of 4 components
* the fzf executable
* a script for called `fzf-tmux` for launching fzf in a tmux pane
* shell extensions
  * key bindings
  * fuzzy auto-completion
* vim/neovim plugin

### install (for MacOS)
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

### uninstall
  * Use uninstall script to remove fzf
  * For more information, see: [https://github.com](https://github.com/junegunn/fzf)

## Usage
### Basic command line usage
* typing `fzf` launches an interactive finder
  * it reads the list of text string from STDIN
  * it writes out the user's selection to STDOUT
* simplest usage
  1. type `fzf` at command line
    * uses the `find` command, by default, to list all files in current directory
      and in all subdirectories
      * you can tell fzf to use other commands besides `find`
        * more on this later
  2. now type in a few letters
     * file names will be filtered out based on what you type
  3. use `c-n` or `c-p` (or `c-j` and `c-k`) to move up and down the file list to select one
  4. when you have the file you want selected, hit `return`
     * fzf will now print the name of the selected file to stdout

### Using fzf with other commands
* unlock the real power of fzf by using it with other commands:
  * Simple examples:
    * `vim $(fzf)`
      * this lets you quickly find and edit a file that might be buried somewhere deeply
        in your directory tree structure
        * This eliminates the need to tediously type, `<tab>`, type, `<tab>`,
          type, `<tab>` with tab completion to get to your file
        * if you aren't familiar with shell scripting, surrounding `fzf` with
          `$()` replaces it with whatever is returned by the `fzf` command
          * In this case, it is the file you selected
    * Example of fzf with pipes
      * To list file details about a deeply nested file, you can do this:
        * `fzf | xargs ls -l`
          * this command "pipes" in the output of fzf into the input of `xargs ls -l`
            command
      * it's essential that you are comfortable with the syntax of piping one
        command into the next to get the real benefit of fzf
        * seek out a good tutorial on using pipes to familiarize yourself with
          pipes or refresh your memory

### Real world usage of fzf
* typically, you don't type `fzf` directly into the command line prompt
  * usually used as part of a shell alias or shell script
  * `<c-t>` binding supplied with the fzf project can also be used
    * instead of `vim $(fzf)` like in the example above, do:
      * vim `<c-t>` to activate fzf
* fzf is often used as part of shell aliases
  * Example:
    * `alias vf='vim $(fzf)'`
      * quickly edit a file with vim
* shell scripts can leverage fzf to do some really neat stuff
  * See the community examples at [Examples · junegunn/fzf Wiki](https://github.com/junegunn/fzf/wiki/Examples)

## Elsewhere
* [Official fzf Wiki page](https://github.com/junegunn/fzf/wiki)
* [How FZF and ripgrep improved my workflow](https://sidneyliebrand.io/blog/how-fzf-and-ripgrep-improved-my-workflow)

---
#### Other notes linking here:

[Diary entry for 2020-07-18](/2020-07-18)

[Diary entry for 2020-07-19](/2020-07-19)

[How This Site Works](/How-this-site-is-built)

[fzf vim plugin](/fzf-vim-plugin)

[MacOS](/MacOS)

[fzf](/fzf)
