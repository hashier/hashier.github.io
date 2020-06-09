---
title: "Setting Up a New Mac"
date: 2013-02-01T21:50:00
tags:
- apple
- config
- install
- mac
- setup
- software
category:
- computer
aliases:
draft: true
---

Every time I setup a new Mac system I wonder "what else do I have to set/configure" so I deceided today while setting up a new Mac that I will write down the (imho) most important steps, settings and applications. Thus I have a step by step list next time I set up a new Mac (:

<!--more-->

This post is subject to change without prior notice.

## System Preferences

### General

- [X] Ask to keep changes when closing documents
- [ ] Close windows when quitting an application

### Mission Control

- [ ] Show Dashboard as a space
- [ ] Automatically rearrange Spaces based on most recent use
- Set up hot corners

### Language & Text

- Remove unneeded languages

### Security & Privacy

- Require password "5 seconds" after sleep or screensaver begins
- activate "FileVault"
- activate "Firewall" (and/or set up pf)

### Notifications

- Mail -> Alert && in the Mail application set only VIP send notifications

### Display

- [ ] Automatically adjust brightness

### Energy Saver

Set sleeping times

- [ ] Wake for network access (For laptops off)

### Keyboard

- [ ] Adjust keyboard brightness in low light
- [X] All controls
- Map "Tab" to "Ctrl"
- higher Key Repeat rate

### Network

- [  ] Ask to join new networks

### Sharing

- [X] Remote login

### Software Update

- [ ] Install system data files and security updates

## Applications

### Finder Preferences

- New Finder windows show: home
- Show these items in the sidebar -> add your home folder
- [X] Show all filename extensions
- Remove "All My Files" from Sidebar
- Show Path Bar
- Show Status Bar

### Contacts

- Default Account
- Adress Format

### iTerm2

- set scrollbackbuffer  higher
- Right option key acts as +ESC

### Applications needed

- iTerm2
- Adium
- AppCleaner
- Evernote
- Chrome
- Firefox
- sublime2
- Xcode
  - install simulator
  - install documentation
- tunnelblick
- flux
- nvALT
- Trim Enabler
- Xee
- Pester
- Caffeine (TODO: Rewrite that tool)
- XQuartz
- Tunnelblick
- Dash
- Timingapp
- DOSBox
- puu.sh
- ReadKit
- TestFlight
- Crashlytics
- CoverStory
- SQLite Professional
- Liya
- Spectacle
- VLC
- texstudio
- Tyme
- Spotify
- 1Password
- Keyboard Cleaner
- Sourcetree
- Caffeine
- Shiori
- Marked 2
- Pixelmator
- DayOne
- PaintCode
- Anki

### homebrew

- wine (put it up here, so it will install deps with -universal)
- hydra (nikto)
- dsniff
- htop-osx
- metas*****
- mplayer
- ngrep
- nmap
- p0f
- smartmontools
- unrar
- wget
- wine
- wireshark
- colordiff
- appledoc
- git (the version in brew is much better then the XCode version)
- duply
- openvpn
- sshfs
- sloccount
- mmv
- git-cal
- mpv (needs extra repo)
- cmake
- curl
- ddate
- dos2unix
- figlet
- toilet
- fortune
- geoip
- hexedit
- jq (nice json parser)
- svg2png
- tcpflow
- tcpreplay
- mitmproxy
- class-dump
- arpoison
- pngquant
- mpv
- sntop
- sslscan
- fasd
- ag

### Other

- cocoapods
- homebrew
- copy over your ~/Library/Keychain

### Config files to copy

- .vim*
- .screenrc
- .mplayer
- .mpv
- .lldbinit
- .zsh*
- .oh-my-zsh
- .ssh
- .git*
- .ssh*
- Library/lldb
- Library/Services
- Library/Saved\ Searches
- Library/PDF\ Services
- other important folders:
  - Music, Movies, Pictures, Documents, Desktop
  - src, wichtig, script

### plist files and other hacks

```bash
#!/bin/bash

##
# defaults write
##

# iTerm2 testing
# defaults write com.googlecode.iterm2.plist SetCtype -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool FALSE

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.12

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool TRUE

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool TRUE

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
# defaults write com.apple.dock autohide-time-modifier -float 0

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"




##
# chflags
##

chflags nohidden ~/Library/


##
# power management
##

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0



killall Dock
killall Finder

# for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
# "Dock" "Finder" "Mail" "Messages" "Safari" "SizeUp" "SystemUIServer" \
# "Terminal" "Transmission" "Twitter" "iCal"; do
# killall "${app}" > /dev/null 2>&1



# sources:
# http://secrets.blacktree.com
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx
```

## Updated

- 2013 06 01: Some apps and plist tweaks added
- 2013 11 20: More homebrew stuff + lots of mac apps (mostly dev. stuff)
- 2014 02 14: More homebrew stuff
- 2014 08 06: More apps and plist
