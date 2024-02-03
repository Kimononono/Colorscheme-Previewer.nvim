local M = {}

local function preview_colorscheme()
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
		callback = preview_colorscheme,
		group = color_preview
	})

end

return M
