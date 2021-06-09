#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Verifies if the aliases file exists, if so source it
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Function to check if there is a git branch associated with this directory, if $BRANCH is not empty there is one and so print it with the prompt
display_branch_or_not()
{
    BRANCH="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')"

    if [[ -z $BRANCH ]]; then
        echo ""
    else
        echo -e "--\e[31m" "$BRANCH"
    fi
}

# Add custom scripts path to $PATH
export PATH=$PATH:~/Documents/Scripts/

# Custom PS1 Prompt
PS1='[ \[\e[34m\]\u \[\e[00m\]@ \[\e[35m\]\h \[\e[00m\]at \[\e[33m\]\W \e[00m\]] $(display_branch_or_not)\n\[\e[32m\]└─> \[\e[00m\]'