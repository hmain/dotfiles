# dotfiles
Utilizing the simple system of adding ~ to git and creating a .gitignore with *. Force add any dotfiles with git add -f .filename.
See: https://drewdevault.com/2019/12/30/dotfiles.html

## Commands

```
make                    # Bootstrap setup
make fish               # Change shell to fish
make fish-packages      # Install fish packages with fisher
make gpg                # Import GPG key from Keybase
make homebrew-packages  # Install tools with homebrew, cask, mas
make macos              # Set up macOS defaults
make tmux-packages      # Install tmux packages with tpm
make vim-packages       # Install vim packages with vim-plug
```
