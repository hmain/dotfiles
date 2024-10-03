# Setting up git for my dotfiles
The key to making this work well is a one-byte .gitignore file:

```
*
```

Git will ignore all of the files in my $HOME directory.
In order to track dotfiles, we need to override the gitignore file on a case-by-case basis with git add -f, or --force.
For example to add .vimrc:

```
git add -f .vimrc
```

The gitignore file does not apply to any files which are already being tracked by git, so any future changes to my dotfiles show up in git and are added to the staging area normally with git add. Using -f is no longer necessary after the first time.

Setting up a new machine is quite easy. After the installation, I run the following commands:

```
cd ~
git init
git remote add origin https://github.com/hmain/dotfiles.git
git fetch
git checkout -f main
```

Based on: https://drewdevault.com/2019/12/30/dotfiles.html

## Bootstrapping my computer with make

```
make                    # Bootstrap setup
make macos              # Set up macOS defaults
make zsh-config         # Setup zsh-config
```
