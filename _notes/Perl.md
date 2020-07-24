---
date: '2020-07-13 06:14:27'
title: Perl
updated: '2020-07-23 14:23:08'
---
Perl is my native programming language and the one I know the best. It was the
lingua franca back in the late 90s when I first started web development.

Perl gets knocked around quite a bit these day for not being elegant. Maybe it
is, and maybe it isn't, I'm not knowledgeable enough about programming languages
to provide a definitive answer. All I know is it's useful for me and its the
easiest way for me to get things done. And remember that English isn't a very elegant
language either but it got the job done well enough to become the most popular
one in the world.

Here are the [perl modules I've written and contributed.](https://metacpan.org/author/STEVIED) The are of varying quality
and usefulness.

Over the last couple of years, I have made a concerted effort to improve my
programming quality and skills.

## Regexes

### substitute text when *not* between two strings of text:
* see [https://stackoverflow.com](https://stackoverflow.com/questions/12493128/regex-replace-text-but-exclude-when-text-is-between-specific-tag)
* used in [markdown_to_note](/markdown_to_note) code:
```perl
    $input_text =~ s@(&#124;)(?!(.(?!^{٪\s*highlight))*{٪ endhighlight ٪})@|@ms;
    $input_text =~ s@(&#124;)(?!(.(?!^```\S))*^```})@|@ms;
```

---
### Other notes linking here:

[Tech stuff](/Tech-stuff)
