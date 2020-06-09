---
title: "Java a New Round Round 7"
date: 2013-02-04T13:10:00
tags:
- java
- mac
- oracle
- software
- apple
categories:
- computer
aliases:
draft: true
---

After fighting against Java 6 from apple I decided to install Java 7 and have a look into that. To say the least, I still feel quite nauseous so I keep this EXTREMELY short.

<!--more-->

To get rid of Java 7 from oracle you have to do this:

## Remove JRE

Navigate to /Library/Internet Plug-Ins and remove the JavaAppletPlugin.plugin directory.
Navigate to /Library/PreferencePanes and remove JavaControlPanel.prefpane.

## Remove JDK

Navigate to /Library/Java/JavaVirtualMachines and remove the directory of the JDK you want to get rid of.
Removing the Pref-Panel:

```bash
sudo rm -rf /Library/PreferencePanes/JavaControlPanel.prefpane
```

## Sources

- <http://docs.oracle.com/javase/7/docs/webnotes/install/mac/mac-jre.html>
- <http://docs.oracle.com/javase/7/docs/webnotes/install/mac/mac-jdk.html>
