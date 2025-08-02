return {
	"echasnovski/mini.nvim",
	config = function ()
		local statusline = require("mini.statusline")
		statusline.setup({
			use_icons = true,
		})

		local pick = require("mini.pick")
		pick.setup()
	end
}
