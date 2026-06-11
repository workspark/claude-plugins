---
name: self-review
description: Draft a self-review in WorkSpark from real evidence. Use when the user needs to write or prepare their self-review, self-assessment, or performance review answers — e.g. "help me write my self-review", "my review is due", "prep my performance review".
---

# Draft a Self-Review

Help the user write an evidence-based self-review in WorkSpark: gather their real accomplishments and OKR progress, draft answers against the platform's quality criteria, and save the draft with the `ws` CLI.

## Prerequisites

- If `ws --version` fails or `ws auth whoami` shows no session, follow the Setup section of the workspark skill in this plugin (`../workspark/SKILL.md`).
- Read `../workspark/references/reviews.md` (relative to this skill's directory) for the writing quality criteria, rating scales, and submission gate before drafting.

## Workflow

1. **Find the review.** Run `ws reviews show-tasks` to find the user's pending self-review. If none is pending, run `ws reviews list-cycles` and confirm with the user which cycle they mean. Get the review with `ws reviews get-review <review-id>` and note the review period dates.
2. **Gather evidence — never write from memory.**
   - Identify the user's member ID via `ws auth whoami`.
   - Pull accomplishments for the review period: `ws accomplishments list <member-id> --filter entry_date_from=<period-start> --filter entry_date_to=<period-end> --output json`
   - Pull OKR progress for cycles overlapping the period: `ws okrs cycles list`, then `ws okrs list <cycle-id>` and check-in history for the user's OKRs.
   - Ask the user for anything significant the data misses (cross-functional work, challenges, growth areas).
3. **Draft the answers** for `--accomplishments`, `--strengths`, and `--opportunities`, applying the quality criteria from the reviews reference:
   - Concrete and specific — numbers, anecdotes, named outcomes drawn from the evidence you pulled.
   - Connect actions to business/team/customer impact; reference relevant OKRs.
   - Honest self-awareness in the opportunities section, with specific next steps.
   - Constructive tone — no blame, no excuses.
   - If ratings are part of the review, proposed ratings must be supported by the narrative (Rating Alignment is AI-checked). The user decides the final ratings.
   - Mark everything clearly as a draft built from their data. Never invent accomplishments, strengths, or metrics.
4. **Iterate with the user** until they approve the exact text and ratings.
5. **Save as draft:**
   ```
   ws reviews answer-review <review-id> --accomplishments "..." --strengths "..." --opportunities "..." [rating flags]
   ```
   This saves a draft (status → Started) and is not visible to anyone else; it can be re-run to revise.
6. **Stop at the gate.** Do not run `mark-review-ready`, `share-review`, or `sign-review` unless the user explicitly asks. Before any of those, present the full final content and ask: "This is the final result. Are you happy with the content? Do you want to submit or leave this as a draft?"

## Guardrails

- Every claim in the draft must trace to an accomplishment entry, OKR data, or something the user told you. If the evidence is thin, say so and ask — don't pad.
- If the review period has few or no logged accomplishments, tell the user plainly and build the draft from their answers to your questions instead.
- Never auto-submit. Saving the draft (`answer-review`) is the default end state of this workflow.
