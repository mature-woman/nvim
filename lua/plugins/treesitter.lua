-- Nvim Treesitter configurations and abstraction layer
return {
	'nvim-treesitter/nvim-treesitter',
	enabled = true,
	lazy = false,
	priority = 40,
	build = ':TSUpdate',
	opts = {
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true
		}
	}
}
