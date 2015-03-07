#!/bin/bash

UUID=$(cat /proc/sys/kernel/random/uuid)
spacerapp="$HOME/.local/share/applications/spacer-$UUID.desktop"
spacerDockItem="$HOME/.config/plank/dock1/launchers/spacer-$UUID.dockitem"

echo "Make new spacer app..."
if [ ! -f "$HOME/.icons/blank.png"]; then
    echo "Copying blank.png to $HOME/.icons/"
    mkdir -p "$HOME/.icons/"
    cp "./blank.png" "$HOME/.icons/"
fi

echo "Creating new spacer.desktop file"
cat <<EOF > $spacerapp
[Desktop Entry]
Version=1.0
Type=Application
Name=Space
Exec=nothing
Icon=$HOME/.icons/blank.png
NoDisplay=true
EOF

cat <<EOF > $spacerDockItem
[PlankItemsDockItemPreferences]
Launcher=file://$HOME/.local/share/applications/spacer-$UUID.desktop
EOF

echo "New spacer dock item created with name \"spacer-$UUID\""