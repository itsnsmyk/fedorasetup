echo 'Welcome to Fedora Setup made by NSM'

echo 'Updating the system'

sudo dnf --refresh upgrade;

echo 'Now we will install all the necessary things for setting up Fedora'

#axel_git
sudo dnf install axel

#dnfconfig

echo 'Making some necessary changes in dnf config'
sudo cp -a dnf.conf /etc/dnf/dnf.conf


#RPMFUSION

echo 'Installing free & nonfree rpmfusion'

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Codecs

echo 'Installing Necessary Codecs'

sudo dnf swap ffmpeg-free ffmpeg --allowerasing;
sudo dnf groupupdate multimedia sound-and-video;

#For_Intel
#sudo dnf install libva-intel-driver

#Tainted_Codecs
sudo dnf install rpmfusion-nonfree-release-tainted
sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware"

#AMDGPU MESA
#echo 'Latest Mesa by xxmitsu copr'
#dnf copr enable xxmitsu/mesa-git


#Apps

#filemanager

sudo dnf install nemo;

#Tg

echo 'Installing Telegram Desktop'
axel -n 10 https://telegram.org/dl/desktop/linux && mv linux telegram.xz;

#Codium

sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg;
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo;
sudo dnf install -y codium;

#WPS

axel -n 10 https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11698/wps-office-11.1.0.11698.XA-1.x86_64.rpm;
sudo rpm -i wps-office-11.1.0.11698.XA-1.x86_64.rpm;

#Email_Client
axel -n 10 https://updates.getmailspring.com/download?platform=linuxRpm;
sudo rpm -i mailspring-1.10.8-0.1.x86_64.rpm;

#Obsidian
axel -n 10 https://github.com/obsidianmd/obsidian-releases/releases/download/v1.2.8/Obsidian-1.2.8.AppImage && sudo chmod +x Obsidian-1.2.8.AppImage;

#Alacritty
sudo dnf install -y alacritty;

#Fetch
sudo dnf install fastfetch;

#QEMU

echo 'Installing QEMU'

sudo dnf install -y qemu-kvm libvirt virt-install bridge-utils virt-manager libvirt-devel virt-top libguestfs-tools guestfs-tools && sudo systemctl start libvirtd && sudo systemctl enable libvirtd;


#ncspot(terminal spotify)

echo 'Installing ncspot'
sudo dnf install -y dbus-devel libxcb-devel ncurses-devel openssl-devel pulseaudio-libs-devel;
sudo dnf install -y cargo;
cargo install ncspot;

#small_apps

sudo dnf install -y okular mpv flameshot 

#autocpufreq 

echo 'Installing auto-cpufreq'

git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer && cd .. ;


sync

sleep 40s;
echo 'Your Computer will Reboot in 40 seconds from now'
sudo reboot
