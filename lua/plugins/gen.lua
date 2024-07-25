return {
	"David-Kunz/gen.nvim",
	opts = {
		model = "mistral", -- The default model to use.
		init = false,
	},
	cmd = "Gen",
	keys = {
		{ "<leader>llm", ":Gen<CR>", mode = "n" },
	},
}
