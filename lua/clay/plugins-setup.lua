-- auto install packer if not installed
-- 如果 packer 没有安装， 自动安装
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
-- 保持和更新插件
vim.cmd([[ 
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
    return
end

-- add list of plugins to install
return packer.startup(function(use)



    use("wbthomason/packer.nvim")           -- packer can manage itself             
    -- packer 包管理器

    use("nvim-lua/plenary.nvim")            -- lua functions that many plugins use

    use("bluz71/vim-nightfly-guicolors")    -- preferred colorscheme
    -- vim-nightfly 主题

    use("christoomey/vim-tmux-navigator")   -- tmux & split window navigation
    -- Ctrl-hjkl 移动窗口

    use("szw/vim-maximizer")                -- maximizes and restores current window
    -- 最大化当前的 split 和恢复

    use("tpope/vim-surround")               -- add, delete, change surroundings (it's awesome)
    -- add `ys [s][w] "`
    -- delete `ds "`
    -- change `cs [want to chang] [new change]`

    use("vim-scripts/ReplaceWithRegister")  -- replace with register contents using motion (gr + motion)
    
	use("nvim-tree/nvim-tree.lua")          -- file explorer


    
	use("kyazdani42/nvim-web-devicons")     -- vs-code like icons

    -- statusline
	use("nvim-lualine/lualine.nvim")

    -- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

    
	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

    -- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

    -- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig


    -- configuring lsp servers
    use("neovim/nvim-lspconfig") -- easily configure language servers

    use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
    use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
    use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion


    -- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side





    if packer_bootstrap then
        require("packer").sync()
    end
end)