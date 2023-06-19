--Plug 'nvim-telescope/telescope.nvim'

--Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
--Plug 'gbrlsnchs/telescope-lsp-handlers.nvim'
--Plug 'nvim-telescope/telescope-ui-select.nvim'
return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {'nvim-telescope/telescope-fzf-native.nvim', 
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      },
      'gbrlsnchs/telescope-lsp-handlers.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
--Plug { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    },
    cmd = "Telescope",
    version = false,
    keys = {
      {',ff', require("telescope.builtin").fd, desc = "Find files"},
      {',fg', require("telescope.builtin").git_files, desc = "Find files (git)"},
      {',gs', require("telescope.builtin").git_status, desc = "Git status"},
      {',s', require("telescope.builtin").lsp_dynamic_workspace_symbols, desc = "Symbols"},
      {'g/', require("telescope.builtin").live_grep, desc = "Live grep"},
      {'<C-/>', require("telescope.builtin").current_buffer_fuzzy_find, desc = "Fuzzy find"},
      {'<leader>*', require("telescope.builtin").grep_string, desc = "Find at cursor"},
      {'gb', require("telescope.builtin").buffers},
      { "<leader>:", require("telescope.builtin").command_history, desc = "Command History" },
      { "<leader>;", require("telescope.builtin").commands, desc = "Commands" },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
      },
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown { }
        },
      },
    },
    config = function(_, opts)
      local telescope = require('telescope')
      telescope.setup(opts)
      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')
    end,
  }
