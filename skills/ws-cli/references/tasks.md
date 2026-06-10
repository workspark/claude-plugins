# Tasks Best Practices

## Common Workflows

### List task boards
```
ws tasks boards list
```

### View tasks on a board
```
ws tasks list <board-id>
```

### Create a task
```
ws tasks create <board-id>
```

### Update a task
```
ws tasks update <board-id> <task-id>
```

### Archive a completed task
```
ws tasks archive <board-id> <task-id>
```

Or unarchive: `ws tasks unarchive <board-id> <task-id>`

### Filter and sort tasks
```
ws tasks list <board-id> --filter status=in_progress --sort -priority
```

## Best Practices

- Keep task titles actionable and specific — "Update API docs for v2 endpoints" not "Documentation"
- Use task descriptions for context: link to relevant specs, PRs, or decisions
- Archive completed tasks promptly to keep boards clean and focused on active work
- Tasks on a board should represent units of work, not an exhaustive to-do list — if it takes 5 minutes, just do it
