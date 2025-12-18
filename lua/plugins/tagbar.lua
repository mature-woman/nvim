-- Vim plugin that displays tags in a window, ordered by scope
return {
	'preservim/tagbar',
	enabled = true,
	lazy = true,
	keys = {
		{ '<f2>', '<cmd>TagbarToggle<cr>', mode = { 'n', 'i', 'v', 't' }, desc = 'Tagbar toggle', noremap = true, silent = true },
	},
	dependencies = {
		-- An enhanced ctags compatible index generator written in pure PHP
		{ 'vim-php/phpctags' },

		-- jsctags generator using tern
		{ 'sergioramos/jsctags' }
	}
}
