-- stylua: ignore
local colors = {
	blue   = '#80a0ff',
	cyan   = '#79dac8',
	black  = '#080808',
	white  = '#c6c6c6',
	red    = '#ff5189',
	violet = '#d183e8',
	grey   = '#303030',
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white },
	},
}

-- A blazing fast and easy to configure
-- neovim statusline plugin written in pure lua
-- @todo навести порядок
return {
	'nvim-lualine/lualine.nvim',
	enabled = true,
	lazy = false,
	priority = 80,
	dependencies = {
		-- Provides Nerd Font icons (glyphs) for use by neovim plugins
		{ 'nvim-tree/nvim-web-devicons' },

		-- LSP Progress lualine componenet
		{ 'arkav/lualine-lsp-progress' },

		-- A Git wrapper so awesome, it should be illegal
		{ 'tpope/vim-fugitive' }
	},
	config = function()
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'auto',
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
					events = {
						'WinEnter',
						'BufEnter',
						'BufWritePost',
						'SessionLoadPost',
						'FileChangedShellPost',
						'VimResized',
						'Filetype',
						'CursorMoved',
						'CursorMovedI',
						'ModeChanged',
					},
				}
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff' },
				lualine_c = { 'filename', 'lsp_progress' },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				-- lualine_x = { FugitiveStatusline, 'encoding', 'fileformat', 'filetype'},
				-- lualine_x = { FugitiveHead, 'encoding', 'fileformat', 'filetype'},
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {
				'lazy',
				'nvim-dap-ui',
				'trouble',
				'neo-tree'
			}
		}
		--[[ config = function()
 	local trouble = require("trouble")
 	local symbols = trouble.statusline({
      mode = "lsp_document_symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
      -- The following line is needed to fix the background color
      -- Set it to the lualine section you want to use
      hl_group = "lualine_c_normal",
    })
    table.insert(opts.sections.lualine_c, {
      symbols.get,
      cond = symbols.has,
    })
 end ]]
	end
}
