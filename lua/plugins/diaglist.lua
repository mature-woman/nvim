-- Live render workspace diagnostics in quickfix with 
-- current buf errors on top, buffer diagnostics in loclist
return {
	'onsails/diaglist.nvim',
	enabled = true,
	lazy = true,
	opts = {
		debug = false,
		debounce_ms = 150
	}
}
