#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0}); pwd)

launchctl unload ~/Library/LaunchAgents/com.nilswinkler.sleepwatcher-lync-status-20compatibility-localuser.plist

ln -sfv $SCRIPT_DIR/com.nilswinkler.sleepwatcher-lync-status-20compatibility-localuser.plist ~/Library/LaunchAgents/

ln -s $SCRIPT_DIR/lync-store-away.sh ~/.sleepwatcher-dim
ln -s $SCRIPT_DIR/lync-restore-status.sh ~/.sleepwatcher-wakeup

launchctl load ~/Library/LaunchAgents/com.nilswinkler.sleepwatcher-lync-status-20compatibility-localuser.plist
