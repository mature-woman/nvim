-- A UI for nvim-dap
return { 
	'rcarriga/nvim-dap-ui', 
	enabled = true,
	lazy = true,
	dependencies = {
		-- Debug Adapter Protocol client implementation for Neovim 
		'mfussenegger/nvim-dap', 

		-- A library for asynchronous IO in Neovim
		'nvim-neotest/nvim-nio'
	},
	config = function()
		local dap, dapui = require('dap'), require('dapui')

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end
}
