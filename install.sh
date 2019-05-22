#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y git
sudo apt-get install rename
sudo apt-get install -y python3-pip
sudo snap install -y --classic go
# sudo apt-get install golang-go

apt install -y python-pip
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev

#Don't forget to set up AWS credentials!
echo "Don't forget to set up AWS credentials!"
apt install -y awscli
echo "Don't forget to set up AWS credentials!"

sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools

# create a tools folder in ~/
mkdir ~/tools
cd ~/tools/

#------------------------*/
# New targets discovery
#------------------------*/
echo "installing amass"
sudo snap install amass
cd ~/tools/
echo "done"

echo "installing subfinder"
go get github.com/subfinder/subfinder
cd ~/tools/
echo "done"

#------------------------*/
# Subdomain brute forcing
#------------------------*/
echo "installing gobuster"
go get github.com/OJ/gobuster
cd ~/tools/
echo "done"

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns
cd massdns
make
cd ~/tools/
echo "done"

#------------------------*/
# Port scanning
#------------------------*/
echo "installing massdns"
git clone https://github.com/blechschmidt/massdns
cd massdns
make
cd ~/tools/
echo "done"

echo "installing nmap"
sudo apt-get install nmap
echo "done"

echo "installing brutespray"
git clone https://github.com/x90skysn3k/brutespray
cd brutespray
pip install -r requirements.txt
echo "done"

echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
echo "One last time: don't forget to set up AWS credentials in ~/.aws/!"
