-- local mode_map = {
-- 	["n"]      = "NORM",
-- 	["no"]     = "O-PENDING",
-- 	["nov"]    = "O-PENDING",
-- 	["noV"]    = "O-PENDING",
-- 	["no\22"]  = "O-PENDING",
-- 	["niI"]    = "NORM",
-- 	["niR"]    = "NORM",
-- 	["niV"]    = "NORM",
-- 	["nt"]     = "NORM",
-- 	["ntT"]    = "NORM",
-- 	["v"]      = "VISL",
-- 	["vs"]     = "VISL",
-- 	["V"]      = "LINE",
-- 	["Vs"]     = "LINE",
-- 	["\22"]    = "VBLK",
-- 	["\22s"]   = "VBLK",
-- 	["s"]      = "SELECT",
-- 	["S"]      = "S-LINE",
-- 	["\19"]    = "S-BLOCK",
-- 	["i"]      = "INST",
-- 	["ic"]     = "INST",
-- 	["ix"]     = "INST",
-- 	["R"]      = "RPLC",
-- 	["Rc"]     = "RPLC",
-- 	["Rx"]     = "RPLC",
-- 	["Rv"]     = "V-REPLACE",
-- 	["Rvc"]    = "V-REPLACE",
-- 	["Rvx"]    = "V-REPLACE",
-- 	["c"]      = "CMND",
-- 	["cv"]     = "EX",
-- 	["ce"]     = "EX",
-- 	["r"]      = "RPLC",
-- 	["rm"]     = "MORE",
-- 	["r?"]     = "CONFIRM",
-- 	["!"]      = "SHEL",
-- 	["t"]      = "TERM",
-- }
--
-- require("lualine").setup {
-- 	options = {
-- 		icons_enabled = false,
-- 		theme = "auto",
-- 		component_separators = { left = "|", right = "|"},
-- 		section_separators = { left = "", right = ""},
-- 		always_divide_middle = true,
-- 		globalstatus = true,
-- 	},
-- 	sections = {
-- 		lualine_a = {},
-- 		lualine_b = {"filename"},
-- 		lualine_c = {"filetype", "branch", "diff"},
-- 		lualine_x = {"encoding"},
-- 		lualine_y = {"progress"},
-- 		lualine_z = {"location"}
-- 	},
-- 	extensions = {"lazy", "mason", "nvim-dap-ui"},
-- }
