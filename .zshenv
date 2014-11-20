#
# Defines environment variables.
#

# enable colors in xterm
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# History
#

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/bin
  /usr/local/{bin,sbin}
  $path
)

# Set the the list of directories that cd searches.
cdpath=(
  $HOME/lnk
  $cdpath
)

#
# Aliases
#

# mistaken often
alias sl='ls'
alias dc='cd'

# processes
alias psa="ps aux"
alias psg="ps aux | grep "

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h'
alias ll='ls -lGh --color=auto'
alias ls='ls -Gh --color=auto'

# hub
if [ $(which hub) ] ; then
  alias git='hub'
fi

# git
alias gs='git status'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gco='git checkout'
alias guns='git unstage'
alias gmg='git merge'
alias grb='git rebase'
alias gfc='git fetch'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gad='git add'
alias gpc='git add -p'
alias gdf='git diff'
alias gds='git diff --staged'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias lsg='ll | grep'
alias cl='clear'
alias ..='cd ..'

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi
