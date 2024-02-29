return {
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    opts = {
      font = "MonaspiceNe Nerd Font Mono",
      to_clipboard = true,
      theme = "Nord",
      no_window_controls = true,
      no_line_number = true,
    },
    keys = {
      { "Y", ":Silicon<cr>", mode = "v", desc = "Make a screenshot" },
    },
  },
}
