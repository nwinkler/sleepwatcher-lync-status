#!/bin/bash

function _lync-status() {
  osascript 2>/dev/null <<EOF
  -- Save your current application
  tell application "System Events"
    set currentApp to name of 1st process whose frontmost is true
  end tell

  -- Bring Lync to the front so we can use the menu
  tell application "Microsoft Lync"
    activate
  end tell

  -- Set your status to 'Available'
  tell application "System Events"
    tell process "Microsoft Lync"
      tell menu bar 1
        tell menu bar item "Status"
          tell menu "Status"
            click menu item "$1"
          end tell
        end tell
      end tell
    end tell
  end tell

  -- Return to your previous application
  tell application currentApp
    activate
  end tell
EOF
}
