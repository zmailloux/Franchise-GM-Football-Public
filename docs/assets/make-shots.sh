#!/usr/bin/env bash
# Build the Field Guide's screenshot assets from the App Store captures.
#
#   ./make-shots.sh          -> docs/guide/assets/shots/<name>.jpg
#
# Both guide sites compile to ONE self-contained HTML file with every asset
# base64-inlined, so captures cannot ship at their native 1320x2868. They are
# downscaled to 660px wide and JPEG-encoded (~40KB each, ~55KB inlined), which
# keeps a fully illustrated guide near 1.5MB and still reads on a laptop.
#
# Add a row to SHOTS, run this, then point a page's screenshot callout at the
# name with `image: <name>.jpg`.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$DIR/../../.." && pwd)"
SRC="$ROOT/appstore-screenshots/iphone-6.9"
OUT="$DIR/shots"
WIDTH=660
QUALITY=72

# <output name>:<source capture, without .png>
SHOTS=(
  "player-card:11-player-card-skills"
  "player-contract:12-player-contract"
  "player-stats:13-player-game-log"
  "archetype-card:42-archetype-card"
  "roster:07-roster"
  "depth-chart:08-lineup-formation"
  "practice-squad:37-practice-squad"
  "scheme:15-team-scheme"
  "free-agents:16-free-agents"
  "trade-center:18-trade-builder"
  "draft-board:38-draft-scouting"
  "mock-draft:33-mock-draft"
  "staff:14-coaching-staff"
  "league-news:25-league-news"
  "live-game:28-live-game-sim"
  "week-results:31-week-results"
)

mkdir -p "$OUT"
total=0
for row in "${SHOTS[@]}"; do
  name="${row%%:*}"
  src="$SRC/${row#*:}.png"
  [ -f "$src" ] || { echo "missing source: $src" >&2; exit 1; }
  sips -Z "$WIDTH" -s format jpeg -s formatOptions "$QUALITY" "$src" \
    --out "$OUT/$name.jpg" >/dev/null
  total=$((total + $(stat -f%z "$OUT/$name.jpg")))
  echo "$name.jpg"
done

echo "built ${#SHOTS[@]} shot(s), $((total / 1024)) KB total -> assets/shots/"
