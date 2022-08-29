SET script_root=%~dp0
SET DOT_FILES_HOME=%~dp0
mklink /d %LOCALAPPDATA%\nvim %script_root%nvim
