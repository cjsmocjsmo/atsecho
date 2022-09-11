#!/bin/sh


sudo apt-get update && \
sudo apt-get -y dist-upgrade && \
sudo apt-get -y autoclean && \ 
sudo apt-get -y autoremove && \
sudo apt-get -y install git systemctl nano && \

sudo cp -pvr atsecho.service /etc/systemd/system/ && \

sudo systemclt enable atsecho && \
sudo systemctl daemon-reload && \
sudo systemctl start atsecho
