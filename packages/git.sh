#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=../lib/utils.sh
source "$SCRIPT_DIR/lib/utils.sh"
# shellcheck source=../config.sh
source "$SCRIPT_DIR/config.sh"

log_info "Git kuruluyor..."
sudo apt install git -y

log_info "Git yapılandırılıyor..."
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git config --global init.defaultBranch "$GIT_DEFAULT_BRANCH"
git config --global color.ui true

log_success "Git kuruldu ve yapılandırıldı: $GIT_USER_NAME <$GIT_USER_EMAIL>"
