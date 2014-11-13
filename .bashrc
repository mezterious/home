# 
#  .bashrc
#

#  Prompt
export PS1="[\u@\h \w]$ "

#  Path
export PATH=/usr/local/bin:${PATH}:${HOME}/bin

#  Default Editor
export EDITOR='/usr/bin/vim'

# Load shell dot files
if [ -f ~/.bash_aliases ]
then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]
then
    . ~/.bash_functions
fi

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
