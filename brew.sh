#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew -v update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew tap homebrew/versions
#brew install bash-completion
brew install bash-completion@2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg
# tap some more
#brew tap homebrew/apache
brew tap homebrew/boneyard
brew tap homebrew/core
#brew tap homebrew/dupes
brew tap homebrew/php
brew tap homebrew/science
brew tap homebrew/gui
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap buo/cask-upgrade
brew tap wagoodman/dive

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
#brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install adwaita-icon-theme
brew install ant
brew install autoenv
brew install autojump
brew install autossh
brew install aws-elasticbeanstalk
brew install boost
brew install bsdgames-osx
brew install cmake
brew install ctags
brew install curl --with-openssl --with-nghttp2
brew install wagoodman/dive/dive
brew install docker-clean
brew install dos2unix
brew install duck
brew install enscript
brew install erlang@19
brew install erlang@20
brew install faac
brew install fdupes
brew install ffmpeg --with-faac --with-ffplay --with-fontconfig --with-freetype --with-libass --with-libvorbis --with-tools --with-x265
#brew install freetds@0.91
brew install freetds
brew install genometools --with-hmmer
brew install gdb
brew install geckodriver
brew install geos
brew install git
brew install git-flow-avh
brew install git-lfs
brew install gnome-icon-theme
brew install graphviz
brew install grip
brew install gtksourceview3
brew install handbrake
brew install htop-osx
brew install httpd
#brew install homebrew/apache/httpd22
#brew install homebrew/apache/httpd24
brew install homebrew/science/htslib
brew install httpie
brew install hub
brew install imap-uw
brew install jq
brew install libidn
brew install libmemcached
brew install libvo-aacenc
brew install libxml2
brew install maven
brew install homebrew/gui/meld
brew install makedepend
brew install mercurial
brew install mkvtoolnix
brew install mobile-shell
brew install mongodb
brew install monit
brew install mosh
brew install mp3info
brew install mp4v2
brew install mplayer
brew install mtr
brew install mycli
brew install mysql
brew install nasm
brew install ncdu
brew install ncftp
brew install nginx
brew install nvm
brew install openssl@1.1
brew install pandoc
brew install perl
brew install php@5.6 --with-debug --with-apache22 --with-homebrew-curl --with-postgresql
brew install pianobar
brew install composer
brew install postgresql --with-python
brew install postgresql@9.5
brew install postgresql@9.6
brew install pv
brew install pwgen
brew install py2cairo
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper
brew install pyenv-pip-migrate
brew install pygobject3
brew install pyside
brew install python
brew install python3
brew install qt
brew install r
brew install rabbitmq
brew install rbenv
brew install redis
brew install rlwrap
brew install ruby
brew install rust
brew install sdl
brew install shared-mime-info
brew install shellcheck
brew install smartmontools
brew install spdylay
brew install ssh-copy-id
brew install stormssh
brew install subversion
brew install swig
brew install texi2html
brew install tmux
brew install tomcat@7
brew install tree
brew install uberftp
brew install utf8proc
brew install vcftools
brew install watchman
brew install wine
brew install winetricks
brew install yarn --without-node
brew install yasm
brew install zeromq
brew install zlib

# install cask apps
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vagrant
brew cask install vagrant-manager
brew cask install bitbar
brew cask install hyper
brew cask install kdiff3
brew cask install font-fira-code
brew cask install dbeaver-community

# Remove outdated versions from the cellar.
brew cleanup
