---
title: "How to run FreeMind on Mountain Lion"
date: 2013-02-07T20:05:00
tags: [application, FreeMind, java, mac, mind mapping, productivity, software, tip, tool]
categories: [computer]
aliases:
---

If you try to run FreeMind on Mountain Lion you get this "nice" error message:

<!--more-->

> "FreeMind.app" is damaged and can't be opened. You should move it to the Trash.

To persuade FreeMind to run anyway you can type this command into your console:

```bash
java -jar /Applications/FreeMind.app/Contents/Resources/Java/lib/freemind.jar
```

I read on the internet that you can disable GateKeeper as well to run FreeMind but I didn't try it.
