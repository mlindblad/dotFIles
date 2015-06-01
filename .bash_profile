export PATH=$HOME/bin:/usr/local/bin:$PATH

export EDITOR=/usr/bin/vim

export HISTSIZE=5000
export HISTCONTROL=ignoredups:erasedups
export HISTTIMEFORMAT='%F %T '

export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # lists all the color

#
#export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

# git prompt
#source ~/.gitcompletion.sh

export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\[$COLOR_LIGHT_BLUE\]\w\[$COLOR_NC\] \$(__git_ps1 '(%s)') \[$COLOR_LIGHT_PURPLE\]\$ \[$COLOR_NC\]"

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f ~/.bash_aliases ]; then
 source ~/.bash_aliases
fi

if [ -f ~/.bashrc ]; then
 source ~/.bashrc
fi

# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# groovy
#export GROOVY_HOME=/usr/local/Cellar/groovy/1.8.5/libexec
export GROOVY_HOME=/usr/local/Cellar/groovy/1.8.6/libexec
export PATH=$PATH:$GROOVY_HOME/bin

export DART_HOME=/usr/local/opt/dart/libexec
export PATH=$PATH:$DART_HOME/bin

#node stuff
export PATH=/usr/local/share/npm/bin:$PATH

#export PATH=/Users/martin/Dev/gradle-1.10/bin:$PATH

function rmb {
 current_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
 if [ "$current_branch" != "master" ]; then
   echo "WARNING: You are on branch $current_branch, NOT master."
 fi
   echo "Fetching merged branches..."
 git remote prune origin
 remote_branches=$(git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$")
 local_branches=$(git branch --merged | grep -v 'master$' | grep -v "$current_branch$")
 if [ -z "$remote_branches" ] && [ -z "$local_branches" ]; then
   echo "No existing branches have been merged into $current_branch."
 else
   echo "This will remove the following branches:"
   if [ -n "$remote_branches" ]; then
     echo "$remote_branches"
   fi
   if [ -n "$local_branches" ]; then
     echo "$local_branches"
   fi
   read -p "Continue? (y/n): " -n 1 choice
   echo
   if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
     # Remove remote branches
     git push origin `git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$" | sed 's/origin\//:/g' | tr -d '\n'`
     # Remove local branches
     git branch -d `git branch --merged | grep -v 'master$' | grep -v "$current_branch$" | sed 's/origin\///g' | tr -d '\n'`
   else
     echo "No branches removed."
   fi
 fi
}

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/martin/.gvm/bin/gvm-init.sh" ]] && source "/Users/martin/.gvm/bin/gvm-init.sh"

export PATH=/Applications/SenchaSDKTools-2.0.0-beta3:$PATH

export SENCHA_SDK_TOOLS_2_0_0_BETA3="/Applications/SenchaSDKTools-2.0.0-beta3"

export PATH=/Users/martin/bin/Sencha/Cmd/4.0.2.67:$PATH

export SENCHA_CMD_3_0_0="/Users/martin/bin/Sencha/Cmd/5.1.3.61"



export PATH=/Users/martin/bin/Sencha/Cmd/5.1.3.61:$PATH
