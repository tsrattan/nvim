
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Sudo saving with <leader> and w
--map('n', '<leader>W', ':silent w !sudo tee %<CR>')

-- Disable s ans S insert mode
map('n', 's', '<nop>')
map('n', 'S', '<nop>')

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- move in insert mode
map('i', '<c-h>', '<left>')
map('i', '<c-l>', '<right>')
map('i', '<c-j>', '<down>')
map('i', '<c-k>', '<up>')

-- Toggle between numbers and Relative numbers
map('n', '<F3>', ':set nu rnu!<CR>', {noremap = true, silent = true})

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffers
map("n", "<S-q>", ":bdelete<CR>", opts)

-- Open new tabpage
map('n', '<Leader>tn', ':tabnew<CR>')

-- Navigate between tabpages
map('n', '<C-h>', ':tabprevious<CR>')
map('n', '<C-l>', ':tabnext<CR>')

-- Close window with <leader> and Q
map('n', '<leader>Q', ':q<CR>')

-- Switch to the directory of the open buffer
map('n', '<Leader>cd', ':lcd %:p:h<CR>:pwd<CR>')

-- Close Terminal
map('t', '<Esc>', '<C-\\><C-n>:q!<CR>')                    -- exit

-- Go to the beginning and end of current line in insert mode quickly
map("i", "<C-A>", "<HOME>")
map("i", "<C-E>", "<END>")

-- Go to beginning of command in command-line mode
map("c", "<C-A>", "<HOME>")

-- Move text up and down
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)

-- plugin management
map('n', '<leader>pc', ':Lazy check<cr>', { desc = 'Check plugins' })
map('n', '<leader>pu', ':Lazy update<cr>', { desc = 'Update plugins' })
map('n', '<leader>ps', ':Lazy show<cr>', { desc = 'Show plugins' })
map('n', '<leader>ph', ':Lazy help<cr>', { desc = 'Help' })
map('n', '<leader>px', ':Lazy clear<cr>', { desc = 'Clear uninstalled plugins' })


