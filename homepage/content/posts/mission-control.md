---
title: "Mission Control"
date: 2013-05-20T18:29:00
tags: [apple, config, installation, mac, plist, productivity, setup, software, til]
categories: [computer]
aliases:
---

To get mission control to pop up fast just write this to your plist file:

<!--more-->

```bash
defaults write com.apple.dock expose-animation-duration -float 0.1; killall Dock
```

And with

```bash
defaults delete com.apple.dock expose-animation-duration; killall Dock
```

you can get back to default setting.
