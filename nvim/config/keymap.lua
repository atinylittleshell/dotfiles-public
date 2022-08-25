vim.g.mapleader = " "

-- telescope
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local fb_actions = telescope.extensions.file_browser.actions

local function telescope_buffer_dir()
	return vim.fn.expand('%:p:h')
end

vim.keymap.set('n', '<leader>f',
	function()
		builtin.find_files({
			no_ignore = false,
			hidden = true
		})
	end)
vim.keymap.set('n', '<leader>r', function()
	builtin.live_grep()
end)
vim.keymap.set("n", "<leader>e", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir()
	})
end)
