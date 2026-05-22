-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 14

config.color_scheme = "Kanagawa (Gogh)"
config.window_background_opacity = 0.9
config.text_background_opacity = 0.3
config.macos_window_background_blur = 20

config.font = wezterm.font_with_fallback({
	"PlemolJP Console NF",
	"ヒラギノ角ゴシック",
})
config.line_height = 1.05

local act = wezterm.action

-- Leaderキーの設定（tmuxのprefixに相当）
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1500 }

config.keys = {
	-- ペイン分割
	{ key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- ペイン移動
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	-- ペインサイズ調整
	{ key = "H", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "J", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "K", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "L", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },

	-- タブ操作
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },

	-- ペインを閉じる
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

	-- ペインのズーム（最大化トグル）
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

	-- コピーモード（tmuxのcopy-modeに相当）
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
}

-- Finally, return the configuration to wezterm:
return config
