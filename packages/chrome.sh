#!/bin/bash

sudo wget 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' -O ./chrome.deb 
sudo apt install ./chrome.deb -y
sudo rm ./chrome.deb