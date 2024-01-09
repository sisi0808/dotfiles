# dotfiles

My dotfiles

## What's this

WezTerm(terminal emulator) + Fish(shell) + Neovim(editor)

## Setup

```Bash
# Base
cd
git clone git@github.com:sisi0808/dotfiles.git
cd dotfiles
vi ./config/git/config.local  # rewrite your Git user
./install.sh

# fish
sudo echo "$(which fish)" >> /etc/shells
chsh -s "$(which fish)"
fish

# rtx
rtx -g node
rtx global deno

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
```
