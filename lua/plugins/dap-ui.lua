-- An UI for nvim-dap
return {
	'rcarriga/nvim-dap-ui',
	enabled = true,
	lazy = true,
	keys = {
		{ '<f5>',      function() require('dap').continue() end,          mode = { 'n' }, desc = 'DAP continue',          noremap = true, silent = true },
		{ '<f10>',     function() require('dap').step_over() end,         mode = { 'n' }, desc = 'DAP step over',         noremap = true, silent = true },
		{ '<f11>',     function() require('dap').step_into() end,         mode = { 'n' }, desc = 'DAP step into',         noremap = true, silent = true },
		{ '<f12>',     function() require('dap').step_out() end,          mode = { 'n' }, desc = 'DAP step out',          noremap = true, silent = true },
		{ '<leader>b', function() require('dap').toggle_breakpoint() end, mode = { 'n' }, desc = 'DAP toggle breakpoint', noremap = true, silent = true },
		-- { '<leader>B', function() require('dap').set_breakpoint() end, mode = { 'n' }, desc = 'DAP set breakpoint', noremap = true, silent = true },
		{
			'<leader>lp',
			function()
				require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
			end,
			mode = { 'n' },
			desc = 'DAP log point message',
			noremap = true,
			silent = true
		},
		{ '<leader>dr', function() require('dap').repl.open() end,          mode = { 'n' },      desc = 'DAP repl open',       noremap = true, silent = true },
		{ '<leader>dl', function() require('dap').run_last() end,           mode = { 'n' },      desc = 'DAP run last',        noremap = true, silent = true },
		{ '<leader>dh', function() require('dap.ui.widgets').hover() end,   mode = { 'n', 'v' }, desc = 'DAP widgets hover',   noremap = true, silent = true },
		{ '<leader>dp', function() require('dap.ui.widgets').preview() end, mode = { 'n', 'v' }, desc = 'DAP widgets preview', noremap = true, silent = true },
		{
			'<leader>df',
			function()
				local widgets = require('dap.ui.widgets'); widgets.centered_float(widgets.frames)
			end,
			mode = { 'n', 'v' },
			desc = 'DAP centered float (frames)',
			noremap = true,
			silent = true
		},
		{
			'<leader>ds',
			function()
				local widgets = require('dap.ui.widgets'); widgets.centered_float(widgets.scopesframes)
			end,
			mode = { 'n', 'v' },
			desc = 'DAP centered float (scopes)',
			noremap = true,
			silent = true
		},
	},
	dependencies = {
		-- Debug Adapter Protocol client implementation for Neovim
		{ 'mfussenegger/nvim-dap' },

		-- A library for asynchronous IO in Neovim
		{ 'nvim-neotest/nvim-nio' }
	},
	config = function()
		local dap, dapui = require('dap'), require('dapui')
		dapui.setup()

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
