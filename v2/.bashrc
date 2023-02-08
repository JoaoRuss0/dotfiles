# If not running interactively, don't do anything
[[ $- != *i* ]] && return

CONFIG_DIR=$HOME/.config
XDG_CONFIG_HOME=$CONFIG_DIR

source $CONFIG_DIR/shell-variables
source $CONFIG_DIR/shell-aliases

parse_git_branch() {
	git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ \(\1\)/p'
}

PS1='[\[\e[34m\]\u\[\e[0m\]@\[\e[35m\]\h\[\e[0m\] \[\e[32m\]\W\[\e[0m\]]\[\e[33m\]$(parse_git_branch)\[\e[0m\] \$ '
