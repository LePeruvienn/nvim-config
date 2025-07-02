local sysname = vim.loop.os_uname().sysname
local is_linux = sysname == "Linux"

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",

	-- add fzf dependencies if we are on linux
	dependencies = vim.tbl_extend("force", {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	}, is_linux and {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	} or {}),

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {

				-- Parce que c'est joli
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
				file_ignore_patterns = { ".git/", "node_modules" },

				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
		})

		-- Load fzf extension if we are on linux
		if is_linux then
			telescope.load_extension("fzf")
		end

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set(
			"n",
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			{ desc = "Recherche de chaînes de caractères dans les noms de fichiers" }
		)
		keymap.set(
			"n",
			"<leader>fg",
			"<cmd>Telescope live_grep<cr>",
			{ desc = "Recherche de chaînes de caractères dans le contenu des fichiers" }
		)
		keymap.set(
			"n",
			"<leader>fb",
			"<cmd>Telescope buffers<cr>",
			{ desc = "Recherche de chaînes de caractères dans les noms de buffers" }
		)
		keymap.set(
			"n",
			"<leader>fx",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Recherche de la chaîne de caractères sous le curseur" }
		)
	end,
}
