---
title: "git diff and ObjectiveC"
date: 2013-11-28T23:51:00
tags:
- development
- git
- ObjC
categories:
- computer
aliases:
- test
---

When writing Objective-C code and using git you probably realised that the `git diff` output does not mention the function name in which the change occurred. This can easily be changed.

<!--more-->

Run the following command inside your git repository

```bash
echo "*.m diff=objc" >> .gitattributes
```

Source: <https://gist.github.com/bjhomer/2473281>
