---
title: "Fixing TruePreview for Apple Mail 6.6"
date: 2013-09-23T20:33:00
tags: [apple, fix, mail, plist]
categories: [computer]
aliases:
---

<!--more-->

```bash
defaults write ~/Library/Mail/Bundles/TruePreview.mailbundle/Contents/Info SupportedPluginCompatibilityUUIDs -array-add DAFFB2B4-77BC-4C25-8CE1-2405E652D54B
defaults write ~/Library/Mail/Bundles/TruePreview.mailbundle/Contents/Info SupportedPluginCompatibilityUUIDs -array-add 2B98D2DD-000B-4521-83EB-7BFCB9B161C8
```

If you started mail before executing these two commands, make sure to copy the plugin from the Bundle `(Disbaled)` folder back to the Bundle folder.
