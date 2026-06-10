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

## Never Fabricate Accomplishment Content

- **Do not invent** accomplishment entries. Accomplishments are evidence of real work and may be used in reviews, promotions, and performance discussions.
- If the user asks for help drafting an entry, you may suggest text based on context they've shared, but mark it clearly as a draft.
- The user must review, edit, and provide the final text before you execute `create`.
- **Never** run `create` with AI-generated content unless the user has explicitly approved the exact text.

## Submission Gate

Accomplishment entries are **final on creation** — there is no draft state. Before executing `create`, you MUST:

1. Present the full entry content (title, content, category, date) to the user.
2. Ask: **"This is the final result. Are you happy with the content? Do you want to create this entry?"**
3. Only proceed if the user explicitly confirms.

Updates to existing entries are also immediate but can be revised. Still confirm content changes with the user.

## Anti-Patterns

- Don't wait until review season to log everything retroactively
- Don't log task-list items ("Emailed Bob"). Capture meaningful work with context.
- Don't use "we" when you mean "I". Be specific about your contributions.
- Don't skip entries because they seem small — a fix that prevented a major outage is as important as shipping a feature
- **Don't fabricate entries.** Never invent accomplishments. All content must come from the user or real work data.
- **Don't auto-create.** Always present the full entry and get explicit user confirmation before `create`.
