#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=../lib/utils.sh
source "$SCRIPT_DIR/lib/utils.sh"

CHROME_DEB="/tmp/google-chrome.deb"

log_info "Google Chrome indiriliyor..."
wget -q --show-progress \
    'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' \
    -O "$CHROME_DEB"

log_info "Google Chrome kuruluyor..."
sudo apt install "$CHROME_DEB" -y

rm -f "$CHROME_DEB"
log_success "Google Chrome kuruldu."
