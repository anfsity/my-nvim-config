-- line --
vim.opt.relativenumber = true
vim.opt.number = true

-- indent -- 
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- avoid wrap --
vim.opt.wrap = false 

-- Enable the mouse --
vim.opt.mouse:append("a")

-- system clipboard --
vim.opt.clipboard:append("unnamedplus")
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = '复制到剪贴板' })
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p', { desc = '从剪贴板粘贴' })
vim.keymap.set('i', '<C-v>', '<C-r>+', { desc = '插入模式粘贴' })

-- default new window --
vim.opt.splitright = true
vim.opt.splitbelow = true

-- search --
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10

-- appearance -- 
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.cmd[[colorscheme nord]]





