#!/bin/bash

REPO=~/re/git/dotfiles/
IN=~/.config/
OUT=~/re/git/dotfiles/config/

cp -r $IN'alacritty' $OUT
cp -r $IN'bspwm' $OUT
cp -r $IN'dunst' $OUT
cp -r $IN'picom' $OUT
cp -r $IN'polybar' $OUT
cp -r $IN'rofi' $OUT
cp -r $IN'sxhkd' $OUT
cp -r $IN'waybar' $OUT
cp -r $IN'hypr' $OUT
cp -r $IN'wofi' $OUT
cp -r $IN'kitty' $OUT
cp -r $IN'picom' $OUT
# cp $IN'nvim/lua/custom/init.lua' $OUT'nvim/init/init.lua'
# cp $IN'nvim/lua/custom/chadrc.lua' $OUT'nvim/chadrc/chadrc.lua'
# cp $IN'nvim/lua/custom/plugins.lua' $OUT'nvim/plugins/plugins.lua'
cp -r $IN'tmux' $OUT
cp -r $IN'sway' $OUT
cp -r $IN'mpv' $OUT
cp -r $IN'antimicrox' $OUT
cp -r $IN'ytdl/yt-dl_ongaku.txt' $OUT

# cp ~/.vimrc $REPO'vimrc'
cp ~/.zsh_aliases $REPO'zsh_aliases'
cp ~/.zprofile $REPO'zprofile'
cp ~/.zshrc $REPO'zshrc'
# cp ~/.tmux.conf $REPO'tmux.conf'

# cp -r $IN'lutris/games/' $REPO'/bakap/lutris/'
cp -r ~/'.config/bakap/' $REPO
# cp -r /home/yori/Documents/scripts/* $REPO'scripts/'
# cp $IN'nvim/init.vim' $OUT'nvim/init.vim' sudo cp /etc/sddm.conf.d/sddm.conf $OUT'sddm/sddm.conf' 
# cp -r /usr/share/sddm/themes/sddm-sugar-candy $OUT'sddm/'

cd $REPO
echo "Changed directory to $(pwd)"
git add .
git commit -m "Update config files"
git push origin main
