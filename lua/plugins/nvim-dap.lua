return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function ()

		local mason_dap = require("mason-nvim-dap")
		local dap = require("dap")
		local ui = require("dapui")
		local dap_virtual_text = require("nvim-dap-virtual-text")

		-- Dap Virtual Text
		dap_virtual_text.setup()

		mason_dap.setup({
			ensure_installed = { "cppdbg" },
			automatic_installation = true,
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})

		-- Configurations
		dap.configurations.c = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					local path = vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
					if path ~= "" then
						return path
					end
					return dap.ABORT
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
				MIMode = "gdb",
				console = "integratedTerminal",
				-- console = "externalTerminal"
				-- externalConsole = true,
			},
		}

		-- Dap UI

		ui.setup()

		vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
		vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

		dap.listeners.before.attach.dapui_config = function()
			-- ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			-- ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			-- ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			-- ui.close()
		end

		-- keymaps
		local keymap = vim.keymap.set

		keymap("n", "<F5>", dap.continue, { desc = "lancer une session de debbogage / continue "})
		keymap('n', '<F6>', dap.terminate, { desc = "Kill la session de débbogage"})
		keymap("n", "<F10>", dap.step_over, { desc = "Debug Step Over"})
		keymap("n", "<F11>", dap.step_into, { desc = "Debug Step Into"})
		keymap("n", "<F12>", dap.step_out, { desc = "Debug Step Out"})


		keymap("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Ajouter un Breakpoint à la ligne actuelle"})
		keymap("n", "<Leader>du", ui.toggle, { desc = "Toggle affichage de débbogage"})
	end,
}
