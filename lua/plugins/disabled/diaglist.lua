-- Live render workspace diagnostics in quickfix with
-- current buf errors on top, buffer diagnostics in loclist
-- @todo удалить и заменить на трабл
return {
	'onsails/diaglist.nvim',
	enabled = false,
	lazy = true,
	keys = {
		{ '<f3>', '<cmd>lua require(\'diaglist\').open_all_diagnostics()<cr>', mode = { 'n', 'i', 'v', 't' }, desc = 'Open all diagnostics (diaglist)', noremap = true, silent = true },
	},
	opts = {
		debug = false,
		debounce_ms = 150
	}
}
