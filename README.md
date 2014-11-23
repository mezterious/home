home
====

Home is where the heart is. Take your configuration files and scripts wherever you go.

Installation
------------

1. Clone this repository to wherever you like and run `bootstrap.sh`. It will create 
symbolic links in the $HOME directory to all the dotfiles in your local repository.

```
https://github.com/mezterious/home.git
cd home
./bootstrap.sh
```

If a file already exists in the $HOME directory and is not linked to your local
repository, it will create a backup folder in the $HOME directory and move the existing file over.

2. To make sure configurations take effect, reload bash

```
source ~/.bash_profile
```

Upgrade
-------

1. Get the latest changes and reload bash

```
cd home
git pull
./bootstrap.sh
```

2. Reload bash

```
source ~/.bash_profile
```

Things to Note
--------------

Some vim settings rely on having pathogen and/or other vim plugins.

