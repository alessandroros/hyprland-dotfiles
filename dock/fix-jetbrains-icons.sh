#!/usr/bin/env bash
# JetBrains Toolbox names each app's icon/.desktop file with a random UUID
# that's unique per machine/install, so it never matches the stable window
# class (e.g. jetbrains-idea) the dock/window-rules use for matching.
# This symlinks the current UUID icon under a stable name.
set -euo pipefail

icons_dir="$HOME/.local/share/icons/hicolor/scalable/apps"

for app in idea webstorm rider datagrip; do
  src=$(find "$icons_dir" -maxdepth 1 -iname "jetbrains-${app}-*.svg" 2>/dev/null | head -n1)
  if [ -n "$src" ]; then
    ln -sf "$(basename "$src")" "$icons_dir/jetbrains-${app}.svg"
    echo "Linked jetbrains-${app}.svg -> $(basename "$src")"
  else
    echo "No installed icon found for jetbrains-${app}, skipping" >&2
  fi
done

command -v gtk-update-icon-cache >/dev/null && gtk-update-icon-cache -f -t "$icons_dir" || true
