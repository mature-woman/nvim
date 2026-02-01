vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
	group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
	callback = function()
		-- Folding code method
		-- vim.opt.foldmethod = 'expr'

		-- Expression for folding code
		-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
	end
})
