
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fzf vim adoptopenjdk/openjdk/adoptopenjdk8 clashx jietu karabiner-elements mark-text openinterminal 
brew install autojump ffsend git minikube node neovim tree tmux tldr telnet wget zsh-syntax-highlighting

cp -y .vimrc $HOME/
cp -y .zshrc $HOME/
cp -y reset-ide.sh $HOME/