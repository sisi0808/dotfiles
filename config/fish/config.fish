if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
end

# Appearance
set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"
set -g theme_display_git_default_branch yes
set -g theme_color_scheme dark

# setting nvim
alias nvv='nvim -u ~/.config/nvim/init.vim'
alias nvl='nvim -u ~/.config/nvim/init.lua'
alias view='nvl -R'
alias vit='nvl ~/.config/nvim/init.lua'
alias fit='nvl ~/.config/fish/config.fish'

# setting for vifm
abbr --add vm 'vifm'

# some more ls aliases
abbr --add ls 'eza'
abbr --add ll 'eza -alF'
abbr --add la 'eza -A'
abbr --add lt 'eza -T'
abbr --add cat 'bat'
abbr --add find 'fd'

# tmux
abbr --add ta 'tmux attach'
abbr --add td 'tmux detach'
abbr --add tl 'tmux ls'

# Git
abbr --add ga 'git add'
abbr --add gcm 'git commit -m'
abbr --add gP 'git push'
abbr --add gb 'git branch'
abbr --add gp 'git pull'
abbr --add gc 'git checkout'
abbr --add gcl 'git clone'
abbr --add gcb 'git checkout -b'
abbr --add gs 'git status '

abbr --add python 'python3'
abbr --add pip 'pip3'

# for atcoder
abbr --add ccn 'cargo compete new'
abbr --add cct 'cargo compete test'
abbr --add ccs 'cargo compete submit'

# for rust
abbr --add cr 'cargo run'
abbr --add ct 'cargo test'

#! enable vi mode
fish_vi_key_bindings

# autostart fish_ssh_agent
# fish_ssh_agent
eval (ssh-agent -c)

# export flutter
export PATH="$PATH:$HOME/src/flutter/bin"

# setup starship
starship init fish | source

export PATH="$HOME/.local/bin:$PATH"
# fish_add_path $HOME/src/flutter/bin
# fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
