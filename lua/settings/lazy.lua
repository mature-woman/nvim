-- Bootstrap lazy.nvim
local path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(path) then
	local repository = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', repository, path })

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
			{ out,                            'WarningMsg' },
			{ '\nPress any key to exit...' },
		}, true, {})

		vim.fn.getchar()

		os.exit(1)
	end
end

vim.opt.rtp:prepend(path)

-- Setup lazy.nvim
require('lazy').setup({
	-- Import plugins
	spec = {
		{ import = 'plugins' },
	},

	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	--  install = {
	-- 	colorscheme = { 'flexoki' }
	-- },

	-- Automatically check for plugin updates
	checker = {
		enabled = true
	},
})
