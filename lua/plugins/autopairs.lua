-- A super powerful autopair plugin for Neovim that supports multiple characters
return {
	'windwp/nvim-autopairs',
	enabled = true,
	lazy = true,
	event = 'InsertEnter',
	opts = {
		-- map_bs = false, 
		-- map_cr = false 
	},
  config = true
}
