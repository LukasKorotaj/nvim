-- Set clipboard to use system clipboard
vim.opt.clipboard = 'unnamedplus'
vim.opt.showtabline = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect', 'popup' }
vim.opt.conceallevel = 1

-- neovide
vim.g.neovide_cursor_animation_length = 0.0
