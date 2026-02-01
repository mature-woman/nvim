-- Offset
vim.keymap.set({ 'i' }, '<tab>', '<cmd>><cr>', { noremap = true, silent = true })
vim.keymap.set({ 'i' }, '<s-tab>', '<cmd><<cr>', { noremap = true, silent = true })
vim.keymap.set({ 'v', 't' }, '<tab>', '>', { noremap = true, silent = true })
vim.keymap.set({ 'v', 't' }, '<s-tab>', '<', { noremap = true, silent = true })

-- Disabling arrows
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<left>', '', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<up>', '', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<right>', '', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<down>', '', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<s-left>', '', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<s-up>', '', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<s-right>', '', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<s-down>', '', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<c-left>', '', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<c-up>', '', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<c-right>', '', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<c-down>', '', { noremap = true, silent = true })
