-- Neovim commenting plugin, written in lua
return {
	'b3nj5m1n/kommentary',
	enabled = true,
	lazy = true,
	keys = {
		{ 'gcc', '<Plug>kommentary_line_default', mode = 'n', desc = 'Comment', noremap = true, silent = true },
		{ 'gc', '<Plug>kommentary_motion_default', mode = 'n', desc = 'Comment', noremap = true, silent = true },
		{ 'gc', '<Plug>kommentary_visual_default<C-c>', mode = 'v', desc = 'Comment', noremap = true, silent = true },
	},
	config = function()
		vim.g.kommentary_create_default_mappings = false
	end
}
