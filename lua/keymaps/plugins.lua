-- Formatting
vim.keymap.set({ 'n', 'v', 't' }, 'F', function()
		if (vim.bo.filetype == 'nginx') then
			-- NGINX configuration file

			vim.api.nvim_exec('w', false)
			vim.api.nvim_exec('! nginxbeautifier -i %', false)
			vim.api.nvim_exec('redraw', false)
		elseif (not (vim.diff(vim.inspect(vim.lsp.get_clients()), '{}') == '')) then
			-- LSP-server clients is ready

			vim.lsp.buf.format { async = true }
		else
			-- LSP-server clients not found

			vim.api.nvim_exec('PrettierAsync', false)
		end
	end,
	{ noremap = true, silent = true, buffer = bufnr }
)

--[[ lewis6991/gitsigns.nvim ]]
-- Инициализация только после того, как LSP-сервер подключится к текущему буферу
-- gitsigns_on_attach = function(bufnr)
-- 	-- Инициализация ярлыка
-- 	local gs = package.loaded.gitsigns
--
-- 	-- Навигация
-- 	vim.keymap.set('n', ']c', function()
-- 		if vim.wo.diff then return ']c' end
-- 		vim.schedule(function() gs.next_hunk() end)
-- 		return '<Ignore>'
-- 	end, { expr = true, buffer = bufnr })
--
-- 	-- Навигация
-- 	vim.keymap.set('n', '[c', function()
-- 		if vim.wo.diff then return '[c' end
-- 		vim.schedule(function() gs.prev_hunk() end)
-- 		return '<Ignore>'
-- 	end, { expr = true, buffer = bufnr })
--
-- 	vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<cr>', { buffer = bufnr })
-- 	vim.keymap.set('v', '<leader>hs', '<cmd>Gitsigns stage_hunk<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>', { buffer = bufnr })
-- 	vim.keymap.set('v', '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { buffer = bufnr })
-- 	vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { buffer = bufnr })
-- 	vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { buffer = bufnr })
-- 	vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr })
-- 	vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end, { buffer = bufnr })
-- 	vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { buffer = bufnr })
-- 	vim.keymap.set('n', '<leader>hd', gs.diffthis, { buffer = bufnr })
-- 	vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, { buffer = bufnr })
-- 	vim.keymap.set('n', '<leader>td', gs.toggle_deleted, { buffer = bufnr })
--
-- 	vim.keymap.set('o', 'ih', '<cmd><c-U>Gitsigns select_hunk<cr>', { buffer = bufnr })
-- 	vim.keymap.set('x', 'ih', '<cmd><c-U>Gitsigns select_hunk<cr>', { buffer = bufnr })
-- end
