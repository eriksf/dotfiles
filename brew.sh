#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew -v update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

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
brew tap homebrew/versions
brew install bash-completion
brew install bash-completion2

# Install `wget` with IRI support.
brew install wget --with-iri

# tap some more
brew tap homebrew/apache
brew tap homebrew/core
brew tap homebrew/dupes
brew tap homebrew/php
brew tap homebrew/science
brew tap homebrew/gui

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install other useful binaries.
brew install ant
brew install autojump
brew install aws-elasticbeanstalk
brew install boost
brew install curl --with-openssl --with-nghttp2
brew install dos2unix
brew install enscript
brew install ffmpeg --with-faac --with-ffplay --with-fontconfig --with-freetype --with-libass --with-libvorbis --with-tools --with-x265
brew install homebrew/science/genometools --with-hmmer
brew install geos
brew install git
brew install graphviz
brew install htop-osx
brew install homebrew/apache/httpd22
brew install homebrew/science/htslib
brew install httpie
brew install hub
brew install imap-uw
brew install jq
brew install libidn
brew install libvo-aacenc
brew install maven
brew install homebrew/gui/meld
brew install mobile-shell
brew install monit
brew install mp3info
brew install mysql
brew install ncftp
brew install nginx
brew install nvm
brew install perl
brew install homebrew/php/php56 --with-debug --with-homebrew-apxs --with-homebrew-curl --with-postgresql
brew install homebrew/php/composer
brew install postgresql --with-python
brew install pv
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper
brew install pyside
brew install python
brew install python3
brew install rabbitmq
brew install rbenv
brew install redis
brew install rust
brew install sdl
brew install shellcheck
brew install socat
brew install ssh-copy-id
brew install subversion
brew install tmux
brew install homebrew/versions/tomcat7
brew install watchman
brew install zeromq

# Remove outdated versions from the cellar.
brew cleanup
