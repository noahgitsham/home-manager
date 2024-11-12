vim.opt.termguicolors = true

-- Set colour scheme
local function setColours(termColo, ttyColo)
	if os.getenv("DISPLAY") then
		vim.cmd.colorscheme(termColo)
	elseif ttyColo then
		vim.cmd.colorscheme(ttyColo)
	end
	-- Else default colourscheme
end

setColours("Tomorrow", "default")
