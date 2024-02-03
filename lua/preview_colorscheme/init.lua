local M = {}

local function save_colorscheme()
	local colorscheme = vim.g.colors_name
	local file = io.open(vim.fn.stdpath('config') .. '/colorscheme.vim', 'w')
	if file then
		file:write('colorscheme ' .. colorscheme)
		file:close()
	end
end

local function load_colorscheme()
	local file = io.open(vim.fn.stdpath('config') .. '/colorscheme.vim', 'r')
	if file then
		local colorscheme = file:read("*a")
		file:close()
		vim.cmd(colorscheme)
	end
end

local function _preview_colorscheme()
	local cmdline = vim.fn.getcmdline()
	local cmdpos = vim.fn.getcmdpos()
	local cmd_parts = vim.split(cmdline, ' ')
	local cmd = cmd_parts[1]
	local arg = cmd_parts[2]

	if cmd ~= 'colorscheme' or cmdpos <= #cmd + 2 or not arg then
		return
	end

	local success, _ = pcall(vim.cmd, 'silent colorscheme ' .. arg)
	if success then
		vim.cmd('redraw!')
	end
end

M.setup = function()
	local color_preview = vim.api.nvim_create_augroup("aesthetic_settings", { clear = true })

	vim.api.nvim_create_autocmd("CmdlineChanged", {
		callback = _preview_colorscheme,
		group = color_preview
	})

	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = save_colorscheme,
		group = color_preview
	})


	load_colorscheme()
end

return M
