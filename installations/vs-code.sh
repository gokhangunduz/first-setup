#!/bin/bash

sudo wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O ./vs-code.deb
sudo apt install ./vs-code.deb -y