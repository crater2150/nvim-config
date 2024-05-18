local function ts_disable(_, bufnr)
	return vim.api.nvim_buf_line_count(bufnr) > 5000
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				init = function()
					-- PERF: no need to load the plugin, if we only need its queries for mini.ai
					local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
					local opts = require("lazy.core.plugin").values(plugin, "opts", false)
					local enabled = false
					if opts.textobjects then
						for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
							if opts.textobjects[mod] and opts.textobjects[mod].enable then
								enabled = true
								break
							end
						end
					end
					if not enabled then
						require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
					end
				end,
			},
		},
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Decrement selection", mode = "x" },
		},
		opts = {
			auto_install = true,
			ignore_install = {},
			highlight = { enable = true, disable = ts_disable },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"gitignore",
				"html",
				"java",
				"json",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"scala",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						-- stylua: ignore start
						["af"] = { query = "@function.outer",  desc = "outer function" },
						["if"] = { query = "@function.inner",  desc = "inner function" },
						["ac"] = { query = "@class.outer",     desc = "outer class" },
						["ic"] = { query = "@class.inner",     desc = "inner class" },
						["ap"] = { query = "@parameter.outer", desc = "outer parameter" },
						["ip"] = { query = "@parameter.inner", desc = "inner parameter" },
						["ar"] = { query = "@return_type.outer",      desc = "outer return type" },
						["ir"] = { query = "@return_type.inner",      desc = "inner return type" },
						-- stylua: ignore end
					},
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "V",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
			},
		},
		---@param opts TSConfig
		config = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				---@type table<string, boolean>
				local added = {}
				opts.ensure_installed = vim.tbl_filter(function(lang)
					if added[lang] then
						return false
					end
					added[lang] = true
					return true
				end, opts.ensure_installed --[[@as string[] ]])
			end
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/playground",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = {
			"TSPlaygroundToggle",
			"TSHighlightCapturesUnderCursor",
			"TSNodeUnderCursor",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = { "TSContextEnable", "TSContextDisable", "TSContextToggle" },
		keys = {
			-- stylua: ignore start
			{ "[c", function() require("treesitter-context").go_to_context() end, desc = "Go to context start", },
			-- stylua: ignore end
		},
		opts = { enable = true },
		config = function(_, opts)
			require("treesitter-context").setup(opts)
			vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#555555" })
			vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "Special" })
		end,
	},
}
