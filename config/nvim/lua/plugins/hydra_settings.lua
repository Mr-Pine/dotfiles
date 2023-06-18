require("hydra")({
	name = "<C-w>",
	mode = "n",
	body = "<C-w>",
	config = {
		color = "pink",
	},
	heads = {
		{ "<", "3<C-w><", { nowait = true } },
		{ ">", "3<C-w>>", { nowait = true } },
		{ "+", "3<C-w>+", { nowait = true } },
		{ "-", "3<C-w>-", { nowait = true } },
	},
})
