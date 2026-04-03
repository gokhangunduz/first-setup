#!/bin/bash

set -Eeo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="/tmp/first-setup.log"
DRY_RUN=false

for arg in "$@"; do
    case $arg in
        --dry-run) DRY_RUN=true ;;
        *) ;;
    esac
done

# shellcheck source=./config.sh
source "$SCRIPT_DIR/config.sh"
# shellcheck source=./lib/utils.sh
source "$SCRIPT_DIR/lib/utils.sh"

trap 'log_error "Beklenmeyen hata: satır $LINENO. Detaylar: $LOG_FILE"' ERR

# ─── Fonksiyonlar ────────────────────────────────────────────────────────────

install_app() {
    local app="$1"
    local script="$SCRIPT_DIR/packages/$app.sh"

    if [ ! -f "$script" ]; then
        log_error "Paket scripti bulunamadı: $script"
        return 1
    fi

    chmod +x "$script"

    if [ "$DRY_RUN" = true ]; then
        log_info "[dry-run] Kurulacak: $app"
        return 0
    fi

    log_info "Kuruluyor: $app..."
    if bash "$script" >> "$LOG_FILE" 2>&1; then
        log_success "$app kuruldu"
    else
        log_error "$app kurulamadı — bkz: $LOG_FILE"
        return 1
    fi
}

show_menu() {
    local packages=()
    for file in "$SCRIPT_DIR/packages/"*.sh; do
        [ -e "$file" ] || continue
        packages+=("$(basename "$file" .sh)")
    done

    >&2 printf '\nMevcut paketler:\n'
    >&2 printf -- '----------------\n'
    for i in "${!packages[@]}"; do
        >&2 printf '  [%d] %s\n' "$((i + 1))" "${packages[$i]}"
    done
    >&2 printf '\nKurulacak paket numaralarını girin (örn: 1 3 4) veya "all":\n> '
    read -r selection

    if [ "$selection" = "all" ]; then
        printf '%s\n' "${packages[@]}"
        return
    fi

    for num in $selection; do
        if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -ge 1 ] && [ "$num" -le "${#packages[@]}" ]; then
            echo "${packages[$((num - 1))]}"
        else
            log_warn "Geçersiz seçim '$num' atlandı"
        fi
    done
}

# ─── Ana Akış ────────────────────────────────────────────────────────────────

: > "$LOG_FILE"
log_info "first-setup başlıyor... (log → $LOG_FILE)"

if [ "$DRY_RUN" = true ]; then
    log_warn "Dry-run modu aktif — hiçbir paket kurulmayacak"
else
    require_sudo
    log_info "Paket listesi güncelleniyor..."
    sudo apt update >> "$LOG_FILE" 2>&1
    sudo apt install curl wget -y >> "$LOG_FILE" 2>&1
fi

mapfile -t selected_apps < <(show_menu)

if [ "${#selected_apps[@]}" -eq 0 ]; then
    log_error "Hiç paket seçilmedi. Çıkılıyor."
    exit 1
fi

log_info "Seçilen paketler: ${selected_apps[*]}"

for app in "${selected_apps[@]}"; do
    install_app "$app"
done

if [ "$DRY_RUN" = false ] && [ "$(who | awk 'NR==1{print $1}')" = "$SETUP_USER" ]; then
    log_info "Masaüstü ayarları uygulanıyor..."
    bash "$SCRIPT_DIR/settings.sh" >> "$LOG_FILE" 2>&1
fi

log_success "Tamamlandı!"
