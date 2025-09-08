vim.g.neovide_cursor_animation_length = 0.0
vim.g.neovide_opacity = 0.8
vim.g.neovide_normal_opacity = 0.8
vim.g.neovide_scale_factor = 1.4

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = '↪'

vim.keymap.set('n', '<C-=>', function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.1
end)

vim.keymap.set('n', '<C-->', function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.1
end)
