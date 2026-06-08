---
inclusion: always
---

# Git Best Practices

Follow jj-inspired git workflows — commit often, keep changes atomic, and never lose work.

1. **Commit early and often** — After every meaningful change (new function, fixed bug, added test, refactored code), create a commit. Don't accumulate large uncommitted diffs.
2. **Small atomic commits** — Each commit should represent one logical change. Prefer many small commits over few large ones.
3. **Commit before switching context** — Before moving to a different part of the codebase or a different task, commit current progress even if incomplete. Use WIP prefixes for in-progress work.
4. **Amend freely on unpushed commits** — Rewrite, squash, or amend local commits to keep history clean before pushing.
5. **Descriptive commit messages** — Use conventional commit format (feat:, fix:, refactor:, test:, chore:). First line under 72 chars, body for details when needed.
6. **Stage specific files** — Never use `git add .` blindly. Stage only the files relevant to the current logical change.
7. **Branch per task** — Work on feature branches. Keep main clean and deployable.
8. **Commit tests with their implementation** — Tests and the code they cover belong in the same commit.
9. **Main is always deployable** — Never commit directly to main. All work happens on short-lived feature branches that merge into main only when complete and tested.
10. **Short-lived branches** — Feature branches should live days, not weeks. If a branch lives too long, break the work into smaller incremental branches that each merge to main.
11. **Rebase onto main before merging** — Keep feature branches linear by rebasing onto the latest main before completing. This gives clean, readable history.
12. **Delete branches after merge** — Once merged to main, delete the feature branch locally and remotely. Branches are cheap bookmarks, not permanent records.
13. **One branch = one purpose** — A branch should map to a single feature, bugfix, or task. Don't pile unrelated work onto the same branch.
14. **Pull before branching** — Always branch from an up-to-date main. Pull/fetch before creating a new feature branch.
15. **No long-lived development branches** — Avoid "develop" or "staging" branches. Use main + short-lived feature branches. Deploy from main.
16. **Every change is always on a branch** — There's no "detached" or uncommitted state. If you start working, you're on a branch with a commit. WIP is just an unpushed commit on a named branch.
