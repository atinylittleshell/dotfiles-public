local wezterm = require 'wezterm'

local prog_powershell = {
  'C:\\Program Files\\PowerShell\\7\\pwsh.exe'
}
local prog_wsl = {
  'C:\\Windows\\System32\\wsl.exe',
  '-d',
  'Ubuntu-22.04',
  '--cd',
  '~'
}

local default_prog = function()
  if package.config:sub(1,1) == '\\' then
    return prog_powershell
  else
    return prog_wsl
  end
end

return {
  font = wezterm.font(
    'Hack NF',
    {
      weight = 'DemiBold'
    }
  ),
  font_size = 12.0,
  color_scheme = 'Rosé Pine Moon (base16)',
  tab_max_width = 64,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  window_frame = {
    font_size = 12.0,
  },
  leader = { key = '`', mods = '' },
  keys = {
    {
      key = 'c',
      mods = 'ALT',
      action = wezterm.action.SendString('\x03')
    },
    {
      key = 'c',
      mods = 'CTRL',
      action = wezterm.action.CopyTo('Clipboard')
    },
    {
      key = 'v',
      mods = 'CTRL',
      action = wezterm.action.PasteFrom('Clipboard')
    },
    {
      key = '`',
      mods = 'LEADER',
      action = wezterm.action.SendString '`'
    },
    {
      key = 'c',
      mods = 'LEADER',
      action = wezterm.action.SpawnTab 'CurrentPaneDomain'
    },
    {
      key = 'x',
      mods = 'LEADER',
      action = wezterm.action.CloseCurrentTab { confirm = false }
    },
    {
      key = '1',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(0)
    },
    {
      key = '2',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(1)
    },
    {
      key = '3',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(2)
    },
    {
      key = '4',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(3)
    },
    {
      key = '5',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(4)
    },
    {
      key = '6',
      mods = 'LEADER',
      action = wezterm.action.ActivateTab(5)
    },
  },
  default_prog = default_prog(),
  launch_menu = {
    {
      label = 'Ubuntu',
      args = prog_wsl
    },
    {
      label = 'Powershell',
      args = prog_powershell
    }
  }
}
