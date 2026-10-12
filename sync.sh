#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_REMOTE="/home/mhc/dotfiles"

usage() {
	cat <<EOF
Usage: $0 [-h]

Interactive push-only rsync of this dotfiles repo to a remote host.

Options:
  -h    show this help

Prompts (Enter accepts default):
  Directory   local path relative to this repo or absolute.
                './'          whole repo
                'scripts'     scripts/
                file path     single file (lands in Location)
  Host        ssh destination: alias from ~/.ssh/config or user@ip
  Location    remote path (default mirrors the repo at $BASE_REMOTE/)
EOF
}

case "${1:-}" in
-h | --help)
	usage
	exit 0
	;;
"") ;;
*)
	usage >&2
	exit 1
	;;
esac

ask() {
	local label="$1" default="$2" answer
	read -e -r -p "$(printf '%-40s: ' "$label (default '$default')")" -i "$default" answer || {
		echo "Input closed; aborting." >&2
		exit 1
	}
	printf '%s\n' "${answer:-$default}"
}

DIR="$(ask "Directory" "./")"
DIR="${DIR#./}"
DIR="${DIR%/}"
DIR="${DIR/#\~/$HOME}"

if [[ -z "$DIR" ]]; then
	SRC="$SCRIPT_DIR/"
	LOCATION_DEFAULT="$BASE_REMOTE/"
elif [[ "$DIR" = /* ]]; then
	if [[ -d "$DIR" ]]; then
		SRC="$DIR/"
		LOCATION_DEFAULT="$BASE_REMOTE/$(basename "$DIR")/"
	else
		SRC="$DIR"
		LOCATION_DEFAULT="$BASE_REMOTE/"
	fi
elif [[ -d "$SCRIPT_DIR/$DIR" ]]; then
	SRC="$SCRIPT_DIR/$DIR/"
	LOCATION_DEFAULT="$BASE_REMOTE/$DIR/"
else
	SRC="$SCRIPT_DIR/$DIR"
	LOCATION_DEFAULT="$BASE_REMOTE/"
fi

[[ -e "$SRC" ]] || {
	echo "No such file or directory: $SRC" >&2
	exit 1
}

HOST="$(ask "Host" "mhc")"
LOCATION="$(ask "Location" "$LOCATION_DEFAULT")"
LOCATION="${LOCATION%/}/"

echo ""
echo "==> Pushing $SRC -> $HOST:$LOCATION"
ssh "$HOST" "mkdir -p $(printf '%q' "$LOCATION")"
rsync -avP -e ssh --exclude='.git*' "$SRC" "$HOST:$(printf '%q' "$LOCATION")"

echo ""
echo "==> Synced."
echo "Run on VPS: ssh $HOST 'bash ~/dotfiles/bootstrap-vps.sh'"
