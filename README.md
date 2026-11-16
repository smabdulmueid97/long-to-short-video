<div align="center">

# long-to-short-video

**One long video → 5–10 standalone shorts.**

Turn a long video into short vertical clips for **YouTube Shorts, Instagram Reels, Facebook Reels, TikTok, Bilibili, LinkedIn, and X**. Each clip must make sense with no context from the long video.

[![License: MIT](https://img.shields.io/github/license/smabdulmueid97/long-to-short-video?style=flat-square)](https://github.com/smabdulmueid97/long-to-short-video/blob/main/LICENSE)
[![Stars](https://img.shields.io/github/stars/smabdulmueid97/long-to-short-video?style=flat-square)](https://github.com/smabdulmueid97/long-to-short-video/stargazers)
[![Last commit](https://img.shields.io/github/last-commit/smabdulmueid97/long-to-short-video?style=flat-square)](https://github.com/smabdulmueid97/long-to-short-video/commits/main)

**[▶ Live demo](https://smabdulmueid97.github.io/long-to-short-video/)**

</div>

---

## What it does

- **Finds the best moments** in a long video and writes hooks + captions for each.
- **Shows you a clip plan to approve before cutting** — cutting is the expensive part.
- **Cuts with ffmpeg** — 9:16, 1080×1920, loudness normalised to −14 LUFS.
- **One idea per clip** — if it needs "as I said earlier", it's not a clip.

## The rules of a good clip

1. **One idea per clip.** If it needs "as I said earlier", it's not a clip.
2. **Hook in the first 2 seconds.** A question, a bold claim, or a result.
3. **Length: 30–60 seconds is the sweet spot, 90 seconds max** for a universal clip. Ceilings (checked Oct–Nov 2026): Shorts ≤3 min, Reels recommended ≤3 min to new audiences, X free ≤2:20, LinkedIn 30–120 s best, Bilibili vertical 3–15 min sweet spot.
4. **Captions burned in.** Most people watch muted. Big, high-contrast, centred, inside the safe zone.
5. **Vertical first.** Master export: 9:16, 1080×1920, H.264 MP4 + AAC, 30 fps.

## Install — 30 seconds

```bash
git clone https://github.com/smabdulmueid97/long-to-short-video.git
./install.sh
# copies this skill to ~/.claude/skills/long-to-short-video/
```

Or manually: copy `SKILL.md` to `~/.claude/skills/long-to-short-video/SKILL.md`.

Requires only `ffmpeg` for cutting: `brew install ffmpeg` / `apt install ffmpeg`.

## Use it

```
turn this 40-minute tutorial into 5 shorts for Shorts, Reels and TikTok
```

## Cut with ffmpeg

```bash
./scripts/make-clips.sh input.mp4 clips.csv
# clips.csv: clip-name,start,end  (one per line, e.g. invoice-trick,00:12:04,00:12:58)
```

Outputs 9:16, 1080×1920 clips, loudness normalised to −14 LUFS. See `templates/clip-plan.md` for the plan format.

## Rules

- This skill plans and cuts from a video **you** provide. It does not generate video.
- No clip that only makes sense inside the long video.
- No posting the clips itself — hand over the files + the post pack.
- No copyrighted music from one platform's library on another platform.

## Layout

```
SKILL.md                     # the skill
templates/clip-plan.md       # clip plan format
scripts/make-clips.sh        # ffmpeg cutter, clips.csv in, 9:16 clips out
install.sh                   # copies the skill to ~/.claude/skills/
```

## Related repos

- [social-media-posting](https://github.com/smabdulmueid97/social-media-posting) — one idea into posts for YouTube, Instagram, Facebook, TikTok, Bilibili, LinkedIn, and X
- [freelancer-skills](https://github.com/smabdulmueid97/freelancer-skills) — Claude Code skills for the money work: invoice, quote, expenses, follow-ups

## License

MIT
