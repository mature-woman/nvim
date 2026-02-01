-- 🚦 A pretty diagnostics, references, telescope results,
-- quickfix and location list to help you solve
-- all the trouble your code is causing
return {
	'folke/trouble.nvim',
	enabled = true,
	lazy = false,
	cmd = 'Trouble',
	keys = {
		{ '<f3>', '<cmd>Trouble diagnostics toggle<cr>', mode = { 'n', 'i', 'v', 't' }, desc = 'Diagnostics (Trouble)', noremap = true, silent = true },
	},
	dependencies = {
		-- Nvim Treesitter configurations and abstraction layer
		{ 'nvim-treesitter/nvim-treesitter' },

		-- Provides Nerd Font icons (glyphs) for use by neovim plugins
		{ 'nvim-tree/nvim-web-devicons' }
	}
}
