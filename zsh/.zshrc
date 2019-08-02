#
# User configuration sourced by interactive shells
#

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

export PATH=/home/khoa/app:$PATH
# fnm
export PATH=/home/khoa/.fnm:$PATH
eval "`fnm env --multi`"

# yarn
export PATH=/home/khoa/.yarn/bin:$PATH
alias yw="yarn workspace"

# allow to call local node_modules binary directly
export PATH=./node_modules/.bin:$PATH

##### ALIASES ########
# git
alias gco="git checkout"
alias gcb="git checkout -b"
alias gst="git status"
alias gp="git push"
alias gpl="git pull"
alias nah="git reset --hard"

# bucklescript
alias bsbc="bsb -clean-world"
alias bsbm="bsb -make-world"
export BS_LOG="*"

# OS
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

# tmux
# should should be last line

if [ -z "$TMUX" ]; then
	tmux attach || tmux
fi

# opam configuration
test -r /home/khoa/.opam/opam-init/init.zsh && . /home/khoa/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

source ~/.fzf.zsh

# goodies

# Final redirect with curl
function finalurl() {
	curl $1 -s -L -I -o /dev/null -w '%{url_effective}'
}
