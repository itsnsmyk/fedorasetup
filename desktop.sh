echo 'Welcome to Fedora Desktop Setup Script made by NSM'


echo 'Now we will install all the necessary dnf things for setting up Fedora'

#axel_git
sudo dnf install -y axel
sudo dnf install -y python3
sudo dnf install -y python3-pip

#dnfconfig

echo 'Making some necessary changes in dnf config'
sudo cp -a dnf.conf /etc/dnf/dnf.conf

#best_speed_mirrors
echo 'Best mirrors fr'

sudo cp -a fedora.repo /etc/yum.repos.d/fedora.repo
sudo cp -a fedora-updates.repo /etc/yum.repos.d/fedora-updates.repo

#Selinux_Permmisive
sudo cp -a config /etc/selinux/config

#fedora3rdparty
sudo dnf install -y fedora-workstation-repositories

#update

echo 'Updating the system'

sudo dnf --refresh upgrade;

#RPMFUSION

echo 'Installing free & nonfree rpmfusion'

sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Codecs

echo 'Installing Necessary Codecs'

sudo dnf swap ffmpeg-free ffmpeg --allowerasing;
sudo dnf groupupdate multimedia sound-and-video;

#Tainted_Codecs
sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware"

#Dragora

echo  'Installing Dragora'
sudo dnf install -y dnfdragora;

#Flatseal
echo 'Installing Flatseal'
sudo dnf install -y flatseal;

#Tg
echo 'Installing Telegram Desktop'
wget https://telegram.org/dl/desktop/linux && mv linux telegram.xz;

#Codium

sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg;
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo;
sudo dnf install -y codium;

#OnlyOffice
echo 'Removing LibreOffice'
sudo dnf remove libreoffice*
echo 'Downloading Onlyoffice'
wget https://github.com/ONLYOFFICE/appimage-desktopeditors/releases/download/v7.3.3/DesktopEditors-x86_64.AppImage && chmod +x DesktopEditors-x86_64.AppImage;

#Obsidian
echo 'Getting Obsidian for ya'
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.2.8/Obsidian-1.2.8.AppImage && sudo chmod +x Obsidian-1.2.8.AppImage;

#Alacritty
echo 'Downloading the Best terminal alacritty' 
sudo dnf install -y alacritty;

#Fetch
echo 'Wanna fetch i gotchu Installing fastfetch'
sudo dnf install -y fastfetch;

#QEMU

echo 'Installing QEMU'

sudo dnf install -y qemu-kvm libvirt virt-install bridge-utils virt-manager libvirt-devel virt-top libguestfs-tools guestfs-tools && sudo systemctl start libvirtd && sudo systemctl enable libvirtd;


#ncspot(terminal spotify)

echo 'Installing ncspot'
flatpak install flathub io.github.hrkfdn.ncspot;

#Spotify
echo 'Installing Spotiy'
sudo flatpak install flathub com.spotify.Client

#small_apps
echo 'Installing few handy apps'
sudo dnf install -y okular mpv;
sudo dnf install -y gnome-tweaks;

#corectrl
echo 'Installing CoreCtrl'
sudo dnf install corectrl;

sync;


