require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
  filetypes = {
    mail = false,
  }
})
require("copilot_cmp").setup()
