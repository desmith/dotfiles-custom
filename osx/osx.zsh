#!/usr/bin/env zsh

# ~/.osx — http://mths.be/osx

computername='Devap'
localhostname='Devap'

# ask for the administrator password upfront
sudo -v

# keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# general ui/ux                                                               #
###############################################################################

# Reduce Transparency
#defaults write com.apple.universalaccess reduceTransparency -bool true

# Restore Default Transparency
defaults write com.apple.universalaccess reduceTransparency -bool false

# set computer name (as done via system preferences → sharing)
#sudo scutil --set computername $computername
#sudo scutil --set hostname $computername
#sudo scutil --set localhostname $localhostname
#sudo defaults write /library/preferences/systemconfiguration/com.apple.smb.server netbiosname -string $localhostname

# disable the sound effects on boot
sudo nvram systemaudiovolume=" "

# set standby delay to 24 hours (default is 1 hour)
#sudo pmset -a standbydelay 86400

# set standby delay to 1 hour
sudo pmset -a standbydelay 3600

# Menu bar: enable transparency
defaults write nsglobaldomain appleenablemenubartransparency -bool true

# Menu bar: show remaining battery time (on pre-10.8); hide percentage
defaults write com.apple.menuextra.battery showpercent -string "yes"
defaults write com.apple.menuextra.battery showtime -string "yes"

# set highlight color to green
defaults write nsglobaldomain applehighlightcolor -string "0.764700 0.976500 0.568600"

# highlight color: blue
defaults write nsglobaldomain applehighlightcolor -string "0.709800 0.835300 1.000000"

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# disable opening and closing window animations
defaults write nsglobaldomain nsautomaticwindowanimationsenabled -bool false

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
# defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Save to iCloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Disable Resume system-wide
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Fix for the ancient UTF-8 bug in QuickLook (http://mths.be/bbo)
# Commented out, as this is known to cause problems in various Adobe apps :(
# See https://github.com/mathiasbynens/dotfiles/issues/237
#echo "0x08000100:0" > ~/.CFUserTextEncoding

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Restart automatically if the computer freezes
systemsetup -setrestartfreeze on

# never go into computer sleep mode
#systemsetup -setcomputersleep off > /dev/null

# check for software updates daily, not just once per week
defaults write com.apple.softwareupdate schedulefrequency -int 1

# disable notification center and remove the menu bar icon
#launchctl unload -w /system/library/launchagents/com.apple.notificationcenterui.plist 2> /dev/null

# disable smart quotes as they’re annoying when typing code
defaults write nsglobaldomain nsautomaticquotesubstitutionenabled -bool false

# disable smart dashes as they’re annoying when typing code
defaults write nsglobaldomain nsautomaticdashsubstitutionenabled -bool false

# appearance: graphite
#defaults write -g appleaquacolorvariant -int 6

# set a custom wallpaper image. `defaultdesktop.jpg` is already a symlink, and
# all wallpapers are in `/library/desktop pictures/`. the default is `wave.jpg`.
#rm -rf ~/library/application support/dock/desktoppicture.db
#sudo rm -rf /system/library/coreservices/defaultdesktop.jpg
#sudo ln -s /path/to/your/image /system/library/coreservices/defaultdesktop.jpg

###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################

# Disable local Time Machine snapshots
sudo tmutil disablelocal

# Disable hibernation (speeds up entering sleep mode)
#sudo pmset -a hibernatemode 0

# Remove the sleep image file to save disk space
#sudo rm /Private/var/vm/sleepimage
# Create a zero-byte file instead…
#sudo touch /Private/var/vm/sleepimage
# …and make sure it can’t be rewritten
#sudo chflags uchg /Private/var/vm/sleepimage

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# trackpad: swipe between pages with three fingers
defaults write nsglobaldomain appleenableswipenavigatewithscrolls -bool true
defaults write nsglobaldomain com.apple.trackpad.threefingerhorizswipegesture -int 1
defaults write com.apple.driver.applebluetoothmultitouch.trackpad trackpadthreefingerhorizswipegesture -int 1

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# disable smooth scrolling
# (uncomment if you’re on an older mac that messes up the animation)
#defaults write nsglobaldomain nsscrollanimationenabled -bool false

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# enable access for assistive devices
echo -n 'a' | sudo tee /private/var/db/.accessibilityapienabled > /dev/null 2>&1
sudo chmod 444 /private/var/db/.accessibilityapienabled
# todo: avoid gui password prompt somehow (http://apple.stackexchange.com/q/60476/4408)
#sudo osascript -e 'tell application "system events" to set ui elements enabled to true'

# use scroll gesture with the ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeviewscrollwheeltoggle -bool true
defaults write com.apple.universalaccess hidscrollzoommodifiermask -int 262144
# follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeviewzoomfollowsfocus -bool true

# disable press-and-hold for keys in favor of key repeat
defaults write nsglobaldomain applepressandholdenabled -bool false

# set a blazingly fast keyboard repeat rate
defaults write nsglobaldomain keyrepeat -int 0

# don't illuminate built-in macbook keyboard in low light
defaults write com.apple.bezelservices kdim -bool false
# turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.bezelservices kdimtime -int 300

# set language and text formats
# note: if you’re in the us, replace `eur` with `usd`, `centimeters` with
# `inches`, and `true` with `false`.
defaults write nsglobaldomain applelanguages -array "en" "ru"
defaults write nsglobaldomain applelocale -string "en_us@currency=usd"
defaults write nsglobaldomain applemeasurementunits -string "inches"
defaults write nsglobaldomain applemetricunits -bool false

# set the timezone; see `systemsetup -listtimezones` for other values
systemsetup -settimezone "America/New_York" > /dev/null

# disable auto-correct
defaults write nsglobaldomain nsautomaticspellingcorrectionenabled -bool false

# stop itunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# finder: allow quitting via ⌘ + q; doing so will also hide desktop icons
defaults write com.apple.finder quitmenuitem -bool true

# finder: disable window animations and get info animations
defaults write com.apple.finder disableallanimations -bool true

# set desktop as the default location for new finder windows
# for other paths, use `pflo` and `file:///full/path/here/`
#defaults write com.apple.finder newwindowtarget -string "pfde"
#defaults write com.apple.finder newwindowtargetpath -string "file://${HOME}/desktop/"
defaults write com.apple.finder newwindowtarget -string "pflo"
defaults write com.apple.finder newwindowtargetpath -string "file://${HOME}/"

# show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder showexternalharddrivesondesktop -bool true
defaults write com.apple.finder showharddrivesondesktop -bool true
defaults write com.apple.finder showmountedserversondesktop -bool true
defaults write com.apple.finder showremovablemediaondesktop -bool true

# finder: show hidden files by default
#defaults write com.apple.finder appleshowallfiles -bool true
defaults write com.apple.finder AppleShowAllFiles YES

# By default when you get to the top of a page and you keep scrolling
# you see the linen background. This disables it.
defaults write -g NSScrollViewRubberbanding -bool FALSE

# finder: show all filename extensions
defaults write nsglobaldomain appleshowallextensions -bool true

# finder: show status bar
defaults write com.apple.finder showstatusbar -bool true

# finder: show path bar
defaults write com.apple.finder showpathbar -boolean true

# finder: allow text selection in quick look
defaults write com.apple.finder qlenabletextselection -bool true

# display full posix path as finder window title
defaults write com.apple.finder _fxshowposixpathintitle -bool true

# when performing a search, search the current folder by default
defaults write com.apple.finder fxdefaultsearchscope -string "sccf"

# disable the warning when changing a file extension
defaults write com.apple.finder fxenableextensionchangewarning -bool false

# enable spring loading for directories
defaults write nsglobaldomain com.apple.springing.enabled -bool true

# remove the spring loading delay for directories
defaults write nsglobaldomain com.apple.springing.delay -float 0

# avoid creating .ds_store files on network volumes
defaults write com.apple.desktopservices dsdontwritenetworkstores -bool true

# Avoids creation of .DS_Store and AppleDouble files.
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# automatically open a new finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder openwindowfornewremovabledisk -bool true

# use list view in all finder windows by default
# four-letter codes for the other view modes: `icnv`, `clmv`, `flwv`
defaults write com.apple.finder fxpreferredviewstyle -string "nlsv"

# disable the warning before emptying the trash
defaults write com.apple.finder warnonemptytrash -bool false

# empty trash securely by default
defaults write com.apple.finder emptytrashsecurely -bool true

# enable airdrop over ethernet and on unsupported macs running lion
defaults write com.apple.networkbrowser browseallinterfaces -bool true

# finder: disable sounds
defaults write com.apple.finder findersounds -boolean false

# enable the macbook air superdrive on any mac
#sudo nvram boot-args="mbasd=1"

# show the ~/library folder
chflags nohidden ~/library

# remove dropbox’s green checkmark icons in finder
#file=/applications/dropbox.app/contents/resources/check.icns
#[ -e "$file" ] && mv -f "$file" "$file.bak"
#unset file

# expand the following file info panes:
# “general”, “open with”, and “sharing & permissions”
defaults write com.apple.finder fxinfopanesexpanded -dict \
	general -bool true \
	openwith -bool true \
	privileges -bool true


###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# set the icon size of dock items to 60 pixels
#defaults write com.apple.dock tilesize -int 60

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
#defaults write com.apple.dock persistent-apps -array ""

# Add a Stack with Recent Applications
defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }'

# don’t animate opening applications from the dock
defaults write com.apple.dock launchanim -bool false

# speed up mission control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# group windows by application in mission control
defaults write com.apple.dock expose-group-by-app -bool true

# disable dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# don’t show dashboard as a space
defaults write com.apple.dock dashboard-in-overlay -bool true

# enable the 2d dock
defaults write com.apple.dock no-glass -bool true

# automatically hide and show the dock
defaults write com.apple.dock autohide -bool true

# remove the delay when showing and hiding the dock
defaults write com.apple.dock autohide-delay -float 0

# remove the animation when hiding/showing the dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Show Hidden App Icons
# make dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# make dock more transparent
defaults write com.apple.dock hide-mirror -bool true

# enable icon bouncing
defaults write com.apple.dock no-bouncing -bool false

# don’t automatically rearrange spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# enable space switching on command-tab
defaults write com.apple.dock workspaces-auto-swoosh -bool true

# show only active applications
#defaults write com.apple.dock static-only -bool true

# disable the launchpad gesture (pinch with thumb and three fingers)
#defaults write com.apple.dock showlaunchpadgestureenabled -int 0


#ln -s /applications/xcode.app/contents/applications/iphone\ simulator.app /applications/ios\ simulator.app

# add a spacer to the left side of the dock (where the applications are)
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

# add a spacer to the right side of the dock (where the trash is)
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

# hot corners
# possible values:
#  0: no-op
#  2: mission control
#  3: show application windows
#  4: desktop
#  5: start screen saver
#  6: disable screen saver
#  7: dashboard
# 10: put display to sleep
# 11: launchpad
# 12: notification center
# top left screen corner → mission control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# top right screen corner → desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0
# bottom left screen corner → start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Add iOS Simulator to Launchpad
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone Simulator.app" "/Applications/iOS Simulator.app"

###############################################################################
# misc                                                                        #
###############################################################################

# check spelling as you type
defaults write -g checkspellingwhiletyping -boolean true

# enable continuous spell checking everywhere (don't know what it means)
defaults write -g webcontinuousspellcheckingenabled -boolean true

###############################################################################
# Finder,  Files and Folders
###############################################################################

# Show All File Extensions
defaults write -g AppleShowAllExtensions -bool true

# Show Hidden Files

# Show All
defaults write com.apple.finder AppleShowAllFiles true

# Restore Default File Visibility
defaults write com.apple.finder AppleShowAllFiles false

# Show Full Path in Finder Title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Unhide User Library Folder
chflags nohidden ~/Library

# Increase Number of Recent Places
defaults write -g NSNavRecentPlacesLimit -int 10

#Show "Quit Finder" Menu Item
# Makes possible to see Finder menu item "Quit Finder" with default shortcut Cmd + Q

# Enable
defaults write com.apple.finder QuitMenuItem -bool true


###############################################################################
# spotlight                                                                   #
###############################################################################
# hide spotlight tray-icon (and subsequent helper)
#sudo chmod 600 /system/library/coreservices/search.bundle/contents/macos/search
# disable spotlight indexing for any volume that gets mounted and has not yet
# been indexed before.
# use `sudo mdutil -i off "/volumes/foo"` to stop indexing any volume.
sudo defaults write /.spotlight-v100/volumeconfiguration exclusions -array "/Volumes"
# change indexing order and disable some search results
# yosemite-specific search results (remove them if you are using macos 10.9 or older):
#   menu_definition
#   menu_conversion
#   menu_expression
#   menu_spotlight_suggestions (send search queries to apple)
#   menu_websearch             (send search queries to apple)
#   menu_other
defaults write com.apple.spotlight ordereditems -array \
	'{"enabled" = 1;"name" = "applications";}' \
	'{"enabled" = 1;"name" = "system_prefs";}' \
	'{"enabled" = 1;"name" = "directories";}' \
	'{"enabled" = 1;"name" = "pdf";}' \
	'{"enabled" = 1;"name" = "fonts";}' \
	'{"enabled" = 0;"name" = "documents";}' \
	'{"enabled" = 0;"name" = "messages";}' \
	'{"enabled" = 0;"name" = "contact";}' \
	'{"enabled" = 0;"name" = "event_todo";}' \
	'{"enabled" = 0;"name" = "images";}' \
	'{"enabled" = 0;"name" = "bookmarks";}' \
	'{"enabled" = 0;"name" = "music";}' \
	'{"enabled" = 0;"name" = "movies";}' \
	'{"enabled" = 0;"name" = "presentations";}' \
	'{"enabled" = 0;"name" = "spreadsheets";}' \
	'{"enabled" = 0;"name" = "source";}' \
	'{"enabled" = 0;"name" = "menu_definition";}' \
	'{"enabled" = 0;"name" = "menu_other";}' \
	'{"enabled" = 0;"name" = "menu_conversion";}' \
	'{"enabled" = 0;"name" = "menu_expression";}' \
	'{"enabled" = 0;"name" = "menu_websearch";}' \
	'{"enabled" = 0;"name" = "menu_spotlight_suggestions";}'
# load new settings before rebuilding the index
killall mds > /dev/null 2>&1
# make sure indexing is enabled for the main volume
sudo mdutil -i on / > /dev/null
# rebuild the index from scratch
sudo mdutil -E / > /dev/null

# disable spotlight menu keyboard shortcut: none
#/usr/libexec/plistbuddy "${HOME}/library/preferences/com.apple.symbolichotkeys.plist" -c 'delete applesymbolichotkeys:64' > /dev/null 2>&1
#/usr/libexec/plistbuddy "${HOME}/library/preferences/com.apple.symbolichotkeys.plist" -c 'add applesymbolichotkeys:64:enabled bool false'
# enable spotlight menu keyboard shortcut:
/usr/libexec/plistbuddy "${HOME}/library/preferences/com.apple.symbolichotkeys.plist" -c 'add applesymbolichotkeys:64:enabled bool true'

# spotlight window keyboard shortcut: none
#/usr/libexec/plistbuddy "${HOME}/library/preferences/com.apple.symbolichotkeys.plist" -c 'delete applesymbolichotkeys:65' > /dev/null 2>&1
#/usr/libexec/plistbuddy "${HOME}/library/preferences/com.apple.symbolichotkeys.plist" -c 'add applesymbolichotkeys:65:enabled bool false'

# remove spotlight from menu bar
#sudo chmod 600 /system/library/coreservices/search.bundle/contents/macos/search


###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Hide Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


###############################################################################
# iTunes                                                                      #
###############################################################################

# disable the itunes store link arrows
defaults write com.apple.itunes show-store-link-arrows -bool false

# disable the genius sidebar in itunes
defaults write com.apple.itunes disablegeniussidebar -bool true

# disable the ping sidebar in itunes
defaults write com.apple.itunes disablepingsidebar -bool true

# disable all the other ping stuff in itunes
defaults write com.apple.itunes disableping -bool true

# disable radio stations in itunes
defaults write com.apple.itunes disableradio -bool true

# make ⌘ + f focus the search input in itunes
# to use these commands in another language, browse itunes’s package contents,
# open `contents/resources/your-language.lproj/localizable.strings`, and look
# for `khiddenmenuitemtargetsearch`.
defaults write com.apple.itunes nsuserkeyequivalents -dict-add "target search field" "@f"

###############################################################################
# Terminal & iterm 2                                                          #
###############################################################################

# only use utf-8 in terminal.app
defaults write com.apple.terminal stringencodings -array 4

# use a modified version of the solarized dark theme by default in terminal.app
#term_profile='solarized dark xterm-256color';
#current_profile="$(defaults read com.apple.terminal 'default window settings')";
#if [ "${current_profile}" != "${term_profile}" ]; then
#	open "${HOME}/init/${term_profile}.terminal";
#	sleep 1; # wait a bit to make sure the theme is loaded
#	defaults write com.apple.terminal 'default window settings' -string "${term_profile}";
#	defaults write com.apple.terminal 'startup window settings' -string "${term_profile}";
#fi;

# enable “focus follows mouse” for terminal.app and all x11 apps
# i.e. hover over a window and start typing in it without clicking first
defaults write com.apple.terminal focusfollowsmouse -bool true
defaults write org.x.x11 wm_ffm -bool true

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false


###############################################################################
# Photos                                                                      #
###############################################################################
# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Mail                                                                        #
###############################################################################

# Disable send and reply animations in Mail.app
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

# Display emails in threaded mode, sorted by date (oldest at the top)
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# Disable automatic spell checking
defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

# Enable the debug menu in Address Book
defaults write com.apple.addressbook ABShowDebugMenu -bool true

# Enable Dashboard dev mode (allows keeping widgets on the desktop)
defaults write com.apple.dashboard devmode -bool true

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Enable the debug menu in iCal (pre-10.8)
defaults write com.apple.iCal IncludeDebugMenu -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

# Allow installing user scripts via GitHub or GitHub Gist or Userscripts.org
defaults write com.google.Chrome ExtensionInstallSources -array "https://*.github.com/*" "https://gist.githubusercontent.com/" "http://userscripts.org/*"
defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://*.github.com/*" "https://gist.githubusercontent.com/" "http://userscripts.org/*"


# Disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false
# Disable the all too sensitive backswipe on Magic Mouse
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false
# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true
# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true

###############################################################################
# Mac App Store                                                               #
###############################################################################

# Enable the WebKit Developer Tools in the Mac App Store
# Enable Develop Menu and Web Inspector
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write -g WebKitDeveloperExtras -bool true
defaults write -g com.apple.appstore WebKitDeveloperExtras -bool true
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
defaults write -g com.apple.appstore ShowDebugMenu -bool true


###############################################################################
# Messages                                                                    #
###############################################################################

# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

###############################################################################
# GPGMail 2                                                                   #
###############################################################################

# Disable signing emails by default
defaults write ~/Library/Preferences/org.gpgtools.gpgmail SignNewEmailsByDefault -bool false

###############################################################################
# Opera & Opera Developer                                                     #
###############################################################################
# Expand the print dialog by default
defaults write com.operasoftware.Opera PMPrintingExpandedStateForPrint2 -boolean true
defaults write com.operasoftware.OperaDeveloper PMPrintingExpandedStateForPrint2 -boolean true

###############################################################################
# Tweetbot.app                                                                #
###############################################################################
# Bypass the annoyingly slow t.co URL shortener
defaults write com.tapbots.TweetbotMac OpenURLsDirectly -bool true

###############################################################################
# SizeUp.app                                                                  #
###############################################################################

# Start SizeUp at login
defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true

# Don’t show the preferences window on next start
defaults write com.irradiatedsoftware.SizeUp ShowPrefsOnNextStart -bool false

###############################################################################
# Sublime Text                                                                #
###############################################################################

# Install Sublime Text settings
cp -r init/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null

###############################################################################
# Transmission.app                                                            #
###############################################################################

# Use `~/Documents/Torrents` to store incomplete downloads
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"

# Don’t prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

###############################################################################
# Power                                                                       #
###############################################################################

# Battery

# Computer sleep: 10 min
sudo pmset -b sleep 10

# Display sleep: 5 min
sudo pmset -b displaysleep 5

# Put the hard disk(s) to sleep when possible: 10 min
sudo pmset -b disksleep 10

# Slightly dim the display when using this power source
sudo pmset -b lessbright 1

# Automatically reduce brightness before display goes to sleep
sudo pmset -b halfdim 1

# Restart automatically if the computer freezes
sudo pmset -b panicrestart 15

# Power Adapter

# Computer sleep: 30 min
sudo pmset -c sleep 30

# Display sleep: 10 min
sudo pmset -c displaysleep 10

# Put the hard disk(s) to sleep when possible: 10 min
sudo pmset -c disksleep 10

# Wake for network access
sudo pmset -c womp 0

# Automatically reduce brightness before display goes to sleep
sudo pmset -c halfdim 1

# Start up automatically after a power failure
sudo pmset -c autorestart 1

# Restart automatically if the computer freezes
sudo pmset -c panicrestart 15


###############################################################################
# Twitter.app                                                                 #
###############################################################################

# Disable smart quotes as it’s annoying for code tweets
defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false

# Show the app window when clicking the menu bar icon
defaults write com.twitter.twitter-mac MenuItemBehavior -int 1

# Enable the hidden ‘Develop’ menu
defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true

# Open links in the background
defaults write com.twitter.twitter-mac openLinksInBackground -bool true

# Allow closing the ‘new tweet’ window by pressing `Esc`
defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true

# Show full names rather than Twitter handles
defaults write com.twitter.twitter-mac ShowFullNames -bool true

# Hide the app in the background if it’s not the front-most window
defaults write com.twitter.twitter-mac HideInBackground -bool true


###############################################################################
# Kill affected applications                                                  #
###############################################################################
for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome Canary" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Opera" \
	"Photos" \
	"Safari" \
	"SizeUp" \
	"Spectacle" \
	"SystemUIServer" \
	"Terminal" \
	"Transmission" \
	"Tweetbot" \
	"Twitter" \
	"iCal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
