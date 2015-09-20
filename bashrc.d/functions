#
# Bash functions
#

# List directory contents after changing directory
function cdl() {
    cd "$@" && ls -al
}

# Create a new directory and change to that directory
function mkcd() {
    mkdir "$@" && cd "$@"
}

# Print out the perl INC array
function pinc() {
    perl -e 'foreach (@INC) { print "$_\n"; }'
}
