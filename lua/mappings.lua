local wk = require("which-key")

vim.o.timeoutlen = 300
wk.setup({
  triggers = "auto",
  key_labels = { ["<leader>"] = "SPC" },
})

wk.register({
  b = {
    name = "buffer",
    l = { "<cmd>Telescope buffers<cr>", "Open buffer" }
  },
  c = "Comment",
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find file" }, -- create a binding with label
    r = { "<cmd>Telescope oldfiles<cr>", "Open recent file"},
    s = { "<cmd>w<cr>", "Save file"},
    n = { "<cmd>enew<cr>", "New File"},
    w = { "<cmd>Telescope live_grep<cr>", "Find word"} 
  },
  t = {
    t = { "<cmd>NvimTreeToggle<cr>", "Toggle file tree" },
    c = { "<cmd>NvimTreeFindFile<cr>", "Current file in tree"},
    f = { "<cmd>NvimTreeFocus", "Focus file tree" }
  },
  z = { "<cmd>ZenMode<cr>", "Toggle Zen mode" },
  w = { "<C-w>", "Window" },
  u = { "<cmd>Telescope undo<cr>", "View undo history" },
  r = { "<C-r>", "Redo" },
  q = { "<cmd>TroubleToggle<cr>", "Show Trouble" },
  [' '] = { "<cr>", "Confirm"},
}, { prefix = "<leader>" })

wk.register({
  g = {
    h = {"0", "Goto line beginning"},
    l = {"$", "Goto line end"}
  }
})
