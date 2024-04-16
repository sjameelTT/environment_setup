#!/usr/bin/env bash
dir=$PWD

# install oh my zsh and activate it
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc

# add zsh-autosuggestions, syntax highlighting
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# add autojump
cd $(dir)
git clone git://github.com/wting/autojump.git
cd autojump
./install.py

# add fzf-zsh plugin and powerlevel10k
git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# copy over .zshrc and reload it, it will configure powerlevel10k
cd $(dir)
cp ./.zshrc ~
omz reload

# start tmux session, install tpm and add/reload tmux configuration
tmux new
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd $(dir)
cp ./.tmux.conf ~
tmux source ~/.tmux.conf

# install cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install helix
cd $(dir)
git clone https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term --locked
cp config.toml ~/.config/helix/config.toml

# install delta and config git
cargo install git-delta
cp ./.gitconfig ~

# install eza
cargo install eza

# install ripgrep
cargo install ripgrep

# install bat
cargo install --locked bat

# install fdfind
cargo install fd-find
