local watcher = vim.loop.new_fs_event()
watcher:start(
  theme_file,
  {},
  vim.schedule_wrap(function(err, filename, status)
    if err then
      vim.notify('Error watching theme file: ' .. err, vim.log.levels.ERROR)
      return
    end
    apply_theme()
  end)
)
