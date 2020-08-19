---
date: '2020-07-17 23:27:59'
title: MacOS
updated: '2020-07-29 13:56:56'
---
## CLI tools
### ripgrep as a replacement for grep
* GitHub project
  * [BurntSushi/ripgrep: ripgrep recursively searches directories for a regex pattern](https://github.com/BurntSushi/ripgrep)
* File searching tool
  * claims to be much faster than grep
  * installing
    * `brew install ripgrep`
    * looks like perl compatible regular expressions are built in with the brew
      install
  * usage
    * simplest case:
      * `rg search_term_here`
    * version
      * `rg --version`
  * documentation
    * `man rg`
    * `rg [OPTIONS] PATTERN [PATH...]`

### fzf
* see [fzf](/fzf)

## Random tip and tricks
* open man page as a pdf
  * `man -t rg &#124; open -f -a Preview.app`
* speed up repeat speed when key is held down
  * see second line here:
  ```
  defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
  defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
  ```
  * From [How to increase keyboard key repeat rate on OS X? - Ask Different](https://apple.stackexchange.com/questions/10467/how-to-increase-keyboard-key-repeat-rate-on-os-x)
### curl
* download html page and save to file
  * `curl -s -o ./file.html -k [https://example.com`](https://example.com`)
