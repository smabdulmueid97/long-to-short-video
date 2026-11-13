---
name: long-to-short-video
description: Turn one long video into short vertical clips for YouTube Shorts, Instagram Reels, Facebook Reels, TikTok, Bilibili, LinkedIn, and X. Use when the user asks to cut, clip, repurpose, or make shorts/reels from a long video, podcast, tutorial, or stream. Finds the best moments, writes hooks and captions, and exports with ffmpeg.
---

# Long to Short Video

One long video → 5–10 standalone shorts. Each clip must make sense with no context from the long video.

## Before you cut

Ask for (or confirm) in one short question if missing:
- The long video file or link, and its length / topic
- How many clips? Default: 5
- Target platforms? Default: Shorts + Reels + TikTok. Add LinkedIn / X / Bilibili only if asked — they need different cuts (see below).
- Language of captions? Default: the video's language.

## The rules of a good clip

1. **One idea per clip.** If it needs "as I said earlier", it's not a clip.
2. **Hook in the first 2 seconds.** A question, a bold claim, or a result — not "hi, welcome back".
3. **Length: 30–60 seconds is the sweet spot, 90 seconds max for a universal clip.** Hard ceilings (checked Oct–Nov 2026): YouTube Shorts ≤3 min, Instagram Reels recommended ≤3 min to new audiences, TikTok up to 60 min uploaded but clips should stay short, X free ≤2 min 20 s, LinkedIn ≤15 min but 30–120 s performs best, Bilibili vertical clips 3–15 min sweet spot.
4. **Start and end clean.** Cut on a complete sentence. End with a payoff, a CTA, or a loop back to the hook — never mid-word.
5. **Captions burned in.** Most people watch muted. Big, high-contrast, centred, 2–3 words per line, inside the safe zone (keep text away from the top 15% and bottom 20% — that's where platform UI sits).
6. **Vertical first.** Master export: 9:16, 1080×1920, H.264 MP4 + AAC, 30 fps. Crop the speaker to centre; don't just shrink a 16:9 frame with black bars.

## Steps

1. **Find moments.** From the transcript / chapters / timestamps, list candidate moments with start–end times and a 1-line reason each. Rank them: strongest hook first. Pick the top 5 (or the number asked for).
2. **Write the clip plan** using `templates/clip-plan.md`: for each clip — title, hook (first line spoken), start–end, why it works standalone, caption text, hashtags per platform.
3. **Cut.** Use `scripts/make-clips.sh` (ffmpeg) with a `clips.csv` — see the script for the format. It crops to 9:16, scales to 1080×1920, and normalises loudness to −14 LUFS. Verify each output: correct length, audio present, speaker centred, no black bars.
4. **Caption + title each clip.** Title ≤100 chars for YouTube, ≤80 chars for Bilibili, ≤280 chars total post for X. One CTA per clip, same link everywhere.
5. **Platform cuts.** One master clip does not fit everywhere:
   - **Shorts / Reels / TikTok / Facebook:** the master 9:16 clip, ≤90 s.
   - **X (free):** cut to ≤2:20, H.264, ≤512 MB.
   - **LinkedIn:** 30–120 s, 4:5 (1080×1350) or 9:16, professional hook — cut the joke, keep the lesson.
   - **Bilibili:** vertical 9:16 works, but add a Chinese title + tags if the audience is Chinese, and a cover frame.
6. **Show the plan before cutting.** The user approves the moments + hooks first. Cutting is the expensive part — don't cut 10 clips to find out they wanted 3.

## Clip plan template

```markdown
## Clip 1 — "The 2-minute invoice trick"
- Source: 12:04–12:58 (54 s)
- Hook (first 2 s): "You are losing $400 a month to late invoices."
- Why standalone: complete tip, no setup needed
- Caption: …
- Platforms: Shorts, Reels, TikTok, X (54 s, fits free X)
```

## Don't

- Don't generate video, and don't claim to. This skill plans and cuts from a video the user provides.
- Don't cut a clip that only makes sense inside the long video.
- Don't burn in captions that cover the speaker's face.
- Don't upscale a 720p source to 1080p and call it HD — note the source quality.
- Don't post the clips yourself. Hand over the files + the post pack (use the `social-media-posting` skill for captions per platform).
- Don't use copyrighted music from one platform's library on another platform — a Short with a claimed song can be blocked.
