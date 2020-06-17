---
title: "Finding the right LaTeX packages"
date: 2013-05-22T13:47:00
tags: [config, installation, latex, linux, mac, writing]
categories: [computer]
aliases:
---

If you have little space on your machine and therefore want to install the LaTeX Basic package (which is only around 150MB instead of a couple of GB) you might run into problems that packages are missing but with `tlmgr` this is quite easy to solve

<!--more-->

You might get errors like this:

```bash
I couldn't open style file alphadin.bst
---line 222 of file bachelor.aux
 : \bibstyle{alphadin
 :                   }
I'm skipping whatever remains of this command
I found no style file---while reading file bachelor.aux
(There were 2 error messages)
/usr/bin/texi2dvi: bibtex exited with bad status, quitting.
```

or similar. You can easily search for it with

```bash
$ tlmgr search --global --file alphadin.bst
din1505: texmf-dist/bibtex/bst/din1505/alphadin.bst
```

`--all` is a useful search flag as well.

PS: Installing works with `tlmgr` of course as well
