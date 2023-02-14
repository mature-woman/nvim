-- Использовать системный буфер обмена
vim.opt.clipboard = 'unnamedplus'

-- Автодополнение (встроенное в Neovim)
--vim.opt.completeopt = 'menuone,noselect'

-- Не автокомментировать новые линии при переходе на новую строку
vim.cmd('autocmd BufEnter * set fo-=c fo-=r fo-=o')

-- Нумерация строк
vim.opt.number = true

-- Интервал обновлений отрисовки
vim.opt.updatetime = 100

-- Всегда отображать signcolumn (?)
vim.opt.signcolumn = 'yes'

-- 24-битные цвета
vim.opt.termguicolors = true

-- Отключение переноса строк
vim.opt_local.wrap = false

-- Отображение колонки курсора
vim.opt_local.cursorcolumn = true

-- Выбор цветовой темы
vim.cmd.colorscheme('default')

-- Добавление ru_RU (переключать через <c-^>)
vim.opt.keymap = 'russian-jcukenwin'

-- Переключать раскладку на en_US при поиске и вставке
vim.opt.iminsert = 0
vim.opt.imsearch = 0

-- Поддержка буквы "ё"
vim.opt_local.spell = true
vim.opt_local.spelllang = 'ru_yo,en_us'
