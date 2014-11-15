home
====

Home is where the heart is. Take your configuration files and scripts wherever you go.

Installation
------------

```
./bootstrap.sh -h

USAGE

    ./bootstrap.sh -t <copy|link>

DESCRIPTION

    -t copy        -- Copy files to the home directory.
    -t link        -- Create a symlink in the home directory instead. 
                      The symbolic link is a relative path.
```

######Caveat
This is still a work in progress. At this stage, no warning or backup option is provided if files already exist in $HOME. They will just be overwritten.
