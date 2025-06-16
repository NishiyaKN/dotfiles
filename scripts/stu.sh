#!/bin/bash

LOCAL_STU="$HOME/study"
REMOTE_STU="$HOME/re/git/study"

echo "Sync files"
rsync -avh $LOCAL_STU/ $REMOTE_STU
# rsync -avh $LOCAL_STU/ $REMOTE_STU --delete
# $LOCAL_STU/ needs the / since otherwise it will copy the entire local study inside the remote study and not only its contests

cd $REMOTE_STU
git add .
git commit -m 'Upload files'
git push origin main
cd $HOME

