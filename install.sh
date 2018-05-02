#!/bin/bash

ubuntu_os_type=$(uname -v)

if [[ $ubuntu_os_type =~ "Ubuntu" ]]; then
    sudo apt update
    sudo apt install -y build-essential curl zsh vim-gtk3 bat universal-ctags ripgrep silversearcher-ag tmux xsel ranger shellcheck
    sudo ln -s /usr/bin/batcat /usr/bin/bat

    # install source-code-pro font
    mkdir adobefont && cd adobefont && \
        wget -q --show-progress -O source-code-pro.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip && \
        unzip -q source-code-pro.zip -d source-code-pro && \
        fontpath="${XDG_DATA_HOME:-$HOME/.local/share}"/fonts && \
        mkdir -p "$fontpath" && \
        cp -v source-code-pro/* "$fontpath" && \
        fc-cache -f && \
        rm -rf source-code-pro{,.zip} && \
        cd ..
    rm -rf adobefont

    # map dotfiles
    rm -rf ~/dotfiles_bak &> /dev/null
    mkdir ~/dotfiles_bak &> /dev/null
    mv ~/.zshrc      ~/dotfiles_bak/zshrc &> /dev/null
    mv ~/.oh-my-zsh  ~/dotfiles_bak/oh-my-zsh &> /dev/null
    mv ~/.tmux       ~/dotfiles_bak/tmux &> /dev/null
    mv ~/.dir_colors ~/dotfiles_bak/dir_colors &> /dev/null
    mv ~/.vimrc      ~/dotfiles_bak/vimrc &> /dev/null
    mv ~/.ideavimrc  ~/dotfiles_bak/ideavimrc &> /dev/null
    mv ~/.vim        ~/dotfiles_bak/vim &> /dev/null
    mv ~/.gitconfig  ~/dotfiles_bak/gitconfig &> /dev/null
    mv ~/.tmux.conf  ~/dotfiles_bak/tmux.conf &> /dev/null
    ln -sr "$PWD/.zshrc"                         ~/.zshrc
    ln -sr "$PWD/.tmux"                          ~/.tmux
    ln -sr "$PWD/.nord-dircolors/src/dir_colors" ~/.dir_colors
    ln -sr "$PWD/.vimrc"                         ~/.vimrc
    ln -sr "$PWD/.ideavimrc"                     ~/.ideavimrc
    ln -sr "$PWD/.vim"                           ~/.vim
    ln -sr "$PWD/.gitconfig"                     ~/.gitconfig
    ln -sr "$PWD/.tmux.conf"                     ~/.tmux.conf

    # install tmux plugins
    git clone https://github.com/tmux-plugins/tpm .tmux/plugins/tpm
    tmux source .tmux.conf
    .tmux/plugins/tpm/bin/install_plugins

    # install fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git .fzf
    ./.fzf/install --key-bindings --completion --no-update-rc

    # configure ranger
    git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

    # install vim plugins
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim -e +PlugInstall +PlugInstall +PlugInstall +q +q

    # configure oh-my-zsh
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/arcticicestudio/nord-dircolors.git .nord-dircolors
    mv ~/.zshrc ~/dotfiles_bak/zshrc &> /dev/null
    ln -sr "$PWD/.zshrc" ~/.zshrc
    zsh ~/.zshrc

    # configure gnome-terminal
    git clone https://github.com/arcticicestudio/nord-gnome-terminal.git && cd nord-gnome-terminal/src && ./nord.sh && cd ../.. && rm -rf nord-gnome-terminal
    chsh -s "$(which zsh)"
    gnome-terminal --profile=Nord
fi

#Ubuntu GNOME
#0 sudo apt install -y gnome-tweaks gnome-shell-extensions gnome-shell-extension-manager ibus ibus-pinyin
#1 gnome-tweaks: CapsLock -> Ctrl
#2 gnome-extension: ibus-tweaker -> Clipboard history
#3 Settings/Language Support && im-config ibus && ibus restart && ibus-setup && -> install Intelligent Pinyin
#4 curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && nvm install --lts && npm install -g typescript
#5 git clone git@github.com:pop-os/shell.git .popos_shell -> use popshell

