#!/bin/bash

LOCAL_OBS="$HOME/obsidian"
REMOTE_OBS="$HOME/re/git/ura/obsidian"

echo "Sync files"
rsync -avhc --progress --backup --suffix=.bak --exclude .obsidian/ $LOCAL_OBS/ $REMOTE_OBS --delete
# rsync -avh $LOCAL_OBS $REMOTE_OBS --delete
# $LOCAL_OBS/ needs the / since otherwise it will copy the entire local obsidian inside the remote obsidian, and not only its contents

cd $REMOTE_OBS
git add .
git commit -m 'Upload files'
git push origin main
cd $HOME
