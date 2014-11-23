home
====

Home is where the heart is. Take your configuration files and scripts wherever you go.

Installation
------------

```
https://github.com/mezterious/home.git
cd home
./bootstrap.sh
source ~/.bash_profile
```

`bootstrap.sh` will create symbolic links in the $HOME directory.
If a file already exists in $HOME and is not yet linked, `bootstrap.sh` will create a backup folder in $HOME and move the existing file over.

Upgrade
-------

Get the latest changes and reload bash
```
cd home
git pull
./bootstrap.sh
source ~/.bash_profile
```

Things to Note
--------------

Some vim settings rely on having pathogen and/or other vim plugins.

