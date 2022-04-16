# dotfiles

## Install

### Ubuntu

```sh
sudo apt-get update
sudo apt-get upgrade
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update

sudo apt-get install \
    build-essential \
    clang \
    cmake \
    curl \
    dirmngr \
    fd-find \
    fzf \
    g++ \
    gawk \
    git \
    gitk \
    gpg \
    htop \
    iotop \
    jq \
    libasound2-dev \
    libssl-dev \
    libstdc++-10-dev \
    libudev-dev \
    libwayland-dev \
    libx11-dev \
    libxkbcommon-dev \
    libxxhash-dev \
    neovim \
    nodejs \
    npm \
    pkg-config \
    python-dev \
    python3-dev \
    python3-pip \
    software-properties-common \
    subversion \
    yarn \
    zip \
    zlib1g-dev \
    zsh

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

BINDIR=$HOME/.local/bin sh -c "$(curl -fsLS chezmoi.io/get)"
chezmoi init gh_personal:emersonmx/dotfiles.git

ln -sf /usr/bin/fdfind $HOME/.local/bin/fd

env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

mkdir -p $HOME/.local/{bin,share}

mkdir -p $HOME/.config/zsh
git clone https://github.com/asdf-vm/asdf.git $HOME/.local/share/asdf
git clone https://github.com/changyuheng/zsh-interactive-cd.git $HOME/.config/zsh/zsh-interactive-cd.git
git clone https://github.com/emersonmx/zsh-plugins.git $HOME/.config/zsh/zsh-plugins.git
git clone https://github.com/jeffreytse/zsh-vi-mode.git $HOME/.config/zsh/zsh-vi-mode.git
git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.config/zsh/ohmyzsh.git
git clone https://github.com/romkatv/powerlevel10k.git $HOME/.config/zsh/powerlevel10k.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.config/zsh/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-history-substring-search.git $HOME/.config/zsh/zsh-history-substring-search.git

asdf plugin add golang
asdf plugin add nodejs
asdf plugin add python
asdf plugin add rust

asdf global golang latest
asdf global nodejs latest
asdf global python latest
asdf global rust latest

asdf reshim golang latest
asdf reshim nodejs latest
asdf reshim python latest
asdf reshim rust latest

rm -rf /tmp/mold
git clone https://github.com/rui314/mold.git /tmp/mold
pushd /tmp
git checkout v1.2.0
make -j$(nproc) CXX=clang++
sudo make install
popd

cargo install \
    sccache \
    tealdeer \
    cargo-update \

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
```

### Arch

```sh
yay -S asdf-vm base-devel bash-completion bat chezmoi clang cmake direnv exa fd
fzf git htop httpie iotop jq lf-bin man man-db man-pages mlocate mold npm
oh-my-zsh-git pacman-contrib python reflector ripgrep rsync sccache subversion
tealdeer texinfo tk tmux tmuxp unixodbc unzip util-linux wmctrl xclip xdotool
yarn yay-bin zip zsh zsh-autosuggestions zsh-completions
zsh-history-substring-search zsh-theme-powerlevel10k zsh-vi-mode
```
