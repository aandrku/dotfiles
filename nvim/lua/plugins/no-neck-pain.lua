
return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  opts = {
    autocmds = {
      ---@type boolean | "safe"
      enableOnVimEnter = true,
    },
    -- Creates mappings for you to easily interact with the exposed commands.
    ---@type table
    mappings = {
      -- When `true`, creates all the mappings that are not set to `false`.
      ---@type boolean
      enabled = true,
      -- Sets a global mapping to Neovim, which allows you to toggle the plugin.
      -- When `false`, the mapping is not created.
      ---@type string
      toggle = "<Leader>np",
      ---@type string | { mapping: string, value: number }
      widthUp = "<Leader>n=",
      -- Sets a global mapping to Neovim, which allows you to decrease the width (-5) of the main window.
      -- When `false`, the mapping is not created.
      ---@type string | { mapping: string, value: number }
      widthDown = "<Leader>n-",
      -- Sets a global mapping to Neovim, which allows you to toggle the scratchPad feature.
      -- When `false`, the mapping is not created.
      ---@type string
      scratchPad = "<Leader>ns",
    },
  },
}
