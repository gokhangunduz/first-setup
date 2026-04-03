#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=../lib/utils.sh
source "$SCRIPT_DIR/lib/utils.sh"

log_info "Remmina kuruluyor..."
sudo snap install remmina
log_success "Remmina kuruldu."
