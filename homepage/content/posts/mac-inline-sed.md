---
title: "Mac inline sed"
date: 2020-06-17T22:16:31+02:00
tags: [til, shell]
categories: [computer]
aliases:
---

TIL: How to use inline sed on mac.

<!--more-->

I always thought I have to use the gnu tools for inline sed, but I was wrong. Mac sed supports inline editing like this:

```bash
sed -i '' '/pattern/d' ./infile
```

For example to change all my blog posts with the tag `tip` to `til` I used

```bash
sed -i '' 's/\(tags:.*\)tip\(.*\)/\1til\2/g' *.md
```
