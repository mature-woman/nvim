-- Git source for nvim-cmp
return {
	'petertriho/cmp-git',
	enabled = true,
	lazy = true,
	dependencies = {
		-- A completion plugin for neovim coded in Lua.
		{ 'hrsh7th/nvim-cmp' }
	},
	opts = {
	},
	init = function()
		table.insert(require('cmp').get_config().sources, { name = 'git' })
	end
}
