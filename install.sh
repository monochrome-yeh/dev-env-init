#!/usr/bin/env bash    
ITERM2="$HOME/Library/Preferences/com.googlecode.iterm2.plist"


# Set iterm2 config
if [ -L $ITERM2 ] || [ -f $ITERM2 ]; then
    rm -f "$ITERM2"
fi
ln -s "$PWD/com.googlecode.iterm2.plist" $ITERM2

# install fonts
if [ ! -d "./fonts" ]; then
    # clone
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
fi

# NVM
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
fi


# Homebrew
if [ ! -L "/usr/local/bin/brew" ]; then
    xcode-select --install
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install
fi

# Link
if [ -f "$HOME/.bashrc" ] || [ -L "$HOME/.bashrc" ]; then
    rm -f "$HOME/.bashrc"
fi
if [ -f "$HOME/.zshrc" ] || [ -L "$HOME/.zshrc" ]; then
    rm -f "$HOME/.zshrc"
fi

ln -s "$PWD/.bashrc" "$HOME/.bashrc"
ln -s "$PWD/.zshrc" "$HOME/.zshrc"

source ~/.bashrc