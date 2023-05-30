-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.o.rnu = true
vim.o.cursorline = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 50
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd([[colorscheme catppuccin]])

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

vim.opt.swapfile = false
vim.opt.backup = false

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- adds tranparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })

-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none"})
-- vim.api.nvim_set_hl(0, "MsgArea", { bg = "none"})
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none"})
-- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none"})

-- line numbers
vim.opt.relativenumber = true

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

local augroup = vim.api.nvim_create_augroup

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      hgroup = "IncSearch",
      timeout = 40,
    })
  end,
})
