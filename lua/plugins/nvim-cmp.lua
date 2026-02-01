-- A completion plugin for neovim coded in Lua.
return {
	'hrsh7th/nvim-cmp',
	enabled = true,
	lazy = true,
	dependencies = {
		-- nvim-cmp source for neovim builtin LSP client
		{ 'hrsh7th/cmp-nvim-lsp' },

		-- Git source for nvim-cmp
		{ 'petertriho/cmp-git' },
	},
	opts = function(_, opts)
		opts.sources = opts.sources or {}

		table.insert(opts.sources, {
			name = 'lazydev',
			group_index = 0, -- set group index to 0 to skip loading LuaLS completions
		})

		table.insert(opts.sources, {
			name = 'nvim_lsp'
		})

		table.insert(opts.sources, {
			name = 'git'
		})
	end,
}
