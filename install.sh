#!/bin/bash
set -ue

helpmsg() {
    command echo "Usage: $0 [--help | -h]" 0>&2
    command echo ""
}

create_dotfiles() {
    command echo "backup old dotfiles..."
    if [ ! -d "$HOME/.dot_bk" ];then
        command echo "$HOME/.dot_bk not found. Auto Make it"
        command mkdir "$HOME/.dot_bk"
    fi

    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
    local dotdir="${script_dir}/dot"
    if [[ "$HOME" != "$dotdir" ]];then
        for f in $dotdir/.??*; do
            [[ `basename $f` == ".git" ]] && continue
            if [[ -e "$HOME/`basename $f`" ]];then
                command mv "$HOME/`basename $f`" "$HOME/.dot_bk"
            fi
            command ln -snf $f $HOME
        done
    else
        command echo "same install src dest"
    fi
}

create_config() {
    command echo "backup old configrations..."
    if [ ! -d "$HOME/.config_bk" ];then
        command echo "$HOME/.config_bk not found. Auto Make it"
        command mkdir "$HOME/.config_bk"
    fi
    if [ ! -d "$HOME/.config" ];then
        command echo "$HOME/.config not found. Auto Make it"
        command mkdir "$HOME/.config"
    fi

    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
    local confdir="${script_dir}/config"
    local homeconf="${HOME}/.config"
    if [[ "$HOME" != "$confdir" ]];then
        for f in $confdir/*; do
            if [ -d $f ];then
                [[ `basename $f` == ".git" ]] && continue
                if [[ -e "$homeconf/`basename $f`" ]];then
                    command mv "$homeconf/`basename $f`" "$HOME/.config_bk"
                fi
                command ln -snf $f $homeconf
            fi
        done
    else
        command echo "👍 Config setting is done!"
    fi
}

create_brew() {

  # brewコマンドがなければインストール
  if [! type brew > /dev/null 2>&1]; then
   xcode-select --install
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # 権限設定
  sudo chown -R "$(whoami)":admin /usr/local/*
  sudo chmod -R g+w /usr/local/*

  # Brewfileを実行(.Brewfileがあるディレクトリで)
  cd "$HOME" || exit
  brew bundle
  cd - || exit

  echo "👍 Homebrew setting is done!"
}


while [ $# -gt 0 ];do
    case ${1} in
        --debug|-d)
        set -uex
        ;;
        --help|-h)
        helpmsg
        exit 1
        ;;
        *)
        ;;
    esac
    shift
done

ESC=$(printf '\033')

command printf "${ESC}[36m >>> Installing dot files... ${ESC}[m\n"
create_dotfiles
command printf "${ESC}[36m >>> Installing config dirs... ${ESC}[m\n"
create_config
command printf "${ESC}[36m >>> Installing app from brew list... ${ESC}[m\n"
create_brew
command printf "${ESC}[33m <<< Install completed! ${ESC}[m\n"
