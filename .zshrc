#
# Executes commands at the start of an interactive session.
#

#------------------------------
#Keybindings
#------------------------------

# Use vi key bindings
bindkey -v
# [Ctrl-r] - Search backward incrementally for a specified string.
# The string may begin with ^ to anchor the search to the beginning of the line.
bindkey '^r' history-incremental-search-backward
bindkey '^?' backward-delete-char

#------------------------------
# History stuff
#------------------------------

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#------------------------------
# Variables
#------------------------------

export EDITOR="vim"

#------------------------------
# Comp stuff
#------------------------------

zmodload zsh/complist
autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=3
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#------------------------------
# Window title
#------------------------------

case $TERM in
  termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
  precmd () {
    vcs_info
    print -Pn "\e]0;%1d\a"
  }
  ;;
esac

#------------------------------
# Prompt
#------------------------------

git_sym=''
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$fg[${(L)color}]%}'
done

autoload -U colors zsh/terminfo
colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%b${git_sym}%m%u%c"

setprompt() {
   # load some modules
   setopt prompt_subst
   # Check the UID
   if [[ $UID -ge 0 ]]; then # normal user
      eval PR_USER_OP='%#'
   elif [[ $UID -eq 0 ]]; then # root
      eval PR_USER_OP='%#$'
   fi
   # set the prompt
   PS1=$'\[%T\]\[%n@%m\]\[%1~\] ${vcs_info_msg_0_}\n${PR_USER_OP} '
   PS2=$'%_>'
   RPROMPT=$''
}
setprompt

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
