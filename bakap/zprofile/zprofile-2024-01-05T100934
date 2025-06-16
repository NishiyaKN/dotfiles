if [ $DESKTOP_SESSION == "sway"]; then
    #lightdm SOURCES THIS FILE
    export WINIT_X11_SCALE_FACTOR=1
    #export LIBVA_DRIVER_NAME=iHD
    export XDG_CONFIG_DIRS=/etc/xdg
    #export XDG_DATA_HOME=/var/lib/flatpak/exports/share
    # export QT_QPA_PLATFORMTHEME=qt5ct,xbc
    # To run qt application on wayland, uncomment below
    export QT_QPA_PLATFORMTHEME=qt5ct
    export XDG_DATA_DIRS=$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share/:/usr/share/
    # Set default editor as neovim
    export EDITOR=nvim
    # Set fcitx
    # export GTK_THEME=Catppuccin-Mocha-Standard-Mauve-dark
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx

    export PATH=$GOPATH/bin:$HOME/.local/bin:/usr/local/sbin:/usr/lib:/usr/share:$HOME/.cargo/bin:/sbin:/usr/libexec:$PATH
    export XDG_CURRENT_DESKTOP=sway
    # This may help with gtk apps slow at startup
    export GTK_USE_PORTAL=1
    # export WAYLAND_DISPLAY=wayland-1
    # export GTK_DEBUG=portals
    # Set gzip compression to the best possible
    export GZIP=-9
    # Set tmux to use true color
    export TERM="xterm-256color"
    # export LC_ALL=ja-JP.UTF-8
    #export PATH=$HOME/.cargo/bin:$PATH
    # export QT_QPA_PLATFORMTHEME=qt5ct
    # export QT_QPA_PLATFORM=wayland
    export MOZ_ENABLE_WAYLAND=1
    export GTK_THEME=gtk

    export CLASSPATH=$HOME/study/java/mysql-connector-j-8.1.0.jar

    # if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
        # export MOZ_ENABLE_WAYLAND=1
    # else
        # export MOZ_ENABLE_WAYLAND=0
    # fi

    # if [ "$DESKTOP_SESSION" == "/usr/share/wayland-sessions/plasmawayland" ]; then
    #     export QT_QPA_PLATFORMTHEME=
    # else export QT_QPA_PLATFORMTHEME=qt5ct
    # fi

    #export PULSE_LATENCY_MSEC=80
    #export XDG_DATA_DIRS=$HOME/.local/share/flatpak/exports/share
    # export _JAVA_AWT_WM_NONREPARENTING=1

    # Blue light filter
fi
