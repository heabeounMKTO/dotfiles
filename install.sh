#! /usr/bin/bash

apt-get install ninja-build gettext cmake unzip curl git
git clone https://github.com/neovim/neovim
cd neovim 
git checkout main
make CMAKE_BUILD_TYPE=Release
make install
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)


apt install tmux
cp .tmux.conf ~/
cp .zshrc


