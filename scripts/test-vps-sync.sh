#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

fail() { echo "FAIL: $1" >&2; exit 1; }

# --- bootstrap-vps.sh ---
HOME_DIR="$TMP/home"
mkdir -p "$HOME_DIR"
echo "preexisting_line" >"$HOME_DIR/.bashrc"

HOME="$HOME_DIR" bash "$REPO/bootstrap-vps.sh" -f >/dev/null

for f in .aliases .functions .bash_prompt .envvars .inputrc .vimrc .editorconfig .curlrc .wgetrc; do
  [[ -f "$HOME_DIR/$f" ]] || fail "missing $f in HOME"
done

if [[ -f "$HOME_DIR/.path" ]]; then fail ".path must not be copied"; fi
if [[ -f "$HOME_DIR/.git_functions" ]]; then fail ".git_functions must not be copied"; fi
grep -q '^preexisting_line$' "$HOME_DIR/.bashrc" || fail "existing .bashrc content lost"
[[ "$(grep -c '^# >>> dotfiles-vps >>>$' "$HOME_DIR/.bashrc")" == "1" ]] || fail "marker start count != 1"
[[ "$(grep -c '^# <<< dotfiles-vps <<<$' "$HOME_DIR/.bashrc")" == "1" ]] || fail "marker end count != 1"
grep -q '^export EDITOR=vim$' "$HOME_DIR/.bashrc" || fail "EDITOR override missing"
grep -q '^export MANPAGER=less$' "$HOME_DIR/.bashrc" || fail "MANPAGER override missing"

HOME="$HOME_DIR" bash "$REPO/bootstrap-vps.sh" -f >/dev/null
[[ "$(grep -c '^# >>> dotfiles-vps >>>$' "$HOME_DIR/.bashrc")" == "1" ]] || fail "marker duplicated on rerun"
[[ "$(grep -c '^preexisting_line$' "$HOME_DIR/.bashrc")" == "1" ]] || fail "preexisting line duplicated or removed on rerun"

# sourced invocation must resolve its own dir, not $0
HOME2="$TMP/home2"
mkdir -p "$HOME2"
(
	cd "$TMP" || exit 1
	HOME="$HOME2" bash -c "source '$REPO/bootstrap-vps.sh' -f" >/dev/null
) || fail "sourced bootstrap-vps.sh failed"
[[ -f "$HOME2/.aliases" ]] || fail "sourced run: .aliases missing"
[[ "$(grep -c '^# >>> dotfiles-vps >>>$' "$HOME2/.bashrc")" == "1" ]] || fail "sourced run: marker count != 1"

echo "OK: bootstrap-vps.sh"

# --- sync.sh ---
mkdir -p "$TMP/bin"
cat >"$TMP/bin/ssh" <<'STUB'
#!/usr/bin/env bash
printf 'ssh %s\n' "$*" >>"$STUB_LOG"
STUB
cat >"$TMP/bin/rsync" <<'STUB'
#!/usr/bin/env bash
printf 'rsync %s\n' "$*" >>"$STUB_LOG"
STUB
chmod +x "$TMP/bin/ssh" "$TMP/bin/rsync"

[[ "$(bash "$REPO/sync.sh" -h)" == *"Usage:"* ]] || fail "sync.sh -h should print usage"

STUB_LOG="$TMP/log"
run_sync() {
	printf '%s\n' "$1" "" "" | STUB_LOG="$STUB_LOG" PATH="$TMP/bin:$PATH" bash "$REPO/sync.sh" >/dev/null
}
: >"$STUB_LOG"
run_sync "./"
grep -qF 'ssh mhc mkdir -p /home/mhc/dotfiles/' "$STUB_LOG" || fail "whole repo: remote mkdir wrong"
grep -qF -- '--exclude=.git*' "$STUB_LOG" || fail "whole repo: .git* not excluded"
grep -qF 'mhc:/home/mhc/dotfiles/' "$STUB_LOG" || fail "whole repo: rsync dest wrong"

: >"$STUB_LOG"
run_sync "scripts"
grep -qF 'ssh mhc mkdir -p /home/mhc/dotfiles/scripts/' "$STUB_LOG" || fail "subdir: remote mkdir wrong"

: >"$STUB_LOG"
run_sync "README.md"
grep -qF 'ssh mhc mkdir -p /home/mhc/dotfiles/' "$STUB_LOG" || fail "single file: remote dirname mkdir wrong"
grep -qF 'README.md' "$STUB_LOG" || fail "single file: source not pushed"

: >"$STUB_LOG"
if printf './\n' | STUB_LOG="$STUB_LOG" PATH="$TMP/bin:$PATH" bash "$REPO/sync.sh" >/dev/null 2>&1; then
	fail "sync.sh must abort on EOF, not push"
fi
[[ ! -s "$STUB_LOG" ]] || fail "sync.sh must not touch ssh/rsync on EOF"

echo "OK: sync.sh"
