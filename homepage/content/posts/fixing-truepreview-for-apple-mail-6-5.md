---
title: "Fixing TruePreview for Apple Mail 6.5"
date: 2013-07-27T01:10:00
tags: [apple, config, mac, mail, osx, plist]
categories: [computer]
aliases:
---

If you started Mail and it tells you that your plugin got disabled you have to move the plugin first from the disabled folder back to the "normal" folder:

<!--more-->

```bash
mv ~/Library/Mail/Bundles\ \(Disabled\)/TruePreview.mailbundle ~/Library/Mail/Bundles/
```

after this you need to figure out the new UUIDs with these two commands:

```bash
defaults read /Applications/Mail.app/Contents/Info.plist PluginCompatibilityUUID
defaults read /System/Library/Frameworks/Message.framework/Resources/Info.plist PluginCompatibilityUUID
```

These two UUIDs need to go into this file:

```bash
~/Library/Mail/Bundles/TruePreview.mailbundle/Contents/Info.plist
```

You can either do it with

```bash
defaults write ~/Library/Mail/Bundles/TruePreview.mailbundle/Contents/Info SupportedPluginCompatibilityUUIDs -array-add $UUID
```

or any other text editor.

If the bundle is installed system wide of course you have to look into `/Library` instead of `~/Library`.

Source:
[Fixing GrowlMail for Mail 4.2 | langui.sh](http://langui.sh/2009/11/09/fixing-growlmail-letterbox-for-mail-4-2/#fn-811-1)
