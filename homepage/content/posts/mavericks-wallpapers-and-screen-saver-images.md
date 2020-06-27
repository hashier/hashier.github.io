---
title: "Mavericks Wallpapers and Screen Saver Images"
date: 2013-10-25T20:56:00
tags: [apple, mac, setup]
categories: [computer]
---

Have a folder with all the Mavericks wallpapers and screen saver images but without wasting a lot of space.

<!--more-->

So you can set it as the folder that should be used for randomly choosing a background plus you can delete the ones you don't want.

So we generate a folder in which we link all the default Mavericks wallpapers + screen saver images and set this as our folder to chose background images from, here's the script:

```bash
mkdir folder
cd folder
find /Library/Desktop\ Pictures /Library/Screen\ Savers/Default\ Collections \( -name "*.jpg" -or -name "*.png" \) -and \! -path "*.thumbnails*" -and \! -path "*Solid Colors*" -exec ln -s "{}" . \;
```
