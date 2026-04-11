-- Set leader keys before anything else (plugins read this during load)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.options")
require("config.plugins")
require("config.keymaps")
