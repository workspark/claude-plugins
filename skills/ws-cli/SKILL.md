---
name: ws-cli
description: Workspark performance management — reviews, OKRs, tasks, accomplishments, engagement surveys
---

# Workspark CLI

Use the `ws` CLI to interact with the Workspark performance management platform. This skill handles CLI installation, authentication, and the universal command grammar. For domain-specific best practices and workflows, consult the references provided.

## Setup (run once)

1. Detect the host OS and architecture:
   - macOS: `uname -m` (arm64 = Apple Silicon, x86_64 = Intel)
   - Linux: `uname -m` (x86_64 = amd64, aarch64 = arm64)
   - Windows: `[Environment]::Is64BitOperatingSystem`

2. Download the binary from GitHub Releases:

   **macOS Apple Silicon:**
   ```
   curl -sSLO "https://github.com/workspark/cli/releases/latest/download/ws-darwin-arm64" && \
     mv ws-darwin-arm64 /usr/local/bin/ws && chmod +x /usr/local/bin/ws
   ```

   **macOS Intel:**
   ```
   curl -sSLO "https://github.com/workspark/cli/releases/latest/download/ws-darwin-amd64" && \
     mv ws-darwin-amd64 /usr/local/bin/ws && chmod +x /usr/local/bin/ws
   ```

   **Linux x86:**
   ```
   curl -sSLO "https://github.com/workspark/cli/releases/latest/download/ws-linux-amd64" && \
     mv ws-linux-amd64 /usr/local/bin/ws && chmod +x /usr/local/bin/ws
   ```

   **Linux ARM:**
   ```
   curl -sSLO "https://github.com/workspark/cli/releases/latest/download/ws-linux-arm64" && \
     mv ws-linux-arm64 /usr/local/bin/ws && chmod +x /usr/local/bin/ws
   ```

   **Windows (PowerShell):**
   ```powershell
   $dir = "$env:LOCALAPPDATA\workspark"; mkdir $dir -Force | Out-Null
   Invoke-WebRequest "https://github.com/workspark/cli/releases/latest/download/ws-windows-amd64.exe" -OutFile "$dir\ws.exe"
   [Environment]::SetEnvironmentVariable("PATH", "$env:PATH;$dir", "User")
   ```

3. Verify: `ws --version`
4. Authenticate: `ws auth login` — opens browser to sign in
5. Configure: `ws config init` — select your organization

## What WorkSpark Is

WorkSpark is a performance management platform for work evidence, feedback, goals, task context, and organizational data. The CLI exposes these domains:

- authentication and account identity
- organizations and organizational units
- members and reporting structure
- accomplishments and self-review evidence
- reviews and multi-source feedback
- OKRs, key results, and check-ins
- tasks and task boards
- engagement surveys

## Core Principles

- Use the CLI for factual claims about WorkSpark data.
- Do not invent commands, flags, IDs, statuses, or relationships.
- If the CLI does not expose enough information, say so explicitly.
- Keep answers grounded, direct, and concise.

### Never Fabricate Content

**Do not invent data.** Never generate or fabricate review answers, accomplishment entries, check-in notes, OKR statements, key result values, or survey responses. Only use data retrieved from the CLI or explicitly provided by the user.

If the user asks for help drafting content (e.g., "help me write my self-review"), you may suggest drafts, but:
- Mark all AI-generated drafts clearly as suggestions.
- The user must review, edit, and approve the final text before you execute any write command.
- Never write content to WorkSpark without explicit user-provided text or explicit user approval of a draft.

### Final Submission Gate

**Always confirm before final actions.** For any command that submits, finalizes, or publishes — as opposed to saving a draft — you MUST:

1. Present the full content that will be submitted to the user.
2. Ask explicitly: "This is the final result. Are you happy with the content? Do you want to submit or leave this as a draft?"
3. Only proceed with the submission command if the user explicitly confirms.

Commands that require this gate:

| Domain | Final Actions |
|--------|---------------|
| Reviews | `mark-review-ready`, `share-review`, `sign-review` |
| OKRs | `create-check-in` |
| Accomplishments | `create` (entries are final on creation) |
| Engagement Surveys | `submit-response-answers` (as distinct from `save-response-answers`) |

Saving drafts, updating unsubmitted content, and reading data do not require the gate.

## Universal Grammar

Every domain follows the same structure. Use this to derive commands directly without running `--help` first.

**Verbs:** `list` · `get` · `show` · `create` · `update` · `delete` (or `archive`/`unarchive`)

`show` gives a rich composite view (profile, dashboard, tree). Prefer it over `get` when available.

**Sub-resources:** `<parent-id>` is always the first positional argument after the sub-resource name:

```
ws <domain> <subresource> <verb> <parent-id> [sub-id]
```

**Universal flags:** `--match "<text>"` · `--output json` · `--sort -field` · `--filter field=value`

**Shorthand aliases:** `ws rev` = `ws reviews` · `ws acc` = `ws accomplishments`

Not every command follows this pattern. A few use compound verbs like `list-cycles` or `show-reporting-lines`. When the grammar doesn't cover it, fall back to `--help`.

## Output Format

Use the default table/card output when scanning records interactively. Use `--output json` when you need exact fields, nested records, IDs, or several records that must be compared or synthesized.

## Command Families

Common command roots:

- `ws auth whoami`
- `ws organizations ...`
- `ws organizations units ...`
- `ws members ...`
- `ws accomplishments ...`
- `ws reviews ...`
- `ws okrs cycles ...`
- `ws okrs ...`
- `ws okrs check-ins ...`
- `ws tasks boards ...`
- `ws tasks ...`
- `ws engagement surveys ...`

Avoid shorthand namespaces unless help confirms them. Use `ws organizations`, not `ws org`; use `ws members`, not `ws people`.

## Discovery Pattern

When a task is ambiguous:

1. Confirm the relevant organization or person if it affects scope.
2. Find the relevant record IDs from names, dates, titles, or periods.
3. Fetch the records behind those IDs.
4. Synthesize only from evidence you inspected.

Useful examples:

- Find a person: `ws members list --match "<name>"`
- Check context: `ws auth whoami`
- Inspect org shape: `ws organizations units list`, then `ws members list`
- List members in one org unit: `ws members list --unit-id <unit-id>`
- Check your pending review work: `ws reviews list-tasks --output json`
- Find review cycles: `ws reviews list-cycles`
- Read reviews in a cycle: `ws reviews list-reviews <cycle-id>`, then `ws reviews get-review <review-id>`
- Read accomplishments: `ws accomplishments list <member-id>`
- Read accomplishments for a date range: `ws accomplishments list <member-id> --filter entry_date_from=YYYY-MM-DD --filter entry_date_to=YYYY-MM-DD`
- Find OKR cycles by date-range label or period: `ws okrs cycles list --match "<period>"`
- Read OKRs and evidence: `ws okrs list <cycle-id>`, then `ws okrs check-ins list <cycle-id> <okr-id>`
- Read task boards: `ws tasks boards list`, then `ws tasks list <board-id>`
- Check survey metadata: `ws engagement surveys list`, then `ws engagement surveys get <survey-id>`

When a prompt gives a specific name, title, date range, or ID, treat it as the target unless the user asks for a newer or broader record.

## Enums

Enum values (statuses, types, confidence levels, rating scales) are documented in the domain reference files. Consult the relevant reference file for the domain you are working in.

For authoritative server-side definitions, run:
```
ws reference entities <entity>
```
e.g. `ws reference entities reviews.review`.

## Domain References

For detailed best practices, workflows, and anti-patterns per domain, read the following files installed alongside this skill:

| Domain | File | Contents |
|--------|------|----------|
| **Accomplishments** | `references/accomplishments.md` | Entry quality rubric, STAR-Lite format, 9 work categories, common workflows |
| **Reviews** | `references/reviews.md` | Cycle lifecycle, review actions, monitoring, writing quality criteria, rating scales, nine-box grid |
| **OKRs** | `references/okrs.md` | Objective/KR writing rules, value format rules, confidence levels, stale detection |
| **Engagement Surveys** | `references/engagement-surveys.md` | 6 survey themes, confidentiality rules, response best practices |
| **Tasks** | `references/tasks.md` | Board and task management workflows |

Consult the relevant reference before guiding a user through a domain-specific task.

## Recovery Rules

- If you get `unknown command`, run `ws --help` or the nearest group help.
- If you get `unknown flag`, inspect that command's help before retrying.
- If a command needs an ID, discover the ID first.
- If a list command returns `[]`, treat it as an empty result set.
- After the first syntax error, stop free-form guessing.
- If you need field definitions or enum values, run `ws reference entities <entity>` (e.g. `reviews.review`). Do not guess enum codes.
- If asked to generate content (review text, OKRs, accomplishments, check-in notes, survey responses), draft suggestions but mark them as drafts. The user must review and approve before you execute any write command.
- Before any final/submission action, present the content and ask for explicit user confirmation. Never auto-submit.

## Answering Style

- Lead with the answer, not the process.
- Mention the strongest concrete evidence you found.
- Call out missing data or CLI limitations explicitly.
- Do not overstate certainty.
