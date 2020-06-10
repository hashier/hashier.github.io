---
title: "Some of my projects"
date: 2020-06-06T20:07:58+02:00
tags: ["static-page", "index"]
---

This is a small (incomplete) list of projects that I have started over the years and that have had some impact on me in one way or another.
Starting with my very first successful C project that allowed transfer of files between a famous gateway router ([fli4l](https://fli4l.de)) and a local machine, flicp.

You can find most of my projects on [Github](https://github.com) or by clicking on them below.

## [1-2-animation](https://hashier.github.io/1-2-animation/)

This command line tool generates Poemotion images.
These are 2D images that provide an optical illusion of being 3D when viewed with a striped masked.

A video of this effect can be found on the project's GitHub page.

Written in Go.

## [Spotify Playlist Manager](https://hashier.github.io/Bucketify/)

This app helps you to manage and filter your Spotify Playlist.

Whether you want to filtering your playlists by genre, country of artist or just simply randomise it, this app can do it for you.

Written in Objective-C with different Frameworks like CocoaLibSpotify and ENiOS.

## [idleSound](https://hashier.github.io/idleSound/)

Automatically mute your Mac when it becomes idle or your screen locks.

Idle time as well as the screen-lock/screen-saver are individually adjustable.

Mac Menubar UI App, written in Objective-C.

## [SSKeychain](https://github.com/soffes/sskeychain/)

Objective-C wrapper around the iOS/OS X keychain.
I wrote the unite testsfor almost the whole code base.

Written in Objective-C.

## [MacFolket](https://hashier.github.io/MacFolket/)

MacFolket is a Swedish/English dictionary that is deeply integrated into OS~X.

After finding a dictionary database under the CC license, I decided to develop a program that facilitates reading Swedish webpages.

Implemented in XSLT (I started a Golang rewrite recently).

## [GIMP CUDA-Plugin](https://github.com/hashier/gicu/)

GIMP plugin written to use GPU acceleration.

The plugin extends GIMP to apply various filters on images with the help of the graphics card.
This is done by transfer of heavy calculations to the GPU.

As far as I know, this was the very first every written GIMP plugin
that off loaded the heavy math calculations to the graphics card.

Written in C, X11, GTK+ and CUDA.

## [SuperSaft](https://github.com/hashier/SuperSaft/)

Implementation of the SAFT protocol.

It is fully functional and compatible with the original client and server.
More information about the protocol can be found here in this pre-RFC:

<http://linux.math.tifr.res.in/manuals/text/sendfile.txt>

Written in ANSI C.

## [flicp](https://www.fli4l.de/)

My initiation into the world of developing software.

fli4l.de is a Linux based ISDN-, DSL- and Ethernet-router.
The communication with the system service utilized a special
protocol thatwas only implemented in a program for Windows.
I wrote flicp to be able to transfer files to and from Unix/Linux
based systems to the service

Written in ANSI C.
