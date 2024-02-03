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
	vim.cmd([[
		augroup PreviewColorscheme
    autocmd!
    autocmd CmdlineChanged : lua require("core.plugin_config.preview_colorschemes")._preview_colorscheme()
    autocmd ColorScheme * lua require("core.plugin_config.preview_colorschemes").save_colorscheme()
    augroup END]])

	load_colorscheme()
end

M._preview_colorscheme = _preview_colorscheme
M.save_colorscheme = save_colorscheme
M.load_colorscheme = load_colorscheme

return M
