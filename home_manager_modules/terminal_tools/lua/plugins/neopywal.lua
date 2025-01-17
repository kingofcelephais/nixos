local neopywal = require("neopywal")
neopywal.setup({
	use_wallust = true,
	plugins = {
		nvim_cmp = true,
		gitsigns = true,
		telescope = {
			enabled = true,
		},
		treesitter = true,
		nvimtree = true,
		scrollbar = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
			scope_color = "",
		},
		lsp = {
			enabled = true,
			virtual_text = {
				errors = { "bold", "italic" },
				hints = { "bold", "italic" },
				information = { "bold", "italic" },
				ok = { "bold", "italic" },
				warnings = { "bold", "italic" },
				unnecessary = { "bold", "italic" },
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				information = { "undercurl" },
				ok = { "undercurl" },
				warnings = { "undercurl" },
			},
			inlay_hints = {
				background = true,
				style = { "bold", "italic" },
			},
		},
	},
})
vim.cmd.colorscheme("neopywal-dark")
