#!/usr/bin/env bash
set -euo pipefail

SRC="/home/yori/Music/ongaku/"
DEST="yukarioshi@192.168.68.4:/mnt/ssd/ongaku/"
SSH_KEY="$HOME/.ssh/yukarioshi"
LOG="$HOME/mirror-ongaku.log"

# GUARDA: origem precisa existir e NÃO estar vazia.
# Com --delete, origem vazia apagaria a biblioteca inteira no servidor.
# Esta linha é o que impede esse desastre.
if [[ ! -d "$SRC" ]] || [[ -z "$(ls -A "$SRC" 2>/dev/null)" ]]; then
  echo "$(date '+%F %T') origem ausente ou vazia ($SRC), abortando" >> "$LOG"
  exit 1
fi

rsync -az --delete --max-delete=500 \
  -e "ssh -i $SSH_KEY -o BatchMode=yes -o ConnectTimeout=15" \
  --info=stats1 \
  --log-file="$LOG" \
  "$SRC" "$DEST"
