-- Debug Adapter Protocol client implementation for Neovim
return {
	'mfussenegger/nvim-dap',
	enabled = true,
	lazy = true,
	dependencies = {
		-- An UI for nvim-dap
		{ 'rcarriga/nvim-dap-ui' },

		-- A library for asynchronous IO in Neovim
		{ 'nvim-neotest/nvim-nio' },

		-- Virtual text support to nvim-dap
		{ 'theHamsta/nvim-dap-virtual-text' }
	},
	config = function()
		local dap = require('dap')
		require('telescope').load_extension('dap')

		-- Installing debuggers for C, Rust and C++
		dap.configurations.cpp = {}

		-- Initializing PHP debugger adapter
		dap.adapters.php = {
			type = 'executable',
			command = 'node',
			args = { os.getenv('HOME') .. '/vscode-php-debug/out/phpDebug.js' }
		}

		-- Installing PHP debugger
		dap.configurations.php = {
			{
				type = 'php',
				request = 'launch',
				name = 'Listen for Xdebug',
				port = 9003
			}
		}
	end
}
