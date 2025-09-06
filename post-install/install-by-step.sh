#!/bin/bash
## MANUAL ACTION NEEDED:
# lxappearance and kvantummanager
# TreeSitter and Coc
# set fcitx on gtk files

# need to see scrcpy

N='\033[0m'
Y='\033[1;33m'
R='\033[0;31m'
G='\033[0;32m'
CURRENTDIR=$(pwd)

while [ True ]
do
    echo -e $Y"Enter a number 
    1- Fix dnf
    2- Enable RPM and update system
    3- Install flatpak, snap and multimedia codecs
    4- Setup power saving
    5- Optimize performance (SSD trim, adjust swappiness)
    6- Setup mouse/trackpad X11
    7- Install other packages
    8- Setup neovim
    9- Setup zsh (requires reboot)
    10- Setup dotfiles
    11- Install fonts
    12- Setup theme
    13- Install window manager sway and hyprland
    14- Setup mpd
    15- Setup games
    16- Setup wihotspot
    17- Setup SwayAudioIdleInhibit
    "$N
    read NUM 

    case $NUM in

        1)
echo "[main]
gpgcheck=True
installonly_limit=3
clearn_requirements_on_remove=True
best=False
skip_if_unavailable=True
fastestmirror=True
max_parallel_downloads=10
defaultyes=Yes" | sudo tee /etc/dnf/dnf.conf
            echo -e $Y"Changed dnf configuration"$N
            ;;

        2)
            echo -e $Y"This will enable RPM fusion repositories"$N
            sudo dnf up -y
            sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
            sudo dnf upgrade -y --refresh
            sudo dnf update -y @core
            sudo dnf install -y rpmfusion-free-release-tainted
            sudo dnf install -y dnf-plugins-core
            echo -e $Y"Enabled RPM"$N
            ;;
        3)
            sudo dnf in -y flatpak
            sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
            sudo flatpak override --filesystem=$HOME/.themes
            sudo flatpak override --filesystem=$HOME/.icons
            echo -e $Y"Installed flatpak"$N

            # sudo dnf in -y snapd
            # sudo systemctl enable --now snapd
            # echo -e $Y"Installed snap"$N
            # sudo systemctl enable --now snapd.apparmor
            sudo dnf install -y libavcodec-freeworld mesa-va-drivers-freeworld
            sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-plugin-libav --exclude=gstreamer1-plugins-bad-free-devel
            sudo dnf install -y lame\* --exclude=lame-devel
            echo -e $Y"Installed multimedia codecs"$N
            ;;
        4)
            sudo snap install auto-cpufreq
            sudo snap run auto-cpufreq --install
            sudo dnf in -y thermald powertop
            sudo systemctl enable --now thermald
            echo -e $Y"Installed and set up"$N
            ;;
        5)
            sudo systemctl enable fstrim.timer
            echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-swappiness.conf
            echo -e $Y"Ajusted performance"$N
            ;;
        6)
echo 'Section "InputClass"
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
EndSection' | sudo tee /etc/X11/xorg.conf.d/70-touchpad.conf
            echo -e $Y"Fixed trackpad"$N
echo 'Section "InputClass"
	Identifier "My Mouse"
	Driver "libinput"
	MatchIsPointer "yes"
	Option "AccelProfile" "flat"
	Option "AccelSpeed" "0"
EndSection' | sudo tee /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
            echo -e $Y"Fixed mouse"$N
            ;;

        7)
            sudo dnf in -y --skip-broken florence acpi alacritty AtomicParsley ark bleachbit brightnessctl dolphin fcitx5 ffmpeg ffmpegthumbnailer ffmpegthumbs htop lutris mpd ncdu ncmpcpp obs-studio okular pavucontrol perl-File-MimeInfo qbittorrent ranger redshift rofi-wayland spectacle speedtest-cli steam timeshift unrar xfce4-power-manager xclip xrandr xprop xsel yt-dlp git libnotify lxappearance qt6ct fcitx5 fcitx5-mozc fcitx5-configtool cpu-x polkit kdeconnect-kde qlipper xkill mpv xclip sqlite3 antimicrox leafpad bat fzf gamemode xhost neovim python3-pip nodejs tmux gammastep picom kernel-tools blueman network-manager-applet pulseaudio-utils wdisplays slurp grim libva-utils neovim kitty intel-gpu-tools lxqt-policykit wmname mpc meson ninja-build wayland-protocols-devel pulseaudio-libs-devel dbus-x11 dav1d lm_sensors audacity gimp chromium piper fastfetch radeontop
            sudo dnf install -y --setopt=install_weak_deps=False nomacs 
            sudo dnf install -y @development-tools 

            flatpak install -y app/com.vscodium.codium/x86_64/stable
            # flatpak install -y app/io.gitlab.librewolf-community/x86_64/stable
            flatpak install -y com.github.tchx84.Flatseal
            flatpak install -y app/md.obsidian.Obsidian/x86_64/stable
            flatpak install -y app/com.obsproject.Studio/x86_64/stable
            # flatpak install -y app/net.kuribo64.melonDS/x86_64/stable
            # flatpak install -y app/org.citra_emu.citra/x86_64/stable 
            # flatpak install -y app/io.mgba.mGBA/x86_64/stable
            pip install selenium pandas plotly pyautogui

            cd ~/Downloads
            git clone https://github.com/jeremija/wl-gammarelay.git
            cd ~/Downloads/wl-gammarelay
            make
            sudo make install PREFIX=/usr
            cd ~/Downloads
            rm -rf wl-gammarelay

            curl https://raw.githubusercontent.com/GeorgeFilipkin/pulsemixer/master/pulsemixer > pulsemixer && chmod +x ./pulsemixer
            sudo mv pulsemixer /opt

            echo -e $Y"Installed everything"$N

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
            xdg-mime default mpv.desktop audio/wav
            xdg-mime default mpv.desktop video/x-matroska
            xdg-mime default mpv.desktop video/mp4
            xdg-mime default org.mozilla.firefox.desktop application/pdf
            xdg-mime default leafpad.desktop application/json
            xdg-mime default leafpad.desktop text/plain
            xdg-mime default leafpad.desktop text/csv
            echo -e $Y"Set default app to open certain file extensions"$N

            ;;

        8)
            sudo dnf in -y neovim
            sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            sudo dnf in -y python3-pip nodejs
            sudo npm install -g yarn
            cd ~/.local/share/nvim/plugged/coc.nvim
            yarn install
            yarn build
            pip3 install jedi
            cd $CURRENTDIR
            echo -e $Y"Manual installation of TreeSitter and Coc are necessary"$N
            ;;

        9)
            sudo dnf in -y zsh util-linux-user
            sudo chsh -s $(which zsh) ${USER}
            yes n | sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

            git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo 'PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%~%{$reset_color%}"
PROMPT+=" $(git_prompt_info)"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"' | tee ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
            ;;

        10)
            cp -r ../config/* ~/.config/
            cp -r ../bakap ~/.config/
            cp ../zprofile ~/.zprofile
            cp ../profile ~/.profile
            cp ../zsh_aliases ~/.zsh_aliases
            cp ../zshrc ~/.zshrc
            echo -e $Y"Copied files"$N
            ;;
        11)
            sudo dnf in -y google-noto-sans-jp-fonts adobe-source-code-pro-fonts fira-code-fonts fontawesome-fonts-all google-droid-sans-fonts google-noto-sans-cjk-fonts google-noto-color-emoji-fonts google-noto-emoji-fonts jetbrains-mono-fonts

            sudo mkdir /usr/share/fonts/jetbrains-mono-fonts
            cd /usr/share/fonts/jetbrains-mono-fonts
            sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
            sudo unzip JetBrainsMono.zip
            sudo rm -rf JetBrainsMono.zip

            sudo mkdir /usr/share/fonts/noto-nerd-font
            cd /usr/share/fonts/noto-nerd-font
            sudo wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Sans/NotoSansNerdFont-Regular.ttf

            cd $CURRENTDIR
            echo -e $Y"Installed fonts"$N
            ;;

        12)
            sudo dnf in -y lxappearance qt6ct kvantum nitrogen
            mkdir -p ~/.themes
            cd ~/.themes
            wget https://github.com/dracula/gtk/archive/master.zip
            unzip master.zip
            rm -rf master.zip

            mkdir -p ~/.icons
            cd ~/.icons
            git clone https://github.com/m4thewz/dracula-icons

            sudo cp -r ~/.themes/gtk-master /usr/share/themes
            sudo cp -r ~/.icons/dracula-icons /usr/share/icons/
            sudo mkdir /usr/share/themes/dracula
            sudo cp -r ~/.themes/Dracula-cursors.tar.gz /usr/share/themes/dracula/
            echo -e $Y"Themed GTK"$N

            ### QT ###
            mkdir -p ~/.themes/Dracula
            cd ~/.themes/
            git clone https://github.com/dracula/gtk.git
            mv ~/.themes/gtk-master/kde/kvantum/* ~/.themes/Dracula
            rm -rf gtk-master
            cp ~/re/git/dotfiles/kdeglobals ~/.config/

            echo -e $Y"Themed QT"$N
            echo -e $Y"But manual set is necessary (lxappearance, kvantummanager and qt6ct)"$N

            wget https://github.com/dracula/qbittorrent/raw/master/dracula.qbtheme

            ### SDDM ###
            cd $CURRENTDIR
            sudo cp ../config/sddm/sddm.conf /etc/sddm.conf.d/
            sudo cp -r ../config/sddm/sddm-sugar-candy /usr/share/sddm/themes/

            ### FLATPAK ###
            sudo flatpak override --filesystem=$HOME/.themes
            sudo flatpak override --filesystem=$HOME/.icons

            sudo flatpak override --env=THEME=gtk
            sudo flatpak override --env=ICON_THEME=dracula-icons
            ;;

        13)
            sudo dnf in -y waybar gammastep wofi clipman libappindicator wl-clipboard

            sudo dnf copr enable -y zeno/scrcpy
            sudo dnf copr enable -y solopasha/hyprland
            sudo dnf copr enable -y wef/cliphist
            sudo dnf copr enable -y lexa/SwayNotificationCenter
            sudo dnf copr enable -y zeno/scrcpy

            sudo dnf in -y curl gawk git grim gvfs gvfs-mtp ImageMagick jq inxi kitty kvantum nano network-manager-applet openssl pamixer pavucontrol pipewire-alsa pipewire-utils playerctl python3-requests python3-pip python3-pyquery qt6ct qt6-qtsvg rofi-wayland slurp swappy SwayNotificationCenter waybar wget2 wl-clipboard wlogout xdg-user-dirs xdg-utils yad brightnessctl btop cava eog fastfetch gnome-system-monitor mousepad mpv nvtop qalculate-gtk vim-enhanced aylurs-gtk-shell cliphist hypridle hyprlock pamixer pyprland SwayNotificationCenter hyprland hyprcursor sddm qt6-qt5compat qt6-qtdeclarative qt6-qtsvg xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprshot cmake hyprpaper hyprpicker wayvnc hyprpolkitagent wev
 
            ### Gammarelay
            cd /opt
            git clone https://github.com/jeremija/wl-gammarelay.git
            cd wl-gammarelay
            sudo make install PREFIX=/usr
            ### wl-present
            curl https://raw.githubusercontent.com/Ferdi265/wl-mirror/main/scripts/wl-present > wl-present.sh && chmod +x wl-present.sh
            sudo dnf in wl-mirror -y
            ### hyprshot
            git clone https://github.com/Gustash/hyprshot.git Hyprshot
            ln -s $(pwd)/Hyprshot/hyprshot $HOME/.local/bin
            chmod +x Hyprshot/hyprshot

                echo -e $Y"Installed both wm"$N
            ;;
        14)
            mkdir ~/.local/share/mpd
            mkdir ~/.local/share/mpd/playlists
            touch ~/.local/share/mpd/database
            touch ~/.local/share/mpd/state
            touch ~/.local/share/mpd/sticker.sql
            echo -e $Y"Created mpd files"$N
            ;;

        15)
            sudo dnf in -y steam lutris goverlay mangohud gamemode gamescope wine wine.i686 winetricks
            echo -e $Y"Installed game related packages"$N
            ;;

        16)
        sudo dnf in -y gtk3-devel gcc gcc-c++ kernel-devel pkg-config make hostapd qrencode-devel libpng-devel
        sudo chmod 777 /opt
        cd /opt

        git clone https://github.com/lakinduakash/linux-wifi-hotspot
        cd linux-wifi-hotspot
        sudo make
        sudo make install
        cd $CURRENTDIR
        echo -e $Y"Installed wihotspot"$N
        ;;

        17)
        sudo dnf in -y wayland-protocols-devel pulseaudio-libs-devel
        cd /opt
        git clone https://github.com/ErikReider/SwayAudioIdleInhibit.git
        cd SwayAudioIdleInhibit
        sudo meson build
        sudo ninja -C build
        sudo meson install -C build
        echo -e $Y"Installed Idle Inhibitor for Sway"$N

        ;;
        *)
            echo -e $R"Invalid Option"$N
            ;;
    esac
done
