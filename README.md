# Workspark Plugin Marketplace

A [Claude Cowork / Claude Code](https://claude.ai/cowork) plugin marketplace for the [Workspark](https://workspark.io) performance management platform.

## Installation

### Claude Cowork / Claude Code

Add this marketplace in the Cowork app or CLI using the repository URL:

```
https://github.com/workspark/claude-marketplace
```

### npx skills

```bash
npm install -g skills
skills add workspark/claude-marketplace
```

## Available Plugins

### [Workspark](plugins/workspark/)

Performance management — track accomplishments, run reviews, manage OKRs, and respond to engagement surveys via the `ws` CLI.

**Skills included:**

| Skill | Description |
|-------|-------------|
| [workspark](plugins/workspark/skills/workspark/) | CLI bootstrap, auth, grammar, enums, and domain best practices |
| [log-accomplishment](plugins/workspark/skills/log-accomplishment/) | Guided workflow: turn a rough description into a quality accomplishment entry |
| [self-review](plugins/workspark/skills/self-review/) | Guided workflow: draft an evidence-based self-review from accomplishments and OKR data |
| [okr-check-in](plugins/workspark/skills/okr-check-in/) | Guided workflow: update key results, confidence, and notes for an OKR check-in |

## Repository Structure

```
workspark/claude-marketplace/
├── .claude-plugin/
│   └── marketplace.json              # Marketplace manifest
├── plugins/
│   └── workspark/
│       ├── .claude-plugin/
│       │   └── plugin.json           # Plugin manifest
│       ├── skills/
│       │   ├── workspark/
│       │   │   ├── SKILL.md
│       │   │   ├── metadata.json
│       │   │   └── references/
│       │   ├── log-accomplishment/
│       │   ├── self-review/
│       │   └── okr-check-in/
│       └── bin/                      # Linux ws binaries (bundled)
├── scripts/
│   └── package-plugin.sh            # Build + package plugin
└── dist/                            # Build output (git-ignored)
```

## Development

### Building

```bash
./scripts/package-plugin.sh
```

### Testing locally

```bash
skills add /path/to/local/repo --list
skills add /path/to/local/repo --skill workspark
```

## License

See the [Workspark Terms of Service](https://workspark.io/legal/terms).
