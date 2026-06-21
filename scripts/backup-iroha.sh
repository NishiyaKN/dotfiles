#!/usr/bin/env bash
set -euo pipefail

SRC="/mnt/iroha-sync/"
DEST="/mnt/blue/sync/"

# origem: se o SMB não montou (Orange Pi off), /mnt/iroha-sync fica vazio
mountpoint -q /mnt/iroha-sync || { echo "Share SMB não montado, abortando"; exit 1; }

# destino: nunca escrever se o WD Blue não estiver montado
mountpoint -q /mnt/blue || { echo "WD Blue não montado, abortando"; exit 1; }

rsync -rt --modify-window=1 \
  --no-perms --no-owner --no-group \
  --info=progress2 \
  --log-file="$HOME/backup-fileserver.log" \
  "$SRC" "$DEST"
