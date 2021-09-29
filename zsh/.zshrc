# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="clean"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm/dd/yyyy"

MAGIC_ENTER_GIT_COMMAND='git status'
ZSH_DOTENV_PROMPT="false"
HISTSIZE=10000000
SAVEHIST=10000000

plugins=(
  bgnotify
  colored-man-pages
  dircycle
  docker
  dotenv
  encode64
  git
  gitignore
  kubectl
  magic-enter
  ripgrep
  urltools
  z
  zsh_reload
  zsh-syntax-highlighting
  # zsh-autosuggestions
)

# User configuration

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOPATH=$HOME/go
export PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/openssl@1.1/bin:$GOPATH/bin:$HOME/local/bin"

source $ZSH/oh-my-zsh.sh

#export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
# export LESS=" -R "

export FZF_DEFAULT_COMMAND='rg --files --ignore-vcs'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.zshrc_common ] && source ~/.zshrc_common
[ -f ~/.zshrc_local ] && source ~/.zshrc_local
case "$OSTYPE" in
  darwin*)
    [ -f ~/.zshrc_macos ] && source ~/.zshrc_macos
  ;;
  linux*)
    [ -f ~/.zshrc_linux ] && source ~/.zshrc_linux
  ;;
esac

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"
