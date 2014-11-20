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

export BROWSER="firefox"
export EDITOR="vim"

#------------------------------
# Comp stuff
#------------------------------

zmodload zsh/complist
autoload -Uz compinit
compinit
#zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
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
zstyle ':vcs_info:git*' formats "%{${PR_CYAN}%}[%{${PR_YELLOW}%}%m%u%c%{${PR_WHITE}%}${git_sym}%b%{${PR_CYAN}%}]%{$reset_color%}"

setprompt() {
   # load some modules
   setopt prompt_subst
   # make some aliases for the colours: (coud use normal escap.seq's too)
   PR_NO_COLOR="%{$terminfo[sgr0]%}"
   # Check the UID
   if [[ $UID -ge 1000 ]]; then # normal user
      eval PR_USER='${PR_NO_COLOR}%n'
      eval PR_USER_OP='${PR_NO_COLOR}%#'
   elif [[ $UID -eq 0 ]]; then # root
      eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
      eval PR_USER_OP='${PR_NO_COLOR}%#$'
   fi
   # Check if we are on SSH or not
   if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
      eval PR_HOST='${PR_NO_COLOR}%M' #SSH
   else
      eval PR_HOST='${PR_NO_COLOR}%M' # no SSH
   fi
   # set the prompt
   PS1=$'
${PR_CYAN}[${PR_NO_COLOR}%T${PR_CYAN}][${PR_USER}@${PR_HOST}${PR_CYAN}][${PR_NO_COLOR}%1~${PR_CYAN}]
${PR_USER_OP} '
   PS2=$'%_>'
   RPROMPT=$'${vcs_info_msg_0_}'

}
setprompt

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

