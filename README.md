# hyprland-dotfiles

My custom [Hyprland](https://hyprland.org/) configuration, running on top of [Omarchy](https://github.com/basecamp/omarchy).

## Structure

- `hypr/` — Hyprland config (`~/.config/hypr`): keybindings, monitors, look & feel, input, autostart.
- `omarchy/` — Omarchy config (`~/.config/omarchy`): branding, hooks, plugins, themes, shell/bar setup.

## Workspace-per-purpose layout

Instead of using workspaces freely, each one is pinned to a role, and apps are auto-assigned to their workspace by window rules based on the app that launches (`hypr/hyprland.lua`):

| # | Icon | Purpose      | Apps                                  |
|---|:----:|--------------|----------------------------------------|
| 1 | 🌐   | Browser      | Google Chrome, Chromium, Brave, Firefox |
| 2 | `</>` | Frontend    | JetBrains WebStorm                     |
| 3 | 🖥️   | Backend      | JetBrains IDEA / Rider                 |
| 4 | 🗄️   | Database     | JetBrains DataGrip                     |
| 5 | 💬   | Chat         | WhatsApp Web, Teams                    |
| 6 | ✅   | Project mgmt / terminal | Alacritty, kitty, foot, Ghostty, agent terminal |

The idea: instead of remembering "where did I leave X", each workspace has one job. Opening an app always sends it to the same place, so `SUPER + <number>` is a shortcut to a *task*, not just a screen. A custom bar widget (`omarchy/plugins/alessandro.workspaces`) shows the six workspaces as icons instead of numbers, dims the empty ones, and underlines the focused one:

![Workspace bar widget](docs/workspace-bar.png)

## Screenshot

Right monitor (DP-2), showing the workspace bar and terminal setup in action:

![Right monitor](docs/right-monitor.png)

## Dock

The dock is [`rosakodu/omarchy-dock`](https://github.com/rosakodu/omarchy-dock), a native Omarchy Quickshell plugin (`omarchy plugin add https://github.com/rosakodu/omarchy-dock.git --enable`), vendored here at `omarchy/plugins/rosakodu.dock/` with two local tweaks baked into `DockPanel.qml`: a bigger `slotSize`/`iconBaseSize` (there's no exposed setting for this) and a `screen:` binding pinning it to the right monitor (`DP-2` — adjust to your own output name from `hyprctl monitors`). Re-apply both after any `omarchy plugin update rosakodu.dock`, since that overwrites the file.

Pinned icons live at `~/.config/omarchy/dock-pinned.json` (mirrored at `omarchy/dock-pinned.json` here, so it's picked up by the install step below).

If an app's icon or launch doesn't work from the dock, it looks up a `.desktop` file matching the window *class* (not the app name) under `~/.local/share/applications/`. `dock/applications/` holds the ones needed for:
- **WhatsApp** — a web app, so its class is auto-generated and doesn't match its real `.desktop` file.
- **JetBrains apps** (IDEA, WebStorm, Rider, DataGrip) — Toolbox names their `.desktop`/icon files with a random per-install UUID that never matches the stable window class (`jetbrains-idea`, etc.), so both the icon *and* launching from the dock silently fail. These clean `.desktop` files fix both; run `dock/fix-jetbrains-icons.sh` after installing to symlink the actual (UUID-named) icon under the stable name the `.desktop` files and dock expect.

The Omarchy Agent (Claude) icon needed the same trick, but that `.desktop` file isn't included here since it points at a JetBrains-cached copy of Anthropic's logo — recreate it locally with `Icon=` pointing at your own copy if you want it.

## Install

```sh
git clone https://github.com/alessandroros/hyprland-dotfiles.git
cp -a hyprland-dotfiles/hypr/. ~/.config/hypr/
cp -a hyprland-dotfiles/omarchy/. ~/.config/omarchy/
cp hyprland-dotfiles/dock/applications/*.desktop ~/.local/share/applications/
hyprland-dotfiles/dock/fix-jetbrains-icons.sh
omarchy theme set ristretto
```
