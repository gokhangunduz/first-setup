#!/bin/bash

sudo wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O ./vscode.deb
sudo apt install ./vscode.deb -y