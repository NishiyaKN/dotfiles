#!/bin/bash
set -e

### ura
LOCAL_OBS="$HOME/obsidian"
REMOTE_OBS="$HOME/re/git/ura/obsidian"

echo "Fetch any update from ura repo"
cd $REMOTE_OBS
cd ..
echo $(pwd)
git pull

echo "Copy to local obsidian folder"
rsync -avh $REMOTE_OBS/* $LOCAL_OBS

cd $HOME

### study

LOCAL_STU="$HOME/study"
REMOTE_STU="$HOME/re/git/study"

echo "Fetch any update from study repo"
cd $REMOTE_STU
echo $(pwd)
git pull

echo "Copy to local study folder"
rsync -avh $REMOTE_STU/* $LOCAL_STU

cd $HOME
