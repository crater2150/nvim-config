
local sbtToScalaCLI = function()
	vim.cmd[[s/\s*libraryDependencies\s*+=\s*/\/\/> using dep /]]
	vim.cmd[[s/" \(%\+\) "/\=repeat(":", strlen(submatch(1)))/g]]
end

vim.keymap.set("n", "<leader>dep", sbtToScalaCLI, { noremap = true, silent = true, desc = "Convert sbt dependency to Scala CLI" })
