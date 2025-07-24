local colors = require "bt.colorscheme.gruvbox.colors"

return {
	["NvimTreeFolderIcon"] = {
		fg = colors["custom"].blue,
		bold = true,
		italic = false,
	},
	["NvimTreeFolderName"] = { link = "NvimTreeFolderIcon"},
	["NvimTreeOpenedFolderName"] = { link = "NvimTreeFolderIcon"},
	["NvimTreeEmptyFolderName"] = { link = "NvimTreeFolderIcon"},
	["NvimTreeRootFolder"] = { link = "NvimTreeFolderIcon"},
	["NvimTreeGitFileDirtyHL"] = {
		fg = colors["custom"].red,
		bold = false,
		italic = false,
	},
	["NvimTreeGitDirty"] = { link = "NvimTreeGitFileDirtyHL" },
	["NvimTreeGitFileStagedHL"] = {
		fg = colors["light"].green,
		bold = true,
		italic = false,
	},
	["NvimTreeGitStaged"] = { link = "NvimTreeGitFileStagedHL" },
	["NvimTreeGitStagedIcon"] = { link = "NvimTreeGitFileStagedHL" },
	["NvimTreeGitFileNewHL"] = {
		fg = colors["light"].aqua,
		bold = false,
		italic = false,
	},
	["NvimTreeSpecialFile"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
}
