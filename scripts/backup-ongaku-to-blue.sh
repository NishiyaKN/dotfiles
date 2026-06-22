#!/usr/bin/env bash
set -euo pipefail

SRC="/home/yori/Music/ongaku/"
DEST="/mnt/blue/ongaku/"
LOG="$HOME/backup-ongaku-to-blue.log"

# destino: o WD Blue precisa estar montado (senão escreveria na pasta /mnt/blue
# do disco de sistema, enchendo o SSD por engano)
mountpoint -q /mnt/blue || { echo "$(date '+%F %T') WD Blue nao montado, abortando" >> "$LOG"; exit 1; }

# origem: só por garantia (sem --delete, origem vazia não causa estrago, mas evita log inútil)
[[ -d "$SRC" ]] || { echo "$(date '+%F %T') origem ausente ($SRC), abortando" >> "$LOG"; exit 1; }

mkdir -p "$DEST"

# SEM --delete: acúmulo. O que você apagar no Fedora CONTINUA aqui (backup de verdade).
# Destino é NTFS (ntfs-3g), então NADA de -aHAX — só -rt + --no-perms/owner/group.
rsync -rt --modify-window=1 --no-perms --no-owner --no-group \
  --info=stats1 \
  --log-file="$LOG" \
  "$SRC" "$DEST"
