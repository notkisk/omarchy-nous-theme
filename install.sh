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

# `omarchy theme set` resolves the theme dir name; the git repo may be
# installed as `nous` or `nous-research` depending on how omarchy stripped
# the URL. Try both so a fresh `omarchy-theme-install` never leaves the
# theme inactive (which would leave nvim on the previous palette).
if ! omarchy theme set nous-research 2>/dev/null; then
  omarchy theme set nous 2>/dev/null || true
fi

# ── Force Neovim to apply with --force semantics ──────────────────────────
# install.sh is the entrypoint for `omarchy-theme-install` users who expect
# the new palette to be visible immediately, not after Lazy's 2s file-watch
# poll. Ensure symlink, transparency layer, and running instances are forced
# for every install — not just the current user’s machine.
nvim_config="$config_root/nvim"
theme_link="$nvim_config/lua/plugins/theme.lua"
expected_target="../../../../.local/state/omarchy/current/theme/neovim.lua"
theme_src_state="$HOME/.local/state/omarchy/current/theme/nvim/transparency.lua"
theme_src_repo="$script_dir/nvim/transparency.lua"
transparency_dest="$nvim_config/plugin/after/transparency.lua"

mkdir -p "$nvim_config/lua/plugins"
ln -sfn "$expected_target" "$theme_link"
mkdir -p "$(dirname "$transparency_dest")"
# Prefer the just-activated state file (guaranteed to be the active theme’s
# navy palette), but fall back to the repo source so a failed `theme set`
# still leaves nvim with the correct #1E3061 background.
if [[ -f "$theme_src_state" ]]; then
  cp -f "$theme_src_state" "$transparency_dest"
elif [[ -f "$theme_src_repo" ]]; then
  cp -f "$theme_src_repo" "$transparency_dest"
fi
touch "$transparency_dest" 2>/dev/null || true
touch "$theme_link" 2>/dev/null || true
touch "$HOME/.local/state/omarchy/current/theme/neovim.lua" 2>/dev/null || true
# If the state nvim file is still stale (e.g. theme set failed), force it
# from the repo so the next `omarchy theme set` starts from the correct
# navy transparency layer.
if [[ -f "$theme_src_repo" && -f "$HOME/.local/state/omarchy/current/theme/nvim/transparency.lua" ]]; then
  if ! cmp -s "$theme_src_repo" "$HOME/.local/state/omarchy/current/theme/nvim/transparency.lua" 2>/dev/null; then
    cp -f "$theme_src_repo" "$HOME/.local/state/omarchy/current/theme/nvim/transparency.lua" 2>/dev/null || true
  fi
fi

if command -v nvim >/dev/null 2>&1; then
  for sock in $(find "${XDG_RUNTIME_DIR:-/tmp}" -type s -name "nvim.*.0" 2>/dev/null | head -n 20); do
    nvim --server "$sock" --remote-send '<Cmd>doautocmd User LazyReload<CR>' >/dev/null 2>&1 || true
  done
fi

