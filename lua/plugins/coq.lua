-- Fast as FUCK nvim completion
return {
  'ms-jpq/coq_nvim', 
	enabled = true,
  lazy = false,
	priority = 30,
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
