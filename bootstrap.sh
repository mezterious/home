#!/usr/bin/env bash

#
# Bootstrapper for home configuration files
# and scripts
#

function usage() {
    cat << END

USAGE

    $0 -t <copy|link>

DESCRIPTION

    -t copy        -- Copy files to the home directory.
    -t link        -- Create a symlink in the home directory instead. The symbolic link is a relative path.

END

    exit 1
}

# Parse options
while getopts "t:h" option
do
    case "${option}" in
        t)
            action=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done

source_dir_absolute=$(cd $(dirname $0) && pwd)
source_dir_relative=".${source_dir_absolute#${HOME}}"    # get source directory relative to $HOME

case "${action}" in
    copy)
        #   Copy configuration files to $HOME

        rsync -avzh --progress --exclude '.git' --exclude 'bootstrap.sh' --exclude 'README*' ${source_dir_absolute}/ ${HOME}
        ;;
    link)
        #   Link configuration files in $HOME

        # Only link dot files
        for file in $( find ${source_dir_absolute} -type f -name '.*' -maxdepth 1)
        do
            #   Create the symbolic link in the $HOME directory
            ln -sfv "${source_dir_relative}/$(basename ${file})" ${HOME}
        done
        ;;
    *)
        echo "Aborted. Unknown or missing option/argument. Check usage."
        exit 1
        ;;
esac

# Reload bash
source ${HOME}/.bash_profile

