return {
	"nvimtools/none-ls.nvim",

	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {

				--python
				null_ls.builtins.formatting.pyink,

				--Lua
				null_ls.builtins.formatting.stylua,

				--JS and CSS
				null_ls.builtins.formatting.prettier,
				require("none-ls.diagnostics.eslint_d"),
				--Rust
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
