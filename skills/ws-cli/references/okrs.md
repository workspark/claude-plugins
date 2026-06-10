# OKRs Best Practices

## Writing Good Objectives

- **Qualitative, ambitious, inspirational** — not a task list. "Drive 40% revenue growth in EMEA" not "Do sales calls"
- **Describe the change you want** — not the activities to get there. Outcome over output.
- **Clear to anyone** — someone outside your team should understand it
- **Short and punchy** — aim for under 10 words, never exceed 15
- **Use direct verbs** — Reduce churn, Grow pipeline, Ship onboarding v2, Land first enterprise customer

| Good | Bad |
|------|-----|
| Grow pipeline in North America | Implement innovative revenue strategies across several channels |
| Ship onboarding v2 | Work on the onboarding flow to make improvements |
| Reduce customer churn to below 3% | Reduce churn |

## Writing Good Key Results

- **Outcomes, not tasks** — "Conversions increase from 2% to 4%" not "Run 5 A/B tests"
- **Specific and measurable** — a number you can track. Clear start value, clear target value.
- **Ambitious but achievable** — 70% confidence level means you can see the path but it won't be easy
- **2-4 key results per objective** — fewer means not enough definition, more means not enough focus

### Value rules

- Start and target values must be **whole integers** — no decimals
- Use **absolute metric values**, not relative changes: "Revenue grows from 500,000 to 750,000 USD" not "Revenue grows by 250,000"
- For percentages, track the actual percentage: start 82, target 92, unit "%"
- For scores, scale to integers: "satisfaction score" start 64, target 90, unit "/ 100"
- For binary (yes/no) KRs: start 0, target 1, unit ""
- The title describes **what's measured**, not the numbers

| Good | Bad |
|------|-----|
| title: "Reduce unallocated EBS volume costs", start: 10000, target: 8000, unit: "USD" | title: "Reduce costs by 2000 USD", start: 0, target: 2000 |
| title: "Achieve Net Promoter Score of 50", start: 32, target: 50, unit: "NPS" | start: 3.2, target: 4.5 (no decimals) |
| title: "Improve employee retention rate", start: 82, target: 92, unit: "%" | start: 0, target: 20 (tracking delta, not actual) |

## Confidence Levels

| Code | Label | When to use |
|------|-------|-------------|
| 10 | On Track | On pace to achieve the key result |
| 20 | At Risk | Behind pace or blockers emerging |
| 30 | Off Track | Significantly behind, unlikely to recover without intervention |
| 40 | Blocked | Cannot make progress until external factor resolves |

## Stale OKR Detection

Workspark flags OKRs without a check-in in 7+ days. Regular check-ins keep goals visible and signal the right priority.

## Common Workflows

### List cycles
```
ws okrs cycles list
ws okrs cycles list --match "Q1"
```

### View OKRs in a cycle
```
ws okrs list <cycle-id>
```

### View a specific OKR
```
ws okrs get <cycle-id> <okr-id>
```

### Submit a check-in
```
ws okrs check-ins create <cycle-id> <okr-id>
```
Updates confidence level, key result progress, and adds a narrative comment.

### View check-in history
```
ws okrs check-ins list <cycle-id> <okr-id>
```

### Get AI recommendations
```
ws okrs recommend-objectives <cycle-id>
```
The AI coach suggests objectives based on member role and team context.

### Strategic objectives
```
ws okrs cycles get <cycle-id>
```

## Anti-Patterns

- Don't use objectives as a task list. If every objective starts with "Do" or "Complete," they're tasks, not outcomes.
- Don't set key results without a clear measurement method.
- Don't go more than 7 days without a check-in.
- Don't game the numbers. Setting KRs too low to look good defeats the purpose.
- Don't create too many OKRs. 2-3 objectives with 2-4 KRs each is the sweet spot.
