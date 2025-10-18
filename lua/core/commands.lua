local opt = vim.opt -- raccourci pour un peu plus de concision

function SetIndentation(args)
	local n = tonumber(args.args) or 2
	if n < 2 then
		opt.tabstop = 4 -- 2 espaces pour les tabulations
		opt.shiftwidth = 4 -- 2 espaces pour la taille des indentations
		opt.expandtab = false -- change les tabulations en espaces (don't feed the troll please ;) )
		print("Using \\t for tabs.")
	else
		opt.expandtab = true
		opt.tabstop = n
		vim.opt.tabstop = n            -- Définit la largeur d'un tab à 2 espaces
		vim.opt.softtabstop = n        -- Utilise 2 espaces quand on appuie sur Tab
		vim.opt.shiftwidth = n         -- Utilise 2 espaces pour les niveaux d'indentation
		print("Using " .. n .. " spaces for tabs.")
	end
end

function AddNerdTreeIgnore(args)

	-- Retrieve the current ignore patterns
    local current_ignore = require('nvim-tree').config.filters.custom or {}

	local pattern = '\\.' .. tostring(args.args) .. "$"

	-- Add the new pattern to the ignore list if it’s not already present
	if not vim.tbl_contains(current_ignore, pattern) then
		table.insert(current_ignore, pattern)
		print("Added to NERDTreeIgnore : ", pattern)
		-- Update the nvim-tree ignore setting
		require('nvim-tree').setup {
			filters = {
				git_ignored = true,     -- Enable ignoring files specified in .gitignore
				custom = current_ignore   -- Directly set custom ignore patterns
			}
		}
	end
end

vim.api.nvim_create_user_command('SetIndent', SetIndentation, { nargs = 1 })
vim.api.nvim_create_user_command('AddNerdTreeIgnore', AddNerdTreeIgnore, { nargs = 1 })
