#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=../lib/utils.sh
source "$SCRIPT_DIR/lib/utils.sh"

VSCODE_DEB="/tmp/vs-code.deb"

log_info "VS Code indiriliyor..."
wget -q --show-progress -L \
    'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' \
    -O "$VSCODE_DEB"

log_info "VS Code kuruluyor..."
sudo apt install "$VSCODE_DEB" -y

rm -f "$VSCODE_DEB"
log_success "VS Code kuruldu."
