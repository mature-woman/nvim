-- Quickstart configs for Nvim LSP
return {
  'neovim/nvim-lspconfig',
	enabled = true,
  lazy = false,
	priority = 70,
  dependencies = {
		-- 🌈 Plugin that creates missing LSP diagnostics 
		-- highlight groups for color schemes that do not 
		-- yet support the Neovim 0.5 builtin LSP client
    { 'folke/lsp-colors.nvim' },

    -- 9000+ Snippets
    { 'ms-jpq/coq.artifacts', branch = 'artifacts' },

    -- Lua & third party sources. Need to **configure separately**
    { 'ms-jpq/coq.thirdparty', branch = '3p' }
  },
  config = function()
    -- @todo навести порядок

-- Активация вещания готовых набросков
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Инициализация 'ms-jpq/coq_nvim'
local coq = require('coq')

-- Инициализация LSP-серверов

-- Инициализация 'bmewburn/vscode-intelephense' (LSP-сервер для PHP)
vim.lsp.config(
	'intelephense',
	{
		on_attach = lspconfig_on_attach,
		coq.lsp_ensure_capabilities(),
		capabilities = capabilities
	}
)
vim.lsp.enable('intelephense')

-- Инициализация 'hrsh7th/vscode-html-language-server' (LSP-сервер для HTML)
vim.lsp.config(
	'html',
	{
  init_options = {
    configurationSection = { 'html' },
    embeddedLanguages = {
      css = false,
      javascript = false
    },
    provideFormatter = true,
  },
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
}
)
vim.lsp.enable('html')

-- Инициализация 'aca/emmet-ls' (LSP-сервер для HTML)
vim.lsp.config(
	'emmet_ls',
	{
  init_options = {
    html = {
      options = {
        ['bem.enabled'] = true,
      },
    },
  },
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})
vim.lsp.enable('emmet_ls')

-- Инициализация 'hrsh7th/vscode-langservers-extracted' (LSP-сервер для CSS)
vim.lsp.config(
	'cssls',
	{
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  },
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})
vim.lsp.enable('cssls')

-- Инициализация 'antonk52/cssmodules-language-server' (LSP-сервер для JS, вспомогательный для CSS)
vim.lsp.config(
	'cssmodules_ls',
	{
  init_options = {
    camelCase = false,
  },
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})
vim.lsp.enable('cssmodules_ls')

-- Инициализация 'denoland/deno' (LSP-сервер для JavaScript и PostScript)
vim.lsp.config(
	'denols',
	{
  init_options = {
    enable = true,
    unstable = false
  },
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})
vim.lsp.enable('denols')

-- Инициализация 'hrsh7th/vscode-langservers-extracted' (LSP-сервер для JSON)
vim.lsp.config(
	'jsonls',
	{
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities
})
vim.lsp.enable('jsonls')

-- Инициализация 'luals/lua-language-server' (LSP-сервер для Lua)
--[[ vim.lsp.config.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = lspconfig_on_attach,
  coq.lsp_ensure_capabilities(),
  capabilities = capabilities 
})]]
  end,
}
