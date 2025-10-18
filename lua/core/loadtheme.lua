-- Function to read a single line from a file
local function read_theme_file(file_path)
	local file = io.open(file_path, "r") -- Open the file in read mode
	if not file then
		print("Could not open theme file: " .. file_path)
		return nil
	end
	local theme = file:read("*line") -- Read the first line
	file:close() -- Close the file
	return theme -- Return the theme
end

-- Read the theme from the file
local theme_file_path = "/home/arthur/.config/nvim/theme.txt"
local theme = read_theme_file(theme_file_path)

if theme then
	-- Set the colorscheme
	vim.cmd('colorscheme ' .. theme)
else
	print("Failed to set theme.")
end
