#!/usr/bin/env bash
#
# update-pkglist.sh
#
# Regenerates pkglist.txt (plain list of explicitly installed package
# names, one per line) from the packages currently installed on this
# machine. Place this script in the root of arch-dotfiles and run it
# from there.
#
# Usage:
#   ./update-pkglist.sh              # updates pkglist.txt, shows diff
#   ./update-pkglist.sh --commit     # also git add + commit + (optionally) push

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
PKGLIST_FILE="$SCRIPT_DIR/pkglist.txt"

TMP_FILE="$(mktemp)"
trap 'rm -f "$TMP_FILE"' EXIT

# All explicitly installed packages (native + AUR), sorted, plain names only
pacman -Qqe | sort > "$TMP_FILE"

if [[ -f "$PKGLIST_FILE" ]] && diff -q "$PKGLIST_FILE" "$TMP_FILE" &>/dev/null; then
    echo "pkglist.txt already up to date. No changes."
    exit 0
fi

echo "Changes to pkglist.txt:"
if [[ -f "$PKGLIST_FILE" ]]; then
    diff --color=always "$PKGLIST_FILE" "$TMP_FILE" || true
else
    echo "(creating new pkglist.txt)"
fi

mv "$TMP_FILE" "$PKGLIST_FILE"
trap - EXIT
echo
echo "Updated: $PKGLIST_FILE ($(wc -l < "$PKGLIST_FILE") packages)"

if [[ "${1:-}" == "--commit" ]]; then
    cd "$SCRIPT_DIR"
    git add pkglist.txt
    git commit -m "Update pkglist.txt ($(date '+%Y-%m-%d'))"
    echo "Committed."

    read -rp "Push to origin now? [y/N] " ans
    if [[ "$ans" =~ ^[Yy]$ ]]; then
        git push
        echo "Pushed."
    fi
fi
