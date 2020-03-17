# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"

DEFAULT_USER="minhdanh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

MAGIC_ENTER_GIT_COMMAND='git status'
ZSH_DOTENV_PROMPT="false"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  bgnotify
  colored-man-pages
  dircycle
  docker
  dotenv
  encode64
  git
  gitignore
  kube-ps1
  kubectl
  magic-enter
  ripgrep
  systemadmin
  urltools
  z
  zsh_reload
  zsh-syntax-highlighting
)

# User configuration

export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH=$PATH:~/.kube/plugins/jordanwilson230
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# pretty Git log
alias gl='git log --graph --pretty="%C(bold green)%h%Creset%C(auto)%d%Creset %s"'

# pretty Git log, all references
alias gll='gl --all'

# pretty Git log, show authors
alias gla='git log --graph --pretty="%C(bold green)%h%Creset %C(yellow)%an%Creset%C(auto)%d%Creset %s"'

# pretty Git log, all references, show authors
alias glla='gla --all'

alias ls="exa -agh"
alias ll="exa -abglh"
alias h="history"

alias afk="brightness 0 && /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias less='less -m -g -i --underline-special --SILENT'

export FZF_DEFAULT_COMMAND='rg --files --ignore-vcs'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PROMPT=$PROMPT'$(kube_ps1)'
KUBE_PS1_SEPARATOR=''
KUBE_PS1_NS_ENABLE=false
KUBE_PS1_SUFFIX=") "
KUBE_PS1_CTX_COLOR="blue"
