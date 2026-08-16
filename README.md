# Nous Research — Omarchy theme

<img width="2560" height="1440" alt="screenshot-2026-08-11_16-46-22" src="https://github.com/user-attachments/assets/08415f54-6c3b-4b67-b564-23c8ec8da307" />

An original Omarchy theme built around the Nous Research visual language: cool blue paper, electric cobalt, engraved linework, and precise research-instrument UI.

The desktop stays white and precise, with pale blue paper surfaces, deep-blue text, and electric cobalt reserved for focus and selection.

## Install

Install directly with Omarchy:

```bash
omarchy-theme-install https://github.com/notkisk/omarchy-nous-theme.git
```

Then select the installed Nous Research theme if Omarchy does not activate it automatically.

The included `install.sh` also installs the scoped global theme hook required for Fastfetch, Waybar's full layout, GTK, Starship, btop refresh, and Kitty's final caret override. This matters because Omarchy does not execute hooks stored inside a theme directory.

### Optional Waybar layout

To overwrite the active Waybar configuration with this theme's layout:

```bash
waybar_theme_dir="$(mktemp -d)"
trap 'rm -rf "$waybar_theme_dir"' EXIT
git clone --depth 1 https://github.com/notkisk/nous-theme.git "$waybar_theme_dir/nous-theme"
mkdir -p ~/.config/waybar
cp "$waybar_theme_dir/nous-theme/waybar/config.jsonc" \
  "$waybar_theme_dir/nous-theme/waybar/style.css" ~/.config/waybar/
omarchy restart waybar
```

The wallpaper is selected automatically from `backgrounds/` by Omarchy. To cycle it later:

```bash
omarchy theme bg next
```

## Included components

- `colors.toml` — source palette for Omarchy's dynamic templates.
- `kitty.conf` — paper terminal, complete ANSI palette, selection/tabs/borders, and a smooth beam caret with Kitty's cursor trail.
- `fastfetch.jsonc` + `fastfetch-logo.txt` — compact blue line-art Nous mark with a clean terminal fallback.
- `assets/nous-research-girl.png` — the supplied Nous Research girl artwork used by Neovim through `3rd/image.nvim` and Kitty's Graphics Protocol.
- `lua/nous/` + `colors/nous.lua` — standalone Neovim colorscheme with Treesitter, LSP, completion, Telescope, WhichKey, statusline/tabline, floats, search, folds, Git signs, inactive-pane groups, and the optional artwork layer.
- `waybar/` — an optional full Waybar configuration and matching layout CSS using only real Waybar modules.
- `walker.css` + `fuzzel.ini` — native Omarchy launcher styling plus a matching Fuzzel profile.
- `mako.ini`, `gtk.css`, `hyprland.conf`, `hyprlock.conf`, `swayosd.css`, and supporting terminal/editor files.

## Design notes

The palette is intentionally not a generic blue-black hacker palette. White and pale blue paper provide the ground, cobalt is reserved for focus and decisions, and restrained coral/teal/ochre colors make diagnostics and status states legible. Existing wallpaper and illustration assets are left untouched.

The default Fastfetch portrait is compact Unicode linework, so it works in any terminal. Kitty users can preview the supplied PNG beside the same system modules with `fastfetch --kitty ~/.config/omarchy/current/theme/assets/nous-research-girl.png`; the fallback remains defined in `fastfetch-logo.txt`.

## Neovim artwork

The PNG belongs at `assets/nous-research-girl.png` inside the theme directory. Omarchy copies it to `~/.config/omarchy/current/theme/assets/`, and the LazyVim spec in `neovim.lua` installs/configures `3rd/image.nvim` with its Kitty backend and ImageMagick CLI processor. The artwork is shown only in programming buffers, in the active editor window, at the upper-right, and is cleared automatically when buffers, splits, tabs, focus, or Neovim change.

To replace it later, overwrite that PNG while preserving the path. To disable it, set `vim.g.nous_research_image = false` before LazyVim loads plugins, or launch Neovim with `NOUS_RESEARCH_NVIM_ART=0`.
