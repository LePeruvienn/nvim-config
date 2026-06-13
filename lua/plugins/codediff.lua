return {
	"esmuellert/codediff.nvim",
	cmd =  { "CodeDiff" },
	opts = {

		-- Diff view behavior
		diff = {
			layout = "side-by-side",             -- Diff layout: "side-by-side" (two panes) or "inline" (single pane with virtual lines)
			disable_inlay_hints = true,         -- Disable inlay hints in diff windows for cleaner view
			max_computation_time_ms = 5000,     -- Maximum time for diff computation (VSCode default)
			ignore_trim_whitespace = false,     -- Ignore leading/trailing whitespace changes (like diffopt+=iwhite)
			hide_merge_artifacts = false,       -- Hide merge tool temp files (*.orig, *.BACKUP.*, *.BASE.*, *.LOCAL.*, *.REMOTE.*)
			original_position = "left",         -- Position of original (old) content: "left" or "right"
			conflict_ours_position = "right",   -- Position of ours (:2) in conflict view: "left" or "right"
			conflict_result_position = "bottom", -- "bottom" (default): result below diff panes or "center": result between diff panes (three columns)
			conflict_result_height = 30,         -- Height of result pane in bottom layout (% of total height)
			conflict_result_width_ratio = { 1, 1, 1 }, -- Width ratio for center layout panes {left, center, right} (e.g., {1, 2, 1} for wider result)
			cycle_next_hunk = true,             -- Wrap around when navigating hunks (]c/[c): false to stop at first/last
			cycle_next_file = true,             -- Wrap around when navigating files (]f/[f): false to stop at first/last
			cycle_hunks_across_files = false,   -- ]c/[c at file boundary hops to first/last hunk of next/prev file (explorer/history)
			jump_to_first_change = true,        -- Auto-scroll to first change when opening a diff: false to stay at same line
			highlight_priority = 100,           -- Priority for line-level diff highlights (increase to override LSP highlights)
			compute_moves = false,              -- Detect moved code blocks (opt-in, matches VSCode experimental.showMoves)
			compact_context_lines = 3,          -- Number of context lines around hunks in compact mode
			compact_sync_folds = true,          -- Sync fold open/close across panes (mirrors Vim diff mode behavior)
		},
		-- Keymaps in diff view 
		keymaps = {
			conflict = {
				accept_incoming = "<leader>ct",  -- Accept incoming (theirs/left) change
				accept_current = "<leader>co",   -- Accept current (ours/right) change
				accept_both = "<leader>cb",      -- Accept both changes (incoming first)
				discard = "<leader>cx",          -- Discard both, keep base

				-- Accept all (whole file) - uppercase versions
				accept_all_incoming = "<leader>cT",  -- Accept ALL incoming changes
				accept_all_current = "<leader>cO",   -- Accept ALL current changes
				accept_all_both = "<leader>cB",      -- Accept ALL both changes
				discard_all = "<leader>cX",          -- Discard ALL, reset to base
				next_conflict = "]x",            -- Jump to next conflict
				prev_conflict = "[x",            -- Jump to previous conflict
				diffget_incoming = "2do",        -- Get hunk from incoming (left/theirs) buffer
				diffget_current = "3do",         -- Get hunk from current (right/ours) buffer
			}
		}
	}
}
