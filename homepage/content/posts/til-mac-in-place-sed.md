---
title: "TIL: Mac in-place sed"
date: 2020-06-17T22:16:31+02:00
tags: [til, shell]
categories: [computer]
aliases:
---

TIL how to use in-place sed on Mac.

<!--more-->

I always thought I have to use the GNU tools version of sed for in-place sed, but I was wrong. Mac sed supports in-place editing as well.

```bash
sed -i '' '/pattern/d' ./infile
```

There is a caveat though:

> Edit files in-place, saving backups with the specified extension.  If a zero-length extension is given, no backup will be saved.  It is not recommended to give a zero-length extension when in-place editing files, as you risk corruption or partial content in situations where disk space is exhausted, etc.

> Replace all occurances of `foo` with `bar` in the file test.txt, without creating a backup of the file:

```bash
sed -i '' -e 's/foo/bar/g' test.txt
```
