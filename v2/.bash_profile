#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	
	printf "Start X? [Y/n]"
	read -s -n1 answer
	printf "\n"
	
	[[ $answer = "" || ${answer^^} = "Y" ]] && exec startx
fi
