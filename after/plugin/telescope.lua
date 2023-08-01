local map = vim.keymap.set
telescope = require('telescope')
telescope.builtin = require('telescope.builtin')

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}
telescope.load_extension('fzf')
telescope.load_extension("ui-select")


--telescope.load_extension('lsp_handlers')
--
map('n', ',ff', telescope.builtin.fd)
map('n', ',fg', telescope.builtin.git_files)
map('n', ',gs', telescope.builtin.git_status)
map('n', ',s', telescope.builtin.lsp_dynamic_workspace_symbols)
map('n', 'g/', telescope.builtin.live_grep)
map('n', '<C-/>', telescope.builtin.current_buffer_fuzzy_find)
map('n', '<leader>*', telescope.builtin.grep_string)
map('n', 'gb', telescope.builtin.buffers)
map('n', '<C-p>', telescope.builtin.registers)
