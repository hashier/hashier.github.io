---
title: "iOS Localization With iLocalize"
date: 2013-12-27T18:24:00
tags: [apple, development, i10n, i18n, iOS, osx]
categories: [computer]
---

I did it once before and now I have to do it again - and of course, I forgot how to do it.
This time I'll write it down how on way of localisation of an iOS project works.

I don't use nib files and all user facing strings are set in code with NSLocalizedStrings(...). If you are using nibs or need to translate strings in Storyboard and/or nib files, your approach might differ.

English is considered as the base language and Swedish as the translation.

## This is the workflow if you added new NSLocalizedString(...) in your code

1. Have your project with NSLocalizedString
1. run `genstrings -o en.lproj **/*.m` in the correct folder (zsh needed)
1. start iLocalize
1. "Project" -> "Update from files..." -> add the en.lproj/Localizable.strings -> "Update the project from a new version of these files"
1. click "Update"
1. translate

## This is the workflow if you updated the sv.lproj/Localizable.strings files

e.g., manually added them in vim or you had someone translate them for you.

It might be always good idea to update your Base language first so you can directly see after importing the Swedish Localizable.strings file which "Translation Keys" have changed and need updating or if the translator got everything.

1. In iLocalize on the top left you choose (for this example) Swedish
1. "Project" -> "Update from files..." -> select your sv.lproj/Localizable.strings file-> "Update a localised language from these files"
1. Make sure in the box Swedish is selected
1. Click "Update"
1. translate
