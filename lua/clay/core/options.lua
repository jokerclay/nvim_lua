local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true;
opt.number = true;

-- tabs & indentation
opt.tabstop = 4;
opt.shiftwidth = 4;
opt.expandtab = true;
opt.autoindent = true;

-- line wrapping
opt.wrap = true;


-- search setting
opt.ignorecase = true;
opt.smartcase = true;


-- cursor line
opt.cursorline = true;

-- appearance
opt.termguicolors = true;
opt.background = "dark";
opt.signcolumn = "yes";

-- backspace
opt.backspace = "indent,eol,start";


-- clipboard
-- 使用系统剪贴板
opt.clipboard:append("unnamedplus");

-- split windows 
opt.splitright = true;
opt.splitbelow = true;

-- 将由 "-" 连接成的单词当做一个单词
-- ie. (hello)(-)(world) => (hello-world)
opt.iskeyword:append("-");






















