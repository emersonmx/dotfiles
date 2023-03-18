# dotfiles

## Ubuntu

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
    lld \
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
chezmoi apply

ln -sf /usr/bin/fdfind $HOME/.local/bin/fd
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

rm -rf /tmp/mold
git clone https://github.com/rui314/mold.git /tmp/mold
pushd /tmp
git checkout v1.2.1
make -j$(nproc) CXX=clang++
sudo make install
popd
```

## Setup `.local`

```sh
mkdir -p $HOME/.local/{bin,share}
```

## Setup `.ssh`

```sh
mkdir ~/.ssh
mkdir ~/.ssh/sockets
chmod 700 -R ~/.ssh
touch ~/.ssh/config
chmod 600 -R ~/.ssh/config
touch ~/.ssh/example{,.pub}
chmod 600 -R ~/.ssh/example*
```

### Config

```sh
Host * !bitbucket
    ControlMaster auto
    ControlPersist yes
    Compression yes
    ServerAliveInterval 120

Host example
    HostName github.com
    User git
    IdentityFile ~/.ssh/example
    ControlPath ~/.ssh/sockets/example
    IdentitiesOnly yes

Host *
    ControlPath ~/.ssh/sockets/socket-%C
```

## ZSH

[Changing your default shell](https://wiki.archlinux.org/title/Command-line_shell#Changing_your_default_shell)

```sh
mkdir -p $HOME/.config/zsh

# Ubuntu
git clone https://github.com/jeffreytse/zsh-vi-mode.git $HOME/.config/zsh/zsh-vi-mode
git clone https://github.com/romkatv/powerlevel10k.git $HOME/.config/zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search.git $HOME/.config/zsh/zsh-history-substring-search

# Ubuntu and Arch
git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.config/zsh/ohmyzsh
git clone https://github.com/emersonmx/zsh-plugins.git $HOME/.config/zsh/zsh-plugins
git clone https://github.com/changyuheng/zsh-interactive-cd.git $HOME/.config/zsh/zsh-interactive-cd
```

## asdf

```sh
git clone https://github.com/asdf-vm/asdf.git $HOME/.local/share/asdf

for l in golang nodejs python rust lua
do
    asdf plugin add "$l"
    asdf install "$l" latest
    asdf global "$l" latest system
    asdf reshim "$l" latest
done

# run asdf.py [https://github.com/emersonmx/scripts/blob/main/arch/updater/asdf.py]
```

## WSL

```sh
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
    bat \
    bottom \
    chezmoi \
    clang \
    cmake \
    coreutils \
    curl \
    direnv \
    entr \
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
    lld \
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
    procs \
    pulseaudio-alsa \
    python \
    python-pip \
    rancher-k3d-bin \
    reflector \
    ripgrep \
    rsync \
    sccache \
    sd \
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
    vi \
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
