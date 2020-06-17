---
title: "SSH key Length and fingerprint"
date: 2013-02-05T16:19:00
tags: [fingerprint, key, ssh]
categories: [computer]
aliases:
---

I always forget how to figure out the length and the fingerprint of a key, so here we go

<!--more-->

```bash
ssh-keygen -lf ~/.ssh/id_rsa.pub
```
