-- Fast as FUCK nvim completion
return {
  'ms-jpq/coq_nvim', 
	enabled = true,
  lazy = false,
	branch = 'coq',
  dependencies = {
		-- Quickstart configs for Nvim LSP
    { 'neovim/nvim-lspconfig' },

    -- 9000+ Snippets
    { 'ms-jpq/coq.artifacts', branch = 'artifacts' },

    -- Lua & third party sources. Need to **configure separately**
    { 'ms-jpq/coq.thirdparty', branch = '3p' }
  },
  config = function()
    vim.g.coq_settings = {
      auto_start = 'shut-up',
    }
  end,
}

-- 
--[[ {
  'neovim/nvim-lspconfig', 
  lazy = false,
  dependencies = {
		-- Fast as FUCK nvim completion
    { 'ms-jpq/coq_nvim', branch = 'coq' },

    -- 9000+ Snippets
    { 'ms-jpq/coq.artifacts', branch = 'artifacts' },

    -- Lua & third party sources. Need to **configure separately**
    { 'ms-jpq/coq.thirdparty', branch = '3p' }
  },

  init = function()
    vim.g.coq_settings = {
        auto_start = 'shut-up',
        -- Your COQ settings here
    }
  end,

  config = function()
    -- Your LSP settings here
  end,
} ]]
