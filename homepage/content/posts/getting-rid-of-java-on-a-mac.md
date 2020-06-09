---
title: "Getting rid of java on a mac"
date: 2013-02-02T11:38:00
tags:
- apple
- mac
- application
- java
- lsbom
- pkg
- pkgutil
- plist
- software
- oracle
categories:
- computer
aliases:
draft: true
---

If you installed Java from Apple then you have the problem, that you have got a very old Version of Java:

<!--more-->

```bash
$ java -version
java version "1.6.0_37"Java(TM) SE Runtime Environment (build 1.6.0_37-b06-434-11M3909)
Java HotSpot(TM) 64-Bit Server VM (build 20.12-b01-434, mixed mode)
```

Java get's installed as a .pkg file and here is how to figure out which files this .pkg installed (unfortunately I haven't found out where the pre- and postflight scripts are so you have to hope they don't do anything nasty).

First things first; some essential Java files are on your system after a fresh installation, so we have to figure out what files are there from the beginning. To do this we have look into

```bash
/Library/Receipts/InstallHistory.plist
```

Right on top you can see that the "OS X Installer" installed two packages called "JavaTools" and "JavaEssentials" so we don't touch them.

Now we try to figure out all Java .pkgs that were installed:

```bash
grep -i Java /Library/Receipts/InstallHistory.plist
```

So we know that we have to uninstall: "JavaForMacOSX107", "JavaSecurity" and "JavaMDNS".

To get to the files that where installed by those packages we call:

```bash
cd /private/var/db/receipts
lsbom -s com.apple.pkg.JavaSecurity.bom com.apple.pkg.JavaMDNS.bom com.apple.pkg.JavaForMacOSX107.bom
```

Last thing to do is remove the three .bom and three .plist files from: /private/var/db/receipts.

You are done

PS

Two folder to worth looking at are:

```bash
/System/Library/Java/JavaVirtualMachines/
/Library/Java/JavaVirtualMachines/
```
