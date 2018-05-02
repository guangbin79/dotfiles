#!/bin/bash

ln -s $(pwd)/.zshrc            ~/.zshrc
ln -s $(pwd)/.oh-my-zsh        ~/.oh-my-zsh
ln -s $(pwd)/.vimrc            ~/.vimrc
ln -s $(pwd)/.vim              ~/.vim
ln -s $(pwd)/.gitconfig        ~/.gitconfig

os_type=`uname -v`

if [[ $os_type =~ "Darwin" ]]; then
    #macOS
    # Check for Homebrew and install if we don't have it
    if test ! $(which brew); then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew update
    brew install vim the_silver_searcher fzf highlight cmake
    brew install --HEAD universal-ctags/universal-ctags/universal-ctags
    git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-completions .oh-my-zsh/custom/plugins/zsh-completions
    git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
    vim -e +PluginInstall +q +q
    chsh -s $(which zsh)
    /usr/local/opt/fzf/install
    git clone https://github.com/guangbin79/macism.git && cd macism && swiftc macism.swift
    cd .. && mv macism/macism .vim/bundle/vim-macos-ime/ && rm -rf macism
elif [[ $os_type =~ "Ubuntu" ]]; then
    #Ubuntu-16.04-64bit
    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt update
    sudo apt install zsh vim silversearcher-ag highlight ctags
    sudo git clone --depth 1 https://github.com/junegunn/fzf.git /usr/local/opt/fzf
    sudo /usr/local/opt/fzf/install --key-bindings --completion --no-update-rc
    git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-completions .oh-my-zsh/custom/plugins/zsh-completions
    git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
    vim -e +PluginInstall +q +q
    chsh -s /bin/zsh
fi
