---
title: "Mac OS X is updating your preferences in the background"
date: 2013-05-07T16:24:00
tags: [apple, cloud, config, iCloud, mac, mail, plist, setting, sync, system]
categories: [computer]
aliases:
---

Recently I noticed that a config file of Safari gets updated every now and then even if Safari is not running.

<!--more-->

The same goes for these configuration files:

```bash
/Users/hashier/Library/SyncedPreferences/com.apple.Safari.plist
/Users/hashier/Library/SyncedPreferences/com.apple.syncedpreferences.plist
```

These two files are not directly readable with e.g. `cat` but you read them with:

```bash
defaults read /Users/hashier/Library/SyncedPreferences/com.apple.Safari.plist
```

You can see all your open tabs on all your iPhone, iPad, iMac, MacBook etc devices that support Safari Cloud Tabs.

The other file reveals other system preferences that get synced over iCloud like some settings from Apple Mail. Just have a look and poke a bit around.
