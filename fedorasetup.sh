echo 'Welcome to Fedora Setup made by NSM'

echo 'Now we will install all the necessary things for setting up Fedora'

#axel_git
sudo dnf install axel

#dnfconfig

echo 'Making some necessary changes in dnf config'
 
git clone https://github.com/itsnsmyk/fedorasetup.git
cd fedorasetup/ && sudo cp -a dnf.conf /etc/dnf/dnf.conf


#RPMFUSION

echo 'Installing free & nonfree rpmfusion'

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Codecs

echo 'Installing Necessary Codecs'

sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf groupupdate multimedia sound-and-video

#For_Intel
#sudo dnf install libva-intel-driver

#Tainted_Codecs
sudo dnf install rpmfusion-nonfree-release-tainted
sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware"

#AMDGPU MESA
#echo 'Latest Mesa by xxmitsu copr'
#dnf copr enable xxmitsu/mesa-git


#Apps

echo 'Installing Telegram Desktop'
axel -n 10 https://telegram.org/dl/desktop/linux

echo 'Installing Brave Browser'
sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf install brave-browser


#autocpufreq 

echo 'Installing auto-cpufreq'

git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer


