-- Keymaps
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local keymap = vim.keymap.set

-- Clear highlights
keymap('n', '<Esc>', ':nohlsearch<CR>', { desc = 'Clear highlights' })

-- Open diagnostics
keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', { desc = 'Open diagnostics' })

-- Better vertical movement
keymap('n', 'j', 'gj')
keymap('n', 'k', 'gk')

-- Window navigation
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')

-- Diagnostics
keymap('n', '<leader>o', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
-- Diagnostic navigation
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.jump or vim.diagnostic.jump
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end

keymap('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
keymap('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
keymap('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
keymap('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
keymap('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
keymap('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- Tabs
keymap('n', '<tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })

-- cycle Neovim tabs with Ctrl-Shift-H/L
keymap('n', '<C-S-h>', '<cmd>tabprevious<CR>', { noremap = true, silent = true })
keymap('n', '<C-S-l>', '<cmd>tabnext<CR>', { noremap = true, silent = true })

-- CopilotChat
keymap('n', '<leader>c', '', { desc = '[C]opilot Chat' })
keymap('n', '<leader>ct', ':CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat Window' })
keymap('n', '<leader>cs', ':CopilotChatStop<CR>', { desc = 'Stop current Copilot output' })
keymap('v', '<leader>cr', ':CopilotChatReview<CR>', { desc = 'Review the selected code' })
keymap('v', '<leader>ce', ':CopilotChatExplain<CR>', { desc = 'Explain the selected code' })
keymap('v', '<leader>cd', ':CopilotChatDocs<CR>', { desc = 'Add documentation for the selection' })
keymap('n', '<leader>cp', ':CopilotChatTests<CR>', { desc = 'Add tests for my code' })

-- Terminal
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Enter Normal Mode in Terminal' })
keymap('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = '[T]oggle Terminal' })

--java
keymap('n', '<leader>j', '', { desc = 'Open [J]ava options' })
keymap('n', '<leader>jr', '<cmd>JavaRunnerRunMain<CR>', { desc = '[R]un Main' })
keymap('n', '<leader>js', '<cmd>JavaRunnerStopMain<CR>', { desc = '[S]top Main' })
keymap('n', '<leader>jt', '<cmd>JavaRunnerToggleLogs<CR>', { desc = '[T]toggle the ugly window' })
keymap('n', '<leader>jc', '<cmd>JavaTestRunCurrentClass<CR>', { desc = 'Test Current [C]lass' })
keymap('n', '<leader>jm', '<cmd>JavaTestRunCurrentMethod<CR>', { desc = 'Test Current [M]ethod' })
keymap('n', '<leader>jv', '<cmd>JavaTestViewLastReport<CR>', { desc = 'Test [V]iew Last Report' })
keymap('n', '<leader>jb', '<cmd>JavaBuildBuildWorkspace<CR>', { desc = 'Run Full Workspace [B]uild' })

-- File Browser
keymap('n', '<leader>fe', ':Telescope file_browser<CR>')

-- Color Scheme
keymap('n', '<leader>fc', ':Telescope colorscheme<CR>')
-- open file_browser with the path of the current buffer
keymap('n', '<leader>fE', ':Telescope file_browser path=%:p:h select_buffer=true<CR>')

-- Open full diagnostics list with Trouble.nvim (if installed)
keymap('n', '<leader>td', '<cmd>TroubleToggle document_diagnostics<cr>', { desc = 'Document Diagnostics (Trouble)' })
keymap('n', '<leader>tw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { desc = 'Workspace Diagnostics (Trouble)' })

-- Telekasten
keymap('n', '<leader>zi', '<cmd>Telekasten insert_link<CR>')
keymap('n', '<leader>zp', '<cmd>Telekasten panel<CR>')
keymap('n', '<leader>zf', '<cmd>Telekasten find_notes<CR>')
keymap('n', '<leader>zg', '<cmd>Telekasten search_notes<CR>')
keymap('n', '<leader>zd', '<cmd>Telekasten goto_today<CR>')
keymap('n', '<leader>zz', '<cmd>Telekasten follow_link<CR>')
keymap('n', '<leader>zn', '<cmd>Telekasten new_note<CR>')
keymap('n', '<leader>zc', '<cmd>Telekasten show_calendar<CR>')
keymap('n', '<leader>zb', '<cmd>Telekasten show_backlinks<CR>')
keymap('n', '<leader>zI', '<cmd>Telekasten insert_img_link<CR>')

-- Markdown Preview
keymap('n', '<leader>mt', '<cmd>MarkdownPreviewToggle<CR>')

-- Lsp Signature
keymap('i', '<C-s>', function()
  require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

-- math
keymap('n', '<leader>mm', ':ToggleMathMode<CR>', { desc = 'Toggle Math Mode' })
