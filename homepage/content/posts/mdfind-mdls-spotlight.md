---
title: "mdfind & mdls & Spotlight"
date: 2013-12-27T20:02:00
tags: [apple, console, mac, tool, tip]
categories: [computer]
---

Searching for files with Spotlight is awesome and you can actually use the power of Spotlight even in the console. But first let me show you some nice features of Spotlight.

<!--more-->

## Spotlight

Searching for all images that contain `me`, are of kind image and were taken with flash:

```bash
mdfind kind:image flash:1
```

Spotlight supports a whole lot of these search fields like, duration, pixel height, width, last opened, ISO speed, aperture, exposure time and so forth for a full list check this [PDF](http://hints.macworld.com/dlfiles/spotlight_cmds.pdf).

## mdfind

Now let’s move over to the console. Here you can do this cool stuff with a tool called `mdfind`.

Let’s find all audio files that are longer than 10 minutes:

```bash
mdfind -interpret 'duration:>=600 kind:music'
```

`-interpret` interprets the search string as if you typed it into Spotlight. `mdfind` supports another mode in which you can search on fields of the meta information directly.

```bash
mdfind -literal 'kMDItemDurationSeconds > 600 && kMDItemContentTypeTree == public.audio'
```

All mp3s that are longer than 10 minutes:

```bash
mdfind 'kMDItemDurationSeconds > 600 && kMDItemKind = "MPEG Audio Layer 3"'
```

All [ATP](https://atp.fm) podcasts:

```bash
mdfind '(kMDItemAuthors == "atp"cdw)'
```

cdw stands for:

- ignore case
- ignore diacritical
- word based

All by the [5by5](http://5by5.tv) network

```bash
mdfind 'kMDItemAuthors = "*5by5.tv*"'
```

Both are of course possible in Spotlight as well by simply searching for:

```bash
author:atp
author:5by5
```

Find all pictures taken with an iPhone 4S on the last day of the year 2011 and the first day of 2012. The range includes the from date but not the until date.

```bash
mdfind 'kind:image created:31/12/11-2/1/12 model:"iPhone 4S"'
```

## mdls

How to figure out these strange looking search fields, that’s where `mdls` comes into play.

```bash
mdls <file>
```

Prints out all meta information fields for that file. With `mdfind` you can then search for those fields.

If you are curious about all possible field values you can get them with

```bash
mdimport -X
```

and

```bash
mdimport -A
```

Be warned, it is a lot of information.

## Final note

It’s worth having a look at the man page of these commands and the help provided with `mdfind -h` because the information is not consistent. For example the man page doesn’t tell you about the `-s` flag which brings smart folders to the command line.

And for the curious how I came across `mdfind`. I stumbled upon that command while reading this [blog post](http://brettterpstra.com/2013/12/22/quick-tip-tag-filer-without-hazel/) by Brett Terpstra.

Sources:
[Spotlight reference](http://hints.macworld.com/dlfiles/spotlight_cmds.pdf)
[MacDevCenter about mdfind](http://www.macdevcenter.com/pub/a/mac/2006/01/04/mdfind.html?page=1)
