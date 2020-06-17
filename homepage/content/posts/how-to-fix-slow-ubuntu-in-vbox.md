---
title: "How to fix slow Ubuntu in VirtualBox"
date: 2013-02-23T00:18:00
tags: [config, installation, linux, oracle, setup, software, ubuntu, VirtualBox]
categories: [computer]
aliases:
---

1. `apt-get install linux-headers-generic build-essential 2. compizconfig-settings-manager dkms`
1. Install the guest drivers
1. Open ccsm (from the console) and disable "Framebuffer object" option under "OpenGL" (be prepared that you won't be able to read much, but if you activate 3D first, then it will be even worse)
1. `shutdown -h now`
1. Activate 3D acceleration in VirtualBox
1. power on
1. done.

```bash
/usr/lib/nux/unity_support_test -p
```

Source:
<http://askubuntu.com/questions/207813/why-does-an-ubuntu-12-10-guest-in-virtualbox-run-very-very-slowly/214968#214968>

