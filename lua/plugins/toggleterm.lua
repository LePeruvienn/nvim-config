return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 15, -- Terminal height (for horizontal) or width (for vertical)
			open_mapping = [[<C-t>]], -- Keybinding to toggle terminal
			hide_numbers = true, -- Hide line numbers
			shade_terminals = true, -- Adds a background shade
			direction = "float", -- Options: "vertical", "horizontal", "tab", "float"
			float_opts = {
				border = "rounded", -- Rounded border for floating terminal
			},
		})

		-- Keymaps
		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		keymap("n", "<Space>t", "<cmd>ToggleTerm<CR>", opts) -- Toggle terminal
		keymap("t", "<Esc>", "<C-\\><C-n>", opts) -- Exit terminal mode with Esc
	end,
}
