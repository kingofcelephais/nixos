local ibl = require("ibl")

ibl.setup({
	debounce = 100,
	exclude = { filetypes = { "ml" } },
	indent = {
		char = "▏",
		repeat_linebreak = false,
	},
	whitespace = { highlight = { "Whitespace", "NonText" } },
})
