#!/bin/bash

# Define the chromium-browser executable path using 'which' command
CHROMIUM_PATH=$(which chromium-browser)

# Check if chromium-browser is installed
if [ -z "$CHROMIUM_PATH" ]; then
    echo "Error: chromium-browser not found. Please install Chromium first or make sure it's in your system's \$PATH."
    exit 1
fi

# Desktop shortcut filename and path
SHORTCUT_FILENAME="chromium-browser.desktop"
SHORTCUT_PATH="~/Desktop/$SHORTCUT_FILENAME"

DESKTOP_PATH=~/Desktop

if [ ! -d "$DESKTOP_PATH" ]; then
    mkdir -p "$DESKTOP_PATH"
    echo "Desktop directory created."
else
    echo "Desktop directory already exists."
fi

# Create the desktop shortcut file
cat <<EOF > "$SHORTCUT_PATH"
[Desktop Entry]
Name=Chromium Browser
Comment=Open the Chromium web browser
Exec=$CHROMIUM_PATH %U
Icon=chromium-browser
Terminal=false
Type=Application
Categories=Network;WebBrowser;
StartupNotify=true
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
EOF

# Make the shortcut file executable
chmod +x "$SHORTCUT_PATH"

echo "Chromium Browser desktop shortcut created at: $SHORTCUT_PATH"