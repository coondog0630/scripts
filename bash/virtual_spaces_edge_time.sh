#!/usr/bin/env bash
# Change the time on moving windows between virtual spaces
defaults write com.apple.dock workspaces-edge-delay -int 0; killall Dock
