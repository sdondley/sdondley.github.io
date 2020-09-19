---
date: '2020-09-15 20:33:38'
title: MacOS
updated: '2020-09-18 11:12:58'
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

### brew software
* brightness
  * increments
    * brightness can be set from 0.01 to 0.99
    * higher number = brighter
  * controls brightness of screens from command line
  * -d switch
    * 0 for main monitor
    * 1 for t-bolt monitor
  * aliases
    * alias dim='brightness -d 0 0.01; brightness -d 1 0.1'
    * alias dim2='brightness -d 0 0.1; brightness -d 1 0.5'
    * alias med='brightness -d 0 0.3; brightness -d 1 0.7'
    * alias med2='brightness -d 0 0.5; brightness -d 1 0.9'
    * alias bright='brightness -d 0 0.7; brightness -d 1 0.9'
    * alias bright2='brightness -d 0 0.99; brightness -d 1 0.99'
  * to make the monitors about same brightness
    * add about .4 to display 1 compared to display 0

## Random tip and tricks
* open man page as a pdf
  * `man -t rg &#124; open -f -a Preview.app`
* speed up repeat speed when key is held down
  * see second line here:
  ```
  defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
  defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
  ```
  * you must log out and back in to see the changes
  * From [How to increase keyboard key repeat rate on OS X? - Ask Different](https://apple.stackexchange.com/questions/10467/how-to-increase-keyboard-key-repeat-rate-on-os-x)
### curl
* download html page and save to file
  * `curl -s -o ./file.html -k [https://example.com`](https://example.com`)
