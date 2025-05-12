-- Initialization
local dap = require('dap')

-- Installing C, Rust and C++
dap.configurations.cpp = {
}

-- Initializing PHP adapter
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" }
}

-- Installing PHP
dap.configurations.php = {
  {
      type = "php",
      request = "launch",
      name = "Listen for Xdebug",
      port = 9003
  }
}
