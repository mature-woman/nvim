--[[ nvim-neo-tree/neo-tree ]]
-- Открыть интерфейс с древовидным отображением файлов
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<f1>', '<cmd>Neotree toggle<cr>', { noremap = true })


-- [[ folke/trouble.nvim ]]
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<f2>', '<cmd>Trouble diagnostics toggle focus=false filter.buf=0<cr>', { noremap = true })


--[[ onsails/diaglist.nvim ]]
-- Открыть интерфейс диагностики
vim.keymap.set('n', '<space>dw', '<cmd>lua require(\'diaglist\').open_all_diagnostics()<cr>', { noremap = true })
vim.keymap.set('n', '<space>d0', '<cmd>lua require(\'diaglist\').open_buffer_diagnostics()<cr>', { noremap = true })


--[[ noib3/nvim-cokeline ]]
-- Переключение вкладок
vim.keymap.set('n', '<tab>', '<plug>(cokeline-focus-next)', { noremap = true, silent = true })
vim.keymap.set('n', '<s-tab>', '<Plug>(cokeline-focus-prev)', { noremap = true, silent = true })


--[[ neovim/nvim-lspconfig ]]
-- Диагностика
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { noremap = true, silent = true })

-- Инициализация только после того, как LSP-сервер подключится к текущему буферу
lspconfig_on_attach = function(client, bufnr)
	-- Активация завершения
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	-- vim.keymap.set({ 'n', 'v', 't' }, 'F', function() vim.lsp.buf.format { async = true } end, { noremap = true, silent = true, buffer = bufnr })

	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true, silent = true, buffer = bufnr })
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true, buffer = bufnr })
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true, buffer = bufnr })
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true, silent = true, buffer = bufnr })
	vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, { noremap = true, silent = true, buffer = bufnr })
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { noremap = true, silent = true, buffer = bufnr })
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { noremap = true, silent = true, buffer = bufnr })
	vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
		{ noremap = true, silent = true, buffer = bufnr })
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { noremap = true, silent = true, buffer = bufnr })
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { noremap = true, silent = true, buffer = bufnr })
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { noremap = true, silent = true, buffer = bufnr })
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true, buffer = bufnr })
end

-- Formatting
vim.keymap.set({ 'n', 'v', 't' }, 'F', function()
		if (vim.bo.filetype == 'nginx') then
			-- NGINX configuration file

			vim.api.nvim_exec('w', false)
			vim.api.nvim_exec('! nginxbeautifier -i %', false)
			vim.api.nvim_exec('redraw', false)
		elseif (not (vim.diff(vim.inspect(vim.lsp.buf_get_clients()), '{}') == '')) then
			-- LSP-server clients is ready

			vim.lsp.buf.format { async = true }
		else
			-- LSP-server clients not found

			vim.api.nvim_exec('PrettierAsync', false)
		end
	end,
	{ noremap = true, silent = true, buffer = bufnr })

--[[ lewis6991/gitsigns.nvim ]]
-- Инициализация только после того, как LSP-сервер подключится к текущему буферу
gitsigns_on_attach = function(bufnr)
	-- Инициализация ярлыка
	local gs = package.loaded.gitsigns

	-- Навигация
	vim.keymap.set('n', ']c', function()
		if vim.wo.diff then return ']c' end
		vim.schedule(function() gs.next_hunk() end)
		return '<Ignore>'
	end, { expr = true, buffer = bufnr })

	-- Навигация
	vim.keymap.set('n', '[c', function()
		if vim.wo.diff then return '[c' end
		vim.schedule(function() gs.prev_hunk() end)
		return '<Ignore>'
	end, { expr = true, buffer = bufnr })

	vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<cr>', { buffer = bufnr })
	vim.keymap.set('v', '<leader>hs', '<cmd>Gitsigns stage_hunk<cr>', { buffer = bufnr })
	vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>', { buffer = bufnr })
	vim.keymap.set('v', '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>', { buffer = bufnr })
	vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { buffer = bufnr })
	vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { buffer = bufnr })
	vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { buffer = bufnr })
	vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr })
	vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end, { buffer = bufnr })
	vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { buffer = bufnr })
	vim.keymap.set('n', '<leader>hd', gs.diffthis, { buffer = bufnr })
	vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, { buffer = bufnr })
	vim.keymap.set('n', '<leader>td', gs.toggle_deleted, { buffer = bufnr })

	vim.keymap.set('o', 'ih', '<cmd><c-U>Gitsigns select_hunk<cr>', { buffer = bufnr })
	vim.keymap.set('x', 'ih', '<cmd><c-U>Gitsigns select_hunk<cr>', { buffer = bufnr })
end


--[[ nvim-telescope/telescope.nvim ]]
-- Инициализация ярлыка
local builtin = require('telescope.builtin')

-- Поиск файла
vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true })

-- grep
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true })

-- Буферы?
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true })

-- Помощь
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true })


--[[ mfussenegger/nvim-dap ]]
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)


--[[ windwp/nvim-autopairs ]]
-- Переназначение стандартных сочетаний клавиш для "ms-jpq/coq_nvim"
--vim.keymap.set('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], {expr = true, noremap = true})
--vim.keymap.set('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], {expr = true, noremap = true})
--vim.keymap.set('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], {expr = true, noremap = true})
--vim.keymap.set('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<tab>"]], {expr = true, noremap = true})

_G.PairIT = function()
	local autopairs = {
		['('] = ')',
		['['] = ']',
		['{'] = '}',
		['<'] = '>',
		[ [=[']=] ] = [=[']=],
		[ [=["]=] ] = [=["]=],
	}
	local set_pairs = vim.keymap.set
	for k, v in pairs(autopairs) do
		set_pairs('i', k, function()
			return k .. v .. '<Left>'
		end, { expr = true, noremap = true })
	end
end


--[[ b3nj5m1n/kommentary ]]
vim.keymap.set('n', '<leader>cic', '<Plug>kommentary_line_increase', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ci', '<Plug>kommentary_motion_increase', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>ci', '<Plug>kommentary_visual_increase', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cdc', '<Plug>kommentary_line_decrease', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cd', '<Plug>kommentary_motion_decrease', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>cd', '<Plug>kommentary_visual_decrease', { noremap = true, silent = true })


--[[ preservim/tagbar ]]
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<f8>', '<cmd>TagbarToggle<cr>', { noremap = true, silent = true })


--[[ simrat39/symbols-outline.nvim ]]
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<f7>', '<cmd>SymbolsOutline<cr>', { noremap = true, silent = true })
