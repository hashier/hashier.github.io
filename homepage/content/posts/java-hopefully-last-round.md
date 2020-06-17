---
title: "Java, the hopefully last round"
date: 2013-02-07T18:37:00
tags: [apple, installation, java, mac, oracle, setup, software]
categories: [computer]
aliases:
---

I had a fresh installation of Mountain Lion and installed Java 7. The problem was when I tried to run StandAloneJava applications ML always asked me whether it should install Java 6. Apparently a lot of people have this problem and here is the solution how to solve it.

<!--more-->

```bash
sudo mkdir /System/Library/Java/JavaVirtualMachines
sudo ln -s /Library/Java/JavaVirtualMachines/jdk_VERSION /System/Library/Java/JavaVirtualMachines/1.6.0.jdk
```

of course you have to amend VERSION to match your Java 7 version.

Caveat:

> Watch out for doing the symlink... Apple released 1.6 security update recently. If you apply this update from Apple, the symlink seems to fool the update and installs 1.6 update into where the symlink points to, i.e. Oracle's 1.7.

[– Jonah Tsai Jan 19 at 18:04](http://apple.stackexchange.com/questions/58203/mountain-lion-with-java-7-only)
