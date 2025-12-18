-- Find, Filter, Preview, Pick. All lua, all the time
-- Gaze deeply into unknown regions using the power of the moon
return {
	'nvim-telescope/telescope.nvim',
	enabled = true,
	lazy = true,
	keys = {
		{ '<c-f>', '<cmd>Telescope find_files', mode = { 'n', 'i', 'v', 't' }, desc = 'Telescope find', noremap = true, silent = true },
		{ '<c-F>', '<cmd>Telescope live_grep', mode = { 'n', 'i', 'v', 't' }, desc = 'Telescope grep', noremap = true, silent = true },
		{ '<leader><s-tab>', '<cmd>Telescope buffers', mode = { 'n', 'i', 'v', 't' }, desc = 'Telescope buffers', noremap = true, silent = true },
		{ '<leader>?', '<cmd>Telescope help_tags', mode = { 'n', 'i', 'v', 't' }, desc = 'Telescope help', noremap = true, silent = true },
	},
	dependencies = {
		-- Functions for Telescope
		{ 'nvim-lua/plenary.nvim' },

		-- Integration for nvim-dap with telescope.nvim 
		{ 'nvim-telescope/telescope-dap.nvim' }
	},
	opts = {
		exteinsions = {
			dap = {}
		}
	},
	config = function()
		-- Initializing telescope
		local telescope = require('telescope')

		-- Loading extensions
		telescope.load_extension('dap')
	end
}
