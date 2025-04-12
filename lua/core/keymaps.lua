vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- insert mode --
-- vim.keymap.set("i", "<capslock>", "<ESC>")


-- vision mode --
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { desc = "向下移动选中内容", silent = true })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { desc = "向上移动选中内容", silent = true })
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = "全选文件", silent = true })-- 窗口管理

vim.keymap.set('n', '<Leader>c', '<Cmd>bdelete<CR>', { desc = 'Close current buffer' })
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "垂直分屏", silent = true })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "水平分屏", silent = true })
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "取消搜索高亮", silent = true })


-- 文件操作
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "保存文件" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "退出窗口" })


-- plugins -- 
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

-- swap buffer --
vim.keymap.set("n", "<leader>l", ":bnext<CR>")
vim.keymap.set("n", "<leader>h", ":bprevious<CR>")

-- =============================================================================
-- == CompetiTest C++ 专属快捷键 (仅在 C++ 文件中生效)
-- =============================================================================
local competitest_cpp_group = vim.api.nvim_create_augroup('CompetitestCppKeymaps', { clear = true })

-- 快捷键将在打开 C++ 文件时设置
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'cpp', -- 匹配 C++ 文件类型
    group = competitest_cpp_group,
    callback = function()
        -- 使用 <localleader> (你设置为 " ") 作为前缀
        -- 注意：我们使用你确认过的命令名 "ComptiTest"

        -- 运行测试 (编译 + 运行)
        vim.keymap.set('n', '<localleader>r', '<Cmd>CompetiTest run<CR>',
            { desc = '[C]ompetiTest [R]un tests', silent = true, buffer = true })

        -- 添加测试用例
        vim.keymap.set('n', '<localleader>a', '<Cmd>CompetiTest add_testcase<CR>',
            { desc = '[C]ompetiTest [A]dd testcase', silent = true, buffer = true })

        -- 编辑测试用例 (会提示输入编号)
        vim.keymap.set('n', '<localleader>e', '<Cmd>CompetiTest edit_testcase<CR>',
            { desc = '[C]ompetiTest [E]dit testcase', silent = true, buffer = true })

        -- 显示上次测试结果 UI
        vim.keymap.set('n', '<localleader>s', '<Cmd>CompetiTest show_ui<CR>',
            { desc = '[C]ompetiTest [S]how UI', silent = true, buffer = true })

        -- (可选) 接收单个问题 (手动触发监听)
        -- vim.keymap.set('n', '<localleader>rp', '<Cmd>ComptiTest receive problem<CR>',
        --     { desc = '[C]ompetiTest [R]eceive [P]roblem', silent = true, buffer = true })

        -- (可选) 接收整个比赛 (手动触发监听)
        -- vim.keymap.set('n', '<localleader>rc', '<Cmd>ComptiTest receive contest<CR>',
        --     { desc = '[C]ompetiTest [R]eceive [C]ontest', silent = true, buffer = true })

        -- (可选) 停止持续监听 (如果需要手动停止)
        -- vim.keymap.set('n', '<localleader>rx', '<Cmd>ComptiTest receive stop<CR>',
        --     { desc = '[C]ompetiTest Stop [R]eceiving', silent = true, buffer = true })

        -- 你可以根据需要添加或修改其他快捷键
        -- vim.notify("CompetiTest C++ keymaps loaded!", vim.log.levels.INFO) -- 可以加个通知确认加载
    end,
})
