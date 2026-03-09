-- Code snapshots

return {
  "mistricky/codesnap.nvim",
  enabled = false, -- Тимчасово відключено через помилку mac-aarch64_generator.so
  build = "make",
  opts = {
    mac_window_bar = true,
    code_font_family = "JetBrainsMono Nerd Font",
    watermark = "",
  },
}
