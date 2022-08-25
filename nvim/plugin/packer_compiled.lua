-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/kunchenguid/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/kunchenguid/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/kunchenguid/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/kunchenguid/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kunchenguid/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  catppuccin = {
    config = { "\27LJ\2\nì\1\0\0\3\0\t\0\0146\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0B\0\1\0016\0\0\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0\27colorscheme catppuccin\bcmd\nsetup\15catppuccin\frequire\vfrappe\23catppuccin_flavour\6g\bvim\0" },
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["lsp_lines.nvim"] = {
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://github.com/Maan2003/lsp_lines.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\næ\5\0\0\a\0!\0;6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\v\0004\4\3\0005\5\b\0005\6\t\0=\6\n\5>\5\1\4=\4\f\0035\4\r\0005\5\14\0>\5\3\4=\4\15\0034\4\0\0=\4\16\0034\4\0\0=\4\17\0035\4\18\0=\4\19\0034\4\3\0005\5\20\0005\6\21\0=\6\n\5>\5\1\4=\4\22\3=\3\23\0025\3\25\0005\4\24\0=\4\f\0034\4\0\0=\4\15\0034\4\0\0=\4\16\0034\4\0\0=\4\17\0034\4\0\0=\4\19\0034\4\0\0=\4\22\3=\3\26\0025\3\31\0004\4\3\0005\5\27\0005\6\28\0=\6\n\0055\6\29\0=\6\30\5>\5\1\4=\4\f\3=\3 \2B\0\2\1K\0\1\0\ftabline\1\0\0\fsymbols\1\0\1\19alternate_file\5\1\0\2\tleft\bÓÇ∂\nright\bÓÇ¥\1\2\1\0\fbuffers\18right_padding\3\2\22inactive_sections\1\0\0\1\2\0\0\rfilename\rsections\14lualine_z\1\0\1\nright\bÓÇ¥\1\2\1\0\rlocation\17left_padding\3\2\14lualine_y\1\3\0\0\rfiletype\rprogress\14lualine_x\14lualine_c\14lualine_b\1\2\1\0\tdiff\fcolored\1\1\3\0\0\rfilename\vbranch\14lualine_a\1\0\0\14separator\1\0\1\tleft\bÓÇ∂\1\2\1\0\tmode\18right_padding\3\2\foptions\1\0\0\23section_separators\1\0\2\tleft\bÓÇ¥\nright\bÓÇ∂\1\0\2\25component_separators\6|\ntheme\15catppuccin\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\n1\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\20mkdp_auto_start\6g\bvim\0" },
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\nv\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\27automatic_installation\2\20mason-lspconfig\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\ny\0\1\4\0\4\0\0149\1\0\0'\3\1\0B\1\2\2\14\0\1\0X\2\bÄ9\1\0\0'\3\2\0B\1\2\2\14\0\1\0X\2\3Ä9\1\0\0'\3\3\0B\1\2\2L\1\2\0\21.prettierrc.json\19.prettierrc.js\16.prettierrc\18root_has_files\0\1\4\0\4\0\0149\1\0\0'\3\1\0B\1\2\2\14\0\1\0X\2\bÄ9\1\0\0'\3\2\0B\1\2\2\14\0\1\0X\2\3Ä9\1\0\0'\3\3\0B\1\2\2L\1\2\0\19.eslintrc.json\17.eslintrc.js\14.eslintrc\18root_has_fileì\2\1\0\t\0\15\1\0276\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\r\0004\4\3\0009\5\3\0009\5\4\0059\5\5\0059\5\6\0055\a\b\0003\b\a\0=\b\t\aB\5\2\2>\5\1\0049\5\3\0009\5\4\0059\5\n\0059\5\6\0055\a\f\0003\b\v\0=\b\t\aB\5\2\0?\5\0\0=\4\14\3B\1\2\1K\0\1\0\fsources\1\0\0\1\0\1\17prefer_local\22node_modules/.bin\0\veslint\14condition\1\0\1\17prefer_local\22node_modules/.bin\0\twith\rprettier\15formatting\rbuiltins\nsetup\fnull-ls\frequire\5ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n;\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\20formatting_sync\bbuf\blsp\bvimÜ\1\0\2\4\0\6\0\r9\2\0\0\6\2\1\0X\2\6Ä9\2\0\0\6\2\2\0X\2\3Ä9\2\0\0\a\2\3\0X\2\3Ä9\2\4\0+\3\1\0=\3\5\2K\0\1\0\24document_formatting\26resolved_capabilities\16tailwindcss\veslint\rtsserver\tnameÓ\a\1\0\14\0009\0d6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0004\4\0\0B\1\3\0016\1\2\0009\1\3\0019\1\6\1'\3\a\0005\4\b\0003\5\t\0=\5\n\4B\1\3\0016\1\0\0'\3\v\0B\1\2\0023\2\f\0005\3\14\0=\3\r\0016\3\0\0'\5\15\0B\3\2\0029\3\16\0036\5\2\0009\5\17\0059\5\18\0059\5\19\5B\5\1\0A\3\0\0029\4\20\0009\4\21\0045\6\22\0=\2\23\6=\3\24\0065\a\28\0005\b\26\0005\t\25\0=\t\27\b=\b\29\a=\a\30\6B\4\2\0019\4\31\0009\4\21\0045\6 \0=\2\23\6=\3\24\6B\4\2\0019\4!\0009\4\21\0045\6\"\0=\2\23\6=\3\24\6B\4\2\0019\4#\0009\4\21\0045\6$\0=\2\23\6=\3\24\6B\4\2\0019\4%\0009\4\21\0045\6&\0=\2\23\6=\3\24\6B\4\2\0019\4'\0009\4\21\0045\6(\0=\2\23\6=\3\24\6B\4\2\0019\4)\0009\4\21\0045\6*\0=\2\23\0065\a7\0005\b,\0005\t+\0=\t-\b5\t/\0005\n.\0=\n0\t=\t1\b5\t4\0006\n\2\0009\n\3\n9\n2\n'\f3\0+\r\2\0B\n\3\2=\n5\t=\t6\b=\b8\a=\a\30\6B\4\2\1K\0\1\0\bLua\1\0\0\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\1\0\0\16sumneko_lua\1\0\0\16tailwindcss\1\0\0\rtsserver\1\0\0\veslint\1\0\0\vjsonls\1\0\0\thtml\rsettings\bcss\1\0\0\tlint\1\0\0\1\0\1\19unknownAtRules\vignore\17capabilities\14on_attach\1\0\0\nsetup\ncssls\29make_client_capabilities\rprotocol\blsp\24update_capabilities\17cmp_nvim_lsp\1\26\0\0\bÓòí\bÔûî\bÔûî\bÔûî\bÓûõ\bÓûõ\bÔÉ®\bÔ∞Æ\bÔ£ñ\bÓò§\bÔëµ\bÔ¢ü\bÔÉä\bÔ†ä\bÔ¨å\bÓà´\bÔÖõ\bÔöê\bÔÑï\bÔÖù\bÓà¨\bÔÉä\bÔÉß\bÔ¨¶\bÓòé\23CompletionItemKind\0\21vim.lsp.protocol\rcallback\0\1\0\1\ngroup\15formatting\16BufWritePre\24nvim_create_autocmd\15formatting\24nvim_create_augroup\bapi\bvim\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nç\3\0\0\v\0\25\0$6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0009\2\4\0029\2\5\0029\3\6\0005\5\14\0005\6\f\0005\a\n\0005\b\b\0009\t\a\1=\t\t\b=\b\v\a=\a\r\6=\6\15\0055\6\23\0005\a\16\0005\b\17\0=\b\18\a5\b\22\0005\t\20\0009\n\19\2=\n\21\t=\t\v\b=\b\r\a=\a\4\6=\6\3\5B\3\2\0019\3\24\0'\5\4\0B\3\2\1K\0\1\0\19load_extension\1\0\0\1\0\0\6a\1\0\0\vcreate\18layout_config\1\0\1\vheight\3(\1\0\5\22respect_gitignore\2\fgrouped\2\17initial_mode\vnormal\17hijack_netrw\2\vhidden\2\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6q\1\0\0\nclose\nsetup\factions\17file_browser\15extensions\22telescope.actions\14telescope\frequire\0" },
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/kunchenguid/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n;\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\20formatting_sync\bbuf\blsp\bvimÜ\1\0\2\4\0\6\0\r9\2\0\0\6\2\1\0X\2\6Ä9\2\0\0\6\2\2\0X\2\3Ä9\2\0\0\a\2\3\0X\2\3Ä9\2\4\0+\3\1\0=\3\5\2K\0\1\0\24document_formatting\26resolved_capabilities\16tailwindcss\veslint\rtsserver\tnameÓ\a\1\0\14\0009\0d6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0004\4\0\0B\1\3\0016\1\2\0009\1\3\0019\1\6\1'\3\a\0005\4\b\0003\5\t\0=\5\n\4B\1\3\0016\1\0\0'\3\v\0B\1\2\0023\2\f\0005\3\14\0=\3\r\0016\3\0\0'\5\15\0B\3\2\0029\3\16\0036\5\2\0009\5\17\0059\5\18\0059\5\19\5B\5\1\0A\3\0\0029\4\20\0009\4\21\0045\6\22\0=\2\23\6=\3\24\0065\a\28\0005\b\26\0005\t\25\0=\t\27\b=\b\29\a=\a\30\6B\4\2\0019\4\31\0009\4\21\0045\6 \0=\2\23\6=\3\24\6B\4\2\0019\4!\0009\4\21\0045\6\"\0=\2\23\6=\3\24\6B\4\2\0019\4#\0009\4\21\0045\6$\0=\2\23\6=\3\24\6B\4\2\0019\4%\0009\4\21\0045\6&\0=\2\23\6=\3\24\6B\4\2\0019\4'\0009\4\21\0045\6(\0=\2\23\6=\3\24\6B\4\2\0019\4)\0009\4\21\0045\6*\0=\2\23\0065\a7\0005\b,\0005\t+\0=\t-\b5\t/\0005\n.\0=\n0\t=\t1\b5\t4\0006\n\2\0009\n\3\n9\n2\n'\f3\0+\r\2\0B\n\3\2=\n5\t=\t6\b=\b8\a=\a\30\6B\4\2\1K\0\1\0\bLua\1\0\0\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\1\0\0\16sumneko_lua\1\0\0\16tailwindcss\1\0\0\rtsserver\1\0\0\veslint\1\0\0\vjsonls\1\0\0\thtml\rsettings\bcss\1\0\0\tlint\1\0\0\1\0\1\19unknownAtRules\vignore\17capabilities\14on_attach\1\0\0\nsetup\ncssls\29make_client_capabilities\rprotocol\blsp\24update_capabilities\17cmp_nvim_lsp\1\26\0\0\bÓòí\bÔûî\bÔûî\bÔûî\bÓûõ\bÓûõ\bÔÉ®\bÔ∞Æ\bÔ£ñ\bÓò§\bÔëµ\bÔ¢ü\bÔÉä\bÔ†ä\bÔ¨å\bÓà´\bÔÖõ\bÔöê\bÔÑï\bÔÖù\bÓà¨\bÔÉä\bÔÉß\bÔ¨¶\bÓòé\23CompletionItemKind\0\21vim.lsp.protocol\rcallback\0\1\0\1\ngroup\15formatting\16BufWritePre\24nvim_create_autocmd\15formatting\24nvim_create_augroup\bapi\bvim\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\nv\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\27automatic_installation\2\20mason-lspconfig\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\ny\0\1\4\0\4\0\0149\1\0\0'\3\1\0B\1\2\2\14\0\1\0X\2\bÄ9\1\0\0'\3\2\0B\1\2\2\14\0\1\0X\2\3Ä9\1\0\0'\3\3\0B\1\2\2L\1\2\0\21.prettierrc.json\19.prettierrc.js\16.prettierrc\18root_has_files\0\1\4\0\4\0\0149\1\0\0'\3\1\0B\1\2\2\14\0\1\0X\2\bÄ9\1\0\0'\3\2\0B\1\2\2\14\0\1\0X\2\3Ä9\1\0\0'\3\3\0B\1\2\2L\1\2\0\19.eslintrc.json\17.eslintrc.js\14.eslintrc\18root_has_fileì\2\1\0\t\0\15\1\0276\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\r\0004\4\3\0009\5\3\0009\5\4\0059\5\5\0059\5\6\0055\a\b\0003\b\a\0=\b\t\aB\5\2\2>\5\1\0049\5\3\0009\5\4\0059\5\n\0059\5\6\0055\a\f\0003\b\v\0=\b\t\aB\5\2\0?\5\0\0=\4\14\3B\1\2\1K\0\1\0\fsources\1\0\0\1\0\1\17prefer_local\22node_modules/.bin\0\veslint\14condition\1\0\1\17prefer_local\22node_modules/.bin\0\twith\rprettier\15formatting\rbuiltins\nsetup\fnull-ls\frequire\5ÄÄ¿ô\4\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\næ\5\0\0\a\0!\0;6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\v\0004\4\3\0005\5\b\0005\6\t\0=\6\n\5>\5\1\4=\4\f\0035\4\r\0005\5\14\0>\5\3\4=\4\15\0034\4\0\0=\4\16\0034\4\0\0=\4\17\0035\4\18\0=\4\19\0034\4\3\0005\5\20\0005\6\21\0=\6\n\5>\5\1\4=\4\22\3=\3\23\0025\3\25\0005\4\24\0=\4\f\0034\4\0\0=\4\15\0034\4\0\0=\4\16\0034\4\0\0=\4\17\0034\4\0\0=\4\19\0034\4\0\0=\4\22\3=\3\26\0025\3\31\0004\4\3\0005\5\27\0005\6\28\0=\6\n\0055\6\29\0=\6\30\5>\5\1\4=\4\f\3=\3 \2B\0\2\1K\0\1\0\ftabline\1\0\0\fsymbols\1\0\1\19alternate_file\5\1\0\2\tleft\bÓÇ∂\nright\bÓÇ¥\1\2\1\0\fbuffers\18right_padding\3\2\22inactive_sections\1\0\0\1\2\0\0\rfilename\rsections\14lualine_z\1\0\1\nright\bÓÇ¥\1\2\1\0\rlocation\17left_padding\3\2\14lualine_y\1\3\0\0\rfiletype\rprogress\14lualine_x\14lualine_c\14lualine_b\1\2\1\0\tdiff\fcolored\1\1\3\0\0\rfilename\vbranch\14lualine_a\1\0\0\14separator\1\0\1\tleft\bÓÇ∂\1\2\1\0\tmode\18right_padding\3\2\foptions\1\0\0\23section_separators\1\0\2\tleft\bÓÇ¥\nright\bÓÇ∂\1\0\2\25component_separators\6|\ntheme\15catppuccin\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\nì\1\0\0\3\0\t\0\0146\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0B\0\1\0016\0\0\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0\27colorscheme catppuccin\bcmd\nsetup\15catppuccin\frequire\vfrappe\23catppuccin_flavour\6g\bvim\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: markdown-preview.nvim
time([[Config for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\20mkdp_auto_start\6g\bvim\0", "config", "markdown-preview.nvim")
time([[Config for markdown-preview.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nç\3\0\0\v\0\25\0$6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0009\2\4\0029\2\5\0029\3\6\0005\5\14\0005\6\f\0005\a\n\0005\b\b\0009\t\a\1=\t\t\b=\b\v\a=\a\r\6=\6\15\0055\6\23\0005\a\16\0005\b\17\0=\b\18\a5\b\22\0005\t\20\0009\n\19\2=\n\21\t=\t\v\b=\b\r\a=\a\4\6=\6\3\5B\3\2\0019\3\24\0'\5\4\0B\3\2\1K\0\1\0\19load_extension\1\0\0\1\0\0\6a\1\0\0\vcreate\18layout_config\1\0\1\vheight\3(\1\0\5\22respect_gitignore\2\fgrouped\2\17initial_mode\vnormal\17hijack_netrw\2\vhidden\2\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6q\1\0\0\nclose\nsetup\factions\17file_browser\15extensions\22telescope.actions\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
