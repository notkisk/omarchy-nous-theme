# Nous Research Theme for Omarchy

An independent Omarchy theme built around the Nous Research aesthetic: void-black surfaces, electric cobalt accents, and near-white type. The visual language draws from manga halftone illustration, minimalist HUD instrumentation, and technical grid layouts — clean, contrasty, and deliberate.

## Preview

![Nous Research wallpaper](backgrounds/nous-research.png)

The wallpaper carries the full cobalt palette into every surface. Windows, bars, terminals, and notifications all share the same void ground, so the desktop reads as one coherent environment rather than layered apps.

## Palette

| Role | Color | Use |
| --- | --- | --- |
| Void | `#010109` | Main surfaces, terminal background, wallpaper base |
| Near-white | `#F6F7FF` | Primary text and high-contrast labels |
| Electric cobalt | `#0305F6` | Focus, selection, active controls, borders |
| Cobalt mid | `#6F70FA` | Secondary emphasis, muted elements, comments |
| Deep cobalt | `#010288` | Cards, selection backgrounds, surface highlights |
| Lavender | `#C2C2FC` | Secondary labels, strings, inactive UI |
| Verdigris | `#4F9B8C` | Success and healthy states |
| Amber | `#C28A39` | Warnings only |
| Oxide | `#C75E6A` | Errors only |

The void-and-white base keeps everything on a single low-glare field. Electric cobalt is reserved for focus and decisions — never decorative. The result matches the contrasty, high-precision feel of the Nous Research visual identity.

## Included targets

The package supplies Omarchy color tokens plus Kitty, Ghostty, Alacritty, Waybar, Mako, Walker, SwayOSD, Hyprland, Hyprlock, Chromium, BTOP, VS Code, Neovim, and icon-theme settings. It also includes an original Fastfetch profile and ASCII badge, plus a matching Starship prompt profile. The file names and flat package layout follow Omarchy's theme installer conventions.

## Installation

```bash
omarchy theme install https://github.com/notkisk/nous-theme.git
```

For a repository named `nous-theme`, Omarchy installs this package as `nous`; select that installed theme from Omarchy's theme picker. The wallpaper is included under `backgrounds/` and can be selected through the normal Omarchy background controls.

### Terminal extras

Kitty receives a short electric-cobalt cursor trail for deliberate cursor jumps. To use the optional Fastfetch profile and Starship prompt in another Omarchy install, copy the included files to `~/.config/fastfetch/config.jsonc` and `~/.config/starship.toml`; the Fastfetch profile reads its ASCII badge from the active theme directory.

## Design notes

- Electric cobalt on void black delivers maximum contrast without any bloom or neon treatment.
- Thin cobalt separators and 1px borders keep the desktop structured without visual noise.
- Lavender secondaries (`#C2C2FC`) provide hierarchy without introducing a new hue.
- No gradients, glass surfaces, or rounded corners — every element is precise and flat.
- The halftone manga aesthetic referenced in the wallpaper and Fastfetch badge reinforces the research-lab character of the environment.
