---
inclusion: always
---

# Git — jj-inspired workflow

Every working state is a commit. Never lose work. Keep history linear and atomic.

## Principles

- **Working copy = commit.** WIP is just an unpushed commit — commit constantly.
- **Atomic.** One logical change per commit. Small beats large. Commit tests with their implementation.
- **Trunk-based.** Short-lived branches off main; main is always deployable. No develop/staging branches.
- **Linear.** Rebase onto main before merging, resolve conflicts forward, delete branches after merge.
- **Reversible.** Amend and rewrite unpushed commits freely. Never force-push or rewrite shared history without explicit permission.

## Rules

- Stage specific files, never `git add .` blindly.
- Conventional commits (`feat:`, `fix:`, `refactor:`, `test:`, `chore:`), first line under 72 chars.
- Fetch before branching. One branch = one purpose, days not weeks.
- Only commit when asked. Flag files that may hold secrets before staging.
