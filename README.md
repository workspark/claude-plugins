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
| [workspark](plugins/workspark/skills/workspark/) | CLI bootstrap, auth, grammar, enums, and domain best practices in `references/` (loaded only when needed) |

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
│       │   └── workspark/
│       │       ├── SKILL.md
│       │       ├── metadata.json
│       │       └── references/
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

Keep the skill content in sync with [workspark/skills](https://github.com/workspark/skills) — the only intended differences are the Setup section (here it installs from the bundled binaries instead of downloading) and the frontmatter description (here it carries extra trigger phrases, since this is the plugin's only skill).

## License

See the [Workspark Terms of Service](https://workspark.io/legal/terms).
