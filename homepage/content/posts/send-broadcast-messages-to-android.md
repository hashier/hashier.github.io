---
title: "Send Broadcast Messages to Android"
date: 2013-09-04T17:38:00
tags: [android, development, google]
categories: [computer]
aliases:
---

Faking a received SMS

<!--more-->

```android
adb shell am broadcast -a android.provider.Telephony.SMS_RECEIVED
```
