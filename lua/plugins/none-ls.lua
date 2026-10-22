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
		-- stylua formats Lua when it's installed, and lua_ls only when it isn't,
		-- so the two never reformat the same file one after the other.
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({
				filter = function(client)
					return client.name ~= "lua_ls" or vim.fn.executable("stylua") == 0
				end,
			})
		end, {})
	end,
}
