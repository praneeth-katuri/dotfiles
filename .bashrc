# Test for an interactive shell.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.
#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

PS1="\[\033[35m\] 󰣨  \[\033[37m\]\[\033[34m\]\w \[\033[0m\]"
PS2="\[\033[32m\]  > \[\033[0m\]"

# No double entries in the shell history.
export HISTCONTROL="$HISTCONTROL erasedups:ignoreboth"

# prevents over-writing existing files when using 'cat' and other commands
#set -o noclobber

# Fancy shell color script
#colorscript random

# colorize 'grep' output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob
shopt -s histappend
shopt -s expand_aliases
shopt -s checkwinsize

# extract function
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# navigation function
up () {
  local d=""
  local limit="$1"

  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

# source aliases from ~/.aliasrc
if [[ -r ~/.aliasrc ]]; then
  . $HOME/.aliasrc
fi

# Set up Node Version Manager(NVM)
source /usr/share/nvm/init-nvm.sh

if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} && ${SHLVL} == 1 ]]
then
	shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
	exec fish $LOGIN_OPTION
fi
