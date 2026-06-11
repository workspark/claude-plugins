---
name: okr-check-in
description: Run an OKR check-in in WorkSpark. Use when the user wants to update OKR progress, do a check-in, update key results or confidence, or review goal status — e.g. "check in on my OKRs", "update my key results", "my OKRs are stale".
---

# OKR Check-In

Walk the user through a WorkSpark OKR check-in: review current progress, capture updated key result values and confidence, and submit the check-in with the `ws` CLI.

## Prerequisites

- If `ws --version` fails or `ws auth whoami` shows no session, follow the Setup section of the workspark skill in this plugin (`../workspark/SKILL.md`).
- Read `../workspark/references/okrs.md` (relative to this skill's directory) for confidence levels, value rules, and stale-OKR guidance.

## Workflow

1. **Locate the OKRs.** Find the active cycle with `ws okrs cycles list` (use `--match` if the user names a period). List the user's OKRs with `ws okrs list <cycle-id>`. If the user has several OKRs, check each one — WorkSpark flags any OKR without a check-in in 7+ days as stale.
2. **Show current state.** For each OKR being checked in, fetch it (`ws okrs get <cycle-id> <okr-id>`) and the last check-in (`ws okrs check-ins list <cycle-id> <okr-id>`). Present key results with their start, current, and target values so the user updates from facts, not memory.
3. **Capture the update from the user.** For each key result, ask for the current value. Ask for the overall confidence level using the labels from the reference (On Track / At Risk / Off Track / Blocked — codes 10/20/30/40), and a short narrative note: what moved, what's blocking, what's next.
   - Never invent values or notes. Current values must come from the user or existing data.
   - Key result values are whole integers — no decimals.
   - If confidence is At Risk or worse, prompt for the blocker so the note is actionable.
4. **Confirm before submitting.** Check-ins are final on creation — they immediately update confidence and key result progress. Present the confidence level, each key result update, and the note, then ask: "This is the final result. Are you happy with the content? Do you want to submit this check-in or skip it?" Only proceed on explicit confirmation.
5. **Submit:**
   ```
   ws okrs check-ins create <cycle-id> <okr-id>
   ```
   Pass the confirmed values. Run `ws okrs check-ins create --help` to confirm flag names before the first use.
6. **Repeat** for the user's remaining OKRs, one at a time, each with its own confirmation.

## Guardrails

- Never auto-submit a check-in or guess key result values.
- Don't let the user game numbers silently — if a current value jumps implausibly (e.g. past the target with no explanation), ask once to confirm it's real.
- If no check-in is warranted (nothing changed), a check-in with an honest "no movement" note still beats staleness — suggest it, but let the user decide.
