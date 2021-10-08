local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    PL_BRANCH_CHAR=$'\ue0a0'         # 
  }

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local current_dir='%{$terminfo[bold]$fg[green]%}%~%{$reset_color%}'

local git_branch='$(git_prompt_info)$(git_prompt_status)'

local time='⌚ %{$fg_bold[red]%}%*%{$reset_color%}'

PROMPT="╭─${current_dir} ${git_branch} ${time}
╰─%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="${PL_BRANCH_CHAR} %{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
