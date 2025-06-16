#!/bin/bash
## MANUAL ACTION NEEDED:
# lxappearance and kvantummanager
# TreeSitter and Coc
# Firefox css, about:config and addons

N='\033[0m'
Y='\033[33m'
R='\033[31m'
G='\033[32m'
CURRENTDIR=$(pwd)
OPTION_NUM=18

print_menu() {
    clear
    echo -e "Enter a number:"
    for ((i=1; i<=OPTION_NUM; i++)); do
        if [[ "${selected_options[*]}" =~ $i ]]; then
            case $i in
                1) echo -e "$G$i- Fix dnf$N" ;;
                2) echo -e "$G$i- Enable RPM and update system$N" ;;
                3) echo -e "$G$i- Install flatpak, snap and multimedia codecs$N" ;;
                4) echo -e "$G$i- Setup power saving$N" ;;
                5) echo -e "$G$i- Optimize performance (SSD trim, adjust swappiness)$N" ;;
                6) echo -e "$G$i- Setup mouse/trackpad X11$N" ;;
                7) echo -e "$G$i- Install other packages$N" ;;
                8) echo -e "$G$i- Setup neovim$N" ;;
                9) echo -e "$G$i- Setup zsh (requires reboot)$N" ;;
                10) echo -e "$G$i- Setup dotfiles$N" ;;
                11) echo -e "$G$i- Install fonts$N" ;;
                12) echo -e "$G$i- Setup theme$N" ;;
                13) echo -e "$G$i- Install window manager sway$N" ;;
                14) echo -e "$G$i- Setup mpd$N" ;;
                15) echo -e "$G$i- Install pulsemixer$N" ;;
                16) echo -e "$G$i- Setup games$N" ;;
                17) echo -e "$G$i- Setup wihotspot$N" ;;
                18) echo -e "$G$i- Setup SwayAudioIdleInhibit$N" ;;
            esac
        else
            case $i in
                1) echo -e "$Y$i- Fix dnf$N" ;;
                2) echo -e "$Y$i- Enable RPM and update system$N" ;;
                3) echo -e "$Y$i- Install flatpak, snap and multimedia codecs$N" ;;
                4) echo -e "$Y$i- Setup power saving$N" ;;
                5) echo -e "$Y$i- Optimize performance (SSD trim, adjust swappiness)$N" ;;
                6) echo -e "$Y$i- Setup mouse/trackpad X11$N" ;;
                7) echo -e "$Y$i- Install other packages$N" ;;
                8) echo -e "$Y$i- Setup neovim$N" ;;
                9) echo -e "$Y$i- Setup zsh (requires reboot)$N" ;;
                10) echo -e "$Y$i- Setup dotfiles$N" ;;
                11) echo -e "$Y$i- Install fonts$N" ;;
                12) echo -e "$Y$i- Setup theme$N" ;;
                13) echo -e "$Y$i- Install window manager sway$N" ;;
                14) echo -e "$Y$i- Setup mpd$N" ;;
                15) echo -e "$Y$i- Install pulsemixer$N" ;;
                16) echo -e "$Y$i- Setup games$N" ;;
                17) echo -e "$Y$i- Setup wihotspot$N" ;;
                18) echo -e "$Y$i- Setup SwayAudioIdleInhibit$N" ;;
            esac
        fi
    done
}

# declare -a selected_options # Don't really need to declare it explicitly
while true; do
    print_menu
    # 12 will install dracula, is missing cursors
    read -p "Enter your choice: " NUM 

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
            selected_options+=("$NUM")
            ;;

        2)
            echo -e $Y"This will enable RPM fusion repositories"$N
            sudo dnf up -y
            sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
            sudo dnf upgrade -y --refresh
            sudo dnf groupupdate -y core
            sudo dnf install -y rpmfusion-free-release-tainted
            sudo dnf install -y dnf-plugins-core
            echo -e $Y"Enabled RPM"$N
            selected_options+=("$NUM")
            ;;
        3)
            sudo dnf in -y flatpak
            sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
            sudo flatpak override --filesystem=$HOME/.themes
            sudo flatpak override --filesystem=$HOME/.icons
            echo -e $Y"Installed flatpak"$N

            sudo dnf in -y snapd
            sudo systemctl enable --now snapd
            echo -e $Y"Installed snap"$N
            # sudo systemctl enable --now snapd.apparmor

            sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-plugin-libav --exclude=gstreamer1-plugins-bad-free-devel
            sudo dnf install -y lame\* --exclude=lame-devel
            sudo dnf group upgrade --with-optional Multimedia   
            echo -e $Y"Installed multimedia codecs"$N
            selected_options+=("$NUM")
            ;;
        4)
            sudo snap install auto-cpufreq
            sudo snap run auto-cpufreq --install
            sudo dnf in -y thermald powertop
            sudo systemctl enable --now thermald
            echo -e $Y"Installed and set up"$N
            selected_options+=("$NUM")
            ;;
        5)
            sudo systemctl enable fstrim.timer
            echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-swappiness.conf
            echo -e $Y"Ajusted performance"$N
            selected_options+=("$NUM")
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
            selected_options+=("$NUM")
            ;;

        7)
            sudo dnf in -y --skip-broken florence acpi alacritty AtomicParsley ark bleachbit brightnessctl dolphin fcitx5 ffmpeg ffmpegthumbnailer ffmpegthumbs htop lutris mpd ncdu ncmpcpp obs-studio okular pavucontrol perl-File-MimeInfo qbittorrent ranger redshift rofi spectacle speedtest-cli steam timeshift unrar xfce4-power-manager xclip xrandr xprop xsel yt-dlp git rofi dunst libnotify lxappearance qt5ct fcitx5 fcitx5-mozc fcitx5-configtool cpu-x polkit kdeconnect-kde qlipper xkill mpv xclip sqlite3 eza antimicrox leafpad bat fzf gamemode xhost neovim python3-pip nodejs tmux gammastep picom kernel-tools blueman network-manager-applet pulseaudio-utils wdisplays slurp grim libva-utils neovim kitty intel-gpu-tools lxqt-policykit wmname mpc meson ninja-build wayland-protocols-devel pulseaudio-libs-devel dbus-x11 dav1d lm_sensors neofetch
            sudo dnf install -y --setopt=install-weak-deps=False nomacs 
            sudo dnf groupinstall -y "C Development Tools and Libraries"
            sudo dnf groupinstall -y "Development Tools"
            sudo flatpak install -y app/com.vscodium.codium/x86_64/stable
            sudo flatpak install -y app/io.gitlab.librewolf-community/x86_64/stable
            sudo flatpak install -y app/com.brave.Browser/x86_64/stable
            sudo flatpak install -y com.github.tchx84.Flatseal
            sudo flatpak install -y app/md.obsidian.Obsidian/x86_64/stable
            sudo flatpak install -y app/com.obsproject.Studio/x86_64/stable
            sudo flatpak install -y app/net.kuribo64.melonDS/x86_64/stable
            sudo flatpak install -y app/org.citra_emu.citra/x86_64/stable 
            sudo flatpak install -y app/io.mgba.mGBA/x86_64/stable
            pip install selenium pandas plotly pyautogui
            echo -e $Y"Installed everything"$N
            selected_options+=("$NUM")
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
            selected_options+=("$NUM")
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
            selected_options+=("$NUM")
            ;;

        10)
            cp -r ../config/* ~/.config/
            cp -r ../bakap ~/.config/
            cp ../zprofile ~/.zprofile
            cp ../profile ~/.profile
            cp ../zsh_aliases ~/.zsh_aliases
            cp ../zshrc ~/.zshrc
            echo -e $Y"Copied files"$N
            selected_options+=("$NUM")
            ;;
        11)
            sudo dnf in -y google-noto-sans-jp-fonts

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
            selected_options+=("$NUM")
            ;;
        12)
            sudo dnf in -y lxappearance qt5ct kvantum nitrogen
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

            echo -e $Y"Themed QT"$N
            echo -e $Y"But manual set is necessary (lxappearance, kvantummanager and qt5ct)"$N

            wget https://github.com/dracula/qbittorrent/raw/master/dracula.qbtheme

            ### SDDM ###
            cd $CURRENTDIR
            sudo cp ../config/sddm/sddm.conf /etc/sddm.conf.d/
            sudo cp -r ../config/sddm/sddm-sugar-candy /usr/share/sddm/themes/

            ### FLATPAK ###
            sudo flatpak override --env=THEME=gtk
            sudo flatpak override --env=ICON_THEME=dracula-icons
            selected_options+=("$NUM")
            ;;
        13)
            sudo dnf in -y sway waybar gammastep wofi clipman libappindicator wl-clipboard
            #sudo dnf in -y bspwm rofi nitrogen sxhkd polybar dunst sddm lxqt-policykit picom
            echo -e $Y"Installed both wm"$N
            selected_options+=("$NUM")
            ;;
        14)
            mkdir ~/.local/share/mpd
            mkdir ~/.local/share/mpd/playlists
            touch ~/.local/share/mpd/database
            touch ~/.local/share/mpd/state
            touch ~/.local/share/mpd/sticker.sql
            echo -e $Y"Created mpd files"$N
            selected_options+=("$NUM")
            ;;

        15)
            curl https://raw.githubusercontent.com/GeorgeFilipkin/pulsemixer/master/pulsemixer > pulsemixer && chmod +x ./pulsemixer
            sudo mv pulsemixer /opt
            echo -e $Y"Downloaded pulsemixer"$N
            selected_options+=("$NUM")
            ;;
        16)
            sudo dnf in -y steam lutris goverlay mangohud gamemode gamescope wine winetricks
            echo -e $Y"Installed game related packages"$N
            selected_options+=("$NUM")
            ;;

        17)
            sudo dnf in -y gtk3-devel gcc gcc-c++ kernel-devel pkg-config make hostapd qrencode-devel libpng-devel
            sudo chmod 777 /opt
            cd /opt

            git clone https://github.com/lakinduakash/linux-wifi-hotspot
            cd linux-wifi-hotspot
            sudo make
            sudo make install
            cd $CURRENTDIR
            echo -e $Y"Installed wihotspot"$N
            selected_options+=("$NUM")
            ;;
        18)
            sudo dnf in -y wayland-protocols-devel pulseaudio-libs-devel
            cd /opt
            git clone https://github.com/ErikReider/SwayAudioIdleInhibit.git
            cd SwayAudioIdleInhibit
            sudo meson build
            sudo ninja -C build
            sudo meson install -C build
            echo -e $Y"Installed Idle Inhibitor for Sway"$N
            selected_options+=("$NUM")
            ;;
        *)
            echo -e $R"Invalid Option"$N
            ;;
    esac
done
