-- A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua
return {
	'akinsho/bufferline.nvim', 
	enabled = true,
	lazy = true,
	event = 'BufReadPre',
	keys = {
		{ '<tab>', '<cmd>BufferLineCycleNext<cr>', mode = { 'n' }, desc = 'Move to the next tab', noremap = true, silent = true },
		{ '<s-tab>', '<cmd>BufferLineCyclePrev<cr>', mode = { 'n' }, desc = 'Move to the previous tab', noremap = true, silent = true },
		{ '<c-tab>', '<cmd>lua require("bufferline").go_to(vim.fn.input("Enter tab number: "), true)<cr>', mode = { 'n' }, desc = 'Move to the tab', noremap = true, silent = true },
	},
	version = '*', 
	dependencies = {
		--
		{ 'nvim-tree/nvim-web-devicons' }
	},
  opts = {
    options = {
			themable = true,
    numbers = 'ordinal',
    -- close_command = 'bdelete! %d',
    -- right_mouse_command = 'bdelete! %d',
    -- left_mouse_command = 'buffer %d',
    -- middle_mouse_command = nil,
    indicator = {
      icon = '▎',
			style = 'icon',
    },
    max_name_length = 24,
    max_prefix_length = 18,
		truncate_names = true,
    tab_size = 18,
    diagnostics = 'nvim_lsp',
    offsets = {
			{
				filetype = 'NvimTree',
        text = 'File Explorer',
        text_align = 'left',
        separator = true
      }
    },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
		show_duplicate_prefix = true,
    duplicates_across_groups = true,
    persist_buffer_sort = true,
    move_wraps_at_ends = false,
    -- separator_style = 'slant' | 'slope' | 'thick' | 'thin' | { 'any', 'any' },
    separator_style = 'default',
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    auto_toggle_bufferline = true,
    hover = {
			enabled = true,
			delay = 200,
      reveal = {'close'}
    },
    --[[ sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        local modified_a = vim.fn.getftime(buffer_a.path)
        local modified_b = vim.fn.getftime(buffer_b.path)
        return modified_a > modified_b
			end, ]]
    sort_by = 'insert_after_current',
    pick = {
			alphabet = 'abcdefghijklmopqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ1234567890',
    }
	}
  }
}
