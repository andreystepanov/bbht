#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y git
sudo apt-get install rename
sudo apt-get install -y python3-pip
# sudo snap install -y --classic go

mkdir ~/go
export GOPATH=$HOME/go
sudo apt-get install golang-go

apt install -y python-pip
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev

# Don't forget to set up AWS credentials!
echo "Don't forget to set up AWS credentials!"
apt install -y awscli

sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools

sources_path=${HOME}/sources/
lists_path=${HOME}/lists/
tools_path=${HOME}/tools/
aws_path=${HOME}/.aws/

# create sources folder in ~/
mkdir ${sources_path}
cd ${sources_path}

# create a lists folder in ~/
mkdir ${lists_path}

# create a tools folder in ~/
mkdir ${lists_path}
# cd ${sources_path}

#------------------------*/
# New targets discovery
#------------------------*/
echo "installing amass"
sudo snap install amass
# cd ${sources_path}
echo "done"

echo "installing subfinder"
git clone https://github.com/subfinder/subfinder
cd subfinder
go build
mv ./subfinder ${tools_path}
cd ${sources_path}
echo "done"

#------------------------*/
# Subdomain brute forcing
#------------------------*/
echo "installing gobuster"
got clone https://github.com/OJ/gobuster gobuster
cd gobuster
go get && go build
mv ./gobuster ${tools_path}
cd {$sources_path}
echo "done"

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns
cd massdns
make
mv bin/massdns ${tools_path}
mv scripts/ ${tools_path}massdns-scripts
cd ${sources_path}
echo "done"

#------------------------*/
# Port scanning
#------------------------*/
echo "installing masscan"
git clone https://github.com/robertdavidgraham/masscan
cd massdns
make -j
mv bin/masscan ${tools_path}
cd ${sources_path}
echo "done"

echo "installing nmap"
sudo apt-get install nmap
echo "done"

echo "installing brutespray"
git clone https://github.com/x90skysn3k/brutespray
cd brutespray
pip install -r requirements.txt
mv brutespray.py ${tools_path}
mv wordlist/ ${lists_path}brutespray
cd ${sources_path}
echo "done"

#------------------------*/
# Screenshoting tools
#------------------------*/
echo "installing chromium"
sudo apt-get install chromium-browser
echo "done"

echo "installing aquatone"
git clone https://github.com/michenriksen/aquatone
cd aquatone
go get
GOOS=linux GOARCH=amd64 go build -o aquatone
mv ./aquatone ${tools_path}
cd ${sources_path}
echo "done"

echo "installing eyewitness"
git clone https://github.com/FortyNorthSecurity/EyeWitness
cd EyeWitness
./setup/setup.sh
mv ${sources_path}EyeWitness ${tools_path}

#------------------------*/
# Word lists
#------------------------*/
echo "downloading lists"
cd ${lists_path}

echo "downloading SecLists"
git clone https://github.com/danielmiessler/SecLists

echo "downloading RobotsDisallowed"
git clone https://github.com/danielmiessler/RobotsDisallowed

echo "downloading CommonSpeak"
git clone https://github.com/assetnote/commonspeak2-wordlists

echo "downloading all.txt"
curl -O https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt
echo "done"

echo "cleaning up"
rm -rf ${sources_path}
echo "done"

echo -e "\n\n\n\n\n"
echo "--------------------------------------------"
echo "Done! All tools are set up in ${tools_path}"
echo "--------------------------------------------"
# echo -e "\n\n\n\n\n"

cd ${tools_path}
ls -la

# echo -e "\n\n\n\n\n"
echo "--------------------------------------------"
echo "One last thing: don't forget to set up AWS credentials in ${aws_path}!"
echo "--------------------------------------------"
