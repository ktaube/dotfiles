1. Open up `about:support`
2. Get `Profile Folder` path
3. Link chrome to the profile folder `ln -s `pwd`/firefox/chrome/ /Users/ktaube/Library/Application\ Support/Firefox/Profiles/oxed8vh2.dev-edition-default/chrome`
4. [Run `userChrome.css` on startup](https://www.userchrome.org/how-create-userchrome-css.html#aboutconfig)
5. Toggle `toolkit.legacyUserProfileCustomizations.stylesheets=true` in `about:config`

