#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=../lib/utils.sh
source "$SCRIPT_DIR/lib/utils.sh"

export DEBIAN_FRONTEND=noninteractive

log_info "Docker bağımlılıkları kuruluyor..."
sudo apt-get install ca-certificates curl gnupg -y

log_info "Docker GPG anahtarı ekleniyor..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
    | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

log_info "Docker deposu ekleniyor..."
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

log_info "Docker kuruluyor..."
sudo apt-get install \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin \
    -y

log_info "Kullanıcı docker grubuna ekleniyor..."
sudo usermod -aG docker "$USER"

log_success "Docker kuruldu. 'docker compose version' ile doğrulayabilirsiniz."
log_warn "Grup değişikliğinin aktif olması için yeniden giriş yapın."
