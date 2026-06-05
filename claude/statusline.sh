#!/bin/sh
# Claude Code statusline: cwd (with ~) + git branch, Nerd Font icons

cwd=$(pwd | sed "s|$HOME|~|")
branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)

ESC=$(printf '\033')
RESET="${ESC}[0m"
C_DIR="${ESC}[38;5;110m"
C_BR="${ESC}[38;5;175m"

ICON_DIR=$(printf '\xee\x97\xbe')   # U+E5FE
ICON_BR=$(printf '\xee\x82\xa0')    # U+E0A0

if [ -n "$branch" ]; then
  printf '%s%s %s%s  %s%s %s%s' "$C_DIR" "$ICON_DIR" "$cwd" "$RESET" "$C_BR" "$ICON_BR" "$branch" "$RESET"
else
  printf '%s%s %s%s' "$C_DIR" "$ICON_DIR" "$cwd" "$RESET"
fi
