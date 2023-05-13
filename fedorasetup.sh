echo 'Welcome to Fedora Setup made by NSM'


echo 'Now we will install all the necessary things for setting up Fedora'

#axel_git
sudo dnf install axel

#dnfconfig

echo 'Making some necessary changes in dnf config'
sudo cp -a dnf.conf /etc/dnf/dnf.conf

#update


echo 'Updating the system'

sudo dnf --refresh upgrade;

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


#Tg

echo 'Installing Telegram Desktop'
wget -n 10 https://telegram.org/dl/desktop/linux && mv linux telegram.xz;

#Codium

sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg;
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo;
sudo dnf install -y codium;

#OnlyOffice

axel -n 10 https://github.com/ONLYOFFICE/appimage-desktopeditors/releases/download/v7.3.3/DesktopEditors-x86_64.AppImage;


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
flatpak install flathub io.github.hrkfdn.ncspot;

#small_apps

sudo dnf install -y okular mpv

sync

sleep 40s;
echo 'Your Computer will Reboot in 40 seconds from now'
sudo reboot
