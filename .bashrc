#
#  .bashrc
#

#  Load Homebrew's bash completion
if [ -d /usr/local/etc/bash_completion.d ]
then
    for file in /usr/local/etc/bash_completion.d/*
    do
        . $file
    done
fi

# Load shell dot files
if [ -f ~/.bash_aliases ]
then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]
then
    . ~/.bash_functions
fi

if [ -f ~/.bash_colors ]
then
    . ~/.bash_colors
fi

#  Git command prompt configurations
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1

#   Need to use PROMPT_COMMAND in combination with GIT_PS1_SHOWCOLORHINTS to show colors in prompt
#   Will override PS1
PROMPT_COMMAND="__git_ps1 '${Purple}[\u@\h \w]' '${Purple}\\$ ${Color_Off}' '${Yellow}[%s${Yellow}]' "

#  Path
export PATH=/usr/local/bin:${PATH}:${HOME}/bin

#  Default Editor
export EDITOR='/usr/bin/vim'

#
# Homebrew and rbenv
#
# Use Homebrew's directories rather than ~/.rbenv
export RBENV_ROOT=/usr/local/var/rbenv

# Enable shims and autocompletion
if which rbenv > /dev/null
then
    eval "$(rbenv init -)"
fi
