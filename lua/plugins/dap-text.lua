-- Virtual text support to nvim-dap
return {
	'theHamsta/nvim-dap-virtual-text',
	enabled = true,
	lazy = true,
	dependencies = {
		-- Debug Adapter Protocol client implementation for Neovim 
		{ 'mfussenegger/nvim-dap' },

		-- Nvim Treesitter configurations and abstraction layer 
		{ 'nvim-treesitter/nvim-treesitter' }
	}
}
