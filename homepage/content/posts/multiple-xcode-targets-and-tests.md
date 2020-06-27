---
title: "Multiple Xcode Targets and Tests"
date: 2014-02-09T15:58:00
tags: [apple, development, iOS, mac, ObjC, Xcode]
categories: [computer]
---

<!--more-->

- Go to targets -> Select target -> Duplicate (I duplicated a target which name was “tests”)
- Rename the target to whatever you want (I use “Tooth” here)
- Go to “Manage Schemes” and delete the scheme with the old name (“tests copy”) and click on “Autocreate Schemes Now”
- Rename the “tests copy-Info.plist” to “Tooth-Info.plist” in your “Project Navigator” (or the path where Xcode can find the .plist file)
- (If you need a different .pch file, you have to duplicate it in finder and add it to your project, otherwise “Tooth” will use the same .pch file as “tests”)
- Go to the “Build Settings” of your new target and make sure that you check the following key value pairs:
  - Info.plist File: Change from “tests copy-Info.plist” to “Tooth-Info.plist”
  - Product Name: Change from “tests copy” to “$(TARGET_NAME)”
  - Prefix Header: Change accordingly if you need a different .pch file and created it earlier
  - Preprocessor Macros
    - Add something like “TOOTH=1” to your “Tooth” target and “TESTS=1” to your “tests” target (in Debug and Release)

If your project doesn’t build (or link) any more now, just reopen Xcode.

This is how you can decide in which target you are inside your code:

```objc
#if TESTS
    NSLog(@"I'm the tests target");
#elif TOOTH
    NSLog(@"I'm the Tooth target");
#else
    NSLog(@"Error: You added a new target and didn't set the Macros");
#endif
```

## Adding a new test target

Of course you want to be able to write tests for your new target as well.

- Go to the “Test Navigator”
- On the bottom left click the “+” sign and chose “New Test Target…”
- Select the Target you want to build tests for
- WAIT! Don’t worry that you don’t see any tests for the new test target, just wait…. until it’s there, or restart Xcode
- Right click on it and enable your test target
- Go to “Build Settings” and select your tests target
  - Framework Search Path: Add “$(SRCROOT)” otherwise you will get errors with Frameworks like Crashlytics that it can’t find #import “Crashlytics/Crashlytics.h” (I add this as a project key value so I don’t have to do it for every new test target)
- Start writing tests (:
