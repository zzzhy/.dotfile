# 安装ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 安装homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# 安装软件
brew bundle
# 安装vim vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp -f .vimrc $HOME/
cp -f .zshrc $HOME/
cp -f reset-ide.sh $HOME/
cp -f .functions $HOME/

# 安装vim插件
vim +PluginInstall +qall 
