-- An asynchronous linter plugin for Neovim complementary
-- to the built-in Language Server Protocol support.
return {
	'mfussenegger/nvim-lint',
	enabled = true,
	lazy = true,
	config = function()
		vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
			callback = function()
				require('lint').try_lint()
			end
		})
	end
}
