if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
end

#view
set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"
set -g theme_display_git_default_branch yes
set -g theme_color_scheme dark

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cat='bat'

#Git
alias g='git'
alias gb='git branch'
alias gcm='git commit -m'
alias gc='git checkout'
alias ga='git add'
alias gp='git push'

#! enable vi mode
fish_vi_key_bindings

# alias python='python3'
alias pip='pip3'
alias cptest='python cptest_atcoder.py'
# alias autocommit='python ./auto.py && python ./delete_compiled_file.py'
alias autocommit='python ./delete_compiled_file.py && python ./auto.py'
alias makef='python makef.py'
alias ojs='oj s main.cpp -y --no-open'
alias vim='nvim'

# Set key bindings
# set fish_key_bindings fish_user_key_bindings

# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"

# autostart fish_ssh_agent
# fish_ssh_agent
eval (ssh-agent -c)

# export flutter
export PATH="$PATH:/Users/sisi0808/src/flutter/bin"

# setup starship
starship init fish | source

