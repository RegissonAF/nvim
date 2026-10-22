return {
	"nvimtools/none-ls.nvim",

	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		-- Only the tools that are installed, so a machine without them (like the
		-- server) doesn't warn each time a file of that type opens.
		local function if_installed(source, command)
			return source.with({
				condition = function()
					return vim.fn.executable(command) == 1
				end,
			})
		end

		null_ls.setup({
			sources = {

				--python
				if_installed(null_ls.builtins.formatting.pyink, "pyink"),

				--Lua
				if_installed(null_ls.builtins.formatting.stylua, "stylua"),

				--JS and CSS
				if_installed(null_ls.builtins.formatting.prettier, "prettier"),
				if_installed(require("none-ls.diagnostics.eslint_d"), "eslint_d"),
				--Rust
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
