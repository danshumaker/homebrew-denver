return {
  "folke/noice.nvim",
  opts = {
    messages = {
      view_search = "popup",
      view_cmdline = "popup",
      view_history = "popup",
      view_popop = "popup",
      view_warnings = "popup",
    },
    presets = {
      bottom_search = false, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- noice shows an `inc_rename` message upon renaming files
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    popup_options = {
      enter = true,
      focusable = true,
      timeout = 5000, -- 5 seconds
    },
  },
}
