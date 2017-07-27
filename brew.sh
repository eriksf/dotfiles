#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew -v update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg
# tap some more
brew tap homebrew/apache
brew tap homebrew/boneyard
brew tap homebrew/core
brew tap homebrew/dupes
brew tap homebrew/php
brew tap homebrew/science
brew tap homebrew/gui
brew tap caskroom/cask
brew tap buo/cask-upgrade

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen

# Install other useful binaries.
brew install ant
brew install autoenv
brew install autojump
brew install autossh
brew install aws-elasticbeanstalk
brew install boost
brew install ctags
brew install curl --with-openssl --with-nghttp2
brew install docker-clean
brew install dos2unix
brew install enscript
brew install erlang
brew install faac
brew install fdupes
brew install ffmpeg --with-faac --with-ffplay --with-fontconfig --with-freetype --with-libass --with-libvorbis --with-tools --with-x265
brew install freetds
brew install homebrew/science/genometools --with-hmmer
brew install gdb
brew install geos
#brew install git
brew install gnome-icon-theme
brew install graphviz
brew install gtksourceview3
brew install handbrake
brew install heroku
brew install htop-osx
brew install homebrew/apache/httpd22
brew install homebrew/apache/httpd24
brew install homebrew/science/htslib
brew install httpie
brew install hub
brew install imap-uw
brew install jq
brew install libidn
brew install libmemcached
brew install libvo-aacenc
brew install maven
brew install homebrew/gui/meld
brew install mercurial
brew install mkvtoolnix
brew install mobile-shell
brew install mongodb
brew install monit
brew install mp3info
brew install mp4v2
brew install mplayer
brew install mtr
brew install mycli
brew install mysql
brew install ncftp
brew install nginx
brew install node
brew install nvm
brew install perl
brew install homebrew/php/php56 --with-debug --with-apache22 --with-homebrew-curl --with-postgresql
brew install homebrew/php/composer
brew install postgresql --with-python
brew install postgresql@9.5
brew install pv
brew install pwgen
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper
brew install pyenv-pip-migrate
brew install pygobject3
brew install pyside
brew install python
brew install python3
brew install qt
brew install rabbitmq
brew install rbenv
brew install redis
brew install ruby
brew install rust
brew install screen
brew install sdl
brew install shellcheck
brew install smartmontools
brew install socat
brew install ssh-copy-id
brew install stormssh
brew install subversion
brew install tmux
brew install tomcat@7
brew install tree
brew install utf8proc
brew install homebrew/science/vcftools
brew install watchman
brew install wine
brew install winetricks
brew install yarn
brew install zeromq

# install cask apps
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vagrant
brew cask install vagrant-manager
brew cask install bitbar
brew cask install hyper

# Remove outdated versions from the cellar.
brew cleanup
