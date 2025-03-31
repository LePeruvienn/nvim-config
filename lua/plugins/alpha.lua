return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Header personnalisé
	dashboard.section.header.val = {
		"      Trying to be the GOAT .... 🥷     ",
		"",
		"______________________ ____ ___ __________ ",
		"\\_   _____/\\_   _____/|    |   \\\\______   \\",
		" |    __)   |    __)_ |    |   / |       _/",
		" |     \\    |        \\|    |  /  |    |   \\",
		" \\___  /   /_______  /|______/   |____|_  /",
		"     \\/            \\/                   \\/ ",
	}

		-- Boutons personnalisés
		dashboard.section.buttons.val = {
			dashboard.button("p", "📂  Projects", ":Telescope projects<CR>"),
			dashboard.button("e", "📄  Nouveau fichier", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "🔎  Rechercher un fichier", ":Telescope find_files <CR>"),
			dashboard.button("r", "🕘  Fichiers récents", ":Telescope oldfiles <CR>"),
			dashboard.button("l", "💤  Lazy", ":Lazy<CR>"),
			dashboard.button("s", "⚙️  Paramètres", ":e $MYVIMRC <CR>"),
			dashboard.button("q", "❌  Quitter", ":qa<CR>"),
		}

		-- Activation de alpha-nvim
		alpha.setup(dashboard.config)
	end,
}
