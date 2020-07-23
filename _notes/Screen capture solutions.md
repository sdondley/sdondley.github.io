---
date: '2020-07-19 14:53:47'
new: 0
title: 'Open source screen capture solutions for macOS'
updated: '2020-07-22 20:46:29'
updated_logo: '1'
---
I did a little research into open source solutions for doing quick screen
captures for my notes.

## My requirements
* Should be able to show key presses
* Should be able to produce gifs easily
  * gif are the most portable format, easiest to work with
  * however, they are not ideal for longer videos as they can be much larger than
    mp4 or webm

## Inspiration
* [How FZF and ripgrep improved my workflow](https://sidneyliebrand.io/blog/how-fzf-and-ripgrep-improved-my-workflow)
  * though site used gifs at first but they are actually mp4 and webm videos
  * Got in contact with author, he uses a program called [Screenflick – Mac Screen Recorder with Audio](https://www.araelium.com/screenflick-mac-screen-recorder) to generate the videos
    * Screenflick is $35

## Doesn't macOS already come with good screen capture software?
* Yes it does
* However, it doesn't capture and display key presses, one of my requirements

## Open source alternatives?
* I tested one:
  * [wulkano/Kap: An open-source screen recorder built with web technology](https://github.com/wulkano/Kap)
  * Limitations of Kap
    * export process is very confusing
      * unable to find the exported files in the file system
    * does not show key presses
      * however, has a plugin that shows key presses
        * however, plugin is not executed very well
          * only one character shows at a time
          * however, there is another open source GitHub project that displays
            key presses to the screen:
            * [keycastr/keycastr: KeyCastr, an open-source keystroke visualizer](https://github.com/keycastr/keycastr)
              * keycastr works pretty well
              * you can drag the keycastr display where you want and display it
                in the capture area of Kap
              * **however** it turns out keycastr is buggy and doesn't work well
                on my iMac 5K
                * see [Cannot be displayed on right side of large screens? · Issue #173 · keycastr/keycastr](https://github.com/keycastr/keycastr/issues/173)

## Conclusion
* I ended up springing the $35 for Screenflick. Its ease of use is probably worth saving
  myself the aggravation of using the open source alternatives.
* I thought about using keycastr on my secondary monitors (I have 3) for
  now, use the built-in screencast solution on macOS and then hope the developer can
  fix the bug so I can use it on my main monitor.
  * Decided against it

---
### Other notes linking here:

[Tech stuff](/Tech-stuff)
