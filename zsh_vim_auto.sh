# /bin/bash
cd ~
echo "Will install vim git zsh curl fzy!"
sudo apt update
sudo apt upgrade
sudo apt install vim git zsh curl wget autojump fzy
echo "Install oh my zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 安装vim-plug、zplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# 下载配置好的.zshrc、.vimrc
curl -fLo .vimrc https://github.com/yangp1205/auto_zsh_vim/raw/master/vimrc
curl -fLo .zshrc https://github.com/yangp1205/auto_zsh_vim/raw/master/zshrc

# 安装zplug
source  ~/.zshrc
zplug install
zplug update

# 安装vim-plug
vim 
:PlugInstall

echo "Success"




