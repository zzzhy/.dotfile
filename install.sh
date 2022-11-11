ME=`whoami`
OH_MY_ZSH="/Users/$ME/.oh-my-zsh/"
if [ ! -d "$OH_MY_ZSH" ] ;then
  # 安装ohmyzsh
  echo "安装oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -f "/usr/local/bin/brew" ] ;then
  # 安装homebrew
  echo "安装homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# 安装软件
brew bundle

VUNDLE="/Users/$ME/.vim/bundle/Vundle.vim"
if [ ! -d "$VUNDLE" ] ;then
  # 安装vim vundle
  echo "安装vim vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cp -f .vimrc $HOME/
cp -f .zshrc $HOME/
cp -f reset-ide.sh $HOME/
cp -f .functions $HOME/

# 安装vim插件
vim +PluginInstall +qall 
