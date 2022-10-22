local  opts = {noremap = true, silent = true}
local  term_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap

-- leader key 设置为 空格, 单击 <SPACE> 即可
vim.g.mapleader = ' '


---------------------
-- General Keymaps
---------------------

-- 连续按 "jk" 回到 normal mode
keymap("i", "jk", "<ESC>", opts)


-- 在搜索时清除高亮
keymap("n", "<leader>nh", ":nohl<CR>", opts)

-- 使用 x 删除单个 letter 不存到 寄存器
keymap("n", "x", '"_x', opts)

-- 使用 <leader>+ — 数字
keymap("n", "<leader>+", "<C-a>", opts)
keymap("n", "<leader>-", "<C-x>", opts)

-- window management
-- 窗口管理
keymap("n", "<leader>sv", "<C-w>v", opts)                  -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts)                  -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts)                  -- make split windows equal width & height
keymap("n", "<leader>sx", ":close<CR>", opts)              -- close current split window

keymap("n", "<leader>to", ":tabnew<CR>"  , opts)           -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts)           -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>"    , opts)           --  go to next tab 
keymap("n", "<leader>tp", ":tabp<CR>"    , opts)           --  go to previous tab



----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap("n", "<leader>sm", ":MaximizerToggle<CR>" , opts)      -- toggle split window maximization
                                                              -- <leader>sm 最大化当前被分开的窗口，再次点击恢复
-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)         -- toggle file explorer
                                                              -- <space>e 打开 文件管理器

-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>" , opts) -- find files within current working directory, respects .gitignore
                                                                  -- ff 找文件
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>"  , opts) -- find string in current working directory as you type
                                                                  -- fs 找 text
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts) -- find string under cursor in current working directory
                                                                  -- fc 找 光标所在位置的 string 
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>"    , opts) -- list open buffers in current neovim instance
                                                                  -- fb show active buffers
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>"  , opts) -- list available help tags
                                                                  -- fh show help




























