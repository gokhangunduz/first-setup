#!/bin/bash

sudo apt install git

prev_user=$(who | awk 'NR==1{print $1}')

if [ "$prev_user" == "gokhangunduz" ]; then
    git config --global user.name "gokhangunduz"
    git config --global user.email me@gokhangunduz.com.tr
    git config --global init.defaultBranch main
    git config --global color.ui true

    echo "Git configuration set for user: gokhangunduz"
else
    echo "Git configuration not set. Previous user is not gokhangunduz."
fi