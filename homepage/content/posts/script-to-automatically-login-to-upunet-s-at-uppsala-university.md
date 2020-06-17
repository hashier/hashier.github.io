---
title: "Script to automatically login to UpUnet-S at Uppsala University"
date: 2013-03-26T10:28:00
tags: [config, console, tip, uu, development]
categories: [computer]
aliases:
---

If you want a small bash, zsh or shell script that auto authenticates you with Uppsala Universities UpUnet-S you can use this simple one liner, just add our username and password and up you go

<!--more-->

```bash
curl --data "action=Login" --data "usergroup=UpUnet-S" --data-urlencode "username=YOUR_USERNAME" --data-urlencode "password=YOUR_PASSWORD" https://netlogon.student.uu.se
```

If you are a student at SLU you can try to substitute `usergroup=UpUnet-S` with `usergroup=SLU` and it should work for you as well. It's untested though.

There is even an iPhone app that I wrote for it: <https://github.com/hashier/UpUnet-S>
