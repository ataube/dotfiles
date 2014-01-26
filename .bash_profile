
# MacPorts Installer addition on 2012-01-28_at_21:37:55: adding an appropriate PATH variable for use with MacPorts.
GRADLE_HOME=/usr/share/gradle;
export GRADLE_HOME
export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/share/npm/bin:$PATH
export PATH=$PATH:$GRADLE_HOME/bin
export SBT_OPTS=-XX:MaxPermSize=512m
export MAVEN_OPTS="-Xmx2048m" 
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0_29-b11-402.jdk/Contents/Home
# Finished adapting your PATH environment variable for use with MacPorts.

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups  
# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


[[ -s "/Users/ataube/.rvm/scripts/rvm" ]] && source "/Users/ataube/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#Git tab compleltion
source ~/git-completion.bash

# z
. `brew --prefix`/etc/profile.d/z.sh

#PS1='\u@\h: \w \n\$'
alias ls='ls -Gla'

## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

#### TAKEN FROM PAUL IRISH's dofiles ####
# @gf3’s Sexy Bash Prompt, inspired by “Extravagant Zsh Prompt”
# Shamelessly copied from https://github.com/gf3/dotfiles

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 256)
	else
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
		WHITE=$(tput setaf 7)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	WHITE="\033[1;37m"
	BOLD=""
	RESET="\033[m"
fi


function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# iTerm Tab and Title Customization and prompt customization
# http://sage.ucsc.edu/xtal/iterm_tab_customization.html

# Put the string " [bash]   hostname::/full/directory/path"
# in the title bar using the command sequence
# \[\e]2;[bash]   \h::\]$PWD\[\a\]

# Put the penultimate and current directory 
# in the iterm tab
# \[\e]1;\]$(basename $(dirname $PWD))/\W\[\a\]

PS1="\[\e]2;$PWD\[\a\]\[\e]1;\]$(basename "$(dirname "$PWD")")/\W\[\a\]\[${BOLD}${MAGENTA}\]\u\[$RESET\]\[$WHITE\]@\[$ORANGE\]\h\[$RESET\]\[$WHITE\]:\[$GREEN\]\w\[$RESET\]\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" git:\")\[$PURPLE\]\$(parse_git_branch)\[$RESET\]\[$WHITE\]\n\$ \[$RESET\]"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
