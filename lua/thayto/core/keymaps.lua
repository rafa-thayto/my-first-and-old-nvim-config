local nmap = function(keys, func, desc)
  if desc then
    desc = "LSP: " .. desc
  end

  vim.keymap.set("n", keys, func, { desc = desc })
end

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Diagnostic keymaps
nmap("[d", vim.diagnostic.goto_prev)
nmap("]d", vim.diagnostic.goto_next)
nmap("<leader>e", vim.diagnostic.open_float)
nmap("<leader>q", vim.diagnostic.setloclist)

-- My custom keymaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- Buffer
nmap("<leader>c", vim.cmd.bd)
nmap("<leader>bn", vim.cmd.bn)
nmap("<leader>bp", vim.cmd.bp)

-- BufferLine
nmap("<leader>bl", ":BufferLineCloseLeft<CR>")
nmap("<leader>br", ":BufferLineCloseRight<CR>")

-- Search and Replace
nmap("<leader>sr", ":%s/")

-- ESLint
nmap("<leader>lf", ":EslintFixAll<CR>")

-- Gitsigns
nmap("<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
