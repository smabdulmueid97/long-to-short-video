#!/bin/sh
# Install long-to-short-video skill into Claude Code
set -e
DEST="$HOME/.claude/skills/long-to-short-video"
mkdir -p "$DEST"
cp "$(dirname "$0")/SKILL.md" "$DEST/SKILL.md"
mkdir -p "$DEST/templates" "$DEST/scripts"
cp "$(dirname "$0")/templates/clip-plan.md" "$DEST/templates/clip-plan.md" 2>/dev/null || true
cp "$(dirname "$0")/scripts/make-clips.sh" "$DEST/scripts/make-clips.sh" 2>/dev/null || true
echo "Installed long-to-short-video to $DEST"
echo "Try in Claude Code: turn this 40-minute tutorial into 5 shorts for Shorts, Reels and TikTok"
