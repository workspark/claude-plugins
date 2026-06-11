# Workspark Skills

Agent skills for the [Workspark](https://workspark.io) performance management platform.

## What is Workspark?

Workspark is a lean, integrated performance management platform for growing companies (30–500 people). It brings together **accomplishment tracking**, **performance reviews**, **engagement surveys**, and **OKR-based goal setting** in one opinionated system built around best practices — no configuration maze, no multi-week implementation.

**Core beliefs:**
- **Simplicity** — purposeful minimalism. Teams actually use it because it's intuitive.
- **Opinionated** — built-in best practices. Competencies, review structures, and survey questions are pre-built. Less flexibility, productive immediately.
- **Integrated** — accomplishments, reviews, surveys, and OKRs connect by design. Performance is a continuous signal, not a periodic event.
- **Visibility** — continuous accomplishment logging makes work visible when it matters (reviews, 1-on-1s, promotions), reducing recency bias.

## What This Repo Does

This repo serves two distribution channels from the same `skills/` directory:

1. **Claude Cowork / Claude Code plugin** — the repo root is a plugin named `workspark` (manifest in `.claude-plugin/plugin.json`). Package it with `./scripts/package-plugin.sh` (bundles Linux `ws` binaries) and install the resulting `dist/workspark.plugin` in Cowork, or install it directly in Claude Code from the repo/marketplace.
2. **The [`npx skills`](https://github.com/vercel-labs/skills) ecosystem** — publishes the **workspark** skill. When a user runs:

```
skills add workspark/skills
```

...their AI coding agent learns to install and use the Workspark CLI (`ws`). The skill includes:
- **CLI bootstrap** — install per OS, authenticate, configure
- **Universal grammar** — how all `ws` commands work
- **Domain references** — best practices for accomplishments, reviews, OKRs, surveys, and tasks (installed as reference files)

## Available Skills

| Skill | Description |
|-------|-------------|
| [workspark](skills/workspark/) | Workspark CLI — install, auth, grammar, enums, and domain best practices in references/ |
| [log-accomplishment](skills/log-accomplishment/) | Guided workflow: turn a rough description of work into a quality accomplishment entry |
| [self-review](skills/self-review/) | Guided workflow: draft an evidence-based self-review from accomplishments and OKR data |
| [okr-check-in](skills/okr-check-in/) | Guided workflow: update key results, confidence, and notes for an OKR check-in |

The workflow skills depend on the `workspark` skill's references and assume the full plugin is installed.

## Installation

The `npx skills` command has a name conflict with npm's built-in `skills` alias. Use one of these approaches:

```bash
# Recommended: install globally, then use directly
npm install -g skills
skills add workspark/skills

# Or use npx with the --package flag
npx --package=skills skills add workspark/skills

# List available skills without installing
skills add workspark/skills --list
```

### Per-agent installation

```bash
# Install to specific agents only
skills add workspark/skills -a claude-code -a opencode

# Install globally with no prompts
skills add workspark/skills -g -y
```

### Updating

```bash
skills update workspark
```

## Repository Structure

```
workspark/skills/
├── README.md
├── .claude-plugin/
│   └── plugin.json                      # Plugin manifest (Claude Cowork / Claude Code)
├── skills/
│   ├── workspark/
│   │   ├── SKILL.md                     # Bootstrap: install, auth, grammar, enums, recovery
│   │   ├── metadata.json                # Version tracking (not copied by npx skills)
│   │   └── references/
│   │       ├── accomplishments.md       # Entry quality, STAR-Lite, 9 categories
│   │       ├── reviews.md               # Cycle mgmt, review actions, writing criteria, ratings, nine-box
│   │       ├── okrs.md                  # Objective/KR rules, value format, confidence, stale detection
│   │       ├── engagement-surveys.md    # 6 themes, confidentiality, response tips
│   │       └── tasks.md                 # Board/task management
│   ├── log-accomplishment/
│   │   └── SKILL.md                     # Workflow: log a quality accomplishment entry
│   ├── self-review/
│   │   └── SKILL.md                     # Workflow: evidence-based self-review draft
│   └── okr-check-in/
│       └── SKILL.md                     # Workflow: OKR check-in with confirmation gate
```

## Development

### Adding a new reference

1. Create a new `.md` file under `skills/workspark/references/`
2. Add it to the Domain References table in `SKILL.md`

### Testing locally

```bash
skills add /path/to/local/repo --list
skills add /path/to/local/repo --skill workspark
```

## License

See the [Workspark Terms of Service](https://workspark.io/legal/terms).
