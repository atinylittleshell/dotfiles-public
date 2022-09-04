local wezterm = require 'wezterm'

return {
  font = wezterm.font(
    'DroidSansMono NF',
    {
      weight = 'DemiBold'
    }
  ),
  font_size = 12.0,
  color_scheme = 'Rosé Pine Moon (base16)',
  window_decorations = "RESIZE",
  window_frame = {
    font_size = 12.0,
  },
  leader = { key = '`', mods = '' },
  keys = {
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
      action = wezterm.action.CloseCurrentTab { confirm = true }
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
  default_prog = {
    'C:\\Windows\\System32\\wsl.exe',
    '-d',
    'Ubuntu-22.04',
    '--cd',
    '~'
  },
  launch_menu = {
    {
      label = 'Ubuntu',
      args = {
        'C:\\Windows\\System32\\wsl.exe',
        '-d',
        'Ubuntu-22.04'
      }
    },
    {
      label = 'Powershell',
      args = {
        'C:\\Program Files\\PowerShell\\7\\pwsh.exe'
      }
    }
  }
}
