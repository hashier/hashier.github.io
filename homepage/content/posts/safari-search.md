---
title: "Safari search"
date: 2013-02-08T14:42:00
tags: [apple, config, mac, plist, setup, til]
categories: [computer]
aliases:
---

To be able to use Safari's search function you definitely should execute this cmd:

<!--more-->

```bash
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool FALSE
```

As the name states it. Your search string doesn't need to be at the beginning of the word.
