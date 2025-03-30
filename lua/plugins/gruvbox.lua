return {
	"morhetz/gruvbox",         -- The Gruvbox theme repository
	lazy = false,              -- Load the plugin immediately
	priority = 1000,          -- Set loading priority
	opts = {},                 -- Options for the plugin (if any)
	config = function()        -- Configuration function for the plugin
	  -- Set the Gruvbox color scheme
	  vim.cmd([[colorscheme gruvbox]])
	  -- Optional: Set Gruvbox options
	  vim.o.background = "dark" -- or "light" for light mode
	end,
}
