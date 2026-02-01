-- Find, Filter, Preview, Pick. All lua, all the time
-- Gaze deeply into unknown regions using the power of the moon
return {
	'nvim-telescope/telescope.nvim',
	enabled = true,
	lazy = true,
	keys = {
		{ '<c-f>',         '<cmd>Telescope find_files<cr>', mode = { 'n', 'i', 'v', 't' }, desc = 'Search files',   noremap = true, silent = true },
		{ '<c-g>',         '<cmd>Telescope live_grep<cr>',  mode = { 'n', 'i', 'v', 't' }, desc = 'Grep files',     noremap = true, silent = true },
		{ '<leader><tab>', '<cmd>Telescope buffers<cr>',    mode = { 'n', 'v', 't' },      desc = 'Search buffers', noremap = true, silent = true },
		{ '<leader>?',     '<cmd>Telescope help_tags<cr>',  mode = { 'n', 'v', 't' },      desc = 'Help',           noremap = true, silent = true },
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
