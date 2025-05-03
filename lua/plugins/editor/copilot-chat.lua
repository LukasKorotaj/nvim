return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    build = "make tiktoken", -- Required for token counting
    opts = {
      model = "gpt-4",
      question_header = "## User ",
      answer_header = "## Copilot ",
      error_header = "## Error ",
      max_tokens = 300,
      keymaps = {
        { "<leader>c", ":CopilotChatToggle<CR>", "[C]opilot Chat" },
        { "<leader>ct", ":CopilotChatToggle<CR>", "Toggle Copilot Chat Window" },
        { "<leader>cs", ":CopilotChatStop<CR>", "Stop current Copilot output" },
        { "<leader>cr", ":CopilotChatReview<CR>", "Review the selected code" },
        { "<leader>ce", ":CopilotChatExplain<CR>", "Explain the selected code" },
        { "<leader>cd", ":CopilotChatDocs<CR>", "Add documentation for the selection" },
        { "<leader>cp", ":CopilotChatTests<CR>", "Add tests for my code" },
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)
      for _, keymap in ipairs(opts.keymaps) do
        vim.api.nvim_set_keymap("n", keymap[1], keymap[2], { noremap = true, silent = true, desc = keymap[3] })
      end
    end,
  },
}
