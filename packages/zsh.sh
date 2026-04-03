#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=../lib/utils.sh
source "$SCRIPT_DIR/lib/utils.sh"

log_info "zsh kuruluyor..."
sudo apt install zsh -y

log_info "oh-my-zsh kuruluyor..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

log_info "zsh-autosuggestions kuruluyor..."
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
else
    log_warn "zsh-autosuggestions zaten kurulu, atlanıyor"
fi

log_info "zsh-syntax-highlighting kuruluyor..."
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting \
        "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
else
    log_warn "zsh-syntax-highlighting zaten kurulu, atlanıyor"
fi

log_info ".zshrc'de plugin'ler aktifleştiriliyor..."
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' "$HOME/.zshrc"

log_info "Varsayılan shell zsh olarak ayarlanıyor..."
chsh -s "$(which zsh)"

log_success "zsh ve oh-my-zsh kuruldu. Terminali yeniden başlatın."
