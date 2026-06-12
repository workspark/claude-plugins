# Reviews Best Practices

## Review Types

| Type | Code | Who Writes It | Purpose |
|------|------|---------------|---------|
| **Self** | 10 | You, about yourself | Reflect on your contributions and growth |
| **Peer** | 20 | Colleagues | Provide perspective from someone at your level |
| **Upward** | 30 | Direct reports | Give feedback to your manager |
| **Manager** | 40 | Your manager | Formal evaluation with ratings |

## Cycle Lifecycle

Review cycles progress through phases:

| Phase | Command | Description |
|-------|---------|-------------|
| Draft | `create-cycle` | Create the cycle with dates and settings |
| Active | `publish-cycle` | Launch the cycle — creates reviews for all reviewees |
| Active | `pause-cycle` | Pause an active cycle |
| Active | `resume-cycle` | Resume a paused cycle |
| Sharing | `open-cycle-sharing` | Transition from review writing to sharing phase |
| Completed | `complete-cycle` | Finalize the cycle |
| Cancelled | `cancel-cycle` | Cancel the cycle |

### Cycle status codes

| Code | Status |
|------|--------|
| 10 | Draft |
| 20 | Active |
| 30 | Sharing |
| 40 | Paused |
| 50 | Completed |
| 60 | Cancelled |

### Cycle types

| Code | Type |
|------|------|
| 10 | Company-Wide |
| 20 | Onboarding |
| 30 | Performance Improvement |

### Creating a cycle

```
ws reviews create-cycle \
  --review-cycle-type 10 \
  --review-period-start-date 2026-01-01 \
  --review-period-end-date 2026-06-30 \
  --due-date-launch 2026-07-01 \
  --due-date-individual-reviews 2026-07-15 \
  --due-date-manager-reviews 2026-07-31 \
  --due-date-sharing 2026-08-07 \
  --due-date-signing 2026-08-14 \
  --add-peer-reviews \
  --add-upward-reviews
```

Required: `--review-cycle-type`, `--review-period-start-date`, `--review-period-end-date`. Optional: due-date flags and `--add-peer-reviews` / `--add-upward-reviews` to enable those review types.

## Review Actions

Once a cycle is published, each review moves through its own status lifecycle:

| Action | Command | Description |
|--------|---------|-------------|
| Write content | `answer-review` | Fill in review sections and ratings (saves as draft — status transitions to Started) |
| Mark ready | `mark-review-ready` | Mark the review as ready for sharing (manager reviews only) |
| Share | `share-review` | Share the review with the reviewee |
| Sign | `sign-review` | Reviewee acknowledges/signs (manager reviews only) |
| Decline | `decline-review` | Reviewer declines to complete the review |
| Cancel | `cancel-review` | Admin/PeopleOps cancels the review |

### Review status codes

| Code | Status |
|------|--------|
| 10 | Not Started |
| 20 | Started |
| 30 | Ready |
| 50 | Shared |
| 60 | Signed |
| 80 | Declined |
| 90 | Cancelled |

### Answering a review

```
ws reviews answer-review <review-id> \
  --accomplishments "Led the migration from monolith..." \
  --strengths "Deep technical knowledge of distributed systems..." \
  --opportunities "Could develop more business-facing communication skills..." \
  --delivery-rating 4 \
  --behaviour-rating 3 \
  --performance-rating 4
```

Flags: `--accomplishments`, `--strengths`, `--opportunities` (text), `--delivery-rating`, `--behaviour-rating`, `--performance-rating` (1-5).

Running `answer-review` saves your answers and auto-transitions the review from Created (10) to Started (20). This is a draft state — you can update your answers multiple times. The review is **not yet visible** to the reviewee.

### Marking a review ready (manager reviews)

```
ws reviews mark-review-ready <review-id>
```

Transitions the review from Started (20) to Ready (30). Only applies to manager reviews. This signals that you have finalized your content and the review can be shared. **This is a final action — use the submission gate (see below).**

### Declining a review

```
ws reviews decline-review <review-id>
```

Use when you cannot complete a review (e.g., you don't have enough context or working relationship with the reviewee). The reviewer who accepted the assignment can decline from Created, Started, or Ready status.

## Never Fabricate Review Content

- **Do not invent** accomplishments, strengths, opportunities, or ratings. Reviews are formal performance documents — fabricated content has real consequences.
- If the user asks for help drafting a review, you may suggest text based on their accomplishments and context, but mark it clearly as a draft.
- The user must review, edit, and provide the final text before you execute `answer-review`.
- **Never** run `mark-review-ready`, `share-review`, or `sign-review` without explicit user approval of the final content.

## Submission Gate

The following commands are **final** — they change the review's visibility or state in ways that may not be reversible without admin intervention. Before executing any of them, you MUST:

1. Present the full review content (or a summary of what will change) to the user.
2. Ask: **"This is the final result. Are you happy with the content? Do you want to submit or leave this as a draft?"**
3. Only proceed if the user explicitly confirms.

Commands requiring the gate:

| Command | Why it's final |
|---------|---------------|
| `mark-review-ready` | Signals content is complete; review can be shared next |
| `share-review` | Makes review visible to the reviewee |
| `sign-review` | Reviewee formally acknowledges the review; closes the feedback loop |

## Monitoring

### Your pending review tasks
```
ws reviews show-tasks                          # current user, latest cycle
ws reviews show-tasks --cycle <cycle-id>       # specific cycle
ws reviews list-tasks --output json            # programmatic use
```

### Cycle overview
```
ws reviews show-cycle-progress                     # latest cycle dashboard
ws reviews show-cycle-progress <cycle-id>          # specific cycle
```

### Reviewee status tracking
```
ws reviews show-cycle-reviewees                    # all reviewees in latest cycle
ws reviews show-cycle-reviewees <cycle-id>         # specific cycle
```

### Cycle results (nine-box grid)
```
ws reviews show-cycle-results                      # latest cycle
ws reviews show-cycle-results <cycle-id>           # specific cycle
```

### Listing cycles and reviews
```
ws reviews list-cycles                             # all cycles
ws reviews list-cycles --filter status=20          # active cycles only
ws reviews list-reviews                            # reviews in latest cycle
ws reviews list-reviews <cycle-id>                 # reviews in specific cycle
ws reviews list-reviews --filter review_type=40    # manager reviews only
ws reviews get-cycle <cycle-id>                    # full cycle details
ws reviews get-review <review-id>                  # full review details
ws reviews show-review <review-id>                 # rich view with ratings + text + competencies
```

## Writing Quality Criteria

These are the criteria Workspark's AI uses to evaluate review quality. Address each one:

### 1. Depth & Specificity
Be concrete. Use numbers, anecdotes, and data points. "Reduced deploy time from 12 minutes to 90 seconds by parallelizing integration tests" not "improved the deploy pipeline."

### 2. Impact & Outcomes
Connect actions to results. What changed because of the work? Tie to business, team, or customer outcomes.

### 3. Self-Awareness & Growth Orientation
Show reflection. Acknowledge strengths honestly, identify specific lessons learned, describe clear next steps for growth.

### 4. Alignment & Context
Frame comments within broader team, project, or company priorities. Reference relevant OKRs.

### 5. Professionalism & Tone
Constructive, objective language. No blame, no excuses, no negativity.
- Good: "The deadline was missed due to scope changes mid-sprint. Next time we'll tighten scope lock."
- Bad: "Sales kept changing requirements and ruined the timeline."

### 6. Rating Alignment
Narrative answers must support the ratings given. "Exceeds Expectations" on Delivery requires descriptions of consistently high-quality output beyond core expectations.

### Manager review only:

### 7. Peer Review Alignment
Do peer reviews align with your assessment? Note discrepancies. Quote specific peer feedback by reviewer name.

### 8. Upward Review Alignment
Do upward reviews (from direct reports) align? Address significant misalignments.

### 9. Self Review Alignment
Does the reviewee's self-assessment align with yours? The gap between self-perception and manager perception is key territory for development conversations.

## Rating Scales

### Delivery

| Rating | Label | When to use |
|--------|-------|-------------|
| 1 | Significantly Below Expectations | Work consistently falls far short of basic requirements |
| 2 | Below Expectations | Inconsistent or partially meets expectations |
| 3 | Meets Expectations | Consistently delivers work fully aligned with role |
| 4 | Exceeds Expectations | Consistently high-quality work beyond core expectations |
| 5 | Significantly Exceeds Expectations | Exceptional, transformative impact |

### Behaviour

| Rating | Label | When to use |
|--------|-------|-------------|
| 1 | Significantly Below Expectations | Consistently struggles with collaboration and values |
| 2 | Below Expectations | Inconsistent in teamwork or demonstrating values |
| 3 | Meets Expectations | Works well with team, consistently demonstrates values |
| 4 | Exceeds Expectations | Exceptional team player, actively strengthens collaboration |
| 5 | Significantly Exceeds Expectations | Role model for values, elevates team performance |

## Nine-Box Talent Grid

Maps delivery (x-axis, 1-3) against behaviour (y-axis, 1-3):

| Behaviour ↓ / Delivery → | 1 (Low) | 2 (Mid) | 3 (High) |
|---------------------------|---------|---------|----------|
| **3 (High)** | High Potential | Team Player | Star Performer |
| **2 (Mid)** | Under Performer | Solid Center | Key Contributor |
| **1 (Low)** | Misfit | Inconsistent Performer | Solo Talent |

## Anti-Patterns

- Don't write reviews without concrete examples — "does great work" without evidence is not actionable
- Don't wait until review season to think about feedback. Continuously note observations through accomplishments.
- Don't give ratings without written justification — Rating Alignment is checked by AI
- Don't write peer reviews about personality traits — focus on observed behaviours and outcomes
- Don't use manager reviews to deliver surprises — ongoing feedback should mean nothing in a review is new
- Don't publish a cycle before all reviewees are added and dates are confirmed
- Don't mark a review ready before running AI feedback
- **Don't fabricate content.** Never invent accomplishments, strengths, or ratings. All review text must come from the user or CLI data.
- **Don't auto-submit.** Always present final content to the user and get explicit confirmation before `mark-review-ready`, `share-review`, or `sign-review`.
