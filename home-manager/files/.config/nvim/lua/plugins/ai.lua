return {
  {
    'github/copilot.vim',
    lazy = false,
    priority = 51,
  },
  {
    'robitx/gp.nvim',
    opts = {
      openai_api_key = os.getenv('OPENAI_API_KEY'),
      toggle_target = 'popup',
    },
  },
}
