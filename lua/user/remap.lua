---See https://www.youtube.com/watch?v=w7i4amO_zaE for the primeagen video that these came from (around 20m in)
vim.g.mapleader = " "

-- allow moving selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- indent/outdent selected lines
-- TODO: implement so that selection isn't lost

-- switch between open buffers
local cmd_next = ":bnext<CR>"
local cmd_prev = ":bprev<CR>"
local last_cmd = cmd_next
vim.keymap.set("n", "gn", cmd_next)         -- activate next open buffer without closing the current pane
vim.keymap.set("n", "gp", cmd_prev)         -- activate prev open buffer without closing the current pane
vim.keymap.set("n", "gt", function ()       -- toggle between last 2 open buffers
   if(last_cmd == cmd_next) then
       last_cmd = cmd_prev
    else
        last_cmd = cmd_next
    end

    vim.cmd.normal(vim.api.nvim_replace_termcodes(last_cmd, true, true, true))
end)

-- close a buffer without messing up the layout
vim.keymap.set("n", "<leader>qh", ":bp<bar>sp<bar>bn<bar>bd<CR>") -- vertical split
vim.keymap.set("n", "<leader>qv", ":bp<bar>vsp<bar>bn<bar>bd<CR>") -- horizontal split

-- jump to definition
vim.keymap.set("n", "J", "mzJ`z")           -- join lines without moving the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")     -- jump down half a page: keep the cursor in the middle of the screen
vim.keymap.set("n", "<C-u>", "<C-u>zz")     -- jump up half a page: keep the cursor in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")           -- keep the cursor in the middle of the screen while searching
vim.keymap.set("n", "N", "Nzzzv")           -- keep the cursor in the middle of the screen while searching

-- use blackhole registers when deleting
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

-- source ~/.config/nvim/init.lua
vim.keymap.set("n", "<leader><Cr>", ":so ~/.config/nvim/init.lua<Cr>")

-- auto insert quotes, parens, braces, and brackets --
vim.keymap.set("v", "(", "s()<esc>Pll")
vim.keymap.set("v", "[", "s[]<esc>Pll")
vim.keymap.set("v", "{", "s{}<esc>Pll")
vim.keymap.set("v", "'", "s''<esc>Pll")
vim.keymap.set("v", '"', 's""<esc>Pll')

-- make a file executable (chmod +x)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- format a file with the current language
vim.keymap.set("n", "<leader>f", "gggqG")

-- show popup for linter errors to show complete message
vim.keymap.set('n', '<leader>k', ':lua vim.diagnostic.open_float()<cr>')

-- open the current file in a vertical split
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>')

-- open the current file in a horizontal split
vim.keymap.set('n', '<leader>sh', ':split<CR>')

-- close all but the active window
vim.keymap.set('n', '<leader>w', ':on<CR>')

-- insert blank line above removing any auto-added chars
vim.keymap.set('n', '<leader>na', 'O<esc>0d$j')

-- insert blank line below
vim.keymap.set('n', '<leader>nb', 'o<esc>0d$k')

-- select entire buffer
vim.keymap.set('n', '<leader><C-a>', 'gg<S-v>G')

-- focus current buffer
vim.keymap.set('n', '<leader>tf', function()
    local api = require("nvim-tree.api")
    api.tree.find_file()
end)
