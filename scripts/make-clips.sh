#!/bin/sh
# Cut vertical short clips from a long video with ffmpeg.
# Usage: ./make-clips.sh input.mp4 clips.csv [outdir]
# clips.csv format (no header, one clip per line):
#   clip-name,start,end
# Example:
#   invoice-trick,00:12:04,00:12:58
#   late-fees,00:24:10,00:25:02
# Output: outdir/clip-name.mp4 — 9:16, 1080x1920, H.264 + AAC, loudness -14 LUFS.
# Requires: ffmpeg. Does not upload or post anything.
set -e
INPUT="$1"; CSV="$2"; OUT="${3:-clips}"
if [ -z "$INPUT" ] || [ -z "$CSV" ]; then echo "Usage: $0 input.mp4 clips.csv [outdir]"; exit 1; fi
command -v ffmpeg >/dev/null || { echo "ffmpeg not found — install it first (brew install ffmpeg / apt install ffmpeg)"; exit 1; }
mkdir -p "$OUT"
while IFS=, read -r name start end; do
  [ -z "$name" ] && continue
  echo "Cutting $name ($start - $end)..."
  ffmpeg -y -loglevel error -ss "$start" -to "$end" -i "$INPUT" \
    -vf "crop=ih*9/16:ih,scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,format=yuv420p" \
    -c:v libx264 -preset medium -crf 20 -c:a aac -b:a 128k \
    -af "loudnorm=I=-14:TP=-1.5:LRA=11" \
    "$OUT/$name.mp4"
done < "$CSV"
echo "Done. Clips in $OUT/:"
ls -lh "$OUT"
