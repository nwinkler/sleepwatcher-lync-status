#!/bin/bash

STATUSFILE=$TMPDIR/sleepwatcher-lync-status.txt

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

  -- Set your status to the provided parameter
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

function _lync-store-status() {
  osascript 2>/dev/null <<EOF
  -- Save your current application
  tell application "System Events"
    set currentApp to name of 1st process whose frontmost is true
  end tell

  -- Bring Lync to the front so we can use the menu
  tell application "Microsoft Lync"
    activate
  end tell

  -- Store the status
  tell application "System Events"
    tell process "Microsoft Lync"
      set statusMenu to menu bar item "Status" of menu bar 1
      set allUiElements to entire contents of statusMenu

      repeat with anElement in allUiElements
        try
          set checked to value of attribute "AXMenuItemMarkChar" of anElement

          if checked is "✓" then
            log checked

            set menuItemName to name of anElement

            log menuItemName

            do shell script "echo " & quoted form of menuItemName & " > $STATUSFILE"

            exit repeat
          end if
        end try
      end repeat
    end tell
  end tell

  -- Return to your previous application
  tell application currentApp
    activate
  end tell
EOF
}

function _lync-restore-status() {
  local status="Reset Status"

  if [ -f "$STATUSFILE" ]; then
    status=$(cat $STATUSFILE)

    rm $STATUSFILE
  fi

  _lync-status "$status"
}
