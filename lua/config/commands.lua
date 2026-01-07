local utils = require 'utils.functions'

local user_cmd = vim.api.nvim_create_user_command

user_cmd('ExtractNoteToMark', function(opts)
  local data = {
    args = opts.args,
  }
  utils.extract_text(data)
end, {
  desc = 'Extract visual selection to new note and insert link at mark',
  nargs = '*', -- Accept any number of arguments
  range = true, -- This makes it work with visual selection
})
