#
# User configuration sourced by interactive shells
#

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh


# fnm
export PATH=/home/khoa/.fnm:$PATH
eval "`fnm env --multi`"

# yarn
export PATH=/home/khoa/.yarn/bin:$PATH

# allow to call local node_modules binary directly
export PATH=./node_modules/.bin:$PATH

##### ALIASES ########
# git
alias gco="git checkout"
alias gcb="git checkout -b"
alias gst="git status"
alias gp="git push"
alias gpl="git pull"

# bucklescript
alias bsbc="bsb -clean-world"
alias bsbm="bsb -make-world"

alias xclip='xclip -selection clipboard'

# docker
alias dkmc="docker-machine"
alias dkc="docker-compose"

machine () {
	local name=$1
	echo "Switching docker_host to $name"
	if [[ $name -eq "local" ]]
	then
		eval $(docker-machine env -u)
	else
		eval $(docker-machine env $name)
	fi
}
