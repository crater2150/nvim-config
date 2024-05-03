return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		"gbrlsnchs/telescope-lsp-handlers.nvim",
	},
	cmd = "Telescope",
	version = false,
	keys = function()
		local builtin = require("telescope.builtin")
		local utils = require("telescope.utils")
		-- stylua: ignore start
		return {
			{ ',,',
				function()
					builtin.fd { cwd = require("findroot")(utils.buffer_dir()) }
				end,
				desc = "Find files in base dir (defined by .telescope-root file)"
			},
			{ ',ff',       builtin.fd,                            desc = "Find files" },
			{ ',fg',       builtin.git_files,                     desc = "Find files (git)" },
			{ ',gs',       builtin.git_status,                    desc = "Git status" },
			{ ',s',        builtin.lsp_dynamic_workspace_symbols, desc = "Symbols" },
			{ 'g/',        builtin.live_grep,                     desc = "Live grep" },
			{ 'g:',        builtin.command_history,               desc = "Command history" },
			{ '<C-/>',     builtin.current_buffer_fuzzy_find,     desc = "Fuzzy find" },
			{ '<leader>*', builtin.grep_string,                   desc = "Find at cursor" },
			{ 'gb',        builtin.buffers,                       desc = "Switch buffer" },
			{ "<leader>:", builtin.command_history,               desc = "Command History" },
			{ "<leader>;", builtin.commands,                      desc = "Commands" },
		}
	end,
	--stylua: ignore end
	opts = {
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
	end,
}
