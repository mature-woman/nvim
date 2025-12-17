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
		opts = {
			icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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
    lualine_a = {
			'mode',
        icons_enabled = true,
        icon = nil,
        separator = nil,
        cond = nil,
        color = nil,
        --type = var(g:coc_status/bo:modifiable),
        padding = 1,
        fmt = nil,
        on_click = nil,
		},
    lualine_b = {
			'branch', 
			'diff', 
			{
        'diagnostics',
        sources = { 'coc' },
        sections = { 'error', 'warn', 'info', 'hint' },
        diagnostics_color = {
          error = 'DiagnosticError',
          warn  = 'DiagnosticWarn',
          info  = 'DiagnosticInfo',
          hint  = 'DiagnosticHint',
        },
        symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
        colored = true,
        update_in_insert = false,
        always_visible = false
      }
		},
    lualine_c = {'filename', 'lsp_progress'},
    lualine_x = { FugitiveStatusline, 'encoding', 'fileformat', 'filetype'},
    -- lualine_x = { FugitiveHead, 'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
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
		'neo-tree'}
}
