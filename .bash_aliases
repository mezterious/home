# 
# Bash Aliases
#

# File/Directory manipulations
alias cp='cp -iv'               #  Prompt before copying files
alias mv='mv -iv'               #  Prompt before moving files
alias rm='rm -iv'               #  Prompt before removing files
alias mkdir='mkdir -pv'         #  Create the directory if it does not exist
alias ls='ls -G'                #  Color ls output
alias l='ls -al'                #  List all files, including dot files

# Move around better
alias cd..='cd ..'                    #  Go up 1 directory
alias ..='cd ..'                      #  Ditto
alias cd...='cd ../..'                #  Go up 2 directories
alias ...='cd ../..'                  #  Ditto
alias .3='cd ../../../'               #  Go up 3 directories
alias .4='cd ../../../../'            #  Go up 4 directories
alias .5='cd ../../../../../'         #  Go up 5 directories
alias .6='cd ../../../../../../'      #  Go up 6 directories

# General
alias c='clear'                       #  Clear terminal output
alias grep='grep --color=always'      #  Always colour grep output
alias vi='vim'                        #  Always use vim, not vi
alias path="echo $PATH | tr ':' '\n'" #  Show path on separate lines

# CPAN
alias mcpan='sudo perl -MCPAN -e shell'

# Screen
alias scdev='screen -c ${HOME}/.screenrc.d/dev'
alias scrails='screen -c ${HOME}/.screenrc.d/rails'
