-- Quick compilation with GCC and running
vim.keymap.set('n', '<leader>c', '<cmd>!gcc -o test % && ./test<cr>', { noremap = true })
