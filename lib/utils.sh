#!/bin/bash
# lib/utils.sh — Ortak yardımcı fonksiyonlar

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info()    { echo -e "${BLUE}[INFO]${NC}  $*" >&2; }
log_success() { echo -e "${GREEN}[OK]${NC}    $*" >&2; }
log_warn()    { echo -e "${YELLOW}[WARN]${NC}  $*" >&2; }
log_error()   { echo -e "${RED}[ERROR]${NC} $*" >&2; }

require_sudo() {
    if ! sudo -n true 2>/dev/null; then
        log_error "Bu script sudo yetkisi gerektiriyor."
        exit 1
    fi
}

is_installed() {
    dpkg -l "$1" &>/dev/null
}

check_command() {
    command -v "$1" &>/dev/null
}
