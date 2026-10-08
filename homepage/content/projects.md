---
title: "Projects"
date: 2020-06-06T20:07:58+02:00
lastMod: 2026-10-08T20:00:00+02:00
---

A selection of projects I've built over the years. More on [GitHub](https://github.com/hashier).

## [Nearest Station Map](https://github.com/hashier/voronoi-subway-map)

Shows the closest transit station (subway, rail, airport, bus) anywhere in the world, drawn as a colored Voronoi diagram over OpenStreetMap. Try the [live demo](https://nearest-station.loessl.org/).

![Four example views from the worldwide Nearest Station Map: Paris, London, Tokyo and New York](/img/projects/nearest-station-map.jpg)

{{< langUsed >}}HTML, JavaScript{{< /langUsed >}}

## [Root CA Tracker](https://github.com/hashier/root-ca-tracker)

Firefox extension that records which root certificate authorities your HTTPS connections actually chain to, and compares them with the roughly 120 roots Mozilla ships. It highlights roots that aren't built into Firefox, which can mean your traffic is being inspected. Everything stays local. Install it from [addons.mozilla.org](https://addons.mozilla.org/firefox/addon/root-ca-tracker/).

{{< img src="/img/projects/root-ca-tracker.png" alt="Root CA Tracker popup with stats and seen roots" width="360" >}}

{{< langUsed >}}JavaScript, Firefox WebExtension{{< /langUsed >}}

## [MacFolket](https://hashier.github.io/MacFolket/)

A Swedish/English dictionary deeply integrated into macOS — look up words system-wide via the native dictionary popup. Installable via [Homebrew](https://github.com/hashier/homebrew-tap).

![MacFolket dictionary lookup](/img/projects/macfolket.jpg)

{{< langUsed >}}XSLT{{< /langUsed >}}

## [1-2-animation](https://github.com/hashier/1-2-animation)

Generates Poemotion images (also known as [barrier-grid animations](https://en.wikipedia.org/wiki/Barrier-grid_animation_and_stereography)): still pictures that start to move when you slide a striped sheet over them.

The tool takes a few animation frames, cuts them into thin vertical strips and interleaves them into one scrambled-looking image (top left). The mask (top right) is a real plastic sheet with black stripes and narrow clear slits. Lay it over the image on a screen or a printout and each slit shows a strip of one frame only. Slide the sheet sideways and the frames play one after another, as in the animation below. See it in real life in the [video demo](https://youtu.be/wS_h5yDLNzM).

![The generated image plus a photo of the striped plastic mask; below, a molecule rotates as the mask slides over the image](/img/projects/1-2-animation.gif)

{{< langUsed >}}Go{{< /langUsed >}}

## [TRMNL Norway Departures](https://github.com/hashier/trmnl-norway-departures)

Plugin for the [TRMNL](https://usetrmnl.com/) e-ink display that shows real-time public transport departures in Norway.

<!-- TODO: add image -->

{{< langUsed >}}Python{{< /langUsed >}}

## [idleSound](https://hashier.github.io/idleSound/)

Automatically mutes your Mac when it becomes idle or the screen locks. Configurable idle time and screen-lock thresholds.

![idleSound menu bar](/img/projects/idlesound.png)

{{< langUsed >}}Objective-C, macOS menu bar app{{< /langUsed >}}

## [Mastodon Stats on Followings](https://github.com/hashier/mastodon-stats-on-followings)

Finds out which of the people you follow on Mastodon are the most chatty — ranks your followings by timeline noise (posts, threads, boosts) over the last 14 days so you can curate who you follow.

```
  vncresolver ........ 120 posts    0 threads    0 boosts  120 total  8.6/day
  briankrebs .........  11 posts    3 threads   82 boosts   96 total  6.9/day
  stroughtonsmith ....  48 posts   13 threads   30 boosts   91 total  6.5/day
```

{{< langUsed >}}Python{{< /langUsed >}}

## Earlier work

A few older projects, kept here for the record rather than the spotlight.

- [SuperSAFT](https://github.com/hashier/SuperSAFT) — my very first code: an implementation of the SAFT file transfer protocol.
- [flicp](https://github.com/hashier/flicp) — my first C project: a file transfer client for [fli4l](https://www.fli4l.de/) Linux routers.
- [CBP Compiler](https://github.com/hashier/cbp) — university project: a compiler for a subset of C, built with Bison and Flex.
- [GIMP CUDA Plugin](https://github.com/hashier/gicu) — the very first CUDA-accelerated GIMP plugin ever written.
