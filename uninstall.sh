#!/bin/bash

launchctl unload ~/Library/LaunchAgents/com.nilswinkler.sleepwatcher-lync-status-20compatibility-localuser.plist

rm ~/Library/LaunchAgents/com.nilswinkler.sleepwatcher-lync-status-20compatibility-localuser.plist
rm ~/.sleepwatcher-dim
rm ~/.sleepwatcher-wakeup
