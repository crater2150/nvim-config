-- Override detection from lua/vim/filetype/detect.lua
-- removes match on |%w+| for SuperCollider
vim.filetype.add({
	extension = {
		-- This function checks the first 25 lines of file extension "sc" to resolve
		-- detection between scala and SuperCollider
		sc = function(path, bufnr)
			for _, line in ipairs(vim.filetype.getlines(bufnr, 1, 25)) do
				if
						vim.filetype.findany(line, {
							'var%s<',
							'classvar%s<',
							'%^this.*',
							'%+%s%w*%s{',
							'%*ar%s',
						})
				then
					return 'supercollider'
				end
			end
			return 'scala'
		end
	}
})
