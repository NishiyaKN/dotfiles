set -e 

#! PROGRAMS
acpi - CHECK BATTERY HEALTH (WITH acpi -V)
alacritty - TERMINAL EMULATOR
ark - ARCHIVING TOOL
auto-cpufreq - AUTO CPU FREQUENCY
brightnessctl - ADJUST BRIGHTNESS
curtail - IMAGE COMPRESSOR
dolphin - FILE MANAGER
dolphin-megasync - MEGA PLUGIN FOR DOLPHIN
downgrader-git - DOWNGRADE A PACKAGE
dunst - NOTIFICATIONS
easyeffects - AUDIO PROCESSOR
etcher-bin - FLASH OS IMAGES TO USB
fcitx5 - KEYBOARD INPUT
figlet - ASCII TEXT
freedownloadmanager - DOWNLOAD MANAGER #NEEDS BROWSER ADD-ON
gimp - IMAGE EDITOR
goverlay - SYSTEM RESOURCES ON GAMES
gparted - MANAGE PARTITIONS
grub-customizer - GUI FOR CUSTOMIZING GRUB
gtk-chtheme - CHANGE GTK THEME
haruna - MPV BASED VIDEO PLAYER
htop - SYSTEM MONITOR
kate - TEXT EDITOR
kdeconnect - INTERRACT WITH ANDROID DEVICE
keepassxc - PASSWORD MANAGER
linux-wifi-hotspot - HOSTSPOT CREATOR
lolcat - RAINBOW TEXT
lxappearance - CUSTOMIZER
mediainfo-gui - MEDIAINFO WITH A GUI
mpc - mpd CLI CONTROLLER
mpd - MUSIC PLAYER DEAMON
ncdu - FILE EXPLORER TO FREE DISK SPACE
ncmpccpp - mpd TUI CONTROLLER
network-manager-applet
nitrogen - WALLPAPER SETTER
nm-connection-editor - GUI WI-FI CONFIGURER
nndownload - NND VIDEO DOWNLOADER
nomacs - IMAGE VIEWER
numlockx - AUTO NUM LOCK KEY ON BOOT
obs-studio - VIDEO RECORDER
okular - PDF VIEWER
pactree - SEE ALL DEPENDENCIES FROM A PACKAGE #NEEDS pacman-contrib
pavucontrol - CONTROL AUDIO INPUT
perl-file-mimeinfo - CHANGE DEFAULT PROGRAM TO OPEN A FILETYPE
pipewire-alsa - ALSA SUBSTITUTE
pipewire-pulse - PULSEAUDIO SUBSTITUTE
powerstat - CHECK LAPTOP POWER CONSUMPTION
protonvpn - FREE VPN
pulsemixer - AUDIO CONTROLLER
qbittorrent - BIT TORRENT CLIENT
qjoypad - GAME CONTROLLER MAPPER
ranger - TUI FILE MANAGER
redshift - BLUELIGHT FILTER
ripgrep - SEARCH FOR TEXT ON FILES
rofi - APP MENU
sc-im - SPREADSHEET TUI
scrcpy - ANDROID DEVICE CONTROLLER
soundconverter - CONVERT VIDEO TO AUDIO
spectacle - PRINTSCREEN TOOL
speedtest-cli - OOKLA INTERNET SPEED 
spek-alternative - SPEK FOR AUDIO QUALITY CONTROL
stacer - CLEAN UP, SYSTEM RESOURCES ETC
steam - STEAM
tenacity-git - AUDIO EDITOR #AUDACITY FORK
timeshift - SYSTEM BACKUP
unrar - ADDS RAR FILE SUPPORT FOR ARK
virt-manager - VIRTUAL MACHINE #LINUX RUNS BETTER HERE
virtualbox - VIRTUAL MACHINE #WINDOWS RUNS BETTER HERE
xampp - LAMPP
xfce4-power-manager - BRIGHTNESS, LAPTOP LID CLOSED
yay-git - AUR HELPER
yt-dlp - YOUTUBE VIDEO DOWNLOADER
zsh - TERMINAL SHELL

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! FIX SOME JOURNALCTL ERRORS
sudo journalctl -p 3 -b

'i915 *ERROR* Atomic update failure on pipe A'
# https://forum.endeavouros.com/t/i915-drm-error-atomic-update-failure-on-pipe-a/9449
sudo vim /etc/mkinitcpio.conf
# Add to the MODULES=(i915)
sudo mkinitcpio -P
# May take a while to finish it

'Application failed to start because no Qt platform plugin could be initialized'
# In my case it was kdeconnect's fault, instead of initializing it on .xprofile, do it on bspwmrc

'decoder: Decoder plugin wildmidi is unavailable'
sudo pacman -S timidity++

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! PACMAN USEFUL COMMANDS

# ENABLE MULTILIB ON PACMAN

sudo vim /etc/pacman.conf
# Uncomment the "multilib" strings

# SEE ALL INSTALLED PACKAGES
sudo pacman -Qqe

# SEE ALL PACKAGES INSTALLED BY USER
comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base -g base-devel | sort | uniq)

# SEE UNUSED PACKAGES
pacman -Qdtq

# REMOVE UNUSED PACKAGES
sudo pacman -Rddns $(pacman Qdtq)

# PACMAN NOT UPDATING - PGP KEYS ERROR
sudo pacman -Sy archlinux-keyring

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! ENABLE TRIM FOR SSD (BETTER PERFORMANCE AND SSD LIFETIME)

sudo systemctl enable fstrim.timer

# ADJUST SWAPPINESS
sysctl vm.swappiness
sudo vim /etc/sysctl.d/99-swappiness.conf
# Add the following line:
vm.swappiness=10

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! INSTALL LTS KERNEL

sudo pacman -S linux-lts linux-lts-headers
sudo grub-mkconfig -o /boot/grub/grub.cfg
reboot
# Select "Arch with advanced options" to change to LTS 

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SET ZSH
# https://www.sitepoint.com/zsh-tips-tricks/

# Make zsh the default shell
chsh -s $(which zsh)
reboot

# Install Oh My Zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Plugin: autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Plugin: syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Search for the line with plugins=(git) and replace it for:
vim ~/.zshrc
plugins=(zsh-autosuggestions colored-man-pages zsh-syntax-highlighting)

# Set PS1 to show full path:
cd .oh-my-zsh/themes
vim robbyrussell.zsh-theme
# Change the %c% from the second line to %~%
# Source or reopen the terminal

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SKIP GRUB, SHOW IF PRESSING SHIFT
# https://www.youtube.com/watch?v=jW4GFGOIUjc

sudo vim /etc/default/grub
# Paste the following somewhere in the file
GRUB_FORCE_HIDDEN_MENU="true"
sudo vim /etc/grub.d/31_hold_shift
# Paste the content from this file 
# https://goo.gl/nac6Kp

# Make the file executable with
sudo chmod a+x /etc/grub.d/31_hold_shift

# Generate the grub config file
sudo grub-mkconfig -o /boot/grub/grub.cfg

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! AUDACITY OR FORKS MAY KILL HEADPHONE AUDIO

# To prevent this, before opening audacity, unplug the headphone, go to 'Edit > Preferences > Recording > Device' and set it to 'default: Internal Mic:0'

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! JAPANESE KEYBOARD INPUT
# https://www.youtube.com/watch?v=lJoXhS4EUJs

sudo pacman -S fcitx5 fcitx5-mozc fcitx5-configtool fcitx5-gtk fcitx5-qt

sudo vim ~/.zshrc
# Paste the following somewhere in the file
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

sudo vim /etc/profile
# Paste the same things
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

sudo vim /etc/locale.gen
# Unconment the 'ja_JP.UTF-8 UTF-8' line (line 302)
sudo locale-gen
# Make it auto start

# fctix5-configtool
# On the menu click the + button and deselect the box, then add mozc

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SYNTAX HIGHLIGHTING PACMAN / LS

sudo cp /etc/pacman.conf /etc/pacman.conf.bak
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf

vim .zshrc
# Paste the following there
alias ls='ls --color'
LS_COLORS='di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=94:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106'

export LS_COLORS
source .zshrc

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! ALACRITTY TERMINAL

sudo pacman -S alacritty
yay -S nerd-fonts-jetbrains-mono
mkdir ~/.config/alacritty
vim ~/.config/alacritty/alacritty.yml
# If configuring from zero, paste the lines from:
# https://github.com/ericmurphyxyz/archrice/blob/master/.config/alacritty/alacritty.yml

# If you use multi monitor with different sizes, do the following to fix the font:
vim .zprofile
# Paste the following command:
export WINIT_X11_SCALE_FACTOR=1

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! USE PIPEWIRE

sudo pacman -S pipewire-alsa pipewire-pulse
# May say that you need to uninstall PulseAudio, do so
reboot
# You can check if it worked with:
pactl info
# Which should print the following:
# Server Name: PulseAudio (on PipeWire)

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! INSTALL YAY
# https://www.tecmint.com/install-yay-aur-helper-in-arch-linux-and-manjaro/

sudo pacman -S git
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R teruyo ./yay-git
cd yay-git
makepkg -si

# If it shows error about fakeroot:
sudo pacman -S base-devel

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! WINE, WINETRICKS AND DEPENDENCIES 

sudo pacman -S --needed wine-staging winetricks wine-mono giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! GPU DRIVERS (INTEL INTEGRATED)
# https://github.com/lutris/docs/blob/master/InstallingDrivers.md

sudo pacman -S --needed lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! USE HARDWARE ACCELERATION ON OBS (FFMPEG VAAPI)
#https://wiki.archlinux.org/title/Intel_graphics#Hardware_accelerated_H.264_decoding_on_GMA_4500

sudo pacman -S libva-intel-driver libva-utils

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! WINE OPEN ON DEFAULT BROWSER
# http://www.webupd8.org/2010/03/how-to-make-wine-open-links-in-your.html

wine regedit
# Go to 'HKEY_CURRENT_USER > Software > Wine'
# Create a key named "WineBrowser" if it doesn't exist
# Paste the following as data
xdg-open,firefox,konqueror,mozilla,netscape,galeon,opera,dillo

# You may need to go to 'HKEY_CLASSES_ROOT > http > hell > open > command' and add the following to the line: '"%1"'

# Note: the single quotes don't enter in this, it's just for comment formatting.

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! PHOTOSHOP CS6 WITH PLAYONLINUX

# All the files are needed, playonlinux only helps the installation

sudo pacman -S playonlinux
# Search 'Photoshop CS6' and follow the instructions
# It may say it's still installing but if the program opens, then it may already be installed

# To run, type the following
WINEARCH=win64 WINEPREFIX=~/.wine wine ~/Apps/PSCS6/PSCS6.exe

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! PROTONTRICKS:
sudo pacman -S python-pip python-pipx python-setuptools python-virtualenv
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# Close and reopen the terminal

pipx install protontricks
sudo pacman -S yad
protontricks --gui

# Commentary from a user: 'I runned the following command: protontricks 1100150 fakejapanese fakejapanese_vlgothic. I also have inserted the command LANG=”ja_JP.utf8” on “set launch options” to emulate the japanese locale, so the game displays the japanese characters then.

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! INPUT AUDIO WEIRD (SAMPLE RATE)
# https://www.youtube.com/watch?v=IgdLgBXw1u0
# 13:13

sudo vim /etc/pulse/daemon.conf
# Search for these lines, remove the ';' and adjust the values
default-sample-rate = 44100
alternate-sample-rate = 44100

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! YOUTUBE-DLP (YT-DLP)

sudo pacman -S yt-dlp atomicparsley ffmpeg

# Wat
yt-dlp -o '~/Music/%(playlist_title)s/%(title)s.%(ext)s' -ciw -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 --add-metadata --cookies '~/Documents/ytdl/cookies-youtube-com.txt' --download-archive '~/Documents/ytdl/yt-dl_wat.txt' 'https://www.youtube.com/playlist?list=PLBYlt8Uh0EcxaT51BU5cyYxiGtN6JmoGL'

# Ongaku
yt-dlp -f bestaudio -ciw --newline -o '~/Music/%(playlist_title)s/%(title)s.%(ext)s' -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata -ciw --download-archive '~/Documents/ytdl/yt-dl_ongaku.txt' --cookies '~/Documents/ytdl/cookies-youtube-com.txt' 'https://www.youtube.com/playlist?list=PLBYlt8Uh0EcwSftTxeFaI3-6cqcQImKPZ'

# Video with subtitles and description on a separate folder
yt-dlp -o '/media/sf_Music/youtube-dl/%(playlist_title)s/%(title)s/%(title)s.%(ext)s' -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 --add-metadata --audio-quality 0 --embed-thumbnail -ciw --all-subs --write-description --download-archive '/media/sf_Music/youtube-dl/yt-dl.txt --cookies /home/teruyoh/Desktop/cookies-youtube-com.txt' 'https://www.youtube.com/playlist?list=PLBYlt8Uh0EcwSftTxeFaI3-6cqcQImKPZ'

# Generic video
yy-dlp -o '/media/sf_Music/youtube-dl/%(playlist_title)s/%(title)s.%(ext)s' -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 --add-metadata --cookies '/home/teruyoh/Desktop/cookies-youtube-com.txt' --download-archive yt-dl_video.txt ''

# Generic audio only
yt-dlp -f bestaudio -o '/media/sf_Music/youtube-dl/%(playlist_title)s/%(title)s.%(ext)s' -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata -ciw --download-archive yt-dl_audio.txt --cookies '/home/teruyoh/Desktop/cookies-youtube-com.txt' 'https://www.youtube.com/playlist?list=PLBYlt8Uh0EcwSftTxeFaI3-6cqcQImKPZ'

# until ;do sleep 5; done //set a 5 sec delay between donwloads

#'%(autonumber)s - %(title)s.%(ext)s'

#/home/teruyoh/youtube-dl/%(title)s.%(ext)s #directory to where it'll download, if don't exists it creates it, but need to use sudo and it'll be locked
#sudo chown -R $USER: $HOME
#to unlock

#--match-filter 'duration < 600' //only download videos shorter than 600 seconds

# Error: /usr/bin/env: ‘python’: No such file or directory
sudo ln -s /usr/bin/python3 /usr/bin/python

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! DOWNLOAD VIDEOS FROM NND

yay -S nndownload
nndownload.py -u user@mail.com -p password --add-metadata -o '/home/teruyo/Music/NND/{title}.{ext}' https://www.nicovideo.jp/watch/sm30171731

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! TIMESHIFT DON'T MAKE AUTOMATIC SNAPSHOTS
# https://github.com/teejee2008/timeshift/issues/396

systemctl enable cronie.service
systemctl start cronie.service

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! VIRT-MANAGER
# https://computingforgeeks.com/install-kvm-qemu-virt-manager-arch-manjar/

# Check if virtualization is enabled, must return a value higher than 0
egrep -c '(vmx|svm)' /proc/cpuinfo

sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat archlinux-keyring ebtables iptables dmidecode ethtool
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo virsh net-start default
sudo virsh net-autostart default
#sudo virsh net-autostart --disable default
sudo vim /etc/libvirt/libvirtd.conf
# Uncomment those lines:
unix_sock_group = "libvirt" #L85
unix_sock_rw_perms = "0770" #L102

sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
sudo systemctl restart libvirtd.service

# Install Virtio-Win iso for Windows guest for better performance
# https://www.youtube.com/watch?v=8Xnmfqqyq4c
# https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/

# Enable XML editing on 'Edit > Preferences'
# Select to customize configuration before install
# Before installing Windows, to to 'CPUs > XML' and erase the following lines:
<timer name="rtc" tickpolicy="catchup"/>
<timer name="pit" tickpolicy="delay"/>
# And replace "no" with "yes" on the following line:
<timer name="hpet" present="yes"

# On 'SATA Disk 1' change to
Disk bus: VirtIO

# ON 'NIC' change to
Device Model: virtio

# To add the VirtIO iso:
# '> Add Hardware > Select or create custom storage'
# 'Device type: CDROM device'
# '> Manage > Browse Local > #SELECT THE ISO > Finish > Begin Installation'

# On the installation process:

# 'Custom: Install Windows only'
# '> Load Driver > OK'
# 'Red Hat VirtIO SCSI controller (path/to/w10/visiostor.inf)'
# '> Next > Next'

# May not have internet, just continue, then to add internet after it's done:
# '> File Explorer > virtio iso CD ROM > virtio-win-gt-x64.msi'
# Click 'Next' to everything

# Make a share folder for Linux Guest
# https://www.youtube.com/watch?v=9FBhcOnCxM8
mkdir share
chmod 777 share/

# Go to 'Hardware details of the VM > Add Hardware > Filesystem'
# Just modify the source path (/home/teruyo/share) and target Path (/sharepoint)
# Open the VM and type on it's terminal:
mkdir share
sudo mount -t 9p -o trans=virtio /sharepoint share
# To interact with the files made/altered by the guest on host, you may need sudo or chmod
sudo vim /etc/fstab
# Add the following, with the huge spaces being a tab key press
/sharepoint    /home/teruyo/share 9p    trans=virtio,version=9p2000.L,rw    0    0

# Make a shared folder for Windows guest (incomplete)
qemu-system-x86_64    -net user,smb=/absolute/path/to/folder    -net nic,model=virtio   ...
# Enable RDP in Windows and connect the VM with
# https://remmina.org/

# 'Name: Win10 RDP'
# 'Group: Development'
# 'Protocol: RDP - Remote Desktop Protocol'
# 'Pre Command: command %h %u %t %U %p %g --option'
# 'Post Command: /path/to/command - opt1 arg %h %u %t -opt2 %U %p %g'

# 'Server: 192.168.122.xxx'
# 'User name: teruyo'
# 'User password: *********'
# 'Domain: #ITS INDEED BLANK'
# 'Resolution: Use client resolution'
# 'Share folder: win10'


# TROUBLESHOOTING 
# failed to connect socket to...
#https://github.com/code-ready/crc/issues/629

sudo vim /etc/libvirt/qemu.conf
# Add the following line:
stdio_handler="file"
sudo systemctl restart libvirtd.service 

# INTERNET NOT WORKING	
# May be caused by a conflict of 2 network managers: 'systemd-networkd' and 'NetworkManager'. Disable one of them.
# https://bbs.archlinux.org/viewtopic.php?id=273243&p=2
sudo systemctl disable systemd-networkd
reboot

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SAVE POWER ON LAPTOP
# https://www.youtube.com/watch?v=B1iRxoyT4EA
# https://aur.archlinux.org/packages/auto-cpufreq/#pinned-811101

sudo pacman -S tlp
sudo systemctl enable --now tlp.service
# Using TLP is not really recommended since auto-cpufreq is better (I think)

yay -S auto-cpufreq
systemctl enable --now auto-cpufreq
# Their GitHub page says that running thermald is also recommended so
sudo pacman -S thermald
systemctl enable --now thermald

sudo pacman -S powertop
# You can make it auto run on startup:
sudo vim /etc/systemd/system/powertop.service
# Paste the following content
[Unit]
Description=Powertop tunings

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/powertop --auto-tune

[Install]
WantedBy=multi-user.target

sudo pacman -S xfce4-power-manager
# This is a GUI app for power management

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SCRCPY TO CONTROL YOUR SMARTPHONE FROM PC

sudo pacman -S scrcpy
# Plug the device through USB
# Search the IP on the phone configurations
adb tcpip 5555
adb connect 192.168.15.52 # Use your IP here
# Unplug the device to run via Wi-fi
# To run with less latency:
scrcpy -m800 -b2M

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! BLUETOOTH SERVICE ERROR
# https://askubuntu.com/questions/1340713/bluetooth-service-failed-to-set-mode

sudo rfkill unblock bluetooth
sudo systemctl stop bluetooth
sudo systemctl status bluetooth
sudo systemctl restart bluetooth

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CANT RECOGNIZE HEADPHONE
# https://www.reddit.com/r/linux4noobs/comments/qfo21u/audio_isnt_being_automatically_redirected_to_my/

# May be a priority issue, check with
pactl list sinks | grep analog

sudo vim /usr/share/alsa-card-profile/mixer/paths/analog-output-headphones.conf
# Modify the following line to
[General]
priority = 100

sudo vim /usr/share/alsa-card-profile/mixer/paths/analog-output-speaker.conf
# Modify the following line to
[General]
priority = 90

systemctl restart --user pipewire-media-session pipewire-pulse pipewire
# May need to unplug and plug the headphone, maybe reboot

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! BLUETOOTH

sudo pacman -S bluez bluez-utils blueman pulseaudio-bluetooth
lsmod | grep btsub
# If returns nothing, then:
modprobe btusb
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

# To make it auto start
sudo vim /etc/bluetooth/main.conf
# Near the end modify the following line
AutoEnable=true

# To run it CLI
bluetoothctl
power on
agent on
default-agent
scan on
trust # Insert the device's MAC address
pair # Same here
connect # Same here
scan off

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! NOTIFICATIONS WITH DUNST

sudo pacman -S libnotify dunst
mkdir .config/dunst
cp /etc/dunst/dunstrc ~/.config/dunst/dunstrc
# That is the default config file

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! DOLPHIN AND OTHER QT APPS NOT FOLLOWING THEME ( I GUESS IT WAS IT)

sudo pacman -S qt5ct
vim .zprofile
# Paste the following line:
export QT_QPA_PLATFORMTHEME=qt5ct

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! DISABLE MOUSE ACCELERATION
# https://wiki.archlinux.org/title/Mouse_acceleration#Disabling_mouse_acceleration

sudo vim /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
# Paste the following:
Section "InputClass"
	Identifier "My Mouse"
	Driver "libinput"
	MatchIsPointer "yes"
	Option "AccelProfile" "flat"
	Option "AccelSpeed" "0"
EndSection

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! ANDROID DEVICE NOT RECOGNIZED
# https://askubuntu.com/questions/463015/ubuntu-14-04-and-android-cant-see-phone-on-my-computer

sudo pacman -S gmtp mtpfs
# Go to the developer options on the phone and reselect MTP

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! XAMPP / LAMPP / LAMP
# https://www.youtube.com/watch?v=Y_GS5OPnd7I

yay -S xampp
sudo chmod 777 /opt/lampp/htdocs -R
# To start, type 'xampp start'

# ERROR ABOUT NEEDING A 32-BIT SOMETHING TO RUN
sudo pacman -S libxcrypt-compat

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! MPD

sudo pacman -S mpd mpc ncmpcpp

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! MIC IS BOOSTED / BAD

alsamixer
# Press 'F6'
# Select the device other than the (default)
# Navigate to the right and remove any of these:

Headphone Mic Boost
Headset Mic Boost
Internal Mic Boost

# Press 'Esc'

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! HEADPHONE MIC NOT BEING RECOGNIZED

sudo pacman -S pavucontrol
# This is a GUI application to control sound

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! JAVA APPLICATIONS GREY SCREEN
# https://wiki.archlinux.org/title/Bspwm#Problems_with_Java_applications

sudo pacman -S wmname
vim ~/.config/bspwm/bspwmrc
# Paste the following:
wmname LG3D

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CHANGING GTK THEME VIA CLI

vim ~/.gtkrc-2.0
sudo vim /usr/share/gtk-2.0/gtkrc
sudo vim /usr/share/gtk-3.0/settings.ini 

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CHANGE DEFAULT APPLICATION TO OPEN A FILE TYPE
# https://wiki.archlinux.org/title/default_applications

yay -S perl-file-mimeinfo

# Determine the extension of an specific file
mimetype file.extension

# Choose the default application to open that file type
mimeopen -d file.extension

# Type the number corresponding to the app

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! TLP DISABLING WIFI
# https://askubuntu.com/questions/545841/installing-tlp-power-save-stopped-my-wifi-adapter-from-working

sudo vim /etc/tlp.d/00-template.conf

# Add the following line anywhere
WIFI_PWR_ON_BAT=N

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! DOLPHIN NOT SHOWING VIDEO THUMBNAILS
# https://www.q4os.org/forum/viewtopic.php?id=3462

sudo pacman -S ffmpegthumbs
# Go to 'Configure > Configure Dolphin > Previews
# Check the video option

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CPU FAN ON DELL LAPTOP
# https://wiki.archlinux.org/title/fan_speed_control#Dell_laptops

yay -S acpi tcl tk dell-bios-fan-control-git
sudo systemctl enable i8kmon.service

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! TRACKPAD WITH WEIRD CONFIG

sudo pacman -S xf86-input-synaptics

# Create a conf file if don't exists
sudo vim /etc/X11/xorg.conf.d/70-synaptics.conf

# Paste the following:
Section "InputClass"
    Identifier "touchpad"
    Driver "synaptics"
    MatchIsTouchpad "on"
        Option "TapButton1" "1"
        Option "TapButton2" "3"
        Option "TapButton3" "2"
        Option "VertEdgeScroll" "on"
        Option "VertTwoFingerScroll" "on"
        Option "HorizEdgeScroll" "on"
        Option "HorizTwoFingerScroll" "on"
        Option "CircularScrolling" "on"
        Option "CircScrollTrigger" "2"
        Option "EmulateTwoFingerMinZ" "40"
        Option "EmulateTwoFingerMinW" "8"
        Option "CoastingSpeed" "0"
        Option "FingerLow" "20"
        Option "FingerHigh" "40"
        Option "MaxTapTime" "125"
        Option      "VertScrollDelta"          "-111"
        Option      "HorizScrollDelta"         "-111"
EndSection

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! MAKE A .desktop FILE FOR A LUTRIS GAME ENTRY FOR ROFI

# Package needed to call the game via CLI
sudo pacman -S python-magic

vim ~/.local/share/applications/NAMEOFTHEAPP.desktop

# For system wide apps, the path is /usr/share/applications
# Use the following template:
[Desktop Entry]
Type=Application
Name=Touhou
Icon=th
Exec=env LUTRIS_SKIP_INIT=1 lutris lutris:rungameid/9
Categories=Game
Keywords=Touhou, th

# Icon: You can put it on '~/.icons/' or in '/usr/share/pixmaps/' and must be a '.png' or other supported format, don't support '.jpg' nor '.jpeg'
# lutris/rungameid/9: Should correspond with the order that the games are added on Lutris, in this case, the game is the 9th
# You can, of course, create a .desktop file directly on Lutris by right clicking the game and selecting 'Create Application Menu Shortcut'

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! RUN A GAME ON LUTRIS / WINE WITH JAPANESE LOCALE

# WINE:
env LANG=ja_JP.UTF-8 wine Touhou.exe
# OR
env LC_ALL=ja_JP.UTF-8

# LUTRIS: Paste the command above on the arguments part of the app launch

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CREATE A HOTSPOT INTERNET CONNECTION (NOT THE BEST WAY, NEED TO BE CONNECTED TO ETHERNET)
# https://computingforgeeks.com/create-wi-fi-hotspot-on-ubuntu-debian-fedora-centos-arch/

ip link show
# There should be a network named 'wlp2s0' or something

# Set some environment variables to help create the hotspot
IFNAME="wlp2s0" # Replace this with your network
CON_NAME="Hostpot Name"
nmcli con add type wifi ifname $IFNAME con-name $CON_NAME autoconnect yes ssid $CON_NAME

# Set connection method
nmcli con modify $CON_NAME 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared

# Set Password
nmcli con modify $CON_NAME wifi-sec.key-mgmt wpa-psk
nmcli con modify $CON_NAME wifi-sec.psk "Password"

# Bring up the connection (deactivates wi-fi)
nmcli con up $CON_NAME

# Bring down the connection (reactivates wi-fi)
nmcli con down $CON_NAME

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CREATE A HOTSPOT INTERNET CONNECTION (BEST WAY)
# https://wiki.archlinux.org/title/software_access_point#Tools

yay -S linux-wifi-hotspot 

# There is a GUI, you can manually enter with:
wihotspot

# Wifi interface: wlp2s0
# Wifi interface: wlp2s0

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! EMOJIS
sudo pacman -S rofi-emoji noto-fonts-emoji xsel

vim ~/.config/rofi/config.rasi
# On line 6 (modi:) add 'emoji' 

# Run with the following command:
rofi -show emoji

# Remember to set it to a hotkey on sxhkd

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! RUN A COMMAND WITH SUDO WITHOUT PASSWORD

# Search where is all the command binary
type -a umount

sudo vim /etc/sudoers.d/filename
# It's recommended to put your username as the filename in order to better manage sudoers

# Paste the following, changing to your username and program binary location
teruyo ALL=(ALL) NOPASSWD:/usr/bin/umount,/bin/umount

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CHANGE LIGHTDM'S BACKGROUND

# Make a directory to put the image, it can be anywhere but in the home directory
sudo mkdir /etc/lightdm/bg
sudo cp /path/to/the/image /etc/lightdm/bg/

sudo lightdm-gtk-greeter-settings
# From there, choose "Image" and the path /etc/lightdm/bg/image.img

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! DELETED ARCH BOOT OPTION ON UEFI

# This may help or not, IDK. 
# Either way, using the same ISO you can reinstall both the root and boot/efi partitions without erasing (kinda)

# Boot Option Name:
Arch_Linux

# File System List:
# Don't put anything here

# File Name
\EFI\Arch_Linux\grubx64.efi
# Remember to use the inverted slash \ and not the normal /

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SHOW SYSTEMD PROCESSES AT BOOT / SHUTDOWN

sudo vim /etc/default/grub
# Go to the line with "GRUB_CMDLINE_LINUX_DEFAULT" and remove the following options:
"loglevel 3 quiet"

sudo grub-mkconfig -o /boot/grub/grub.cfg

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SETTING UP A CRON JOB

# List crontab
crontab -l

# Edit crontab
crontab -e

# SYNTAX: m h d m w command, each can be * to say any
# Can be @hourly @daily @monthly @reboot @
59 23 * * 0 yay -Syu
# This makes a system update every sunday at 23:59

# You can run with other users, ex
sudo crontab -u root -l

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! MAKE VIM WORK ON CRONTAB

vim ~/.vimrc 
# Add the following:
set backupskip+=/var/spool/cron/*

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! INSTALLING BSPWM AND OTHER THINGS 
sudo pacman -S bspwm rofi nitrogen sxhkd lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings picom-git
yay -S polybar
sudo systemctl enable lightdm

mkdir ~/.config/bspwm
cp /usr/share/doc/bspwm/examples/bspwmrc .config/bspwm/
vim ~/.config/bspwm/bspwmrc
# Add the following line:
$HOME/.config/polybar/launch.sh

mkdir ~/.config/rofi
vim ~/.config/rofi/config.rasi
# You can use the following as template:
# https://github.com/ericmurphyxyz/archrice/blob/master/.config/rofi/config.rasi

mkdir ~/.config/sxhkd
vim ~/.config/sxhkd/sxhkdrc
cp /usr/share/doc/bspwm/examples/sxhkdrc .config/sxhkd/
# Same Here
# https://github.com/ericmurphyxyz/archrice/blob/master/.config/sxhkd/sxhkdrc

mkdir ~/.config/polybar
cp /usr/share/doc/polybar/config .config/polybar/
vim ~/.config/polybar/launch.sh
# Make the 'launch.sh' from the wiki
chmod +x .config/polybar/launch.sh
vim ~/.config/polybar/config.ini
# Same here
# https://github.com/ericmurphyxyz/archrice/blob/master/.config/polybar/config.ini

mkdir ~/.config/picom
vim ~/.config/picom/picom.conf
# Same here
# https://github.com/ericmurphyxyz/archrice/blob/master/.config/picom/picom.conf

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! INSTALL KDE PLASMA 

sudo pacman -S xorg plasma plasma-wayland-session kde-applications 

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! STUTTERING ON WINE AND PROTON AUDIO
# https://bbs.archlinux.org/viewtopic.php?id=276168
# May be caused by audio buffer underrun

vim ~/.config/pipewire/pipewire.conf
# If it doesn't exists, them:
mkdir ~/.config/pipewire
cp -r /usr/share/pipewire/* ~/.config/pipewire/

# Edit the values of lines 31 and 32 to these:
default.clock.quantum       = 1024
default.clock.min-quantum   = 1024
# You can regulate to see which is better. The higher the value, the higher the latency.
systemctl restart pipewire-pulse --user ; systemctl restart pipewire --user

# MAY BE WORTH TRYING IF THE PREVIOUS THING FAILED:
# On Proton add this on config to startup
PULSE_LATENCY_MSEC=60 %command%

# On Lutris add this at System Options' key
PULSE_LATENCY_MSEC
60 # This is the value 

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! FILE EXPLORER POPUP CRASHES WHEN TRY TO SORT AND DON'T USE THE GTK THEME

# If the popup window is 'xdg-desktop-portal-gnome', them
sudo pacman -Rns xdg-desktop-portal-gnome
reboot

# The system will use xdg-desktop-portal-gtk. If not:
sudo pacman -S xdg-desktop-portal-gtk

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! VULKAN NOT INSTALLED OR SUPPORTED ERROR
# May have different drivers installed

ls -l /usr/share/vulkan/icd.d/
# If there is like amd and intel drivers, just remove the unused one
# To make sure it worked, use this tool
sudo pacman -S vulkan-tools
vulkaninfo

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! REMOVE BLOAT FROM KDE

sudo pacman -Rns blinken bomber bovo kbounce granatier kajongg kanagram kapman katomic kblackbox kblocks kbreakout kdiamond kfourinline kgoldrunner kigo khangman kigo killbots kiriki kjumpingcube klickety kmahjongg kmines knetwalk knights kolf kollision klines konquest kpat kreversi ksirk ksnakeduel kspaceduel ksquares ksudoku kubrick lskat palapeli picmi kshisen ktuberling knavalbattle dragon elisa juk kwave k3b kdenlive kmix rocs umbrello step artikulate cantor cervisia gwenview kalgebra kalarm kalendar kalzium kapptemplate kgeography kfloppy kwordquiz lokalize kiten kmouth klettres kontact discover kcharselect kbackup kbruch marble kdf kwrite minuet kteatime ktimer kgeography kget skanlite kdevelop kdevelop-php itinerary knotes kfind kig zanshin skanpage kcachegrind kcachegrind-common korganizer kaddressbook telepathy-accounts-signon telepathy-farstream telepathy-glib telepathy-kde-accounts-kcm telepathy-kde-approver telepathy-kde-auth-handler telepathy-kde-call-ui telepathy-kde-common-internals telepathy-kde-contact-runner telepathy-kde-desktop-applets telepathy-kde-filetransfer-handler telepathy-kde-integration-module telepathy-kde-send-file telepathy-kde-text-ui telepathy-kde-text-ui telepathy-logger telepathy-logger-qt telepathy-mission-control telepathy-qt telepathy-kde-contact-list kimagemapeditor kgpg kirigami-gallery pim-sieve-editor kmail kmail-account-wizard kmailtransport messagelib libksieve akonadi-calendar akonadiconsole akregator calendarsupport grantlee-editor kdepim-addons mailcommon pim-data-exporter mbox-importer akonadi-import-wizard akonadi-calendar-tools konqueror kompare kolourpaint yakuake kmousetool kmplot khelpcenter kopete kturtle krdc krfb kontrast konversation parley ktouch kruler ktorrent kleopatra sweeper falkon

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SET UP PRINTER EPSON

# You will need epson's generic drivers, which can be found here:
# https://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=EN&CN2=&DSCMI=134381&DSCCHK=9edfca27f0a940d9e3f3156a3d46047ffbfe6d79
yay -S epson-inkjet-printer-escpr epson-printer-utility cups-pdf print-manager cups ghostscript cups system-config-printer

# You need to start CUPS service, maybe enable it
sudo systemctl start cups
sudo systemctl enable cups

# Now to setup the printer go to
system-config-printer # Also know as "Print Settings" on rofi
# From here, click on:
"Add > Network Printer > Forward > Apply"

# CHANGE DEFAULT PAPER SIZE FOR PRINTING DOCUMENTS

# Open 'Print Settings' > Right click your printer > Properties > Printer Options > Media Size

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! (wine?) Performance support disabled
sudo vim /etc/sysctl.d/60-mdapi.conf
# Paste the following
dev.i915.perf_stream_paranoid=0


'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! THEME NOT WORKING ON SOME APPS / CUSTOM CURSOR NOT APPEARING ON bspwm SCREEN

sudo cp /home/teruyo/.themes/Tokyo-Night /usr/share/theme/
sudo lxappearance 
# You need to change the theme for the root user. Whenever running an app with sudo, it's running with the root user. Since the theme isn't global, it need to be set to the root user.

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! CURSOR NOT THEMED ON DESKTOP SCREEN
sudo vim /usr/share/icons/default/index.theme
# On "Inherits=" change it to the theme's cursor name, e.g. Dracula-cursors

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! SET EXTRA MOUSE BUTTONS 
yay -S xvkbd xbindkeys

# To know the name of the button, run this
xev -event button | grep button
# click on the white window and click on the button, it will appear on the terminal 'button 8' or another number

# To know the name of the key, run this
xev -event keyboard | grep keycode

mkdir .config/xbindkeys
vim .config/xbindkeys/.xbindkeysrc
# Use the following as template:

# Button 8 Home 
"xvkbd -text '\[Home]'"
 b:8

# For some keys, you may need to refer to this: http://xahlee.info/linux/linux_xvkbd_tutorial.html

# To make it autostart, put on your .profile the following:
xbindkeys -f ~/.config/xbindkeys/.xbindkeysrc &

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! COMPILE THINGS FASTER

sudo vim /etc/makepkg.conf
# On 'MAKEFLAGS' put the number of threads you have, or just leave it just like this:
MAKEFLAGS="-j$(nproc)"

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! INTERNET NOT WORKING AFTER PROTONVPN

# Probably an issue related to security, disable or remove it with the following
nmcli con down id pvpn-ipv6leak-protection
nmcli connection delete id pvpn-ipv6leak-protection

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! VIM COPY AND PASTE TO THE SYSTEM CLIPBOARD

# Best way to do it is by installing 'gvim' (even though we won't use it), on Arch you can't have both 'vim' and 'gvim' packages, however, by installing 'gvim' it will automatically install 'vim', so install the latter.
sudo pacman -S gvim

# On .vimrc, put the following line to remap the keybindings to copy and paste
vnoremap <C-y> "+y
map <C-p> "+p

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! RANGER SHOW IMAGE AND VIDEO THUMBNAIL

sudo pacman -S ffmpegthumbnailer ueberzug

vim .config/ranger/rc.conf
# line 047 set set preview_script ~/.config/ranger/scope.sh
# line 074 set preview images true
# line 117 set preview_images_method ueberzug

vim .config/ranger/scope.sh
# line 157 video/*)
# line 158 ffmpegthumbnailer -i "${FILE_PATH}" -o "${IMAGE_CACHE_PATH}" -s 0 && exit 6

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! RANGER OPEN FILE EXTENSION WITH DEFAULT PROGRAM APPLICATION

# It's configured on the 'rifle.conf' file, if you don't have it, do
ranger copy-config=all

vim .config/ranger/rifle.conf
# Here we have a lot of different default applications to various file extensions, they will be read line by line, so the upper it is, the higher the priority

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! RUN GUI PROGRAMS WHICH REQUIRES SUDO/ROOT
# https://wiki.archlinux.org/title/Polkit#Configuration

sudo pacman -S polkit lxqt-policykit

# You need to set it to auto start on .profile 
lxqt-policykit-agent &

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! RENAME PC / CHANGE HOSTNAME 

hostnamectl set-hostname newname
# To confirm it worked:
hostname

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! ENABLE FLATPACKS TO USE THE GTK THEME

sudo flatpak override --filesystem=$HOME/.themes # Or wherever your themes folder is
# May not work with themes outside the home directory
sudo flatpak override --env=GTK_THEME=ThemeName
# Might need to reboot

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
#! THUNAR CONFIGURATIONS

# AUTOMOUNT USB DEVICES AND DRIVES
sudo pacman -S gvfs 
# If it doesn't work, try to install this package
sudo pacman -S thunar-volman

# ACESS REMOTE FILES
sudo pacman -S gvfs-smb sshfs

# FRONT-END TO ARCHIVING TOOLS (ARK)
sudo pacman -S thunar-archive-plugin
# Program restart is needed

'⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩⛩'
