#!/bin/bash

echo "System is preparing..."

# Dock
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 30
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'small'

# Desktop
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Theme
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gnome-shell --replace

echo "All done!"