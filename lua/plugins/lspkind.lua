-- VSCode–style pictograms for Neovim completion items 
return {
	'onsails/lspkind-nvim',
	enabled = true,
	lazy = true,
	opts = {
    mode = 'symbol',
    preset = 'default',
	}
}
