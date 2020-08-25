---
date: '2020-08-24 10:20:24'
title: 'Perl Regex Tutorial'
---
* What is a regular expression?
  * A template for determining if a string has certain characteristics
  * $var =~ m/mushroom/
    * this is an expression
      * returns true if $var contains 'mushroom'
      * false otherwise
* use re 'strict'
  * can be used in perl 5.22+
  * can apply stricter rues than otherwise when compiling regex patterns
  * Finds things that may be legal but may not be what was intended

## Operators
* m//
* s///
* qr//
* split

## The basics

### Simple word matching
* "Hello World" =~ /World/; # matches
* =~ is an operator to test if a string matches
* !~ negation matching operator

### metacharacters
* { } [ ] ( ) ^ $ . &#124; * + ? - \
* # is a metacharacter only when \x is used
* } and ] are only metacharacters when paired with their corresponding opening
  character
* metacharacters can be matched as is by putting a backslash before it
*


---
### Other notes linking here:


[Perl](/Perl)