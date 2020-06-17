---
title: "Recursive git grep"
date: 2013-06-21T02:15:00
tags: [coding, development, git, tip]
categories: [computer]
aliases:
---

I just figured out, that I want to make sure, that I never committed a key to my repository before publishing it, so what's the easiest way to grep throw all commits in a git repository:

```bash
git grep USERNAME $(git rev-list --all)
```

If you are only interested in the commits you can run:

```bash
git log -G USERNAME
```
