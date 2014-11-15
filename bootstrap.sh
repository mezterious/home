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

        rsync -avzh --progress --exclude '.git*' --exclude 'bootstrap.sh' --exclude 'README*' ${source_dir_absolute}/ ${HOME}
        ;;
    link)
        #   Link configuration files in $HOME

        #   Find files to link. Don't include current script and README and don't descend into directories
        for file in $(find ${source_dir_absolute} -maxdepth 1 ! -name '.git' ! -name $(basename $0) ! -name 'README*')
        do
            if [ "${file}" == "${source_dir_absolute}" ]
            then
                #   Skip home directory
                continue;
            fi

            base_file_name="$(basename ${file})"

            #   Remove file/directory from $HOME if it exists
            rm -rf ${HOME}/${base_file_name}

            #   Create the symbolic link in the $HOME directory
            ln -sv ${source_dir_relative}/${base_file_name} ${HOME}
        done
        ;;
    *)
        echo "Aborted. Unknown or missing option/argument. Check usage."
        exit 1
        ;;
esac

# Reload bash
if [ -f "${HOME}/.bash_profile" ]
then
    source ${HOME}/.bash_profile
fi

