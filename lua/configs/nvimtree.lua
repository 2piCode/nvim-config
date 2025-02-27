require "configs.nvimtreegit"
return {
  filters = { dotfiles = false, git_clean = false, no_buffer = false, git_ignored = false },
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    width = 30,
    preserve_window_proportions = true,
  },
  renderer = {
    root_folder_label = false,
    highlight_git = true,
    indent_markers = { enable = true },
    icons = {
      glyphs = {
        default = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
        },
        git = {
          unmerged = "",
          unstaged = "",
          staged = "✓",
          untracked = "",
        },
      },
    },
  },
  git = {
    ignore = false,
  },
}
