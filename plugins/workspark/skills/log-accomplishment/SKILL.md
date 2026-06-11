---
name: log-accomplishment
description: Log a work accomplishment in WorkSpark. Use when the user wants to record what they did, log an accomplishment or a win, capture work evidence, or journal their work — e.g. "log what I did today", "add an accomplishment", "record this win in WorkSpark".
---

# Log an Accomplishment

Turn a rough description of the user's work into a high-quality WorkSpark accomplishment entry and create it with the `ws` CLI.

## Prerequisites

- If `ws --version` fails or `ws auth whoami` shows no session, follow the Setup section of the workspark skill in this plugin (`../workspark/SKILL.md`).
- Read `../workspark/references/accomplishments.md` (relative to this skill's directory) for the quality rubric, STAR-Lite format, and the 9 work categories before drafting.

## Workflow

1. **Gather the raw material.** Ask what the user did, why it mattered, and what the outcome was. If they mention artifacts (a PR, a doc, a meeting), ask for the concrete result. Do not proceed on vague input — a "Too Brief" or "Unclear" entry is worse than no entry.
2. **Draft the entry** in STAR-Lite form (Situation/Task, Action, Result/Learning):
   - Use "I", not "we" — be specific about the user's own contribution.
   - Include at least one concrete outcome, number, or learning.
   - Suggest the best-fitting work category from the 9 categories in the reference.
   - Mark the draft clearly as a suggestion built only from what the user told you. Never invent details, metrics, or outcomes.
3. **Confirm before creating.** Entries are final on creation — there is no draft state. Present the full entry (title, content, category, date) and ask: "This is the final result. Are you happy with the content? Do you want to create this entry?" Only run the create command after explicit confirmation.
4. **Create it:**
   ```
   ws accomplishments create
   ```
   Pass the confirmed title, content, category, and entry date. Run `ws accomplishments create --help` to confirm flag names before the first use.
5. **Close the loop.** Show the created entry back to the user. If they have 5+ entries, mention they can see patterns with `ws accomplishments insights <member-id>`.

## Guardrails

- Never run `create` with content the user has not explicitly approved.
- Don't log task-list trivia ("emailed Bob") — push for the meaningful work behind it.
- If the user is logging several items at once, handle them one at a time, each with its own confirmation.
