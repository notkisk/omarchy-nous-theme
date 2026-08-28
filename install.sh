#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config_root="${XDG_CONFIG_HOME:-$HOME/.config}"

# Install to both naming variants so `omarchy theme set nous` and
# `omarchy theme set nous-research` both resolve regardless of how
# omarchy-theme-install stripped the git repo name (nous vs nous-research).
for variant in nous nous-research; do
  theme_dir="$config_root/omarchy/themes/$variant"
  mkdir -p "$theme_dir"
  # Use rsync-like copy without .git to keep theme dir clean
  cp -a "$script_dir/." "$theme_dir/"
  rm -rf "$theme_dir/.git" 2>/dev/null || true
done

mkdir -p "$config_root/omarchy/hooks/theme-set.d"
cp "$script_dir/omarchy-hooks/theme-set.d/nous-research" "$config_root/omarchy/hooks/theme-set.d/nous-research"
chmod +x "$config_root/omarchy/hooks/theme-set.d/nous-research"

omarchy theme set nous-research

# ── Force Neovim to apply with --force semantics ──────────────────────────
# install.sh is the entrypoint for `omarchy-theme-install` users who expect
# the new palette to be visible immediately, not after Lazy's 2s file-watch
# poll. Ensure symlink, transparency layer, and running instances are forced.
nvim_config="$config_root/nvim"
theme_link="$nvim_config/lua/plugins/theme.lua"
expected_target="../../../../.local/state/omarchy/current/theme/neovim.lua"
theme_src="$HOME/.local/state/omarchy/current/theme/nvim/transparency.lua"
transparency_dest="$nvim_config/plugin/after/transparency.lua"

mkdir -p "$nvim_config/lua/plugins"
if [[ ! -L "$theme_link" ]] || [[ "$(readlink "$theme_link")" != "$expected_target" ]]; then
  ln -sfn "$expected_target" "$theme_link"
fi
if [[ -f "$theme_src" ]]; then
  mkdir -p "$(dirname "$transparency_dest")"
  cp -f "$theme_src" "$transparency_dest"
  touch "$transparency_dest" 2>/dev/null || true
fi
touch "$theme_link" 2>/dev/null || true
touch "$HOME/.local/state/omarchy/current/theme/neovim.lua" 2>/dev/null || true

if command -v nvim >/dev/null 2>&1; then
  for sock in $(find "${XDG_RUNTIME_DIR:-/tmp}" -type s -name "nvim.*.0" 2>/dev/null | head -n 20); do
    nvim --server "$sock" --remote-send '<Cmd>doautocmd User LazyReload<CR>' >/dev/null 2>&1 || true
  done
fi

