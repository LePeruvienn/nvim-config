return {
	"ahmedkhalf/project.nvim",
	config = function()

		local project_nvim = require("project_nvim")

		project_nvim.setup({
			detection_methods = { "pattern" },
			patterns = { ".git", "Makefile", "package.json" }, -- Customize as needed
		})

		require("telescope").load_extension("projects") -- Load projects into Telescope
	end,
}
