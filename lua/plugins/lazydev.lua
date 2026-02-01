-- Faster LuaLS setup for Neovim
return {
	'folke/lazydev.nvim',
	enabled = true,
	lazy = false,
	ft = 'lua',
	opts = {
		library = {
			-- Load luvit types when the `vim.uv` word is found
			{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
		},
	}
}
