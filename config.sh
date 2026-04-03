#!/bin/bash
# config.sh — Kullanıcı ayarları
#
# Bu dosyadaki değerleri değiştirerek setup.sh davranışını özelleştirebilirsiniz.
# Env variable ile de override edilebilir, örneğin:
#   GIT_USER_EMAIL="other@mail.com" ./setup.sh

# Hangi kullanıcı için settings.sh çalıştırılacak
SETUP_USER="${SETUP_USER:-gokhangunduz}"

# Git yapılandırması
GIT_USER_NAME="${GIT_USER_NAME:-gokhangunduz}"
GIT_USER_EMAIL="${GIT_USER_EMAIL:-me@gokhangunduz.dev}"
GIT_DEFAULT_BRANCH="${GIT_DEFAULT_BRANCH:-main}"

# GNOME masaüstü ayarları
GNOME_DOCK_POSITION="${GNOME_DOCK_POSITION:-RIGHT}"
GNOME_ICON_SIZE="${GNOME_ICON_SIZE:-30}"
GNOME_THEME="${GNOME_THEME:-Yaru-dark}"
