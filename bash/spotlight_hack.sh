#!/usr/bin/env bash

# NOTE: run as root

# turn off spotlight
cat "SPOTLIGHT=-NO-" >> /etc/hostconfig

# disable indexing
mdutil -i off /

# erase current index
mdutil -E /

mv /System/Library/LaunchAgents/com.apple.Spotlight.plist /System/Library/LaunchAgents/com.apple.Spotlight.plist.bk
mv /System/Library/LaunchDaemons/com.apple.metadata.mds.plist /System/Library/LaunchDaemons/com.apple.metadata.mds.plist.bk