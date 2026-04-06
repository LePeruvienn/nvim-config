return {
	"dmxk062/hexed.nvim",
	-- default options
	opts = {
		highlights = {
			String  = "String",      -- ascii characters
			Null	= "NonText",     -- null bytes
			Newline = "SpecialChar", -- newline characters(\n and \r)
			Address = "Label",       -- the addresses at the beginning of lines
			Byte	= "Identifier",  -- any other byte
			Region  = "Visual",      -- context are in preview buffer
			Char	= "Substitute",  -- character the cursor is on
		},
		command = "Hexed", -- the command used to invoke hexed
	}
}
