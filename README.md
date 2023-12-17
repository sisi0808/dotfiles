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
vi ./config/git  # rewrite your Git user
./install.sh
```

```Bash
# fish
sudo echo "$(which fish)" >> /etc/shells
chsh -s "$(which fish)"
fish
# asdf
asdf global nodejs latest 
asdf global deno latest 
```
