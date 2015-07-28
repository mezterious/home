#!/usr/bin/env bash

#
# Bootstrapper for home configuration files
# and scripts
#

source_dir_absolute=$(cd $(dirname $0) && pwd)
source_dir_relative=".${source_dir_absolute#${HOME}}"    # get source directory relative to $HOME
backup_dir=${HOME}/.log/backup/$(date +"%Y%m%d%H%M%S")

#   Find files to link. Don't include current script and README and don't descend into directories
for file in $(find ${source_dir_absolute} -maxdepth 1 ! -name '.git' ! -name $(basename $0) ! -name 'README*')
do
    #   Skip home directory
    if [ "${file}" == "${source_dir_absolute}" ]
    then
        continue;
    fi

    base_file_name="$(basename ${file})"
    source_file_name="${source_dir_relative}/${base_file_name}"     # Relative path name to the file
    home_file_name=${HOME}/${base_file_name}  # Full path name

    #   Skip if file exists and is already symbolically linked to the repo
    if [ -L "${home_file_name}" -a "$(readlink ${home_file_name})" == "${source_file_name}" ]
    then
        continue;
    fi

    #   Backup existing file
    if [ -f "${home_file_name}" ]
    then
        echo "File '${home_file_name}' already exists. Backing it up now."

        if [ ! -d "${backup_dir}" ]
        then
            mkdir -v ${backup_dir}
        fi

        mv -v ${home_file_name} ${backup_dir}

        echo "Backup complete."
    fi

    echo -n "Creating symbolic link: "
    #   Create the symlink
    ln -sfv ${source_file_name} ${HOME}
done
