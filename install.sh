#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0}); pwd)

PLIST_FILE=~/Library/LaunchAgents/com.nilswinkler.sleepwatcher-lync-status-20compatibility-localuser.plist

if [ -f $PLIST_FILE ]; then
  launchctl unload $PLIST_FILE
fi

launchctl remove "com.nilswinkler.sleepwatcher-lync-status"

ln -sfv $SCRIPT_DIR/com.nilswinkler.sleepwatcher-lync-status-20compatibility-localuser.plist ~/Library/LaunchAgents/

ln -s $SCRIPT_DIR/lync-store-away.sh ~/.sleepwatcher-dim
ln -s $SCRIPT_DIR/lync-restore-status.sh ~/.sleepwatcher-wakeup

launchctl load $PLIST_FILE
