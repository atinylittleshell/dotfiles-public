curl.exe --create-dirs --output %LOCALAPPDATA%\nvim-data\site\autoload\plug.vim --url https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

SET script_root=%~dp0
mklink /d %LOCALAPPDATA%\nvim %script_root%nvim