#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=../lib/utils.sh
source "$SCRIPT_DIR/lib/utils.sh"

NVM_VERSION="v0.40.1"

log_info "nvm ${NVM_VERSION} kuruluyor..."
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" | bash

# Mevcut oturumda nvm'i aktifleştir
export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

log_info "Node.js LTS kuruluyor..."
nvm install --lts
nvm use --lts
nvm alias default "lts/*"

log_success "Node.js $(node --version) kuruldu (nvm ile)"
log_info "Yeni terminallerde nvm otomatik olarak aktif olacak."
