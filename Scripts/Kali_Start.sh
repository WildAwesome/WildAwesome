#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

sudo apt update && sudo apt upgrade -y
echo -e "${GREEN}Unzipping rockyou${ENDCOLOR}"
sudo gunzip /usr/share/wordlists/rockyou.txt.gz
echo -e "${GREEN}installing rlwrap${ENDCOLOR}"
sudo apt install rlwrap -y
echo "Installing Docker"
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list 
  curl -fsSL https://download.docker.com/linux/debian/gpg |
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
echo -e "${GREEN}Installing remmina${ENDCOLOR}"
echo ""
sudo apt install remmina -y
echo -e "${RED}Installing Sublime Text${ENDCOLOR}"
echo ""
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update -y
sudo apt-get install sublime-text -y
echo -e "${GREEN}Installing Rustscan${ENDCOLOR}"
echo ""
wget https://github.com/RustScan/RustScan/releases/download/2.2.3/rustscan_2.2.3_amd64.deb
sudo dpkg -i rustscan_2.2.3_amd64.deb
echo -e "${RED}Installing AD Suite${ENDCOLOR}"
echo ""
wget https://github.com/toneemarqus/AD-Suit/blob/main/adsuit-1.0.deb
sudo dpkg -i adsuit-1.0.deb
#echo "uninstalling crackmapexec"
#sudo apt remove crackmapexec -y
echo ""
sudo apt install pipx -y
echo -e "${GREEN}Installing netexec with pipx${ENDCOLOR}"
echo ""
git clone https://github.com/Pennyw0rth/NetExec.git
cd netexec
pipx install . -y
echo -e "${RED}Installing Terminator${ENDCOLOR}"
echo ""
sudo apt install terminator -y
echo "putting crackeverything into /usr/local/bin"
mkdir ScriptDLs && cd ScriptDLs
wget https://raw.githubusercontent.com/overgrowncarrot1/CrackEverything6/main/CrackEverything6.py
mv CrackEverything6.py /usr/local/bin
echo "getting scripts and putting into scripts directory"
git clone https://github.com/overgrowncarrot1/Scripts.git
echo "SMB Ghost"
git clone https://github.com/Barriuso/SMBGhost_AutomateExploitation.git
echo "Auto Eternal Blue"
git clone https://github.com/3ndG4me/AutoBlue-MS17-010.git
echo "getting tools and putting into tools directory"
git clone https://github.com/overgrowncarrot1/Tools.git
echo "Grabbing the static binary for nmap"
cd Tools
wget https://github.com/andrew-d/static-binaries/blob/master/binaries/linux/x86_64/nmap
echo "Grabbing Ligolo"
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.5.2/ligolo-ng_agent_0.5.2_linux_arm64.tar.gz
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.5.2/ligolo-ng_proxy_0.5.2_linux_amd64.tar.gz
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.5.2/ligolo-ng_agent_0.5.2_windows_amd64.zip
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.5.2/ligolo-ng_proxy_0.5.2_windows_amd64.zip
cd ..
echo "Grabbing Tyler's Scripts"
git clone https://github.com/TeneBrae93/offensivesecurity.git
cd offensivesecurity
mv * /usr/local/bin
cd ..
echo "GTFONow"
git clone https://github.com/Frissi0n/GTFONow.git
cd GTFONow/gtfonow
mv gtfonow.py /usr/local/bin 
cd ..
cd ..
echo "installing impacket shutdownrepo"
git clone https://github.com/overgrowncarrot1/ShutDownRepo_Tools.git
cd ShutDownRepo_Tools/dacledit
pipx install . --force
cd /usr/local/bin
echo "installing owneredit"
wget https://raw.githubusercontent.com/ShutdownRepo/impacket/owneredit/examples/owneredit.py
echo "installing targeted kerberoast.py"
wget https://raw.githubusercontent.com/ShutdownRepo/targetedKerberoast/main/targetedKerberoast.py
echo "installing pywhisker"
wget https://raw.githubusercontent.com/ShutdownRepo/pywhisker/main/pywhisker.py
echo "installing pkinit toolkit"
wget https://raw.githubusercontent.com/dirkjanm/PKINITtools/master/getnthash.py
wget https://raw.githubusercontent.com/dirkjanm/PKINITtools/master/gets4uticket.py
wget https://raw.githubusercontent.com/dirkjanm/PKINITtools/master/gettgtpkinit.py
echo "fixing oscrypto problem"
pip uninstall oscrypto -y 
pipx install git+https://github.com/wbond/oscrypto.git
pipx install impacket minikerberos --force
sudo updatedb
echo "installing flameshot"
sudo apt install flameshot -y
cd /usr/local/bin
wget https://raw.githubusercontent.com/overgrowncarrot1/ShutDownRepo_Tools/main/dacledit/examples/dacledit.py
chmod +x dacledit.py
echo "fixing msada_guids"
wget https://raw.githubusercontent.com/byt3bl33d3r/CrackMapExec/master/cme/helpers/msada_guids.py
chmod +x msada_guids.py
cp msada_guids.py /home/kali/.local/share/pipx/venvs/impacket/bin/
cp msada_guids.py /home/kali/.local/share/pipx/venvs/impacket/lib/python3.11/site-packages/impacket/
sudo cp msada_guids.py /usr/lib/python3/dist-packages/impacket/
sudo cp msada_guids.py /usr/lib/python3/dist-packages/scapy/layers/
echo "installing kerbrute"
pipx install kerbrute
echo "pipx ensurepath"
pipx ensurepath
pipx completions
echo "Trebds and Chance... take note..."
sudo apt install keepassxc -y
echo "installing bloodhound python"
pipx install bloodhound
echo "${GREEN}addons${ENDCOLOR}"
firefox https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/
firefox https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/
firefox https://addons.mozilla.org/en-US/firefox/addon/penetration-testing-kit/
firefox https://addons.mozilla.org/en-US/firefox/addon/hacktools/
echo "Caido"
firefox https://caido.io/download#
echo "installing golang"
sudo apt install golang-go -y
echo "running nxc for the first time"
nxc --version
echo "we are done, remember this is not everything you will ever need just a lot of stuff. Restart your kali"
