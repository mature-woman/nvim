-- Find, Filter, Preview, Pick. All lua, all the time
-- Gaze deeply into unknown regions using the power of the moon
return {
	'nvim-telescope/telescope.nvim',
	enabled = true,
	lazy = true,
	tag = 'v0.2.0',
	dependencies = {
		-- Functions for Telescope
		{ 'nvim-lua/plenary.nvim' },

		-- Integration for nvim-dap with telescope.nvim 
		{ 'nvim-telescope/telescope-dap.nvim' }
	},
	opts = {
		exteinsiions = {
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
