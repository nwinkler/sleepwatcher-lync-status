#!/bin/bash

PLIST_FILE=~/Library/LaunchAgents/com.nilswinkler.sleepwatcher-lync-status-20compatibility-localuser.plist

if [ -f $PLIST_FILE ]; then
  launchctl unload $PLIST_FILE

  rm $PLIST_FILE
fi

launchctl remove "com.nilswinkler.sleepwatcher-lync-status"

rm -f ~/.sleepwatcher-dim
rm -f ~/.sleepwatcher-wakeup
