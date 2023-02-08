#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	echo "Do you want to start an X session? [Y/n]"

	read yes_or_no

	if [[ "$yes_or_no" == "n" || "$yes_or_no" == "N" ]]; then
		echo "Did not start an X session."
	elif [[ "$yes_or_no" == "" || "$yes_or_no" == "y" || "$yes_or_no" == "Y" ]]; then
		exec startx
	else
		echo "None of the available options were chosen."
	fi
fi