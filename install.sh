#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config_root="${XDG_CONFIG_HOME:-$HOME/.config}"
theme_dir="$config_root/omarchy/themes/nous-research"

mkdir -p "$theme_dir" "$config_root/omarchy/hooks/theme-set.d"
cp -a "$script_dir/." "$theme_dir/"
cp "$script_dir/omarchy-hooks/theme-set.d/nous-research" "$config_root/omarchy/hooks/theme-set.d/nous-research"
chmod +x "$config_root/omarchy/hooks/theme-set.d/nous-research"
omarchy theme set nous-research

