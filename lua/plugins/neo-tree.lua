-- Neovim plugin to manage the file system
-- and other tree like structures
return {
	'nvim-neo-tree/neo-tree.nvim',
	enabled = true,
	lazy = false,
	priority = 60,
  branch = 'v3.x', 
  dependencies = {
    -- Lua functions
		{ 'nvim-lua/plenary.nvim' },
    
    -- Provides Nerd Font icons (glyphs) for use by neovim plugins
		{ 'nvim-tree/nvim-web-devicons' }, 
    
    -- UI Component Library for Neovim
		{ 'MunifTanjim/nui.nvim' },
  },
	opts = {
		close_if_last_window = true,
		clipboard = {
			sync = "global"
		},
		enable_git_status = true,
		enable_diagnostics = true
	}
}
