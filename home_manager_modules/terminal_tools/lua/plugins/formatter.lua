local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		c = {
			require("formatter.filetypes.c").clangformat,
		},
		haskell = {
			require("formatter.filetypes.haskell").stylish_haskell,
		},
		java = {
			require("formatter.filetypes.java").clangformat,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		yaml = {
			require("formatter.filetypes.yaml").yamlfmt,
		},
		go = {
			require("formatter.filetypes.go").gofmt,
		},
		ocaml = {
			require("formatter.filetypes.ocaml").ocamlformat,
		},
		nix = {
			require("formatter.filetypes.nix").nixfmt,
		},
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
