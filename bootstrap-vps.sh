#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

FILES=(
	.aliases
	.functions
	.bash_prompt
	.envvars
	.inputrc
	.vimrc
	.editorconfig
	.curlrc
	.wgetrc
)

doIt() {
	for f in "${FILES[@]}"; do
		rsync -avh --no-perms "$SCRIPT_DIR/$f" "$HOME/$f"
	done

	touch "$HOME/.bashrc"
	awk_pass() {
		awk '
		/^# >>> dotfiles-vps >>>$/ { buf = $0 "\n"; inblock = 1; next }
		inblock {
			buf = buf $0 "\n"
			if ($0 == "# <<< dotfiles-vps <<<") { inblock = 0; buf = "" }
			next
		}
		{ print }
		END { if (inblock) printf "%s", buf }
		' "$1"
	}
	awk_pass "$HOME/.bashrc" >"$HOME/.bashrc.tmp" &&
		mv "$HOME/.bashrc.tmp" "$HOME/.bashrc"
	cat >>"$HOME/.bashrc" <<'EOF'
# >>> dotfiles-vps >>>
source ~/.envvars
export EDITOR=vim
export MANPAGER=less
alias so='bash ~/dotfiles/bootstrap-vps.sh -f'
source ~/.aliases
source ~/.functions
source ~/.bash_prompt
# <<< dotfiles-vps <<<
EOF

	echo "Done. Open a new shell or run: source ~/.bashrc"
}

if [[ "${1:-}" == "--force" || "${1:-}" == "-f" ]]; then
	doIt
else
	read -p "This may overwrite dotfiles in your home directory. Are you sure? (y/n) " -n 1
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
