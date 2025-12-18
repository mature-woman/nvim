-- 🚦 A pretty diagnostics, references, telescope results, 
-- quickfix and location list to help you solve 
-- all the trouble your code is causing
return { 
  'folke/trouble.nvim',
	enabled = true,
	lazy = false,
	cmd = 'Trouble',
	keys = {
		{ '<f3>', '<cmd>Trouble diagnostics toggle<cr>', mode = { 'n', 'i', 'v', 't' }, desc = 'Diagnostics (Trouble)', noremap = true, silent = true },
	},
	dependencies = {
		-- Nvim Treesitter configurations and abstraction layer 
		{ 'nvim-treesitter/nvim-treesitter' },
    
    -- Provides Nerd Font icons (glyphs) for use by neovim plugins
		{ 'nvim-tree/nvim-web-devicons' }
	},
  opts = {
		
  auto_close = true, -- auto close when there are no items
		auto_open = true,  -- auto open when there are items
		position = 'bottom',           -- position of the list can be: bottom, top, left, right
	 auto_preview = true, -- automatically open preview when on an item
  auto_refresh = true, -- auto refresh when open
  auto_jump = false, -- auto jump to the item when there's only one
  focus = false, -- Focus the window when opened
  restore = true, -- restores the last location in the list when opening
  follow = true, -- Follow the current item
  indent_guides = true, -- show indent guides
  max_items = 200, -- limit number of items that can be displayed per section
  multiline = true, -- render multi-line messages
  pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
  warn_no_results = true, -- show a warning when there are no results
  open_no_results = false, -- open the trouble window when there are no results
	-- use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
	},
	config = function()
-- Initializing Telescope
local telescope = require('telescope')
local telescope_actions = require('telescope.actions')
local telescope_open = require('trouble.sources.telescope').open

-- Use this to add more results without clearing the trouble list
local add_to_trouble = require('trouble.sources.telescope').add

telescope.setup({
  defaults = {
    mappings = {
      i = { ['<c-t>'] = telescope_open },
      n = { ['<c-t>'] = telescope_open },
    },
  },
})
end
}
