---
title: "Automatically Increment Build Number (CFBundleVersion)"
date: 2013-08-21T19:19:00
tags: [apple, coding, development, mac, software, til, Xcode]
categories: [computer]
aliases:
---

David wrote this nice little helper that automatically increments the build version every time.

<!--more-->

```bash
#!/bin/bash
buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "$INFOPLIST_FILE")
buildNumber=$(echo $buildNumber | sed 's/0*//')
buildNumber=$(($buildNumber + 1))
buildNumber=$(printf "%04d" $buildNumber)
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "$INFOPLIST_FILE"
```

In Xcode just head over to "Build Phases" of your target and "Editor" -> "Add Build Phase" -> "Add Run Script Build Phase" there you can just simply paste this little script and every time you build your app the build version gets incremented.

So at least I can see how many times I build a certain project.
