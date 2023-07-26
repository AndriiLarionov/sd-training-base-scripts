#!/bin/bash

# Define the google-chrome executable path using 'which' command
CHROME_PATH=$(which google-chrome)

# Check if google-chrome is installed
if [ -z "$CHROME_PATH" ]; then
    echo "Error: google-chrome not found. Please install Google Chrome first or make sure it's in your system's \$PATH."
    exit 1
fi

# Desktop shortcut filename and path
SHORTCUT_FILENAME="google-chrome.desktop"
SHORTCUT_PATH="$HOME/Desktop/$SHORTCUT_FILENAME"

# Create the desktop shortcut file
cat <<EOF > "$SHORTCUT_PATH"
[Desktop Entry]
Name=Google Chrome
Comment=Open the Google Chrome
Exec=$CHROME_PATH %U
Icon=google-chrome
Terminal=false
Type=Application
Categories=Network;WebBrowser;
StartupNotify=true
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
EOF

# Make the shortcut file executable
chmod +x "$SHORTCUT_PATH"

echo "Google Chrome desktop shortcut created at: $SHORTCUT_PATH"