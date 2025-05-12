-- Инициализация
vim.cmd('packadd packer.nvim')

return require('packer').startup(function(use)
	-- Менеджер плагинов Packer (автообновление)
	use 'wbthomason/packer.nvim'

	-- Flexoki colorscheme
	use {
		'nuvic/flexoki-nvim',
		config = function() require('plugins/flexoki') end
	}

	-- Быстрая настройка LSP-серверов
	use {
		'neovim/nvim-lspconfig',
		after = 'coq_nvim',
		config = function() require('plugins/lspconfig') end
	}

	-- Прогресс LSP
	use {
		'j-hui/fidget.nvim',
		config = function() require('plugins/fidget') end
	}

	-- Интерфейс отображающий найденные проблемы LSP-серверами
	use {
		'folke/trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require('plugins/trouble') end
	}

	-- Пиктограммы для плагинов
	use {
		'onsails/lspkind-nvim',
		config = function() require('plugins/lspkind') end
	}

	-- Пиктограммы для плагинов
	use {
		'nvim-tree/nvim-web-devicons',
		config = function() require('plugins/nvim-web-devicons') end
	}

	-- Интеграция с GIT
	use {
		'lewis6991/gitsigns.nvim',
		config = function() require('plugins/gitsigns') end
	}

	-- Обработчик GIT-команд
	use 'tpope/vim-fugitive'

	-- Отображение изменений GIT
	use 'mhinz/vim-signify'

	-- Отрисовка в реальном времени найденных ошибок LSP-серверами
	use {
		'onsails/diaglist.nvim',
		config = function() require('plugins/diaglist') end
	}

	-- Интерфейс строки состояния
	use {
		'nvim-lualine/lualine.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require('plugins/lualine') end
	}

	-- Дополнение для "nvim-lualine/lualine.nvim" с отображением прогресса работы с LSP-серверами
	use {
		'arkav/lualine-lsp-progress',
		config = function() require('plugins/lualine-lsp-progress') end
	}

	-- Интерфейс строки буфера файлов
	use {
		'akinsho/bufferline.nvim',
		-- tag = "v3.*",
		requires = 'nvim-tree/nvim-web-devicons',
		config = function() require('plugins/bufferline') end
	}

	-- Интерфейс древовидной структуры файлов
	use {
		'nvim-neo-tree/neo-tree.nvim',
		-- branch   = 'v2.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons',
			'MunifTanjim/nui.nvim'
		},
		config   = function() require('plugins/neo-tree') end
	}

	-- Автодополнение скобок и кавычек
	use {
		'windwp/nvim-autopairs',
		config = function() require('plugins/autopairs') end
	}

	-- Цвета для отображения найденных ошибок LSP-сервером в случае если другие цвета не найдены
	use 'folke/lsp-colors.nvim'

	-- Автозавершение
	use {
		'ms-jpq/coq_nvim',
		branch = 'coq',
		config = function() require('plugins/coq') end
	}

	-- Готовые наброски для автозавершения "ms-jpq/coq_nvim"
	use {
		'ms-jpq/coq.artifacts',
		branch = 'artifacts'
	}

	-- Пользовательские готовые наброски для автозавершения "ms-jpq/coq_nvim"
	use {
		'ms-jpq/coq.thirdparty',
		branch = '3p'
	}

	-- Линтер
	use {
		'mfussenegger/nvim-lint',
		config = function() require('plugins/lint') end
	}

	-- Тестирование
	use {
		'vim-test/vim-test',
		config = function() require('plugins/vim-test') end
	}
	-- Functions for Telescope
	use 'nvim-lua/plenary.nvim'

	-- DAP integration for Telescope
	use 'nvim-telescope/telescope-dap.nvim'

	-- Fuzzy finder over lists (find, filter, preview, pick)
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		requires = {'nvim-lua/plenary.nvim'},
		config = function() require('plugins/telescope') end
	}

	-- UI for Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function() require('plugins/treesitter') end,
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
    end
	}

	-- Удобное комментирование
	use 'b3nj5m1n/kommentary'

	-- Древовидное представление символов
	use {
		'simrat39/symbols-outline.nvim',
		config = function() require('plugins/symbols-outline') end
	}

	-- Интерфейс для отображения тегов в отдельном окне
	use 'preservim/tagbar'

	-- PHP-теги для "preservim/tagbar" (phpctags для ctags)
	use {
		'vim-php/phpctags',
		run = 'composer install'
	}

	-- LSP-сервер для Fish Shell 
	use 'dag/vim-fish'

	-- Цветовая тема
	use {
		'rktjmp/lush.nvim',
		config = function() require('plugins/lush') end
	};

	-- Аналог LSP-сервера для подержки синтаксиса nginx
	use 'chr4/nginx.vim'

	-- Форматировщик Prettier
  use {
    'prettier/vim-prettier',
		branch = 'master',
		-- run = 'sudo npm i -g',
		run = 'yarn install --frozen-lockfile --production'
  }

	-- Debug Adapter Protocol client implementation --
	use {
		'mfussenegger/nvim-dap',
		config = function() require('plugins/dap') end
	}

	-- Asynchronous IO --
	use 'nvim-neotest/nvim-nio'

	-- UI for DAP client implementation --
	use { 
		'rcarriga/nvim-dap-ui', 
		requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
		config = function() require('plugins/dapui') end
	}

	-- Virtual text support for DAP client implementation and Treesitter --
	use {
		'theHamsta/nvim-dap-virtual-text',
		config = function() require('plugins/dap-text') end
	}
end)
