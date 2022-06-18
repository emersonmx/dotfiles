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
    coreutils \
    curl \
    dirmngr \
    exa \
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
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libstdc++-10-dev \
    libudev-dev \
    libwayland-dev \
    libx11-dev \
    libxkbcommon-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libxxhash-dev \
    llvm \
    make \
    neovim \
    nodejs \
    pkg-config \
    python3 \
    python3-dev \
    python3-pip \
    ripgrep \
    software-properties-common \
    sqlite3 \
    subversion \
    tk-dev \
    wget \
    xdg-utils \
    xz-utils \
    yarn \
    zip \
    zlib1g-dev \
    zsh

BINDIR=$HOME/.local/bin sh -c "$(curl -fsLS chezmoi.io/get)"
chezmoi init gh_personal:emersonmx/dotfiles.git

ln -sf /usr/bin/fdfind $HOME/.local/bin/fd

mkdir -p $HOME/.local/{bin,share}

mkdir -p $HOME/.config/zsh
git clone https://github.com/asdf-vm/asdf.git $HOME/.local/share/asdf
git clone https://github.com/changyuheng/zsh-interactive-cd.git $HOME/.config/zsh/zsh-interactive-cd
git clone https://github.com/emersonmx/zsh-plugins.git $HOME/.config/zsh/zsh-plugins
git clone https://github.com/jeffreytse/zsh-vi-mode.git $HOME/.config/zsh/zsh-vi-mode
git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.config/zsh/ohmyzsh
git clone https://github.com/romkatv/powerlevel10k.git $HOME/.config/zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search.git $HOME/.config/zsh/zsh-history-substring-search

asdf plugin add golang
asdf plugin add nodejs
asdf plugin add python
asdf plugin add rust

asdf install golang latest
asdf install nodejs latest
asdf install python latest
asdf install rust latest

asdf global golang latest
asdf global nodejs latest
asdf global python latest
asdf global rust latest

asdf reshim golang latest
asdf reshim nodejs latest
asdf reshim python latest
asdf reshim rust latest

env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

rm -rf /tmp/mold
git clone https://github.com/rui314/mold.git /tmp/mold
pushd /tmp
git checkout v1.2.1
make -j$(nproc) CXX=clang++
sudo make install
popd

cargo install \
    sccache \
    tealdeer

LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)

# WSL
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
```

### Arch

```sh
# as root
passwd # root pass

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash {username}
passwd {username}
exit

# as user
sudo pacman-key --init
sudo pacman-key --populate

sudo vim /etc/pacman.conf
sudo vim /etc/pacman.d/mirrorlist
sudo vim /etc/locale.gen
sudo vim /etc/locale.conf
sudo locale-gen

sudo pacman -Syu archlinux-keyring base base-devel

cd /tmp
curl -LO https://aur.archlinux.org/cgit/aur.git/snapshot/yay-bin.tar.gz
tar xvf yay-bin.tar.gz
cd yay-bin
makepkg -si

yay -S \
    asdf-vm \
    bat \
    chezmoi \
    clang \
    cmake \
    coreutils \
    curl \
    direnv \
    exa \
    fd \
    fzf \
    git \
    helm \
    htop \
    httpie \
    iotop \
    jq \
    lf-bin \
    man-db \
    man-pages \
    man-pages-pt_br \
    mingw-w64-gcc \
    mold \
    neovim \
    ninja \
    nodejs \
    npm \
    oh-my-zsh-git \
    openssh \
    openssl \
    pacman-contrib \
    pulseaudio-alsa \
    python \
    python-pip \
    rancher-k3d-bin \
    reflector \
    ripgrep \
    rsync \
    sccache \
    sqlite \
    subversion \
    tealdeer \
    terraform \
    tk \
    tmux \
    tmuxp \
    ttf-dejavu \
    ttf-meslo-nerd-font-powerlevel10k \
    unzip \
    util-linux \
    vulkan-swrast \
    wmctrl \
    xclip \
    xdg-utils \
    xdotool \
    xz \
    yarn \
    zip \
    zlib \
    zsh \
    zsh-autosuggestions \
    zsh-completions \
    zsh-history-substring-search \
    zsh-theme-powerlevel10k-git \
    zsh-vi-mode \
    && :
```
