#!/bin/bash

## 需要下载的文件和程序文件
download_File(){
    cd ~ 
    # 安装vim-plug、zplug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    # 下载配置好的.zshrc、.vimrc
    curl -fLo .vimrc https://github.com/yangp1205/auto_zsh_vim/raw/master/vimrc   
    curl -fLo .zshrc https://github.com/yangp1205/auto_zsh_vim/raw/master/zshrc
    
    echo "Download Success"
}

## 安装应用
apt_install(){
    echo "Will install vim git zsh curl fzy!"
    sudo apt update && sudo apt upgrade && sudo apt install vim git zsh curl wget autojump fzy python3-pip
}

## python3虚拟环境和autopep8
config_env_python3(){
    pip3 install virtualenv virtualenvwrapper autopep8
}

## 安装oh-my-zsh
oh_my_zsh(){
    echo "Install oh my zsh vim-plug zplug powerlevel10k" 
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}


