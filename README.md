# hyprland-dotfiles

My custom [Hyprland](https://hyprland.org/) configuration, running on top of [Omarchy](https://github.com/basecamp/omarchy).

## Structure

- `hypr/` — Hyprland config (`~/.config/hypr`): keybindings, monitors, look & feel, input, autostart.
- `omarchy/` — Omarchy config (`~/.config/omarchy`): branding, hooks, plugins, themes, shell/bar setup.

## Workspace-per-purpose layout

Instead of using workspaces freely, each one is pinned to a role, and apps are auto-assigned to their workspace by window rules based on the app that launches (`hypr/hyprland.lua`):

| # | Icon | Purpose      | Apps                                  |
|---|:----:|--------------|----------------------------------------|
| 1 | 🌐   | Browser      | Google Chrome                          |
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

## Install

```sh
git clone https://github.com/alessandroros/hyprland-dotfiles.git
cp -a hyprland-dotfiles/hypr/. ~/.config/hypr/
cp -a hyprland-dotfiles/omarchy/. ~/.config/omarchy/
```
