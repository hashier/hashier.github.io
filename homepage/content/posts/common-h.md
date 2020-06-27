---
title: "common.h"
date: 2013-09-04T15:24:00
tags: [development, ObjC]
categories: [computer]
aliases:
---

So I got sick with NSLog and wrote myself a simple wrapper around it.

<!--more-->

Which you can find [here](https://gist.github.com/hashier/6436829).

The Syntax is the same but the printout is why nicer to read, it looks like this:

```objc
2013-09-02 17:00:49.543 AppName[4841:a0b] (FilterAppDelegate.m:15 -[FilterAppDelegate application:didFinishLaunchingWithOptions:]) TEST LOG
```

So you can see the filename, line number, function and everything else important directly.
