-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "5" })

-- Auto-assign apps to their workspace: 1 Browser, 2 Frontend, 3 Backend,
-- 4 Database, 5 Chat, 6 Project Management.
o.window("google-chrome", { workspace = "1" })
o.window("jetbrains-webstorm", { workspace = "2" })
o.window("(jetbrains-idea|jetbrains-rider)", { workspace = "3" })
o.window("jetbrains-datagrip", { workspace = "4" })
o.window("(chrome-web\\.whatsapp\\.com.*|teams-for-linux)", { workspace = "5" })
o.window("(Alacritty|kitty|foot|com\\.mitchellh\\.ghostty|org\\.omarchy\\.agent)", { workspace = "6" })
