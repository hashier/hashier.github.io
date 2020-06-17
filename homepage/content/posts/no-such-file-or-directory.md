---
title: "No Such File or Directory"
date: 2013-03-15T02:58:00
tags: [android, apt, linux, setup, strange, ubuntu]
categories: [computer]
aliases:
---

bash: ./adb: No such file or directory

<!--more-->

Fix:

```bash
apt-get install ia32-libs
```

via [ubuntu bash: ./adb: No such file or directory](http://ubuntuforums.org/showthread.php?t=1520697)
