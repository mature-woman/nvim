-- 💥 Create key bindings that stick. WhichKey helps you remember your Neovim keymaps,
-- by showing available keybindings in a popup as you type.
return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	opts = {
		preset = 'helix',
		triggers = {
			{ '<auto>', mode = { 'n', 'i', 'v', 't' } },
		}
	},
	keys = {
		-- { '<leader><leader>', function() require('which-key').show({ global = false }) end, mode = { 'n' }, desc = 'Buffer Local Keymaps (which-key)', noremap = true, silent = true },
	},
}
