# Accomplishments Best Practices

## Entry Quality Standards

These are the quality standards Workspark's AI evaluates entries against:

### Write with clarity and evidence

- Write honestly about a meaningful work activity — what you did, why it mattered, what you learned, what happens next
- Include outcomes, challenges, and decisions. Keep it concise but insightful.
- Think about who might read this: your manager 6 months from now, a review panel, your future self

### Use the STAR-Lite format (adapted for daily logging)

- **Situation / Task:** What was the context? What needed to be done?
- **Action:** What did YOU specifically do? Use "I" not "we"
- **Result / Learning:** What was the outcome? What did you learn?

### Quality tiers the AI uses

The AI rates every entry on this scale. Aim for at least "Good Enough" — ideally "Clear & Complete":

| Rating | What it means |
|--------|---------------|
| **Clear & Complete** | Covers enough to satisfy the achievement concept fully |
| **Good Enough** | Understandable and useful, but could benefit from deeper context |
| **Missing Details** | Gives some information but skips key parts |
| **Unclear** | Hard to follow, lacks structure or specific meaning |
| **Too Brief** | Too short to provide insight or value |

### The 9 work categories

Entries are auto-categorized into one of these. They help show the breadth of your work:

| Category | Example |
|----------|---------|
| **Create** | Shipped a new feature, designed a new process |
| **Execute** | Completed a sprint deliverable, hit a milestone |
| **Lead** | Ran a meeting, mentored a teammate, drove a decision |
| **Learn** | Completed training, learned a new tool or technique |
| **Maintain** | Fixed a bug, refactored code, kept systems running |
| **Plan** | Defined roadmap items, scoped a project |
| **Research** | Investigated a technology, analyzed competitors |
| **Share** | Gave a presentation, wrote documentation, published internally |
| **Support** | Helped a customer, unblocked a colleague, handled an incident |

### Cross-functional work

The platform values work outside your core responsibilities. About 20% of your entries should reflect cross-functional contributions — a developer who helped with customer escalation, a marketer who facilitated onboarding, a manager who rolled up their sleeves during an incident.

## Common Workflows

### Log an accomplishment
```
ws accomplishments create
```

### View your accomplishments
```
ws accomplishments list <member-id>
```

### Filter by date range
```
ws accomplishments list <member-id> --filter entry_date_from=YYYY-MM-DD --filter entry_date_to=YYYY-MM-DD
```

### View analytics (insights)
```
ws accomplishments insights <member-id>
```
Shows 12-month heatmap, category distribution, theme analysis (requires 5+ entries).

## Anti-Patterns

- Don't wait until review season to log everything retroactively
- Don't log task-list items ("Emailed Bob"). Capture meaningful work with context.
- Don't use "we" when you mean "I". Be specific about your contributions.
- Don't skip entries because they seem small — a fix that prevented a major outage is as important as shipping a feature
