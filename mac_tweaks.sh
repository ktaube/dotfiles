
# Make the Dock instantly leap back into view when it’s needed
defaults write com.apple.dock autohide-time-modifier -float 0.15;killall Dock

# Disable useless dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock

# Increase key refresh rate
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
