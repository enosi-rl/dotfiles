-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Session management https://github.com/danielcopper/wezterm-session-manager
local session_manager = require("wezterm-session-manager/session-manager")

wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- color scheme --
-- config.color_scheme = 'Gruvbox light, hard (base16)'
-- config.color_scheme = 'Gruvbox light, medium (base16)'
-- config.color_scheme = 'Gruvbox light, soft (base16)'
-- config.color_scheme = "Gruvbox dark, medium (base16)"
-- config.color_scheme = 'Gruvbox dark, pale (base16)'
-- config.color_scheme = "Gruvbox Material (Gogh)"
-- config.color_scheme = "nord"
config.color_scheme = "nordfox"

-- config.color_scheme = 'MonokaiPro (Gogh)'
-- config.color_scheme = 'Monokai Pro Ristretto (Gogh)'
-- config.color_scheme = 'Monokai (terminal.sexy)'
-- config.color_scheme = 'Mocha (dark) (terminal.sexy)'

config.font = wezterm.font("MonoLisa")
config.line_height = 1.2
config.audible_bell = "Disabled"
config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 150,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 150,
}
config.colors = {
	visual_bell = "#303030",
}

config.window_decorations = "RESIZE"
config.initial_rows = 80
config.initial_cols = 121

config.show_update_window = true

config.keys = {
	{ key = "A", mods = "CMD", action = wezterm.action.ShowTabNavigator },

	{
		key = "W",
		mods = "CMD",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},

	{
		key = "W",
		mods = "ALT",
		action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
	{ key = "N", mods = "ALT", action = act.SwitchWorkspaceRelative(1) },
	{ key = "P", mods = "ALT", action = act.SwitchWorkspaceRelative(-1) },

	-- session management
	{ key = "S", mods = "ALT", action = wezterm.action({ EmitEvent = "save_session" }) },
	{ key = "L", mods = "ALT", action = wezterm.action({ EmitEvent = "load_session" }) },
	{ key = "R", mods = "ALT", action = wezterm.action({ EmitEvent = "restore_session" }) },
}

wezterm.on("update-right-status", function(window, pane)
	local cwd_uri = pane:get_current_working_dir()
	local cwd = ""

	if cwd_uri then
		cwd = cwd_uri.file_path
	end
	window:set_right_status(wezterm.format({
		{ Attribute = { Intensity = "Half" } },
		{ Foreground = { Color = "#aaaaaa" } },
		{ Text = "Workspace: " .. window:active_workspace() .. " @ " .. cwd .. "    " },
	}))
end)

-- and finally, return the configuration to wezterm
return config
