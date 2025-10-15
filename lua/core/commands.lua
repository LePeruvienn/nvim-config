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

vim.api.nvim_create_user_command('SetIndent', SetIndentation, { nargs = 1 })
