if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
end

# Appearance
set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"
set -g theme_display_git_default_branch yes
set -g theme_color_scheme dark

# some more ls aliases
alias ls='eza'
alias ll='eza -alF'
alias la='eza -A'
alias lt='eza -T'
alias cat='bat'
alias find='fd'

# tmux
alias ta='tmux attach'
alias td='tmux detach'
alias tl='tmux ls'

# Git
alias ga='git add'
alias gcm='git commit -m'
alias gps='git push '
alias gb='git branch'
alias gp='git pull '
alias gc='git checkout'
alias gcb='git checkout -b'
alias gps='git push'
alias gl='git log --oneline '
alias gt='git tree '
alias gs='git status '
alias gss='git status -s'

# setting nvim
alias nvv='nvim -u ~/.config/nvim/init.vim'
alias nvl='nvim -u ~/.config/nvim/init.lua'
alias view='nvl -R'
alias vit='nvl ~/.config/nvim/init.lua'
alias fit='nvl ~/.config/fish/config.fish'

#! enable vi mode
fish_vi_key_bindings

alias python='python3'
alias pip='pip3'
alias cptest='python cptest_atcoder.py'
# alias autocommit='python ./auto.py && python ./delete_compiled_file.py'
alias autocommit='python ./delete_compiled_file.py && python ./auto.py'
alias makef='python makef.py'
alias ojs='oj s main.cpp -y --no-open'

# Set key bindings
# set fish_key_bindings fish_user_key_bindings

# autostart fish_ssh_agent
# fish_ssh_agent
eval (ssh-agent -c)

# export flutter
export PATH="$PATH:$HOME/src/flutter/bin"

# setup starship
starship init fish | source

# Add asdf path
# source /opt/homebrew/opt/asdf/asdf.fish

export PATH="$HOME/.local/bin:$PATH"
# fish_add_path $HOME/src/flutter/bin
# fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
