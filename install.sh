#!/usr/bin/env fish

# Initializing the flags
set -l options (fish_opt -s v -l verbose)
set options $options (fish_opt -s f -l force)
set options $options (fish_opt -s u -l update)

# Reading the flags
argparse $options -- $argv

# Initializing the buffer of output
set -l output (if set -q _flag_verbose; echo '/dev/tty'; else; echo '/dev/null'; end)

python3 -m venv ~/.local --system-site-packages

if set -q _flag_update
	begin
		# need to rewrite in future (бляяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяя)
		sudo apt install -y npm python3-venv python3-pip rubygems ruby-dev pkg-config
		python3 -m ~/.local/bin/pip install --upgrade pip
		fish_add_path ~/.local/bin
		~/.local/bin/pip install --upgrade pynvim
		sudo gem install neovim

		# Install NeoVim module for NPM
		npm i -g neovim
	end &> $output
end

# Инициализация текста сообщений в зависимости от установленного языка в оболочке
if test (string match -ri "ru" "$LANG")
  function print -a TYPE PARAM1 PARAM2 -d "Текст сообщений"
    switch $TYPE
      case PACKER_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить Packer? (\"wbthomason/packer.nvim\") (y/N) ";
			case PACKER_EXISTS
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Packer уже установлен. Переустановить? (y/N) ";
      case PACKER_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен Packer";
			case LSP_INTELEPHENSE_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить LSP-сервер для PHP? (\"bmewburn/vscode-intelephense\") (y/N) ";
			case LSP_INTELEPHENSE_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен LSP-сервер для PHP (\"bmewburn/vscode-intelephense\")";
			case LSP_VSCODE-LANGSERVERS_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить LSP-сервера от VSCode (JSON, HTML, CSS)? (\"hrsh7th/vscode-langservers-extracted\") (y/N) ";
			case LSP_VSCODE-LANGSERVERS_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлены LSP-сервера от VSCode (JSON, HTML, CSS) (\"hrsh7th/vscode-langservers-extracted\")";
			case LSP_EMMET_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить LSP-сервер для набора инструментов Emmet (HTML из CSS)? (\"aca/emmet-ls\") (y/N) ";
			case LSP_EMMET_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен LSP-сервер для набора инструментов Emmet (HTML из CSS) (\"aca/emmet-ls\")";
			case LSP_CSSMODULES_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить LSP-сервер для CSS (форматировщик)? (\"antonk52/cssmodules-language-server\") (y/N) ";
			case LSP_CSSMODULES_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен LSP-сервер для CSS (форматировщик) (\"antonk52/cssmodules-language-server\")";
			case LSP_DENO_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить LSP-сервер для JavaScript и PostScript? (\"denoland/deno\") (y/N) ";
			case LSP_DENO_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен LSP-сервер для JavaScript и PostScript (\"denoland/deno\")";
			case LSP_LUA_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить LSP-сервер для Lua? (\"luals/lua-language-server\") (y/N) ";
			case LSP_LUA_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен LSP-сервер для Lua (\"luals/lua-language-server\")";
			case FORMATTER_NGINX_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить форматировщик для NGINX? (\"vasilevich/nginxbeautifier\") (y/N) ";
			case FORMATTER_NGINX_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен форматировщик для NGINX (\"vasilevich/nginxbeautifier\")";
			case FORMATTER_PRETTIER_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить форматировщик Prettier? (\"prettier/vim-prettier\") (y/N) ";
			case FORMATTER_PRETTIER_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен форматировщик Prettier (\"prettier/vim-prettier\")";
			case FONT_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Установить шрифт "(set_color cyan)"FiraCode"(set_color white)"? (y/N) ";
			case FONT_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Установлен шрифт "(set_color cyan)"FiraCode"(set_color white)" (выбери его в настройках твоего эмулятора терминала)";
			case FONTS
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color magenta; echo -n "[ДАННЫЕ] "; set_color white; echo "Шрифты для GNOME эмулятора терминала: https://www.nerdfonts.com/font-downloads (моя рекомендация - "(set_color cyan)"FiraCode"(set_color white)")";
			case FONT_PATCH
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Пропатчить шрифт для иконок? (\"nvim-tree/nvim-web-devicons\") (y/N) ";
			case FONT_CHOOSE
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[ЗАДАЧА] "; set_color white; echo "Путь до шрифта";
			case FONT_PATCHED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[РАБОТА] "; set_color white; echo "Пропатчен шрифт для иконок  (\"nvim-tree/nvim-web-devicons\")";
    end
  end
else
  function print -a TYPE PARAM1 PARAM2 -d "Messages text"
    switch $TYPE
			case PACKER_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install Packer? (\"wbthomason/packer.nvim\") (y/N) ";
			case PACKER_EXISTS
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Packer already installed. Reinstall? (y/N) ";
      case PACKER_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed Packer";
			case LSP_INTELEPHENSE_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the LSP-server for PHP? (\"bmewburn/vscode-intelephense\") (y/N) ";
			case LSP_INTELEPHENSE_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the LSP-server for PHP (\"bmewburn/vscode-intelephense\")";
			case LSP_VSCODE-LANGSERVERS_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the LSP-servers from VSCode (JSON, HTML, CSS)? (\"hrsh7th/vscode-langservers-extracted\") (y/N) ";
			case LSP_VSCODE-LANGSERVERS_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the LSP-servers from VSCode (JSON, HTML, CSS) (\"hrsh7th/vscode-langservers-extracted\")";
			case LSP_EMMET_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the LSP-server for Emmet toolkit (HTML из CSS)? (\"aca/emmet-ls\") (y/N) ";
			case LSP_EMMET_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the LSP-server for Emmet toolkit (HTML из CSS) (\"aca/emmet-ls\")";
			case LSP_CSSMODULES_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the LSP-server for CSS (formatter)? (\"antonk52/cssmodules-language-server\") (y/N) ";
			case LSP_CSSMODULES_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Install the LSP-server for CSS (formatter) (\"antonk52/cssmodules-language-server\")";
			case LSP_DENO_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the LSP-server for JavaScript and PostScript? (\"denoland/deno\") (y/N) ";
			case LSP_DENO_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the LSP-server for JavaScript and PostScript (\"denoland/deno\")";
			case LSP_LUA_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the LSP-server for Lua? (\"luals/lua-language-server\") (y/N) ";
			case LSP_LUA_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the LSP-server for Lua (\"luals/lua-language-server\")";
			case FORMATTER_NGINX_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the formatter for NGINX? (\"vasilevich/nginxbeautifier\") (y/N) ";
			case FORMATTER_NGINX_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the formatter for NGINX (\"vasilevich/nginxbeautifier\")";
			case FORMATTER_PRETTIER_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install the formatter Prettier? (\"prettier/vim-prettier\") (y/N) ";
			case FORMATTER_PRETTIER_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed the formatter Prettier (\"prettier/vim-prettier\")";
			case FONT_INSTALL
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Install "(set_color cyan)"FiraCode"(set_color white)" font? (y/N) ";
			case FONT_INSTALLED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Installed "(set_color cyan)"FiraCode"(set_color white)" font (select it in your terminal emulator settings)";
			case FONTS
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color magenta; echo -n "[INFO] "; set_color white; echo "Fonts for GNOME terminal emulator: https://www.nerdfonts.com/font-downloads (my recommendation - "(set_color cyan)"FiraCode"(set_color white)") ";
			case FONT_PATCH
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Patch your font for icons? (\"nvim-tree/nvim-web-devicons\") (y/N) ";
			case FONT_CHOOSE
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color blue; echo -n "[TASK] "; set_color white; echo "Path to the font";
			case FONT_PATCHED
        set_color yellow; echo -n "[mirzaev/nvim] "; set_color green; echo -n "[WORK] "; set_color white; echo "Pathed the font for icons  (\"nvim-tree/nvim-web-devicons\")";
		end
	end
end

if not set -q _flag_force
	# Installation request
	set RESPONSE (read -n 1 -p "print PACKER_INSTALL")
	bind -e y
end

if set -q _flag_force; or test (string match -ri 'y' "$RESPONSE")
	if test -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim
		# Найден репозиторий "wbthomason/packer.nvim"

		if not set -q _flag_force
			# Installation request
			set RESPONSE (read -n 1 -p "print PACKER_EXISTS")
			bind -e y
		end

		if set -q _flag_force; or test (string match -ri 'y' "$RESPONSE")
			# Запрошена переустановка

			begin 
				# Деинициализация старого репозитория
				rm -rf ~/.local/share/nvim/site/pack/packer/start/packer.nvim 

				# Инициализация репозитория
				git clone --depth 1 https://github.com/wbthomason/packer.nvim\
					~/.local/share/nvim/site/pack/packer/start/packer.nvim 
			end &> $output

			print PACKER_INSTALLED
		end
	else 
		# Не найден репозиторий "wbthomason/packer.nvim" 

		begin
			# Инициализация репозитория
			git clone --depth 1 https://github.com/wbthomason/packer.nvim\
				~/.local/share/nvim/site/pack/packer/start/packer.nvim 
		end &> $output

		print PACKER_INSTALLED
	end
end

if not set -q _flag_force
	# Installation request
	set RESPONSE (read -n 1 -p "print LSP_INTELEPHENSE_INSTALL")
	bind -e y
end

if set -q _flag_force; or test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "bmewburn/vscode-intelephense"

	begin
		# Установка
		npm i -g intelephense
	end &> $output

	print LSP_INTELEPHENSE_INSTALLED
end

if not set -q _flag_force
	# Installation request
	set RESPONSE (read -n 1 -p "print LSP_VSCODE-LANGSERVERS_INSTALL")
	bind -e y
end

if set -q _flag_force; or test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "hrsh7th/vscode-langservers-extracted"

	begin
		# Установка
		npm i -g vscode-langservers-extracted
	end &> $output

	print LSP_VSCODE-LANGSERVERS_INSTALLED
end

if not set -q _flag_force
	# Installation request
	set RESPONSE (read -n 1 -p "print LSP_EMMET_INSTALL")
	bind -e y
end

if set -q _flag_force; or test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "aca/emmet-ls"

	begin
		# Установка
		npm i -g emmet-ls
	end &> $output

	print LSP_EMMET_INSTALLED
end

if not set -q _flag_force
	# Installation request
	set RESPONSE (read -n 1 -p "print LSP_CSSMODULES_INSTALL")
	bind -e y
end

if set -q _flag_force; or test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "antonk52/cssmodules-language-server"

	begin
		# Установка
		npm i -g cssmodules-language-server
	end &> $output

	print LSP_CSSMODULES_INSTALLED
end

if not set -q _flag_force
	# Installation request
	set RESPONSE (read -n 1 -p "print LSP_DENO_INSTALL")
	bind -e y
end

if set -q _flag_force; or test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "denoland/deno"

	begin
		# Установка
		curl -fsSL https://deno.land/install.sh | sh 
	end &> $output

	# TODO доделать нормально
	set -g DENO_INSTALL "$HOME/.deno"
	fish_add_path $DENO_INSTALL/bin

	print LSP_DENO_INSTALLED
end


if not set -q _flag_force
	# Installation request
	set RESPONSE (read -n 1 -p "print LSP_LUA_INSTALL")
	bind -e y
end

if set -q _flag_force; or test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "luals/lua-language-server"

	begin
		# Установка
		sudo apt install ninja-build -y
		cd ~/
		rm -rf lua-language-server
		git clone https://github.com/LuaLS/lua-language-server 
		cd lua-language-server
		fish ./make.sh 
		fish_add_path $HOME/lua-language-server/bin 
	end &> $output

	print LSP_LUA_INSTALLED
end

if not set -q _flag_force
	# Installation request
	set RESPONSE (read -n 1 -p "print FORMATTER_NGINX_INSTALL")
	bind -e y
end

if set -q _flag_force; or test (string match -ri 'y' "$RESPONSE")
	# Запрошена установка "vasilevich/nginxbeautifier"

	begin
		# Установка
		npm i -g nginxbeautifier
	end &> $output

	print FORMATTER_NGINX_INSTALLED
end

if not set -q _flag_force
	# Installation request
	set RESPONSE (read -n 1 -p "print FORMATTER_PRETTIER_INSTALL")
	bind -e y
end

if set -q _flag_force; or test (string match -ri 'y' "$RESPONSE")
	# Accepted installation of "prettier/vim-prettier"

	begin
		npm i prettier
		npm i -g prettier
	end &> $output

	print FORMATTER_PRETTIER_INSTALLED
end

print FONTS

if not set -q _flag_force
	# Installation request
	set RESPONSE (read -n 1 -p "print FONT_INSTALL")
	bind -e y
end

if set -q _flag_force; or test (string match -ri 'y' "$RESPONSE")
	# Accepted installation of the FiraCode font
	
	begin
		mkdir -p ~/.local/share/fonts/FiraCode
		cd ~/.local/share/fonts/FiraCode
		wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip"
		unzip -o FiraCode.zip
		rm FiraCode.zip
		fc-cache -f -v
	end &> $output

	print FONT_INSTALLED

	if type -q dconf
		# GNOME

		# if (set -q _flag_force or string match (lsb_release -i | grep -Po '[^\s]*$') Ubuntu))
		# 	sudo apt-get install dconf
		# end
	end

	# dconf write /apps/gnome-terminal/profiles/Default/font FiraCodeNerdFontMono-Medium.ttf
	# gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font --type=boolean false
	# gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string FiraCodeNerdFontMono-Medium.ttf
else
	# Denied installation of the FiraCode font
	
	if not set -q _flag_force
		# Installation request
		set RESPONSE (read -n 1 -p "print FONT_PATCH")
		bind -e y
	end

	if set -q _flag_force; or test (string match -ri 'y' "$RESPONSE")
		# Accepted to patching the font

		begin
			cd ~/
			wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip"
			unzip -o FontPatcher.zip -d font_patcher
			cd font_patcher

			#if not type -q python && type -q python3
			if not type -q python
				# alias python=python3
				sudo apt install python-is-python3 -y
			end

			sudo apt install fontforge python3-fontforge -y

		end &> $output
	
		# Initializing path to the font
		set FONT (read -p "print FONT_CHOOSE")

		begin
			./font-patcher $FONT
		end &> $output

		print FONT_PATCHED
	end
end
