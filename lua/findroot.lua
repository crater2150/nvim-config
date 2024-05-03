local Path = require("plenary.path")
local source_basedir_markers = {
	".telescope-root",
	".editorconfig",
	"build.sbt",
	"package.json",
	"setup.py",
	".git",
}
function find_upwards_any(base, filenames)
	local folder = Path:new(base)
	local root = Path.path.root(folder)

	while folder:absolute() ~= root do
		for _, filename in ipairs(filenames) do
			local p = folder:joinpath(filename)
			if p:exists() then
				return p
			end
		end
		folder = folder:parent()
	end
	return ""
end

local function find_dir(base)
	print("base: ", base)
	if base == nil then
		base = vim.loop.cwd()
	end
	--@type Path
	local search_root
	search_root = find_upwards_any(base, source_basedir_markers)
	print("search_root: ", search_root)
	if search_root ~= "" then
		local file = search_root:_split()
		if file[#file] == ".telescope-root" then
			local target = search_root:parent():joinpath(search_root:head(1))
			if target:exists() then
				return tostring(target)
			end
		else
			return tostring(search_root:parent())
		end
	else
		return base
	end
end

return find_dir
