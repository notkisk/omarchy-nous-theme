# Field Notes for Omarchy

Field Notes is an independent Omarchy theme for quiet research sessions: paper-white surfaces, precise navy type, and blue instrument-panel accents. It takes its visual cues from archival scientific publishing, early terminal interfaces, and monochrome field photography—not from any company artwork, logo, or typeface.

## Preview

![Field Notes lake wallpaper: a blue dithered cabin, forest, and reflective sphere](backgrounds/field-notes-lake.png)

The included wallpaper is an original blue two-ink illustration: an intentionally sparse field-study scene with printed-paper grain, halftone shading, contour marks, and space for windows. It is designed to read as a background rather than a focal point.

## Palette

| Role | Color | Use |
| --- | --- | --- |
| Paper | `#F7F5EF` | Main surfaces and terminal background |
| Ink | `#0B1A37` | Primary text and dark instrument panels |
| Signal blue | `#1554C0` | Focus, selection, and active controls |
| Periwinkle | `#AAB8F5` | Secondary emphasis and monitoring data |
| Rule | `#AAB8D1` | Borders and quiet separators |
| Slate | `#50627F` | Secondary labels and inactive UI |
| Verdigris | `#2E7D6F` | Success and healthy states |
| Amber | `#A86619` | Warnings only |
| Oxide | `#A44148` | Errors only |

The paper-and-ink base keeps long reading sessions low-glare; signal blue is reserved for decisions and focus. BTOP and the lock screen use the same inks in reverse, making dense monitoring and private entry feel like purposeful instrumentation rather than a second theme.

## Included targets

The package supplies Omarchy color tokens plus Kitty, Ghostty, Alacritty, Waybar, Mako, Walker, SwayOSD, Hyprland, Hyprlock, Chromium, BTOP, VS Code, Neovim, and icon-theme settings. The file names and flat package layout follow Omarchy’s theme installer conventions.

## Installation

```bash
omarchy theme install <repository-url>
```

For a repository named `nous-theme`, Omarchy installs this package as `nous`; select that installed theme from Omarchy’s theme picker. The wallpaper is included under `backgrounds/` and can be selected through the normal Omarchy background controls.

## Design notes

- Thin separators and paper surfaces keep the desktop structured without feeling busy.
- Compact monospace settings suit terminal, documentation, and lab-notebook work.
- Halftone landscape imagery introduces a contemplative “research in nature” note without relying on branded visual assets.
- There are no gradients, bloom effects, glass surfaces, or neon treatments.
