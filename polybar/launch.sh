#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Detect wireless interface for Polybar (portable across distros)
# Prefer ip -br link, fallback to iw
if command -v ip >/dev/null; then
  POLYBAR_WLAN=$(ip -br link 2>/dev/null | awk '$1 ~ /^wl/ {print $1; exit}')
fi
if [ -z "$POLYBAR_WLAN" ] && command -v iw >/dev/null; then
  POLYBAR_WLAN=$(iw dev 2>/dev/null | awk '/Interface/ {print $2; exit}')
fi
export POLYBAR_WLAN

# Launch polybar
polybar example &
