
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp -f .vimrc $HOME/
cp -f .zshrc $HOME/
cp -f reset-ide.sh $HOME/
cp -f .functions $HOME/

brew bundle
