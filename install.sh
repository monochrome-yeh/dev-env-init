#!/usr/bin/env bash    
ITERM2="$HOME/Library/Preferences/com.googlecode.iterm2.plist"


# Set iterm2 config
if [[ -fs $ITERM2 ]]; then
    rm $ITERM2
else
    echo $ITERM2
    ln -s com.googlecode.iterm2.plist $ITERM2
fi


# install fonts
if [ ! -d "./fonts" ]; then
    # clone
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
fi

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

# Homebrew
if [ ! -e "/usr/local/bin/brew" ]
    xcode-select --install
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Link
if [ -f "$HOME/.bashrc" ]; then
    rm -f "$HOME/.bashrc"
fi
if [ -f "$HOME/.zshrc" ]; then
    rm -f "$HOME/.zshrc"
fi

ln -S .bashrc "$HOME"
ln -S .zshrc "$HOME"

source ~/.bashrc