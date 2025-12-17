-- Vim plugin that displays tags in a window, ordered by scope
return {
	'preservim/tagbar',
	enabled = true,
	lazy = false,
	priority = 40,
	dependencies = {
		-- An enhanced ctags compatible index generator written in pure PHP
		{ 'vim-php/phpctags' },

		-- jsctags generator using tern
		{ 'sergioramos/jsctags' }
	}
}
