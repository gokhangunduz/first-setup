#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./config.sh
source "$SCRIPT_DIR/config.sh"
# shellcheck source=./lib/utils.sh
source "$SCRIPT_DIR/lib/utils.sh"

log_info "Masaüstü ayarları uygulanıyor..."

# Dock
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "$GNOME_DOCK_POSITION"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size "$GNOME_ICON_SIZE"
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'small'

# Masaüstü
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Tema
gsettings set org.gnome.desktop.interface gtk-theme "$GNOME_THEME"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# GNOME shell yeniden başlatma (sadece X11'de güvenli)
if [ "${XDG_SESSION_TYPE:-}" = "x11" ]; then
    log_info "GNOME shell yeniden başlatılıyor..."
    nohup gnome-shell --replace &>/dev/null &
else
    log_warn "Wayland oturumu algılandı — değişikliklerin aktif olması için oturumu kapatıp açın."
fi

log_success "Masaüstü ayarları uygulandı."
