return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' },
      { 'zbirenbaum/copilot.lua' },
    },
    build = 'make tiktoken', -- Required for token counting
    opts = {
      question_header = '## Konan ',
      answer_header = '## Copilot ',
      error_header = '## Error ',
      max_tokens = 300,
      mappings = {},
    },
  },
  {
    'zbirenbaum/copilot.lua',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
}
