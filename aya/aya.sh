set -e
Nobara

sudo dnf in florence acpi alacritty AtomicParsley ark bleachbit brightnessctl dolphin fcitx5 ffmpeg ffmpegthumbnailer ffmpegthumbs htop lutris mpd ncdu ncmpcpp obs-studio okular pavucontrol perl-File-MimeInfo qbittorrent ranger redshift rofi-wayland spectacle speedtest-cli steam timeshift unrar xfce4-power-manager xclip xrandr xprop xsel yt-dlp git libnotify alacritty zsh lxappearance qt6ct fcitx5 fcitx5-mozc fcitx5-configtool snapd thermald powertop cpu-x flatpak polkit kdeconnect-kde qlipper xkill mpv xclip sqlite3 antimicrox leafpad tmux bat fzf gamemode xhost neovim python3-pip nodejs tmux gammastep picom kernel-tools blueman network-manager-applet pulseaudio-utils wdisplays slurp grim libva-utils mpc meson ninja-build wayland-protocols-devel dav1d lm_sensors audacity gimp chromium piper fastfetch hyprpicker radeontop cmake hyprpaper wayvnc sysstat iotop libavcodec-freeworld mesa-va-drivers-freeworld hyprpolkitagent wev

sudo dnf copr enable zeno/scrcpy
sudo dnf copr enable solopasha/hyprland
sudo dnf copr enable wef/cliphist
sudo dnf copr enable lexa/SwayNotificationCenter
sudo dnf copr enable zeno/scrcpy

sudo dnf install scrcpy pyprland cliphist aylurs-gtk-shell SwayNotificationCenter

sudo dnf install --setopt=install_weak_deps=False nomacs

pip3 install jedi trash-cli 
#sudo dnf in meson vulkan-devel libXxf86vm-devel libXres-devel libdrm-devel wayland-protocols-devel SDL2-devel libudev-devel libinput-devel libseat1 seatd-devel wlroots-devel gslang-devel libcap-devel
flatpak install vscodium librewolf brave flatseal obsidian mGBA melonDS

sudo dnf rm elisa-player vlc kmouth inkscape khelpcenter gwenview

sudo dnf install -y @development-tools 

# Commit on github without the need to type the credentials
git config --global credential.helper store
git config --global user.email "email"
git config --global user.name "name"

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! DNF CONFIGURATION

sudo vim /etc/dnf/dnf.conf
# Add these to the file:
fastestmirror=True
max_parallel_downloads=20
defaultyes=Yes

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! UPGRADE FEDORA VERSION
https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/

sudo dnf upgrade --refresh
reboot
sudo dnf install dnf-plugin-system-upgrade
sudo dnf system-upgrade download --releasever=39 # Change for the release number
# There may be some packages with unsatisfied dependencies, so be sure to check if everything is ok
sudo dnf system-upgrade reboot

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! CONFIGURE NEOVIM 

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# :PlugInstall
# :PlugUpdate
:TSInstall c cpp awk bash html php json rust sxhkdrc yaml toml javascript css java markdown markdown_inline lua sql python kotlin

vim ~/.local/share/nvim/plugged/dracula.nvim/lua/dracula/palette.lua
# Change the bg to #0f0f17

# Coc auto completion
sudo dnf in python3-pip nodejs
sudo npm install -g yarn
cd ~/.local/share/nvim/plugged/coc.nvim
yarn install
yarn build
pip3 install jedi

:CocInstall coc-python coc-html coc-css coc-tsserver coc-clangd coc-java coc-sh coc-kotlin
:CocInstall @yaegassy/coc-intelephense
# Open a C/C++ file and use this command
:CocCommand clangd.install

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! CONFIGURE TMUX
sudo dnf in tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux
# Type Alt+f and then Shift+I

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SET GITHUB FILES BACKUP  

mkdir -p ~/re/git
cd ~/re/git
git clone https://github.com/KenichiNishiya/dotfiles.git
cp -r config/* ~/.config/

mkdir ~/.config/bakap
cd ~/.config/bakap

mkdir bspwm;mkdir polybar;mkdir sxhkd;mkdir zsh_aliases;mkdir zprofile;mkdir zshrc;mkdir wofi;mkdir waybar;mkdir hypr;mkdir tmux;mkdir kitty

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SET ZSH
https://www.sitepoint.com/zsh-tips-tricks/

sudo dnf in zsh
# Make zsh the default shell
chsh -s $(which zsh)
# reboot

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
vim ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
# Change the %c% near the end of the first line to %~%
# Source or reopen the terminal

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! FONTS

# Download these:
https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Sans/complete/Noto%20Sans%20Medium%20Nerd%20Font%20Complete.ttf
https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip

https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Sans/NotoSansNerdFont-Medium.ttf

sudo mkdir /usr/share/fonts/jetbrains-mono-fonts
cd /usr/share/fonts/jetbrains-mono-fonts
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
sudo unzip JetBrainsMono.zip
sudo rm -rf JetBrainsMono.zip

# # Remember to unzip the file
# sudo cp -r ~/Downloads/JetBrainsMono /usr/share/fonts/jetbrains-mono-fonts
# sudo chown yori:yori /usr/share/fonts/jetbrains-mono-fonts/JetBrainsMono

sudo mkdir /usr/share/fonts/noto-nerd-font
cd /usr/share/fonts/noto-nerd-font
sudo wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Sans/NotoSansNerdFont-Regular.ttf

# sudo cp ~/Downloads/Noto\ Sans\ Medium\ Nerd\ Font\ Complete.ttf /usr/share/fonts/noto-nerd-font

sudo dnf in google-noto-sans-jp-fonts
# Reload the fonts
fc-cache -f -v

# You can check all fonts installed with
fc-list

# You can search with
fc-match FontName

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! INSTALLING BSPWM AND OTHER THINGS

sudo dnf in git bspwm rofi nitrogen sxhkd polybar dunst lxqt-policykit picom
# I'll be using sddm, but having lightdm as a fallback is nice

sudo systemctl enable sddm
# Remeber to disable any other Display Manager if applicable, such as
# sudo systemctl disable display-manager

# mkdir ~/.config/bspwm
# cp ~/re/git/Fedora/config/bspwm/bspwmrc ~/.config/bspwm/
# sudo chmod +x ~/.config/bspwm/bspwmrc

# mkdir -p ~/.config/rofi
# cp -r ~/re/git/Fedora/config/rofi/* ~/.config/rofi/
# The default color scheme here is Dracula
# Other color schemes you can find here:
# https://github.com/adi1090x/rofi/tree/master/files/colors

# mkdir ~/.config/sxhkd
# cp ~/re/git/Fedora/config/sxhkd/sxhkdrc ~/.config/sxhkd/

# mkdir ~/.config/polybar
# cp ~/re/git/Fedora/config/polybar/* ~/.config/polybar/
# sudo chmod +x ~/.config/polybar/launch.sh

# mkdir ~/.config/nvim
# cp -r ~/re/git/Fedora/config/nvim/* ~/.config/nvim/

# cp ~/re/git/Fedora/config/mpd ~/.config/

# cp ~/re/git/Fedora/config/ncmpcpp ~/.config/

# mkdir ~/.config/picom
# cp ~/re/git/Fedora/config/picom/picom.conf ~/.config/picom/

# mkdir ~/.config/dunst
# cp ~/re/git/Fedora/config/dunst/dunstrc ~/.config/dunst/

# Start dusnst and test if you want
notify-send Title Message

# SDDM config files need sudo 
sudo cp ~/re/git/dotfiles/config/sddm/sddm.conf /etc/sddm.conf.d/
sudo cp -r ~/re/git/dotfiles/config/sddm/sddm-sugar-candy /usr/share/sddm/themes/

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! CONFIGURE THEME GTK AND QT

sudo dnf in lxappearance qt6ct kvantummanager nitrogen

mkdir -p ~/.themes
cd ~/.themes
wget https://github.com/dracula/gtk/archive/master.zip
unzip master.zip
rm -rf master.zip

mkdir -p ~/.icons
cd ~/.icons
git clone https://github.com/m4thewz/dracula-icons

# For the cursor we need to something different:
# It needs to be in tar.gz format
mv ~/.themes/dracula/kde/cursors/Dracula-cursors ~/.themes
cd ~/.themes
tar -cvzf Dracula-cursors.tar.gz Dracula-cursors
# Place it anywhere, I usually leave on the .themes folder

lxappearance

sudo cp -r ~/.themes/gtk-master /usr/share/themes
sudo cp -r ~/.icons/dracula-icons /usr/share/icons/
sudo mkdir /usr/share/themes/dracula
sudo cp -r ~/.themes/Dracula-cursors.tar.gz /usr/share/themes/dracula/

sudo lxappearance

# Cursor theme on Desktop screen and other things idk
sudo vim /usr/share/icons/default/index.theme
sudo vim /usr/share/gtk-2.0/gtkrc

# Now for the QT stuff

mkdir -p ~/.themes/Dracula
# cd /opt
cd ~/.themes/
git clone https://github.com/dracula/gtk.git
mv ~/.themes/gtk-master/kde/kvantum/* ~/.themes/Dracula
rm -rf gtk-master

wget https://github.com/catppuccin/qbittorrent/blob/main/mocha.qbtheme
mv mocha.qbtheme ~/.themes

# cd /opt
# git clone https://github.com/catppuccin/Kvantum.git
# mv /opt/Kvantum/src/Catppuccin-Mocha-Mauve /home/yori/.themes
# rm -rf Kvantum

kvantummanager
sudo kvantummanger
# Install/Update Theme > Select a Kvantum theme folder > ~/.themes/Catppuccin-Mocha-Mauve > Choose > Install this theme
# Change/Delete Theme > Select a theme: > Catppuccin-Mocha-Mauve > Use this theme
qt6ct
sudo qt6ct # Altough this won't work unless you set the env var on /etc/profile
# Appearance > Style: > kvantum > Apply
# Icon Theme > Dracula > Apply

vim .profile
# Paste the following line:
export QT_QPA_PLATFORMTHEME=qt6ct

# Fix qt theme (dark text in dark background)
cp ~/re/git/dotfiles/kdeglobals ~/.config/

# Change the desktop background
nitrogen
# To always initailize with the same background, put the following on .profile
nitrogen --restore

# Also change the lightdm background
sudo cp ~/Pictures/.sysimg/ayy.jpg /usr/share/backgrounds
sudo cp ~/Pictures/.sysimg/suk.png /usr/share/backgrounds
sudo lightdm-gtk-greeter-settings

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! CONFIGURE SDDM

sudo dnf install sddm
git clone https://framagit.org/MarianArlt/sddm-sugar-candy.git
sudo cp -r sddm-sugar-candy /usr/share/sddm/themes

sudo systemctl enable sddm
sudo systemctl disable lightdm # Or any other pre existing display manager

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! ALACRITTY TERMINAL

sudo dnf in alacritty
mkdir ~/.config/alacritty
cp /opt/Fedora/config/alacritty/alacritty.yml ~/.config/alacritty/

# If you use multi monitor with different sizes, do the following to fix (if broken )the font:
vim .profile
# Paste the following command:
export WINIT_X11_SCALE_FACTOR=1

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SETUP MPD
# Do not enable mpd systemd service
mkdir ~/.local/share/mpd
mkdir ~/.local/share/mpd/playlists
touch ~/.local/share/mpd/database
touch ~/.local/share/mpd/state
touch ~/.local/share/mpd/sticker.sql

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! JAPANESE KEYBOARD INPUT
#https://www.youtube.com/watch?v=lJoXhS4EUJs

sudo dnf in fcitx5 fcitx5-mozc fcitx5-configtool

sudo vim ~/.profile
# Paste the following somewhere in the file
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
# export QT_IM_MODULE=fcitx # If using wayland, add the below instead for each file
# https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland

vim ~/.gtkrc-2.0
gtk-im-module="fcitx"

vim ~/.config/gtk-3.0/settings.ini 
gtk-im-module=fcitx

vim ~/.config/gtk-4.0/settings.ini 
gtk-im-module=fcitx

# Make it auto start on a startup file
fcitx5 &

# fctix5-configtool
# On the menu click the + button and deselect the box, then add mozc

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! PULSEMIXER TO CONTROL SOUND VOLUME

curl https://raw.githubusercontent.com/GeorgeFilipkin/pulsemixer/master/pulsemixer > pulsemixer && chmod +x ./pulsemixer
sudo mv pulsemixer /opt
# To use it you will have to type it's full path (/opt/pulsemixer)

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! FLATPAK AND SNAP

sudo dnf in flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# GTK theme
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons
# May not work with themes outside the home directory
sudo flatpak override --env=GTK_THEME=gtk-master
sudo flatpak override --env=GTK_THEME=dracula-icons
# Might need to reboot
reboot

# SNAPD
sudo dnf in snapd
sudo systemctl enable --now snapd
# sudo systemctl enable --now snapd.apparmor
# reboot

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! POWER SAVING

sudo dnf in xfce4-power-manager
sudo dnf in lxqt-powermanagement
# These are GUI apps for power management, xfce's has brightness control, while lxqt don't

#- auto-cpufreq
sudo snap install auto-cpufreq
sudo snap run auto-cpufreq --install

#- thermald (only for Intel CPUs)
sudo dnf in thermald
sudo systemctl enable --now thermald

#- powertop
sudo dnf in powertop
# You can make it auto run on startup:
sudo vim /etc/systemd/system/powertop.service
# Paste the following content
'
[Unit]
Description=Powertop tunings

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/powertop --auto-tune

[Install]
WantedBy=multi-user.target
'
sudo systemctl enable --now powertop

# Or you can use the powertop2tuned utility:
# sudo dnf install tuned-utils
# sudo systemctl enable --now tuned
# sudo powertop2tuned -e profile_name
# sudo tuned-adm profile profile_name

# Check the cpu frequency with
cpupower frequency-info
# Change the governor with
sudo cpupower frequency-set --governor powersave
# This is the default governor and probably the best one.
# But may need to change the max frequency with
sudo cpupower frequency-set --max 3500mhz

# If you use Intel cpu with TurboBoost, check if it's enabled with 
cat /sys/devices/system/cpu/intel_pstate/no_turbo
# It's a double negative, so 0 means that it's ACTIVE
# If you want to change it to 0 do:
echo "0" | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo

# You can see the stats with this
lscpu |egrep "Model name|MHz"

# Check CPU frequency in rt
watch -n1 "grep \"^[c]pu MHz\" /proc/cpuinfo"

# GUI for CPU frequency
sudo dnf in cpu-x

# Test with
sudo dnf in stress-ng
stress-ng --cpu 4

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! GPU TESTING
# https://www.cyberciti.biz/open-source/command-line-hacks/linux-gpu-monitoring-and-diagnostic-commands/

sudo dnf in intel-gpu-tools glmark2

sudo intel_gpu_top

glmark2 --fullscreen --show-all-options
vblank_mode=0 glxgears

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! USE HARDWARE ACCELERATION ON OBS (FFMPEG VAAPI)
# https://wiki.archlinux.org/title/Intel_graphics#Hardware_accelerated_H.264_decoding_on_GMA_4500

# Honestly, first time I installed obs studio on openSUSE it didn't work. After some time it did work. Have no idea what happened
sudo dnf in libva-utils
# May need a reboot

# Edit: still don't know what is happening, but installing via flatpak may be the solution
flatpak install obsproject

# Optionally some tweaked hardware encoders
# https://plus.diolinux.com.br/t/vaapi-mais-rapido-para-intel-amd-no-linux/46961/8
flatpak install org.freedesktop.Platform.GStreamer.gstreamer-vaapi com.obsproject.Studio.Plugin.Gstreamer org.freedesktop.Platform.VulkanLayer.OBSVkCapture com.obsproject.Studio.Plugin.OBSVkCapture

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! FIX SUDO
sudo usermod -aG wheel yori
sudo visudo

# At around line 43, starting with env_keep = "LANG... add at the end within the quotes:
'DISPLAY XAUTHORITY'
# Comment lines 68 and 69:
'Defaults targetpw
ALL ALL = (ALL) ALL'
# Uncomment line 81
'%wheel ALL=(ALL) ALL'
# Save and 
reboot

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#- DISABLE QUOTAS
# Having quotas enabled let you verify the disk usage for the snapshots, however it can impact performance, mostly if you have too many snapshots (like, more than 50 I guess)
sudo btrfs quota disable /
# To verify if quota is disabled:
sudo btrfs qgroup show /

#- CHECK USED SPACE
# Seems like btrfs is sometimes tricky when checking disk usage. One command that -maybe- is the most accurate is
sudo btrfs filesystem usage /
# Refer to 'used' and 'free'

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! JOURNALCTL ERRORS

'chronyd[837]: Could not add source 200.20.186.76'
sudo systemctl disable chronyd
# Seems to be a program to sync the clock

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! ENABLE TRIM FOR SSD (BETTER PERFORMANCE AND SSD LIFETIME)

# To verify if the SSD has trim support, run:
lsblk --discard
# If the values under the DISC-GRAN and DISC-MAX are different than 0, then it has support. In that case: 
sudo systemctl enable fstrim.timer

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! ADJUST SWAPPINESS
sysctl vm.swappiness
sudo vim /etc/sysctl.d/99-swappiness.conf
# Add the following line:
vm.swappiness=10

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! ADJUST SWAPPINESS FOR ZRAM
sudo vim /etc/sysctl.d/99-swappiness.conf
# Add the following line:
vm.swappiness = 180
vm.watermark_boost_factor = 0
vm.watermark_scale_factor = 125
vm.page-cluster = 0

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! VIM VIXEN STYLE
'
.vimvixen-console-frame {
  color-scheme: light !important;
}
'

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! CUSTOMIZE AND SETUP FIREFOX CSS 

# Find the firefox profile you are using and cd to it
mkdir .mozilla/firefox/*.default-release/chrome
cp ~/re/git/dotfiles/userChrome.css .mozilla/firefox/*.default-release/chrome/
# Inside firefox, go to about:config and turn true the following:
'
media.ffmpeg.vaapi.enabled
media.hardware-video-decoding.force-enabled
toolkit.legacyUserProfileCustomizations.stylesheets
layers.acceleration.force-enabled
gfx.webrender.all

general.smoothScroll.currentVelocityWeighting 1 
general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS 12 
general.smoothScroll.msdPhysics.enabled true 
general.smoothScroll.msdPhysics.motionBeginSpringConstant 600 
general.smoothScroll.msdPhysics.regularSpringConstant 250 
general.smoothScroll.msdPhysics.slowdownMinDeltaMS 25 
general.smoothScroll.msdPhysics.slowdownMinDeltaRatio 0.3 
general.smoothScroll.msdPhysics.slowdownSpringConstant 250 
general.smoothScroll.stopDecelerationWeighting 1.0

mousewheel.default.delta_multiplier_y 200

# if the mouse scroll is too slow
mousewheel.default.delta_multiplier_y 400
'

# Change UI size
about:config
# Search for
layout.css.devPixelsPerPx
# Set something like 1.25

# If firefox can't recognize camera, turn off:
media.webrtc.camera.allow-pipewire

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! RUN GUI PROGRAMS WHICH REQUIRES SUDO/ROOT
# https://wiki.Fedora.org/title/Polkit#Configuration

sudo dnf in polkit lxqt-policykit

# You need to set it to auto start on .profile
lxqt-policykit-agent &

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! RUN A GAME ON LUTRIS / WINE WITH JAPANESE LOCALE

# WINE:
env LANG=ja_JP.UTF-8 wine Touhou.exe
# LUTRIS: Paste the command above on the arguments part of the app launch

# You may need to install the Meiryo font inside /usr/share/fonts/ as it's the default japanese font for Windows 7+
fc-cache -f -v

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! CREATE A 32-BIT WINE PREFIX

WINEPREFIX="$HOME/re/games/wine32" WINEARCH=win32 wine wineboot

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! INSTALLING FONTS ON WINE

WINEPREFIX="$HOME/re/games/wine32" winetricks corefonts
# If not specified, it will use the default wineprefix

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! GAME ON WINE NOT WORKING

# Try the following things:
'
- Change locale via environment variables
- Use a 32 bit prefix
- Install all fonts
- cp -r the game directory to inside the wine prefix, such as in "wine/drive_c/Program\ Files"
- cd to the game directory and execute from there on the terminal
'

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! MANGOHUD / GOVERLAY NOT WORKING 

# There are many possible causees for that
# Firstly, you can test with
mangohud glxgears
vblank_mode=0 mangohud glxgears
mangohud vkcube

# On older games, try
mangohud.x86 %command%

# On OpenGL games, dynamic hooking may be needed
mangohud --dlsym %command%
MANGOHUD_DLSYM=1
# On Lutris:
'System options > Advanced > Game execution > command prefix'
'mangohud --dlsym'

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! FERAL GAMEMODE

# sudo dnf in gamemoded libgamemode0 libgamemode0-32bit libgamemodeauto0 libgamemodeauto0-32bit gamemode

# On steam
'gamemoderun %command%'
'gamemoderun mangohud %command%'
'INTEL_DEBUG=norbc gamemoderun gamescope -w 1366 -h 768 -f mangohud %command%'
# On lutris 
#'Configure > System options > Advanced > Command prefix'
'gamemoderun'

# To test, open the game and run the following:
gamemoded -s

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! GAMESCOPE
# It helps if the mouse cursor goes to other monitors when playing games

# sudo dnf in meson ninja vulkan-devel libXxf86vm-devel libXres-devel libdrm-devel wayland-protocols-devel SDL2-devel libudev-devel libinput-devel libseat1 seatd-devel wlroots-devel gslang-devel libcap-devel

cd ~/re/git/
git clone https://github.com/Plagman/gamescope.git
git submodule update --init
meson build
ninja -C build
meson install -C build/ --skip-subprojects

# List all options
gamescope --help 

# Graphics all glicthed: use the following env var:
INTEL_DEBUG=norbc

# Use exemple on steam if the mouse keeps escaping
INTEL_DEBUG=norbc gamescope -f %command%

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
# CUSTOM PROTON GE EGG ROLL
# https://www.makeuseof.com/install-proton-ge-on-steamos-linux/

mkdir ~/.steam/root/compatibilitytools.d
# https://github.com/GloriousEggroll/proton-ge-custom
tar -xf GE-Proton*.tar.gz -C ~/.steam/root/compatibilitytools.d/
# Exit steam and reopen it

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! WINE OPEN ON DEFAULT BROWSER
# http://www.webupd8.org/2010/03/how-to-make-wine-open-links-in-your.html

wine regedit
# Go to 'HKEY_CURRENT_USER > Software > Wine'
# Create a key named "WineBrowser" if it doesn't exist
# Paste the following as data
'
xdg-open,firefox,konqueror,mozilla,netscape,galeon,opera,dillo
'

# You may need to go to 'HKEY_CLASSES_ROOT > http > hell > open > command' and add the following to the line: '"%1"'

# Note: the single quotes don't enter in this, it's just for comment formatting.

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! MAKE A .desktop FILE FOR A LUTRIS GAME ENTRY FOR ROFI

# Package needed to call the game via CLI
sudo dnf in python310-magic

vim ~/.local/share/applications/NAMEOFTHEAPP.desktop

# For system wide apps, the path is /usr/share/applications
# Use the following template:
'
[Desktop Entry]
Type=Application
Name=Touhou
Icon=th
Exec=env LUTRIS_SKIP_INIT=1 lutris lutris:rungameid/9
Categories=Game
Keywords=Touhou, th
'

# Icon: You can put it on '~/.icons/' or in '/usr/share/pixmaps/' and must be a '.png' or other supported format, don't support '.jpg' nor '.jpeg'
# lutris/rungameid/9: Should correspond with the order that the games are added on Lutris, in this case, the game is the 9th
# You can, of course, create a .desktop file directly on Lutris by right clicking the game and selecting 'Create Application Menu Shortcut'

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! YOUTUBE-DLP (YT-DLP)

sudo dnf in yt-dlp AtomicParsley ffmpeg

# Wat
yt-dlp -o '~/Music/%(playlist_title)s/%(title)s.%(ext)s' -ciw -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 --add-metadata --cookies '~/Documents/ytdl/cookies-youtube-com.txt' --download-archive '~/Documents/ytdl/yt-dl_wat.txt' 'https://www.youtube.com/playlist?list=PLBYlt8Uh0EcxaT51BU5cyYxiGtN6JmoGL'

# Ongaku
yt-dlp -f bestaudio -ciw --newline -o '~/Music/%(playlist_title)s/%(title)s.%(ext)s' -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata -ciw --download-archive '~/Documents/ytdl/yt-dl_ongaku.txt' --cookies '~/Documents/ytdl/cookies-youtube-com.txt' 'https://www.youtube.com/playlist?list=PLBYlt8Uh0EcwSftTxeFaI3-6cqcQImKPZ'

# Video with subtitles and description on a separate folder
yt-dlp -o '/media/sf_Music/youtube-dl/%(playlist_title)s/%(title)s/%(title)s.%(ext)s' -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 --add-metadata --audio-quality 0 --embed-thumbnail -ciw --all-subs --write-description --download-archive '/media/sf_Music/youtube-dl/yt-dl.txt --cookies /home/yori/Desktop/cookies-youtube-com.txt' 'https://www.youtube.com/playlist?list=PLBYlt8Uh0EcwSftTxeFaI3-6cqcQImKPZ'

# Generic video
yy-dlp -o '/media/sf_Music/youtube-dl/%(playlist_title)s/%(title)s.%(ext)s' -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 --add-metadata --cookies '/home/yori/Desktop/cookies-youtube-com.txt' --download-archive yt-dl_video.txt ''

# Generic audio only
yt-dlp -f bestaudio -o '/media/sf_Music/youtube-dl/%(playlist_title)s/%(title)s.%(ext)s' -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata -ciw --download-archive yt-dl_audio.txt --cookies '/home/yori/Desktop/cookies-youtube-com.txt' 'https://www.youtube.com/playlist?list=PLBYlt8Uh0EcwSftTxeFaI3-6cqcQImKPZ'

# until ;do sleep 5; done //set a 5 sec delay between donwloads

#'%(autonumber)s - %(title)s.%(ext)s'

#/home/yori/youtube-dl/%(title)s.%(ext)s #directory to where it'll download, if don't exists it creates it, but need to use sudo and it'll be locked
#sudo chown -R $USER: $HOME
#to unlock

#--match-filter 'duration < 600' //only download videos shorter than 600 seconds

# Error: /usr/bin/env: ‘python’: No such file or directory
sudo ln -s /usr/bin/python3 /usr/bin/python

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣' 
#! DOLPHIN NOT SHOWING VIDEO THUMBNAILS
# https://www.q4os.org/forum/viewtopic.php?id=3462

sudo dnf in ffmpegthumbs
# Go to 'Configure > Configure Dolphin > Previews
# Check the video option

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! MICROPHONE CONFIGURATION AND TROUBLESHOOTING

#- HEADPHONE MIC NOT BEING RECOGNIZED

sudo dnf in pavucontrol
# This is a GUI application to control sound

#- MIC IS BOOSTED / BAD

alsamixer
# Press 'F6'
# Select the device other than the (default)
# Navigate to the right and remove any of these:

Headphone Mic Boost
Headset Mic Boost
Internal Mic Boost

# Press 'Esc'

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SHUTDOWN (OR ANY) COMMAND NOT FOUND

# Maybe the /sbin is not on your $PATH 
# To add it, do:
export PATH=/usr/libexec:/sbin:$PATH
# You can put it on your .profile so it's persistent

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! RANGER CONFIGURATION
sudo dnf in ranger

#- RANGER SHOW IMAGE AND VIDEO THUMBNAIL
sudo dnf in ffmpegthumbnailer

# Copy all the base config files
ranger --copy-config=all
vim .config/ranger/rc.conf
# Go to these lines and edit to be like these
'
line 046 set preview_script ~/.config/ranger/scope.sh
line 073 set preview images true
line 116 set preview_images_method kitty
'
vim .config/ranger/scope.sh
# Go to these lines and remove the comment
'
line 171 video/*)
line 175 ffmpegthumbnailer -i "${FILE_PATH}" -o "${IMAGE_CACHE_PATH}" -s 0 && exit 6
line 176 exit 1;;
 '

#- OPEN FILE EXTENSION WITH DEFAULT PROGRAM APPLICATION
vim .config/ranger/rifle.conf
# Here we have a lot of different default applications to various file extensions, they will be read line by line, so the upper it is, the higher the priority

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SCRCPY TO CONTROL YOUR SMARTPHONE FROM PC

sudo dnf copr enable zeno/scrcpy && sudo dnf install scrcpy
# Select 1 and 1 again

sudo dnf in android-tools

# Plug the device through USB
# Search the IP on the phone configurations
adb usb
adb tcpip 5555
adb connect 192.168.15.52 # Use your IP here
# Unplug the device to run via Wi-fi
# To run with less latency:
scrcpy -m800 -b2M -S

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! CREATE A HOTSPOT INTERNET CONNECTION (BEST WAY)

# I forgot to document it on openSUSE, but it worked after installing some packages, try the below and if it doesn't work, then go to their github and install more packages
sudo dnf in gtk3-devel gcc gcc-c++ kernel-devel pkg-config make hostapd qrencode-devel libpng-devel
cd /opt

git clone https://github.com/lakinduakash/linux-wifi-hotspot
cd linux-wifi-hotspot
sudo make
sudo make install

# To execute the GUI via cli:
wihotspot

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! TRACKPAD WITH WEIRD CONFIG

# Create a conf file if don't exists
sudo vim /etc/X11/xorg.conf.d/70-touchpad.conf

# Paste the following:
'
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
        Option "TapButton1" "1"
        Option "TapButton2" "3"
        Option "TapButton3" "2"
        Option "NaturalScrolling" "on"
        Option "Tapping" "on"
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
'
'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! DISABLE MOUSE ACCELERATION
# https://wiki.Fedora.org/title/Mouse_acceleration#Disabling_mouse_acceleration

sudo vim /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
# Paste the following:
'
Section "InputClass"
	Identifier "My Mouse"
	Driver "libinput"
	MatchIsPointer "yes"
	Option "AccelProfile" "flat"
	Option "AccelSpeed" "0"
EndSection
'

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! COPY TOKEN TO THE CLIPBOARD

alias tk="echo 'token' | xclip -selection c"

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! FREEDOWNLOADMANAGER
sudo dnf in openssl xdg-utils ffmpeg
cd /opt
mkdir freedownloadmanager
cd freedownloadmanager
wget https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb
ar x ./freedownloadmanager.deb
sudo tar -xvJf data.tar.xz -C /

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SET UP PRINTER EPSON

# You will need epson's generic drivers, which can be found here:
# https://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=EN&CN2=&DSCMI=134381&DSCCHK=9edfca27f0a940d9e3f3156a3d46047ffbfe6d79
sudo dnf in epson-inkjet-printer-escpr
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

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! INTERNET NOT WORKING AFTER PROTONVPN

# Probably an issue related to security, disable or remove it with the following
nmcli con down id pvpn-ipv6leak-protection
nmcli connection delete id pvpn-ipv6leak-protection

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SET EXTRA MOUSE BUTTONS
sudo dnf in xvkbd xbindkeys

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

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! THUNAR CONFIGURATIONS

# AUTOMOUNT USB DEVICES AND DRIVES
sudo dnf install gvfs

# If it doesn't work, try to install this package
sudo dnf install thunar-volman

# ACESS REMOTE FILES
sudo dnf install gvfs-smb sshfs

# FRONT-END TO ARCHIVING TOOLS (ARK)
sudo dnf install thunar-archive-plugin
# Program restart is needed

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! MAKE VIM WORK ON CRONTAB

vim ~/.vimrc
# Add the following:
set backupskip+=/var/spool/cron/*

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! VULKAN NOT INSTALLED OR SUPPORTED ERROR
# May have different drivers installed

ls -l /usr/share/vulkan/icd.d/
# If there is like amd and intel drivers, just remove the unused one
# To make sure it worked, use this tool
sudo dnf install vulkan-tools
vulkaninfo

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! FILE EXPLORER POPUP CRASHES WHEN TRY TO SORT AND DON'T USE THE GTK THEME

# If the popup window is 'xdg-desktop-portal-gnome', them
sudo dnf remove xdg-desktop-portal-gnome
reboot

# The system will use xdg-desktop-portal-gtk. If not:
sudo dnf install xdg-desktop-portal-gtk

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! (wine?) Performance support disabled
sudo vim /etc/sysctl.d/60-mdapi.conf
# Paste the following
'
dev.i915.perf_stream_paranoid=0
'

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! STUTTERING ON WINE AND PROTON AUDIO
# https://bbs.Fedora.org/viewtopic.php?id=276168
# May be caused by audio buffer underrun

vim ~/.config/pipewire/pipewire.conf
# If it doesn't exists, then:
mkdir ~/.config/pipewire
cp -r /usr/share/pipewire/* ~/.config/pipewire/

# Edit the values of lines 31 and 32 to these:
'
default.clock.quantum       = 1024
default.clock.min-quantum   = 1024
'
# You can regulate to see which is better. The higher the value, the higher the latency.
systemctl restart pipewire-pulse --user ; systemctl restart pipewire --user

# MAY BE WORTH TRYING IF THE PREVIOUS THING FAILED:
# On Proton add this on config to startup
PULSE_LATENCY_MSEC=60 %command%

# On Lutris add this at System Options' key
PULSE_LATENCY_MSEC
60 # This is the value

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SETTING UP A CRON JOB

# List crontab
crontab -l

# Edit crontab
crontab -e

# SYNTAX: m h d m w command, each can be * to say any
# Can be @hourly @daily @monthly @reboot @
'
59 23 * * 0 dnf update
'
# This makes a system update every sunday at 23:59

# You can run with other users, ex
sudo crontab -u root -l

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SHOW SYSTEMD PROCESSES AT BOOT / SHUTDOWN

sudo vim /etc/default/grub
# Go to the line with "GRUB_CMDLINE_LINUX_DEFAULT" and remove the following options:
"loglevel 3 quiet"

sudo grub2-mkconfig -o /boot/grub2/grub.cfg

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! RUN A COMMAND WITH SUDO WITHOUT PASSWORD

# Search where is all the command binary
type -a umount

sudo vim /etc/sudoers.d/filename
# It's recommended to put your username as the filename in order to better manage sudoers

# Paste the following, changing to your username and program binary location
'
yori ALL=(ALL) NOPASSWD:/usr/bin/umount,/bin/umount
'

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
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

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! JAVA APPLICATIONS GREY/BLANK SCREEN
# https://wiki.Fedora.org/title/Bspwm#Problems_with_Java_applications

# If Java apps or IDEs like Android Studio and NetBeans don't show properly:
sudo dnf in wmname
vim ~/.config/bspwm/bspwmrc
# Paste the following:
wmname LG3D

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! XAMPP / LAMPP / LAMP
# https://www.apachefriends.org/faq_linux.html

# Download the newest version here:
# https://www.apachefriends.org/download.html

sudo dnf in php

chmod 755 xampp-linux-*-installer.run
sudo ./xampp-linux-*-installer.run

# To start:
sudo /opt/lampp/lampp start

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! BLUETOOTH

sudo dnf in bluez bluez-tools blueman 
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

#- BLUETOOTH SERVICE ERROR
# https://askubuntu.com/questions/1340713/bluetooth-service-failed-to-set-mode

sudo rfkill unblock bluetooth
sudo systemctl stop bluetooth
sudo systemctl status bluetooth
sudo systemctl restart bluetooth

# GAMEPAD CONTROLLER NO INPUT EVEN WHEN CONNECTED
# https://www.reddit.com/r/linux_gaming/comments/tdh3gq/controller_connected_but_not_detected/
sudo vim /etc/bluetooth/input.conf
# Uncomment or add those lines
'
[General]
UserspaceHID=true
ClassicBondedOnly=true
LEAutoSecurity=true
'
# Restart, connect the gamepad controller via usb, then unplug and try to connect via bluetooth

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
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

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! TIMESHIFT DON'T MAKE AUTOMATIC SNAPSHOTS
# https://github.com/teejee2008/timeshift/issues/396

systemctl enable cronie.service
systemctl start cronie.service

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! DOWNLOAD VIDEOS FROM NND
# https://github.com/AlexAplin/nndownload

pip install nndownload
nndownload.py -u user@mail.com -p password --add-metadata -o '~/Music/NND/{title}.{ext}' https://www.nicovideo.jp/watch/sm30171731
# It will send you a code to your e-mail or phone number for every video you want to download.

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! VIRT-MANAGER
# https://computingforgeeks.com/install-kvm-qemu-virt-manager-arch-manjar/

# Check if virtualization is enabled, must return a value higher than 0
egrep -c '(vmx|svm)' /proc/cpuinfo

# sudo dnf in qemu libvirt virt-manager virt-viewer dnsmasq bridge-utils ebtables iptables dmidecode ethtool
sudo dnf in @virtualization
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
# sudo virsh net-start default
# sudo virsh net-autostart default
#sudo virsh net-autostart --disable default
sudo vim /etc/libvirt/libvirtd.conf
# Uncomment those lines:

unix_sock_group = "libvirt" #L85
unix_sock_rw_perms = "0770" #L95

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
# Just modify the source path (/home/yori/share) and target Path (/sharepoint)
# Open the VM and type on it's terminal:
mkdir share
sudo mount -t 9p -o trans=virtio /sharepoint share
# To interact with the files made/altered by the guest on host, you may need sudo or chmod
sudo vim /etc/fstab
# Add the following, with the huge spaces being a tab key press
/sharepoint    /home/yori/share 9p    trans=virtio,version=9p2000.L,rw    0    0

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
# 'User name: yori'
# 'User password: *********'
# 'Domain: #ITS INDEED BLANK'
# 'Resolution: Use client resolution'
# 'Share folder: win10'


# TROUBLESHOOTING
# failed to connect socket to...
# https://github.com/code-ready/crc/issues/629

sudo vim /etc/libvirt/qemu.conf
# Add the following line:
'
stdio_handler="file"
'
sudo systemctl restart libvirtd.service

# INTERNET NOT WORKING
# May be caused by a conflict of 2 network managers: 'systemd-networkd' and 'NetworkManager'. Disable one of them.
# https://bbs.Fedora.org/viewtopic.php?id=273243&p=2
sudo systemctl disable systemd-networkd
reboot

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! REMOVE XFCE BLOAT

sudo dnf rm parole atril asunder claws-mail xfce4-dict geany gnumeric mousepad seahorse pidgin pragha ristretto transmission xarchiver xfburn eog

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! KVANTUM MANAGER SUPPORT QT6
# As the time of writing, kvantum doesn't support qt6

cd /opt
sudo git clone https://github.com/tsujan/Kvantum.git
cd Kvantum/Kvantum
sudo mkdir build && cd build
sudo cmake .. -DENABLE_QT5=OFF
sudo make install 

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! RENAME PC / CHANGE HOSTNAME

hostnamectl set-hostname newname
# To confirm it worked:
hostname
# It may or may not require a reboot

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SSD HEALTH CHECK

sudo dnf in smartmontools
# Check the name of the disk you want to check with
lsblk 

# To Check if it has failed or will fail in a near future:
sudo smartctl -d ata -H /dev/sda
# If it says "PASSED" then it should be good

# To check the general health of the disk, type
sudo smartctl -a /dev/sda
# On 'Vendor Specific SMART Attributs with Thresholds', if the value is 100 or near it, it should be good
# You can check the meaning of the other attributes here: https://www.cropel.com/library/smart-attribute-list.aspx

# TBW is a good indicator of a disk expected terabytes written, usually it is available on the manufacturer's information 
# To check total writes, it depends on the disk, maybe running the command above and looking at ID 241 is correct, but maybe the most consistent way to know it is:
sudo smartctl -l devstat /dev/sda | grep "Logical Sectors Written" | awk ' { print "TBW: "($4 * 512) * 1.0e-12, "TB" } '
;

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SWAY

sudo dnf in sway waybar gammastep wofi clipman libappindicator wl-clipboard 
#libpulse-devel not found
opi copyq

# Install eww
sudo dnf in cargo rustup gtk-layer-shell-devel 
rustup default nightly
cd ~/re/git
git clone https://github.com/elkowar/eww
cd eww
cargo build --release --no-default-features --features=wayland
cd target/release
chmod +x ./eww
# To run eww do
./eww/daemon
./eww open <window_name>

# Build waybar from source to enable experimental features
sudo dnf group install "C Development Tools and Libraries" "Development Tools"

sudo dnf in gtkmm3.0-devel jsoncpp-devel libsigc++-devel fmt-devel wayland-devel spdlog-devel gtk-layer-shell-devel libappindicator-gtk3-devel libdbusmenu-gtk3-devel libmdpclient-devel cmake meson scdoc wayland-protocols-devel date-devel gobject-introspection-devel libinput-devel systemd-devel catch2-devel

sudo dnf in gtkmm3-devel libxkbregistry-devel jsoncpp-devel libsicg++3-devel fmt-devel spdlog-devel libappindicator3-devel libmdpclient-devel scdoc libc++-devel Catch2-2-devel libgtk-3-0-devel libgtk-3-0-32bit libappindicator-devel libappindicator3-devel libdbusmenu-gtk3-devel gobject-introspection-devel gtk-layer-shell-devel
# I don't know if all of the dependencies above are necessary, but it was giving me some errors and installing all these + some more did the trick.
cd /opt
git clone https://github.com/Alexays/Waybar.git
cd Waybar
vim meson_options.txt
# Change the option experimental to true
# Other features can be enabled by changing 'auto' to 'enabled', however waybar will not build successfully if the needed packages aren't installed
# Auto means that if it has the needed packages, it will build with those features
meson build
ninja -C build
ninja -C build install
# You can use it without installing by running the following
./build/waybar

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! GKT APPS ON WAYLAND SLOW STARTUP

# Probably related to xdg-desktop-portal*, which makes us wait 25+ seconds for naught
sudo dnf rm xdg-desktop-portal-gtk
sudo dnf al xdg-desktop-portal-gtk
# May be xdg-desktop-portal-gnome or something else

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! WAYBAR TRAY NOT WORKING

sudo dnf in libappindicator libdbusmenu-gtk3-devel

# On your .zprofile, .zshrc copy the following:
export XDG_CURRENT_DESKTOP=Unity
# Check with:
echo $XDG_CURRENT_DESKTOP

# If it still doesn't work, rebuild waybar from github, with 'dbusmenu-gtk' set to 'enabled' 

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! FIX AUTHORIZATION PROTOCOL GTK AND QT

# If you can't open GUI apps with sudo via terminal, that's the solution
xhost si:localuser:root

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! NEOVIM'S CLIPBOARD DOESN'T WORK WITH WAYLAND'S CLIPBOARD

sudo dnf in wl-clipboard

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! XPROP ALTERNATIVE FOR HYPRLAND - HYPRPROP

sudo dnf in slurp socat
cd /opt
git clone https://github.com/vilari-mickopf/hyprevents.git
cd hyprevents
sudo make install
cd /opt
git clone https://github.com/vilari-mickopf/hyprprop.git
cd hyprprop
sudo make install

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SC-IM SPREADSHEET WITH NCURSES (CLI EXCEL)

dnf in ncurses bison gcc make pkg-config which xclip libxml2-2 libzip 
# libxlsxreader and xlsxwriter would be nice to have too

cd /opt
git clone https://github.com/andmarti1424/sc-im.git
sudo make -C src install

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SCREENSHOT ON WAYLAND

# I couldn't get Flameshot nor Spectacle to work on wayland, and as such, I will be using grim
sudo dnf in grim slurp

# Use as such to screenshot a selected region and copy to clipboard (not sure it's working tho)
grim -g "$(slurp)" $HOME/Pictures/sc/sc-$(date +"%Y-%m-%dT%H-%M-%S").png | wl-copy

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! GAMEPAD INPUT DON'T STOP SWAYIDLE COUNTDOWN

sudo dnf in libwayland-client
cd /opt
git clone https://github.com/nowrep/wljoywake.git
meson setup --prefix /usr build
ninja -C build && ninja -C build install

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! Install MySQL Workbench on Fedora
# https://docs.fedoraproject.org/en-US/quick-docs/installing-mysql-mariadb/

# Download the yum package corresponding to your system version
# https://dev.mysql.com/downloads/repo/yum/

cd /home/yori/Downloads 
sudo rpm -i mysql*
sudo dnf install -y mysql-community-server
sudo systemctl start mysqld
sudo systemctl enable mysqld

# Now install the Workbench
# https://dev.mysql.com/downloads/workbench/?os=src
cd /home/yori/Downloads
sudo rpm -Uvh mysql-workbench-community*
sudo dnf in -y mysql-workbench

# When first connecting to the localhost, you need the temp password
sudo grep 'temporary password' /var/log/mysqld.log

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
# Make a GTK app use a different theme

cd /usr/share/applications
sudo vim <name-of-app.desktop>
# Follow the example
'Exec=env GTK_THEME=Adwaita mysql-workbench'

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
# Set external jar libraries to run java code on terminal
# https://stackoverflow.com/questions/8949413/how-to-run-java-program-in-terminal-with-external-library-jar

# While you can use Eclipse IDE, you can run it from your terminal. First set the full path to the jar file like this:
export CLASSPATH=/path/to/.jar
# Then you can run as normal:
java file.java

# OR you can set the jar file to be used when executing:
java -cp /path/to/.jar file.java

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! OSU INSTALLER LUTRIS ERROR 256
# https://forums.lutris.net/t/osu-install-error-256/13851
# The above may help, but the way I solved it was with
winetricks dotnet40

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! POWER MANAGEMENT WITH SYSTEMD
# https://wiki.archlinux.org/title/Power_management#Power_management_with_systemd

# Uncomment and edit the desired configs
sudo vim /etc/systemd/logind.conf

# Reload systemd
sudo systemctl kill -s HUP systemd-logind
'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! WAYDROID
# https://docs.waydro.id/usage/install-on-desktops
sudo dnf in waydroid

# Setup with these:
'System OTA: https://ota.waydro.id/system'
'Vendor OTA: https://ota.waydro.id/vendor'

# Install arm support, gapps and id
cd /opt
git clone https://github.com/casualsnek/waydroid_script
cd waydroid_script
python3 -m pip install -r requirements.txt
python3 main.py

# To access system files
su
cd ~/.local/share/waydroid/data/media/0/

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SWAYAUDIOIDLEINHIBIT
sudo dnf in wayland-protocols-devel pulseaudio-libs-devel

cd /opt
git clone https://github.com/ErikReider/SwayAudioIdleInhibit.git
cd SwayAudioIdleInhibit
meson build
ninja -C build
meson install -C build
'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! CHANGE MPV KEYBINDS
mpv --input-test --force-window --idle

#! HIGH CPU USAGE WITH MPV - NO HARDWARE ACCELERATION
# Something about ffmpeg not having native support with AV1 so another decoder is needed for .mkv files
sudo dnf in dav1d

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! EXPORT QT_QPA_PLATFORMTHEME ON GDM // IMPORT OTHER ENV 
# https://unix.stackexchange.com/questions/680483/how-to-add-qt-qpa-platformtheme-qt5ct-environment-variable-in-arch-linux
# For some reason, when using GDM you can't export this env var on zshrc or zprofile
sudo vim /etc/environment
# Paste this inside
QT_QPA_PLATFORMTHEME=qt6ct
# This also helps if you can't find xdg-desktop-portal command
# NOTE: IF USING FEDORA MAY MESS WITH GPG KEYS STUFF, JUST UPDATE/INSTALL WITH THE --nogpgcheck FLAG

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
# LEAFPAD SLOW STARTUP
# https://discussion.fedoraproject.org/t/leafpad-slow-startup/74770
/usr/bin/dbus-launch --exit-with-session leafpad

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SCREEN SHARING OR SCREEN RECORDING
# https://www.reddit.com/r/swaywm/comments/l4e55v/guide_how_to_screenshare_from_chromiumfirefox/
# Probably an issue with xdg-desktop-portal-wlr not being used
# Export both these env
'
XDG_CURRENT_DESKTOP=sway
XDG_SESSION_TYPE=wayland
'

# Manually run the command below to replace the portal, or put your sway config to auto start
/usr/libexec/xdg-desktop-portal r & /usr/libexec/xdg-desktop-portal-wlr

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! CREATE SYSTEMD SERVICE WITH TIMER
sudo vim /etc/systemd/system/name.service
'
[Unit]
Description=something
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=on-failure
RestartSec=10
User=yori
ExecStart=/path/to/file.sh

[Install]
WantedBy=multi-user.target
'

sudo vim /etc/systemd/system/name.timer
# This one is set to run every day at 6am, within 1 minute of the time, and persistent as it will auto run asap in case the system was off that time
'
[Unit]
Description=something

[Timer]
OnCalendar=*-*-* 06:00:00
AccuracySec=1m
Persistent=true

[Install]
WantedBy=timers.target
'

sudo systemctl enable --now name.timer
sudo systemctl daemon-reload

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! PYTHON DEVELOPMENT
sudo dnf in scrot tesseract
pip install numpy pytesseract selenium plotly pyautogui pandas openpyxl beautifulsoup4

#! UPDATE ALL PIP PACKAGES
pip3 list -o | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print}' | cut -d' ' -f1 | xargs -n1 pip3 install -U 

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! GTK FOR C DEVELOPMENT

sudo dnf in gtk4 gtk4-devel glib pango gdk-pixbuf2-devel atk gobject-introspection-devel libepoxy-devel gtk+-devel clang

# If using an LSP on vim, it won't know where the gtk file header is
# To solve this, go to your project directory
# Create a .c file with #include <gtk/gkt.h>

# For gtk3
clang -MJ file.o.json `pkg-config --cflags gtk+-3.0` -o file file.c `pkg-config --libs gtk+-3.0` 
# For gtk4
clang -MJ test.o.json `pkg-config --cflags gtk4` -o test test.c `pkg-config --libs gtk4`

sed -e '1s/^/[\n/' -e '$s/,$/\n]/' *.o.json > compile_commands.json
'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! MYSQL FOR C DEVELOPMENT
# https://www.cyberciti.biz/tips/linux-unix-connect-mysql-c-api-program.html

sudo dnf in mariadb-connector-c-devel
sudo dnf in mysql-community-devel

# Include inside the file with
'</usr/include/mysql/mysql.h>'
# Compile with
gcc file.c -o file -I/usr/include/mysql -lmysqlclient
# Or
gcc file.c -o file -I/usr/include/mysql -L/usr/lib64/mysql -lmysqlclient 

# If it's not working:
# Check if -lmysqlclient is there
mysql_config --libs
# Include the path from the output here as flag
mysql_config --cflags

# Alternatively, just compile with everything 
gcc -o file $(mysql_config --cflags) file.c $(mysql_config --libs)

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! LAPTOP POOR PERFORMANCE PLUGGED OUT
sudo systemctl mask power-profiles-daemon.service
sudo systemctl unmask power-profiles-daemon.service
systemctl restart power-profiles-daemon.service

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! REMOVE GNOME BLOAT
sudo dnf rm rhythmbox totem

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SETUP KOTLIN
# https://idroot.us/install-kotlin-fedora-38/

sudo dnf install java-1.8.0-openjdk
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version
sdk list kotlin
sdk install kotlin <version>
# Test
kotlin -version
vim a.kt
'
fun main(){
    println("Hello")
}
'
kotlinc a.kt -include-runtime -d a.jar
java -jar a.jar

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SETUP MONGODB
# Install on Fedora 38
sudo tee /etc/yum.repos.d/mongodb.repo << "EOF" > /dev/null
[mongodb]
name=MongoDB
baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/7.0/${basearch}/
gpgkey=https://www.mongodb.org/static/pgp/server-7.0.asc
EOF
sudo rpm --import https://www.mongodb.org/static/pgp/server-7.0.asc
sudo dnf install mongodb-org
sudo systemctl enable mongod.service
sudo systemctl restart mongod.service

# openssl error
dnf erase -qy mongodb-mongosh
dnf install -qy mongodb-mongosh-shared-openssl3

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
### wl-gammarelay
git clone https://github.com/jeremija/wl-gammarelay.git
make
sudo make install PREFIX=/usr

busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 4500

### wl-present
curl https://raw.githubusercontent.com/Ferdi265/wl-mirror/main/scripts/wl-present > wl-present.sh && chmod +x wl-present.sh
sudo dnf in wl-mirror

git clone --depth=1 https://github.com/JaKooLit/Fedora-Hyprland.git ~/Fedora-Hyprland
cd ~/Fedora-Hyprland
chmod +x install.sh
./install.sh

### hyprshot
git clone https://github.com/Gustash/hyprshot.git Hyprshot
ln -s $(pwd)/Hyprshot/hyprshot $HOME/.local/bin
chmod +x Hyprshot/hyprshot

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#sddm.conf.d directory needs to be on /etc

mkdir .local/share/fonts 
cp -r JetBrainsMonoNerd .local/share/fonts

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'

sudo dnf in swtmp
# https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md
# Install the 'latest virtio-win ISO'

# https://www.youtube.com/watch?v=WmFpwpW6Xko

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
### CAP / LIMIT BATTERY CHARGING CAPACITY

sudo dnf in tlp
sudo systemctl enable tlp --now
sudo vim /etc/tlp.conf
'
STOP_CHARGE_THRESH_BAT0=60
'
sudo systemctl restart tlp

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
### TLP NOT WORKING ON BOOT (INACTIVE AND DEAD)

# TLP is not compatible with power-profiles-daemon
systemctl disable --now power-profiles-daemon
systemctl mask power-profiles-daemon

systemctl disable --now upower
systemctl mask upower

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
### SSH WITH SHARED TERMINAL

# Host machine
sudo dnf in openssh-server
sudo systemctl enable --now sshd

sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload

ip a # Local SSH

tmux new-session -s shared

# Client machine
sudo dnf in openssh
ssh username@192.168.x.x

tmux attach-session -t shared

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
### OLLAMA (with DEEPSEEK)

curl -fsSL https://ollama.com/install.sh | sh
sudo systemctl start ollama
sudo systemctl enable ollama
ollama run deepseek-r1:7b

# For abliterated version:
ollama run https://ollama.com/huihui_ai/deepseek-r1-abliterated:7b
ollama run https://ollama.com/huihui_ai/deepseek-r1-abliterated:8b

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
### vllm
sudo dnf in conda

conda create -n vllm-env python=3.10 -y
# close terminal and reopen
conda activate vllm-env
pip install torch==2.3.0
pip install vllm

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
### SET BATTERY CHARGE THRESHOLD FOR LAPTOP

sudo vim /etc/systemd/system/battery-threshold.service
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c 'sleep 10 && echo 60 > /sys/class/power_supply/BAT0/charge_control_end_threshold'

[Install]
WantedBy=multi-user.target
'
sudo systemctl daemon-reload
sudo systemctl enable battery-threshold.service

# Reboot and check with
reboot
cat /sys/class/power_supply/BAT0/charge_control_end_threshold

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! WAYVNC FOR SCREEN SHARING TO ANDROID
# I recommend AVNC android app, available on fdroid
sudo dnf in wayvnc

# Detect monitors names
hyprctl monitors

wayvnc -o HDMI-A-1 <your_pc_ip_address>

# Make sure firewall allows port 5900
sudo firewall-cmd --permanent --zone=public --add-port=5900/tcp

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! RSYNC FOR SSH FILE TRANSFER

# Create a persistent tmux session
tmux new -s file_transfer

rsync -avr --partial --progress --size-only --no-whole-file -e ssh yori@192.168.15.16:/home/yori/re/tohent/The.Tunnel.mkv .

# Reattach tmux session
tmux attach -t file_transfer

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! AUTO MOUNT DRIVE ON BOOT
sudo /etc/fstab

# In the example above, focus on the flags of uid, gid, dmask and fmask, which will allow anyone to edit files in the drive
'
/dev/disk/by-uuid/4E6F-427F		/srv/dev-disk-by-uuid-4E6F-427F	exfat	defaults,nofail,uid=1000,gid=1000,dmask=000,fmask=0111	0 2
'

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! FIREWALLD

# Allow temporally a port
sudo firewall-cmd --zone=public --add-port=80/tcp

# Allow permanently
sudo firewall-cmd --permanent --zone=public --add-port=5900/tcp

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SLOW TO BOOT SYSTEM
systemd-analyze
systemd-analyze blame

# If the culprit it NetworkManager-wait-online.service
sudo systemctl mask NetworkManager-wait-online.service
reboot

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! MULTI SUBS WITH MPV

# In this case, the file is named 1.srt and it's inside the same directory as the video file 
mpv --sub-files=1.srt: --secondary-sid=1 file.mkv

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SELECT WHICH APP TO OPEN A FILE EXTENSION BY DEFAULT

# Set by file
mimeopen -d file.extension

# Set by extension
# These will edit the file in ~/.config/mimeapps.list
# Apps names you can see in /usr/share/application
# Extension code you can see in:
# https://www.iana.org/assignments/media-types/media-types.xhtml
xdg-mime default org.nomacs.ImageLounge.desktop image/jpeg
xdg-mime default org.nomacs.ImageLounge.desktop image/png
xdg-mime default org.nomacs.ImageLounge.desktop image/tiff
xdg-mime default org.nomacs.ImageLounge.desktop image/webp
xdg-mime default mpv.desktop audio/aac
xdg-mime default mpv.desktop audio/ogg
xdg-mime default mpv.desktop audio/opus
xdg-mime default mpv.desktop audio/flac
xdg-mime default mpv.desktop audio/m4a
xdg-mime default mpv.desktop audio/aiff
xdg-mime default mpv.desktop audio/mpeg
xdg-mime default mpv.desktop video/x-matroska
xdg-mime default mpv.desktop video/mp4
xdg-mime default org.mozilla.firefox.desktop application/pdf
xdg-mime default leafpad.desktop application/json
xdg-mime default leafpad.desktop text/plain
xdg-mime default leafpad.desktop text/csv

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! DOCKER

sudo dnf in docker
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
reboot

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
#! SET UP HOTKEYS IN WAYLAND (key code/ key name)

sudo dnf in wev
# Just tap the key and voila

'￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣'
# Download all htm/html files from the web
wget --reject=jpg,jpeg,png,svg --limit-rate=80k --no-clobber --recursive --wait=12 --random-wait --no-parent --accept htm,html https://docs.oracle.com/en-us/iaas/Content/

# Transforms all htm/html files to txt
for file in $(find . -name "*.htm" -o -name "*.html"); do
    lynx -dump -nolist "$file" > "${file%.*}.txt"
done

# Deletes all htm/html files
find . -type f -name "*.htm*" -delete

# Combines all the txt files into a single txt file
find . -type f -name "*.txt" | sort | xargs cat > combined_output.txt


# File count of all files from all directories
find . -type f | xargs wc

    # This command if the files have spaces in the name
find . -type f -print0 | xargs -0 wc


     __________________________________________________________________

