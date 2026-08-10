# Nous Research — Omarchy theme

An original Omarchy theme built around the Nous Research visual language: cool blue paper, electric cobalt, engraved linework, and precise research-instrument UI.

The desktop stays open and pale blue, while Kitty, btop, Fastfetch, and Neovim use a navy field-station panel so long sessions remain calm and readable.

## Install

From this workspace:

```bash
cp -r nous-research-theme ~/.config/omarchy/themes/nous-research
omarchy theme set nous-research
```

The included `install.sh` also installs the scoped global theme hook required for Fastfetch, Waybar's full layout, GTK, Starship, btop refresh, and Kitty's final caret override. This matters because Omarchy does not execute hooks stored inside a theme directory.

The wallpaper is selected automatically from `backgrounds/` by Omarchy. To cycle it later:

```bash
omarchy theme bg next
```

## Included components

- `colors.toml` — source palette for Omarchy's dynamic templates.
- `kitty.conf` — paper terminal, complete ANSI palette, selection/tabs/borders, and a smooth beam caret with Kitty's cursor trail.
- `fastfetch.jsonc` + `fastfetch-logo.txt` — terminal-native Nous girl artwork; no bitmap or Kitty image protocol is used.
- `lua/nous/` + `colors/nous.lua` — standalone Neovim colorscheme with Treesitter, LSP, completion, Telescope, WhichKey, statusline/tabline, floats, search, folds, Git signs, and inactive-pane groups.
- `waybar/` — an optional full Waybar configuration and matching layout CSS using only real Waybar modules.
- `walker.css` + `fuzzel.ini` — native Omarchy launcher styling plus a matching Fuzzel profile.
- `mako.ini`, `gtk.css`, `hyprland.conf`, `hyprlock.conf`, `swayosd.css`, and supporting terminal/editor files.

## Design notes

The palette is intentionally not a generic blue-black hacker palette. Pale blue-gray paper provides the ground, cobalt is reserved for focus and decisions, and restrained coral/teal/ochre colors make diagnostics and status states legible. The wallpaper uses a cool blue forest field station, glass spheres, and orbit marks with quiet negative space for windows.

The Fastfetch portrait is plain Unicode/ASCII text colored by Fastfetch. It only appears when Fastfetch is run; it is not embedded into Kitty or the wallpaper.
