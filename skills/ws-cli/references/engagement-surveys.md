# Engagement Surveys Best Practices

## How Surveys Work

- **One survey at a time** per organization — prevents fatigue
- **Fixed 15 questions** — same questions every cycle, enabling trend detection
- **1-5 Likert scale** with optional comments
- **Draft saving** — responses can be saved and submitted later
- **All 15 required** for final submission, no modifications after
- **Anonymous in aggregate** — minimum 5 responses before any results are shown

## The 6 Survey Themes

### 1. Role Clarity & Resources (4 questions)
Clear expectations, right tools and information, connection between daily work and goals.

### 2. Manager & Personal Support (3 questions)
Manager relationship — the highest-leverage engagement factor. Covers support, feedback quality, and feeling heard.

### 3. Growth & Development (2 questions)
Learning opportunities, career development, feeling valued beyond current role.

### 4. Team & Environment (3 questions)
Belonging, peer quality, and psychological safety. Covers whether people feel they can be themselves and speak up.

### 5. Leadership & Future (2 questions)
Confidence in company direction and leadership. Retention intent — do people see a future here?

### 6. Well-being (1 question)
Work-life balance and sustainable workload.

## Best Practices for Responding

- **Be honest.** Surveys are anonymous at the aggregate level — nobody sees your individual responses.
- **Answer all 15.** Partial responses time out. Save a draft if you can't finish in one sitting.
- **Write specific comments.** The optional comment field is the most useful part for leaders. "The Tuesday standup has become a status-reporting bottleneck" is more actionable than "Meetings are bad."
- **Reflect on the full period.** Don't let a rough day or a great week dominate your thinking.
- **Vary tone naturally.** Real feedback includes nuance — some things are great, some need work.

## Confidentiality

- **No individual response visibility** — managers and leaders cannot see who gave what rating
- **Minimum 5 responses** before any metric is shown
- **Comments never attributed** — no name, team, or manager tag
- Threshold applies **per filtered segment** — filtering by team requires 5+ responses in that team

## Common Workflows

### List available surveys
```
ws engagement surveys list
```

### View survey details
```
ws engagement surveys get <survey-id>
```

### Check your response status
```
ws engagement surveys list
```
Shows whether you've started, saved a draft, or submitted.

## Anti-Patterns

- Don't skip comments. Rating scales alone don't tell leaders what to fix or keep.
- Don't rush through. Thoughtful responses take 5-10 minutes.
- Don't assume nothing will change. Survey results are reviewed by leadership and People Ops.
- Don't wait until you're frustrated to respond. Answer authentically whenever it's open.
