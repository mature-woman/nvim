-- 🚦 A pretty diagnostics, references, telescope results, 
-- quickfix and location list to help you solve 
-- all the trouble your code is causing
return { 
  'folke/trouble.nvim',
	enabled = true,
	lazy = true,
	cmd = 'Trouble',
	keys = {
		{ '<f3>', '<cmd>Trouble diagnostics toggle<cr>', mode = { 'n', 'i', 'v', 't' }, desc = 'Diagnostics (Trouble)', noremap = true, silent = true },
	},
  opts = {},
	config = function() end
}
