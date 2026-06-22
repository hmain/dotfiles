---
inclusion: always
---

# Git — jj-inspired workflow

Treat every working state as a commit. Never lose work. Keep history linear and atomic.

## Core principles

1. **Working copy = commit** — Commit constantly. There is no "uncommitted state." WIP is just an unpushed commit.
2. **Atomic changes** — One logical change per commit. Small beats large.
3. **Trunk-based** — Short-lived feature branches off main. No develop/staging branches. Main is always deployable.
4. **Linear history** — Rebase onto main before merging. Delete branches after merge.
5. **Conflicts are data** — When rebasing causes conflicts, resolve them forward. Don't avoid rebase to dodge conflicts.
6. **Everything is reversible** — Amend and rewrite freely on unpushed commits. Never force-push or destroy shared history without explicit permission.

## Rules

- Stage specific files, never `git add .` blindly.
- Conventional commits: `feat:`, `fix:`, `refactor:`, `test:`, `chore:`. First line under 72 chars.
- Commit tests with their implementation — same commit.
- Pull/fetch before creating a new branch.
- One branch = one purpose. Days, not weeks.
