local language = vim.lsp.config

-- Configuration: Paths to your dictionary files
local paths = {
  common = vim.fn.stdpath 'config' .. '/spell/common.txt',
  ['en-US'] = vim.fn.stdpath 'config' .. '/spell/en-US.txt',
  ['sv'] = vim.fn.stdpath 'config' .. '/spell/sv.txt',
}

-- Safe file reader
local function read_lines(filepath)
  if not filepath then
    return {}
  end -- Nil check for path

  local lines = {}
  local f = io.open(filepath, 'r')
  if f then
    for line in f:lines() do
      table.insert(lines, line)
    end
    f:close()
  end
  return lines
end

-- Initialize dictionaries safely
local dicts = {}
local common_words = read_lines(paths.common)

for lang, path in pairs(paths) do
  if lang ~= 'common' then
    local specific_words = read_lines(path)
    -- Safe merge
    if common_words and #common_words > 0 then
      vim.list_extend(specific_words, common_words)
    end
    dicts[lang] = specific_words
  end
end

-- Command Handler with full Nil Checks
vim.lsp.commands['_ltex.addToDictionary'] = function(command, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)

  -- 1. Check if client is still valid
  if not client then
    vim.notify('LTeX client not found.', vim.log.levels.ERROR)
    return
  end

  -- 2. Validate command arguments
  local args = command.arguments and command.arguments[1]
  if not args or not args.words then
    vim.notify('No words provided to add.', vim.log.levels.WARN)
    return
  end

  for lang, new_words in pairs(args.words) do
    if new_words then
      -- 3. Check if we have a file path for this language
      local target_file = paths[lang]
      if target_file then
        local f = io.open(target_file, 'a')
        if f then
          for _, word in ipairs(new_words) do
            f:write(word .. '\n')
          end
          f:close()
        else
          vim.notify('Could not write to dictionary file: ' .. target_file, vim.log.levels.ERROR)
        end
      else
        vim.notify('No dictionary file configured for language: ' .. lang, vim.log.levels.WARN)
      end

      -- 4. Safely update running settings (Deep table checks)
      -- Ensure the table structure exists before accessing keys
      client.config.settings = client.config.settings or {}
      client.config.settings.ltex = client.config.settings.ltex or {}
      client.config.settings.ltex.dictionary = client.config.settings.ltex.dictionary or {}

      local current_dict = client.config.settings.ltex.dictionary[lang] or {}
      for _, word in ipairs(new_words) do
        table.insert(current_dict, word)
      end
      client.config.settings.ltex.dictionary[lang] = current_dict
    end
  end

  -- 5. Notify server (if client is still valid, which it should be)
  if client.notify then
    client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
  end

  -- 6. Refresh diagnostics
  local uri = vim.uri_from_bufnr(0)
  if client.request then
    client.request('workspace/executeCommand', {
      command = '_ltex.checkDocument',
      arguments = { { uri = uri } },
    })
  end
end

return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {},
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'neovim/nvim-lspconfig',
      'saghen/blink.cmp',
    },
  },
  language('rust_analyzer', {
    settings = {
      completion = { autoimport = true },
      procMacro = true,
      cargo = { loadOutDirsFromCheck = true },
    },
  }),
  language('ltex', {
    settings = {
      ltex = {
        language = 'sv',
        dictionary = dicts,
      },
    },
  }),
  language('marksman', {
    filetypes = { 'markkdown', 'markdown.mdx', 'quarto' },
    root_markers = { '.marksman.toml', '.git', 'index.qmd' },
  }),
  language('qmlls', {
    cmd = { 'qmlls6', '-E' },
  }),
}
