return {
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = "nvim-lua/plenary.nvim"
	},

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"folke/trouble.nvim",
	{"j-hui/fidget.nvim", event = "LspAttach", tag = "legacy"},

	-- Autocomplete
	"windwp/nvim-autopairs",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	{ "ray-x/lsp_signature.nvim", event = "VeryLazy" },

	-- Snippets
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",

	-- DAP
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",
	{"rcarriga/nvim-dap-ui",
		dependencies = {"nvim-neotest/nvim-nio"}
	},
	"mfussenegger/nvim-dap-python",
	"theHamsta/nvim-dap-virtual-text",

	-- Languages
	"folke/neodev.nvim",
	"windwp/nvim-ts-autotag",
	"lervag/vimtex",
	"mfussenegger/nvim-jdtls",
	"hitsmaxft/vim-nix",

	-- Git
	"lewis6991/gitsigns.nvim",

	-- UI
	"lukas-reineke/indent-blankline.nvim",
	"Aasim-A/scrollEOF.nvim",
	"catgoose/nvim-colorizer.lua",
	"amarakon/nvim-unfocused-cursor",

	-- Colours
	"jaredgorski/fogbell.vim",
	"sjl/badwolf",

	-- Misc
	"smjonas/live-command.nvim",
	"luckasRanarison/nvim-devdocs",

	-- Local Plugins
	{ "noahgitsham/inbar.nvim", dev = true },
	{ "noahgitsham/tomorrow-day.nvim", dev = true },
}
