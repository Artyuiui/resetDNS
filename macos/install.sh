#!/usr/bin/env bash
set -e

SHELL_NAME="$(basename "$SHELL")"

if [[ "$SHELL_NAME" == "zsh" ]]; then
  RC="$HOME/.zshrc"
else
  RC="$HOME/.bashrc"
fi

LINE='alias resetDNS='\''sudo systemctl restart systemd-resolved && echo "✅ DNS cache reset (Linux)"'\'''

touch "$RC"

if grep -q "alias resetDNS=" "$RC"; then
  echo "ℹ️ resetDNS already exists in $RC"
else
  echo "" >> "$RC"
  echo "# resetDNS" >> "$RC"
  echo "$LINE" >> "$RC"
  echo "✅ Installed resetDNS into $RC"
fi

echo "➡️ Please run: source $RC"
