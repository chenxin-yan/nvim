vim.o.guifont = 'JetBrainsMono NF Medium:h14'
vim.g.neovide_show_border = false

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_window_blurred = true

if vim.g.is_transparent then
  vim.g.neovide_transparency = 0.90
end

vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_trail_size = 0.3
vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_cursor_antialiasing = true

vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
