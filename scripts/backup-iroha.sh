#!/usr/bin/env bash
set -euo pipefail

SRC="/mnt/iroha-sync/"
DEST="/mnt/blue/sync/"

# origem: confirma que o SMB está montado (senão /mnt/iroha é só uma pasta vazia)
mountpoint -q /mnt/iroha-sync || { echo "Share SMB não montado, abortando"; exit 1; }

# destino: confirma que o WD Blue está montado (evita escrever no lugar errado)
mountpoint -q /mnt/blue || { echo "WD Blue não montado, abortando"; exit 1; }

rsync -aHAX --info=progress2 \
  --log-file="$HOME/backup-fileserver.log" \
  "$SRC" "$DEST"
