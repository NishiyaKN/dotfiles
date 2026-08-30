-- ~/.config/hypr/hyprland.lua
-- Migrated from the supplied hyprland.conf for Hyprland 0.55+.
-- Keep the old hyprland.conf as a backup until you have verified everything.

-----------------------------
-- ENVIRONMENT VARIABLES  --
-----------------------------

hl.env("CLUTTER_BACKEND", "wayland")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "32")
hl.env("GTK_THEME", "gtk")
hl.env("OPENSSL_CONF", "/dev/null")

hl.env("WAYLAND_DISPLAY", "wayland-0")
hl.env("LIBGL_ALWAYS_INDIRECT", "1")

-- Memory usage optimizations for ROCm
hl.env("PYTORCH_ALLOC_CONF", "expandable_segments:True")
hl.env("TORCH_ROCM_AOTRITON_ENABLE_EXPERIMENTAL", "1")

-- Ollama options
hl.env("OLLAMA_CONTEXT_LENGTH", "16384")
hl.env("OLLAMA_FLASH_ATTENTION", "1")
hl.env("OLLAMA_KV_CACHE_TYPE", "q8_0")

-- Firefox Wayland
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Electron >28 apps
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

----------------
-- WALLUST     --
----------------

-- The old config sourced wallust-hyprland.conf to provide
-- $color12 and $background. Read those two values directly so
-- the existing generated wallust .conf can remain untouched.
local function wallust_var(name, fallback)
    local home = os.getenv("HOME") or ""
    local path = home .. "/.config/hypr/wallust/wallust-hyprland.conf"
    local file = io.open(path, "r")

    if not file then
        return fallback
    end

    local data = file:read("*a")
    file:close()

    local value = data:match("%$" .. name .. "%s*=%s*([^%s#]+)")
    return value or fallback
end

local color12 = wallust_var("color12", "rgba(ffffffff)")
local background = wallust_var("background", "rgba(000000ff)")

----------------
-- MONITORS    --
----------------

hl.monitor({
    output = "DP-2",
    mode = "2560x1440@180.00",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "HDMI-A-2",
    mode = "1920x1080@100",
    position = "2560x0",
    scale = 1,
})

for i = 1, 5 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "DP-2",
    })
end

for i = 6, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "HDMI-A-2",
    })
end

-- Unscale XWayland
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

----------------
-- AUTOSTART   --
----------------

hl.on("hyprland.start", function()
    hl.exec_cmd("swaybg -o DP-2 -m fill -i /home/yori/.config/hypr/wallpapers/Monochrome.png")
    hl.exec_cmd("swaybg -o HDMI-A-2 -m fill -i /home/yori/.config/hypr/wallpapers/Monochrome.png")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("/home/yori/re/git/dotfiles/scripts/notmine/killportal.sh")
    hl.exec_cmd("dunst")
    hl.exec_cmd("hyprctl setcursor Dracula-cursors 24")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("qbittorrent")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("fcitx5")
    hl.exec_cmd("kdeconnectd")
    hl.exec_cmd("kdeconnect-indicator")
    hl.exec_cmd("mpd")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("nohup easyeffects --gapplication-service")

    -- Clipboard manager
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Rainbow borders & Pyprland
    hl.exec_cmd("$HOME/.config/hypr/UserScripts/RainbowBorders.sh &")
    hl.exec_cmd("pypr &")
end)

----------------
-- KEYBINDS    --
----------------

local mainMod = "SUPER"

hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))
hl.bind("SUPER + SHIFT + K", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind("SUPER + Return", hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + SHIFT + W", hl.dsp.window.close())
hl.bind("SUPER + CTRL + M", hl.dsp.exit())
hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin"))
hl.bind("SUPER + S", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + space", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + SHIFT + escape", hl.dsp.exec_cmd("systemctl reboot"))

hl.bind(
    "SUPER + SHIFT + S",
    hl.dsp.exec_cmd(
        [[~/.cargo/bin/wayfreeze --after-freeze-cmd 'FILE="$HOME/Pictures/sc/$(date +%Y%m%d-%H%M%S).png" && grim -g "$(slurp)" "$FILE" && wl-copy < "$FILE"; pkill -x wayfreeze']]
    )
)

-- Layout keybinds
hl.bind("SUPER + T", hl.dsp.window.pseudo())
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))

-- Focus movement
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))

-- Workspaces
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. tostring(i), hl.dsp.focus({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Move window to workspace
for i = 1, 9 do
    hl.bind(mainMod .. " + SHIFT + " .. tostring(i), hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Mouse workspace switching
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

hl.bind("SUPER + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

-- MPD / MPC
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("pkill -9 mpd || mpd"), { repeating = true })
hl.bind("SUPER + SHIFT + PERIOD", hl.dsp.exec_cmd("mpc toggle"), { locked = true })
hl.bind("SUPER + PERIOD", hl.dsp.exec_cmd("mpc next"), { locked = true })
hl.bind("SUPER + COMMA", hl.dsp.exec_cmd("mpc prev"), { locked = true })

-- Display DPMS controls
hl.bind("SUPER + BackSpace", hl.dsp.exec_cmd("hyprctl dispatch dpms on"), { locked = true })
hl.bind("SUPER + SHIFT + BackSpace", hl.dsp.exec_cmd("hyprctl dispatch dpms off"), { locked = true })

-- Audio & Backlight keys
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("/opt/pulsemixer --change-volume -5 --unmute"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("/opt/pulsemixer --change-volume +5 --unmute"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pulsemixer --toggle-mute"), { repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("amixer set Capture toggle"), { repeating = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })

-- Pyprland zoom
hl.bind("SUPER + Z", hl.dsp.exec_cmd("pypr zoom"))

----------------
-- SETTINGS    --
----------------

hl.config({
    dwindle = {
        preserve_split = true,
        special_scale_factor = 0.8,
    },

    master = {
        new_on_top = true,
        mfact = 0.5,
    },

    general = {
        allow_tearing = true,
        border_size = 2,
        gaps_in = 6,
        gaps_out = 8,
        resize_on_border = true,

        col = {
            active_border = color12,
            inactive_border = background,
        },

        layout = "dwindle",
    },

    decoration = {
        rounding = 10,
        active_opacity = 1.0,
        fullscreen_opacity = 1.0,

        dim_strength = 0.1,
        dim_special = 0.8,

        blur = {
            enabled = true,
            size = 6,
            passes = 2,
            ignore_opacity = false,
            new_optimizations = true,
            special = true,
        },
    },

    animations = {
        enabled = true,
    },

    input = {
        kb_layout = "us",
        repeat_rate = 50,
        repeat_delay = 300,
        numlock_by_default = true,
        left_handed = false,
        follow_mouse = 1,
        float_switch_override_focus = 0,
        scroll_factor = 0.5,

        accel_profile = "flat",
        sensitivity = 0,

        touchpad = {
            scroll_factor = 0.5,
            natural_scroll = true,
        },
    },

    gestures = {
        workspace_swipe_distance = 500,
        workspace_swipe_invert = true,
        workspace_swipe_min_speed_to_force = 30,
        workspace_swipe_cancel_ratio = 0.5,
        workspace_swipe_create_new = true,
        workspace_swipe_forever = true,
    },

    group = {
        col = {
            border_active = color12,
        },

        groupbar = {
            col = {
                active = background,
            },
        },
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        enable_swallow = true,
        swallow_regex = "^(kitty)$",
        focus_on_activate = false,
    },

    binds = {
        workspace_back_and_forth = true,
        allow_workspace_cycles = true,
        pass_mouse_when_bound = false,
    },

    cursor = {
        no_hardware_cursors = false,
        enable_hyprcursor = true,
    },
})

hl.device({
    name = "bt5.1-keyboard-1503-keyboard",
    scroll_factor = 0.5,
    natural_scroll = true,
    sensitivity = 1,
})

-- Restore the old 3-finger workspace swipe.
-- The old workspace_swipe_* settings that still exist in 0.55 remain above;
-- the gesture itself is now declared explicitly.
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

----------------
-- ANIMATIONS  --
----------------

hl.curve("wind", {
    type = "bezier",
    points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})

hl.curve("winIn", {
    type = "bezier",
    points = { { 0.1, 1.1 }, { 0.1, 1.1 } },
})

hl.curve("winOut", {
    type = "bezier",
    points = { { 0.3, -0.3 }, { 0, 1 } },
})

hl.curve("liner", {
    type = "bezier",
    points = { { 1, 1 }, { 1, 1 } },
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 6,
    bezier = "wind",
    style = "slide",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 6,
    bezier = "winIn",
    style = "slide",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 5,
    bezier = "winOut",
    style = "slide",
})

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 5,
    bezier = "wind",
    style = "slide",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 1,
    bezier = "liner",
})

hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 100,
    bezier = "liner",
    style = "loop",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "wind",
})

----------------
-- WINDOW RULES
----------------

hl.window_rule({
    match = { class = ".*" },
    idle_inhibit = "fullscreen",
})

hl.window_rule({
    match = { class = ".*" },
    immediate = true,
})

-- Floating Rules
hl.window_rule({
    match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^([Zz]oom|onedriver|onedriver-launcher)$" },
    float = true,
})

hl.window_rule({
    match = { title = "^(File Operation Progress)$" },
    float = true,
})

hl.window_rule({
    match = { title = "^(Confirm to replace files)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^(xdg-desktop-portal-gtk)$" },
    float = true,
})

hl.window_rule({
    match = { title = "^(Calculator)$" },
    float = true,
})

hl.window_rule({
    match = { title = "^(Add Folder to Workspace)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^([Rr]ofi)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^(eog)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^(nwg-look|qt5ct|qt6ct|mpv)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^(nm-applet|nm-connection-editor|blueman-manager)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^(gnome-system-monitor|org.gnome.SystemMonitor)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^(yad)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^(wihotspot-gui)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^(evince)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^(file-roller|org.gnome.FileRoller)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^([Bb]aobab|org.gnome.[Bb]aobab)$" },
    float = true,
})

hl.window_rule({
    match = { title = "^(Kvantum Manager)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^([Qq]alculate-gtk)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^([Ww]hatsapp-for-linux)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^([Ff]erdium)$" },
    float = true,
})

-- Opacity Rules
hl.window_rule({
    match = { class = "^([Ww]ofi)$" },
    opacity = "0.7 0.6",
})

hl.window_rule({
    match = { class = "^(Alacritty)$" },
    opacity = "0.9 0.8",
})

hl.window_rule({
    match = { class = "^(kitty)$" },
    opacity = "0.9 0.8",
})

-- Window Sizing
hl.window_rule({
    match = { class = "^(gnome-system-monitor|org.gnome.SystemMonitor)$" },
    size = { "70%", "70%" },
})

hl.window_rule({
    match = { class = "^(xdg-desktop-portal-gtk)$" },
    size = { "70%", "70%" },
})

hl.window_rule({
    match = { title = "^(Kvantum Manager)$" },
    size = { "60%", "70%" },
})

hl.window_rule({
    match = { class = "^(qt6ct)$" },
    size = { "60%", "70%" },
})

hl.window_rule({
    match = { class = "^(evince|wihotspot-gui)$" },
    size = { "70%", "70%" },
})

hl.window_rule({
    match = { class = "^(file-roller|org.gnome.FileRoller)$" },
    size = { "60%", "70%" },
})

----------------
-- LAYER RULES
----------------

hl.layer_rule({
    match = { namespace = "overview" },
    blur = true,
})

-- Old "ignorezero" is now ignore_alpha = 0.
hl.layer_rule({
    match = { namespace = "overview" },
    ignore_alpha = 0,
})

-------------------------
-- PICTURE-IN-PICTURE  --
-------------------------

hl.window_rule({
    match = { title = "^(Picture-in-Picture)$" },
    opacity = "0.95 0.75",
})

hl.window_rule({
    match = { title = "^(Picture-in-Picture)$" },
    pin = true,
})

hl.window_rule({
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
})

hl.window_rule({
    match = { title = "^(Picture-in-Picture)$" },
    size = { "25%", "25%" },
})

hl.window_rule({
    match = { title = "^(Picture-in-Picture)$" },
    move = { "72%", "7%" },
})

-----------------------
-- WORKSPACE RULES   --
-----------------------

hl.workspace_rule({
    workspace = "w[t1]",
    gaps_out = 0,
    gaps_in = 0,
})

hl.workspace_rule({
    workspace = "w[tg1]",
    gaps_out = 0,
    gaps_in = 0,
})

hl.workspace_rule({
    workspace = "f[1]",
    gaps_out = 0,
    gaps_in = 0,
})

hl.window_rule({
    match = {
        float = false,
        workspace = "w[t1]",
    },
    border_size = 0,
})

hl.window_rule({
    match = {
        float = false,
        workspace = "w[t1]",
    },
    rounding = 0,
})

hl.window_rule({
    match = {
        float = false,
        workspace = "w[tg1]",
    },
    border_size = 0,
})

hl.window_rule({
    match = {
        float = false,
        workspace = "w[tg1]",
    },
    rounding = 0,
})

hl.window_rule({
    match = {
        float = false,
        workspace = "f[1]",
    },
    border_size = 0,
})

hl.window_rule({
    match = {
        float = false,
        workspace = "f[1]",
    },
    rounding = 0,
})

