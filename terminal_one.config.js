const os = require("os");

module.exports = {
  fontFamily: "Hack NF",
  themes: [
    {
      "name": "rose-pine-moon",
    
      "cursor": "#56526e",
      "cursorAccent": "#e0def4",

      "selectionBackground": "#312f44",
      "selectionForeground": "#e0def4",
      "selectionInactiveBackground": "#312f44",
    
      "background": "#232136",
      "foreground": "#e0def4",
    
      "black": "#393552",
      "blue": "#9ccfd8",
      "cyan": "#ea9a97",
      "green": "#3e8fb0",
      "magenta": "#c4a7e7",
      "red": "#eb6f92",
      "white": "#e0def4",
      "yellow": "#f6c177",

      "brightBlack": "#817c9c",
      "brightBlue": "#9ccfd8",
      "brightCyan": "#ea9a97",
      "brightGreen": "#3e8fb0",
      "brightMagenta": "#c4a7e7",
      "brightRed": "#eb6f92",
      "brightWhite": "#e0def4",
      "brightYellow": "#f6c177"
    }
  ],
  shells: [
    {
      name: "Default",
      command: "",
      startupDirectory: "",
      themeName: "rose-pine-moon"
    },
    ...(
      os.platform() === "win32" ? [
        {
          name: "PowerShell",
          command: "C:\\Program Files\\PowerShell\\7\\pwsh.exe",
          startupDirectory: "",
          themeName: "rose-pine-moon"
        },
        {
          name: "Ubuntu",
          command: "ubuntu2204.exe",
          startupDirectory: "",
          themeName: "rose-pine-moon"
        }
      ] : []
    )
  ],
  defaultShellName: os.platform() === "win32" ? "PowerShell" : "Default"
};
