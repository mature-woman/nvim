-- Initializing
local telescope = require('telescope');

-- Installing
telescope.setup {
  pickers = {
    -- Default configuration for builtin picikers goes here:
    -- picker_name = {
    --   picker_configi_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },

  exteinsiions = {
    -- Your extensioni configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
		dap = {}
  }
}

-- Loading extensions
telescope.load_extension('dap')
