-- Provides Nerd Font icons (glyphs) for use by neovim plugins
return {
	'nvim-tree/nvim-web-devicons',
	enabled = true,
	lazy = false,
	priority = 110,
	opts = {
		color_icons = true,
		default = true,
		strict = true
	}
}
