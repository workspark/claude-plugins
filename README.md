# Workspark Claude Plugin

The [Workspark](https://workspark.io) plugin for Claude Cowork and Claude Code.

## What is Workspark?

Workspark is a lean, integrated performance management platform for growing companies (30–500 people). It brings together **accomplishment tracking**, **performance reviews**, **engagement surveys**, and **OKR-based goal setting** in one opinionated system built around best practices — no configuration maze, no multi-week implementation.

**Core beliefs:**
- **Simplicity** — purposeful minimalism. Teams actually use it because it's intuitive.
- **Opinionated** — built-in best practices. Competencies, review structures, and survey questions are pre-built. Less flexibility, productive immediately.
- **Integrated** — accomplishments, reviews, surveys, and OKRs connect by design. Performance is a continuous signal, not a periodic event.
- **Visibility** — continuous accomplishment logging makes work visible when it matters (reviews, 1-on-1s, promotions), reducing recency bias.

## What This Repo Does

This repo is a Claude plugin named `workspark` (manifest in `.claude-plugin/plugin.json`). It ships a single skill that teaches Claude to use the Workspark CLI (`ws`):

- **CLI bootstrap** — install from the bundled Linux binaries in `bin/`, authenticate, configure
- **Universal grammar** — how all `ws` commands work, plus the command families
- **Domain references** — best practices for accomplishments, reviews, OKRs, surveys, and tasks, kept in separate files under `references/` so the skill stays lightweight and loads domain advice only when needed

Looking for the standalone skill for the [`npx skills`](https://github.com/vercel-labs/skills) ecosystem instead? That lives in [workspark/skills](https://github.com/workspark/skills).

## Available Skills

| Skill | Description |
|-------|-------------|
| [workspark](skills/workspark/) | Workspark CLI — install, auth, grammar, enums, and domain best practices in references/ |

## Installation

### Claude Cowork

Package the plugin (bundles the Linux `ws` binaries):

```bash
./scripts/package-plugin.sh
```

Then install the resulting `dist/workspark.plugin` in Cowork.

### Claude Code

Install directly from the repo/marketplace, or point Claude Code at a local checkout.

## Repository Structure

```
workspark/claude-plugins/
├── README.md
├── .claude-plugin/
│   └── plugin.json                      # Plugin manifest (Claude Cowork / Claude Code)
├── bin/
│   ├── ws-linux-arm64                   # Bundled CLI binaries (built by package-plugin.sh)
│   └── ws-linux-amd64
├── scripts/
│   └── package-plugin.sh                # Build binaries + package dist/workspark.plugin
├── skills/
│   └── workspark/
│       ├── SKILL.md                     # Bootstrap: install, auth, grammar, enums, recovery
│       ├── metadata.json                # Version tracking
│       └── references/
│           ├── accomplishments.md       # Entry quality, STAR-Lite, 9 categories
│           ├── reviews.md               # Cycle mgmt, review actions, writing criteria, ratings, nine-box
│           ├── okrs.md                  # Objective/KR rules, value format, confidence, stale detection
│           ├── engagement-surveys.md    # 6 themes, confidentiality, response tips
│           └── tasks.md                 # Board/task management
```

## Development

### Adding a new reference

1. Create a new `.md` file under `skills/workspark/references/`
2. Add it to the Domain References table in `SKILL.md`

Keep the skill content in sync with [workspark/skills](https://github.com/workspark/skills) — the only intended difference is the Setup section, which here installs from the bundled binaries instead of downloading.

## License

See the [Workspark Terms of Service](https://workspark.io/legal/terms).
