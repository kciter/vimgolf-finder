# VimGolf Finder 🔎
[![Build Status](https://travis-ci.org/kciter/vimgolf-finder.svg?branch=master)](https://travis-ci.org/kciter/vimgolf-finder)

Simple VimGolf challenge finder. It just toy project for me! :smile:

## Preview
[![asciicast](https://asciinema.org/a/1whcqi8pjldxi767iiknqxeil.png)](https://asciinema.org/a/1whcqi8pjldxi767iiknqxeil)

## Installation
Paste this at a terminal prompt:
```
$ gem install vimgolf-finder
```

## Usage
```
Commands:
  vimgolf-finder help [COMMAND]  # Describe available commands or one specific command
  vimgolf-finder list            # Show VimGolf challenges
  vimgolf-finder random          # Pick one at random from VimGolf challenges
```

### List 🔎
Show VimGolf challenges from 'http://vimgolf.com/'.
```
$ vimgolf-finder list
1. Simple text editing with Vim - 8304 entries (4d1a34ccfa85f32065000004)
2. Simple, Practical, and Common - 7945 entries (55b18bbea9c2c30d04000001)
3. Words in parens - 7806 entries (5192f96ad8df110002000002)
4. A HAPPY NEW YEAR 2014 ! - 7022 entries (52c3cb0d9b8634000200000e)
5. Just the middle - 5262 entries (54862fbb3f90ac0002904cf5)
6. I forgot quotes - 5034 entries (5462e3f41198b80002512673)
7. Reformat/Refactor a Golfer Class - 4878 entries (4d1a1c36567bac34a9000002)
8. switch variable - 3431 entries (4f0720c8f037090001000007)
9. Search and Replace 0 - 3234 entries (4d1a8bf2b8cb3409320002c4)
10. Vice versa - 2908 entries (55bcdc3ef4219f456102374f)
Choose challenge number. 2

Open your web browser? (y/n) y
Do you want to play? (y/n) y

# Playing VimGolf...

Thanks for playing!
Solves? (y/n) y
[✓] Checked!
```

#### Options
```
Options:
  o, [--order=ORDER]
                            # Default: entries
  d, [--desc], [--no-desc]
                            # Default: true
  l, [--limit=LIMIT]
                            # Default: 10
  p, [--page=PAGE]
                            # Default: 1
```

### Random 🔎
Pick one at random from VimGolf challenges
```
$ vimgolf-finder random
1. C to VimDict - 38 entries (54a94976f4048c00026d8ed6)

Open your web browser? (y/n) n
Waiting...
C to VimDict
Convert a C data structure to a Vimscript dictionary.
--------------------------------------------------
Start File
{ "Return", '\n', },
{ "ampersand", '&', },
{ "apostrophe", '\'', },
{ "asciicircum", '^', },
{ "asciitilde", '~', },
{ "asterisk", '*', },
{ "at", '@', },
{ "backslash", '\\', },
--------------------------------------------------
End File
{
\  "\n" : 'Return',
\  "&"  : 'ampersand',
\  "\'" : 'apostrophe',
\  "^"  : 'asciicircum',
\  "~"  : 'asciitilde',
\  "*"  : 'asterisk',
\  "@"  : 'at',
\  "\\" : 'backslash',
\}
--------------------------------------------------
Do you want to play? (y/n) y

# Playing VimGolf...

Thanks for playing!
Solves? (y/n) n
```

### Solves 🔎
Show solved VimGolf challenges
```
$ vimgolf-finder solves
1. Simple, Practical, and Common - 7953 entries (55b18bbea9c2c30d04000001) [✓]
Choose challenge number. 1

Open your web browser? (y/n) y
Do you want to play? (y/n) y

# Playing VimGolf...

Thanks for playing!
Solves? (y/n) y
```

## TODO
* [ ] Unit Testing
* [ ] Refactoring

## License
The MIT License (MIT)

Copyright (c) 2016 Lee Sun-Hyoup

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
